<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_Proyectos extends CI_Controller {
	public function __construct(){
  parent::__construct();
		// Cargo las Opciones
		if (!$this->db->table_exists('opciones') ){
			redirect(base_url('reparar_EN_CMS'));
		}
		$this->data['op'] = opciones_default();

		// Verifico Sesión
		/*
		if(!verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){
			$this->session->set_flashdata('alerta', 'Debes iniciar sesión para continuar');
			redirect(base_url('login?url_redirect='.base_url(uri_string().'?'.$_SERVER['QUERY_STRING'])));
		}
		*/

		// reviso el dispositivo
		if($this->agent->is_mobile()){
			//$this->data['dispositivo']  = "mobile";
			$this->data['dispositivo']  = "";
		}else{
			$this->data['dispositivo']  = "";
		}

		$this->data['tipo'] = verificar_variable('GET','tipo','');
	}

	public function index()
	{
		// Verifico el switch de mantenimiento
		if(verificar_mantenimiento($this->data['op']['modo_mantenimiento'])){ redirect(base_url('mantenimiento')); }

		// Variables de busqueda
		$this->data['consulta']=array();
		$todo = verificar_variable('GET','todo','si');
		$this->data['consulta']['todo'] = $todo;
		$busqueda = verificar_variable('GET','busqueda','');
		$this->data['consulta']['busqueda'] = $busqueda;
		$fecha_inicio = verificar_variable('GET','fecha_inicio',date('d-m-Y', strtotime(date('d-m-Y').' -30 days')));
		$this->data['consulta']['fecha_inicio'] = $fecha_inicio;
		$fecha_final = verificar_variable('GET','fecha_final',date('d-m-Y'));
		$this->data['consulta']['fecha_final'] = $fecha_final;
		$orden = verificar_variable('GET','orden','');
		$this->data['consulta']['orden'] = $orden;
		$mostrar_por_pagina = verificar_variable('GET','mostrar_por_pagina',$this->data['op']['cantidad_publicaciones_por_pagina']);
		$this->data['consulta']['mostrar_por_pagina'] = $mostrar_por_pagina;
		$pagina = verificar_variable('GET','pagina','1');
		$this->data['consulta']['pagina'] = $pagina;
		$agrupar = '';
		$this->data['consulta']['agrupar'] = $agrupar;

		$parametros_and = array();
		$parametros_or = array();

		$parametros_and['proyectos.ESTADO !='] = 'borrador';

		if(!empty($busqueda)){
			$parametros_or['proyectos.PROYECTO_NOMBRE'] = $busqueda;
		}
		$tablas_join = array();
		if($todo=='no'){
			$tablas_join['usuarios_proyectos'] = 'usuarios_proyectos.ID_PROYECTO = proyectos.ID_PROYECTO';
			$parametros_and['usuarios_proyectos.ID_USUARIO'] = $_SESSION['usuario']['id'];
		}

		// Paginador
		$this->data['pub_totales'] = $this->GeneralModel->conteo('proyectos',$tablas_join,$parametros_or,$parametros_and,$agrupar);
		$this->data['pub_por_pagina'] = $mostrar_por_pagina;
		$this->data['cantidad_paginas'] = ceil($this->data['pub_totales']/$this->data['pub_por_pagina']);
		$this->data['pagina'] = $pagina;

		// Página siguiente
		if($this->data['pagina']!=$this->data['cantidad_paginas']){
			$this->data['pagina_siguiente']=$this->data['pagina'] +1;
		}else{
			$this->data['pagina_siguiente']=$this->data['pagina'];
		}
		// Página Anterior
		if($this->data['pagina']!=1){
			$this->data['pagina_anterior']=$this->data['pagina'] -1;
		}else{
			$this->data['pagina_anterior']=$this->data['pagina'];
		}
		// Offset
		if($this->data['pagina']!=1){
			$this->data['offset'] =$this->data['pub_por_pagina']*($this->data['pagina']-1);
		}else{
			$this->data['offset']='';
		}
		// Consultas rápidas
		$this->data['consulta_actual'] = 'busqueda='.$busqueda.'&todo='.$todo.'fecha_inicio='.$fecha_inicio.'&fecha_final='.$fecha_final.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$pagina;
		$this->data['consulta_siguiente'] = 'busqueda='.$busqueda.'&todo='.$todo.'fecha_inicio='.$fecha_inicio.'&fecha_final='.$fecha_final.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_siguiente'];
		$this->data['consulta_anterior'] = 'busqueda='.$busqueda.'&todo='.$todo.'fecha_inicio='.$fecha_inicio.'&fecha_final='.$fecha_final.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_anterior'];

		// Consulta
		$this->data['proyectos'] = $this->GeneralModel->lista_join('proyectos',$tablas_join,$parametros_or,$parametros_and,$orden,$mostrar_por_pagina,$this->data['offset'],$agrupar);

		// Open Tags
		$this->data['titulo']  = 'Proyectos';
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_lista_proyectos',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		// Vistas
	}

	public function crear()
	{

		$imagen = 'default.jpg';
		$imagen_fondo = 'fondo_default.jpg';
		$id_borrador = generador_aleatorio(4);

		$parametros = array(
			'PROYECTO_NOMBRE' => 'Proyecto '.$id_borrador,
			'URL' => 'Proyecto-'.$id_borrador,
			'PROYECTO_DESCRIPCION' => '',
			'IMAGEN' => $imagen,
			'IMAGEN_FONDO' => $imagen_fondo,
			'TIPO' => 'general',
			'ESTADO' => 'activo',
			'ORDEN' => 0,
		);
		$proyecto_id = $this->GeneralModel->crear('proyectos',$parametros);

		// Asignar a equipo

		if(isset($_GET['id_equipo'])){
			$parametros_meta = array(
				'ID_EQUIPO'=>$_GET['id_equipo'],
				'ID_PROYECTO'=>$proyecto_id
			);

			$this->GeneralModel->crear('equipos_proyectos',$parametros_meta);
		}

		//Meta autor
		$parametros_meta = array(
			'ID_OBJETO'=>$proyecto_id,
			'DATO_NOMBRE'=>'meta_autor',
			'DATO_VALOR'=>$_SESSION['usuario']['nombre'].' '.$_SESSION['usuario']['apellidos'],
			'TIPO_OBJETO'=>'proyectos',
		);

		$this->GeneralModel->crear('meta_datos',$parametros_meta);

		// Reenvio consulta
		$consulta = base64_encode(json_encode($consulta));


		$this->session->set_flashdata('exito', 'Borrador creado correctamente');
		redirect(base_url('proyectos/actualizar?id='.$proyecto_id));
	}
	public function actualizar()
	{

		$this->form_validation->set_rules('ProyectoNombre', 'Nombre', 'required|max_length[255]', array( 'required' => 'Debes designar el %s.', 'max_length' => 'El nombre no puede superar los 255 caracteres' ));

		if($this->form_validation->run())
    {
			// Datos de consulta anterior
			if(isset($_POST['consulta'])&&!empty($_POST['consulta'])){
				$consulta = json_decode(base64_decode($_POST['consulta']));
			}else{
					$consulta->tipo = '';
					$consulta->orden = '';
					$consulta->mostrar_por_pagina = '';
					$consulta->pagina = '';
					$consulta->busqueda = '';
			}


			/*
			PROCESO DE LA IMAGEN
			*/
			if(!empty($_FILES['Imagen']['name'])){

				$archivo = $_FILES['Imagen']['tmp_name'];
				$ancho = $this->data['op']['ancho_imagenes_publicaciones'];
				$alto = $this->data['op']['alto_imagenes_publicaciones'];
				$corte = 'corte';
				$extension = '.jpg';
				$tipo_imagen = 'image/jpeg';
				$calidad = 80;
				$nombre = 'proyecto-'.uniqid();
				$destino = $this->data['op']['ruta_imagenes'].'proyectos/';
				// Subo la imagen y obtengo el nombre Default si va vacía
				$imagen = subir_imagen($archivo,$ancho,$alto,$corte,$extension,$tipo_imagen,$calidad,$nombre,$destino);

			}else{
				$imagen = $this->input->post('ImagenActual');
			}

			/*
			PROCESO DE LA IMAGEN
			*/
			if(!empty($_FILES['ImagenFondo']['name'])){

				$archivo = $_FILES['ImagenFondo']['tmp_name'];
				$ancho = '1920';
				$alto = '1080';
				$corte = 'corte';
				$extension = '.jpg';
				$tipo_imagen = 'image/jpeg';
				$calidad = 80;
				$nombre = 'proyecto-'.uniqid();
				$destino = $this->data['op']['ruta_imagenes'].'proyectos/';
				// Subo la imagen y obtengo el nombre Default si va vacía
				$imagen_fondo = subir_imagen($archivo,$ancho,$alto,$corte,$extension,$tipo_imagen,$calidad,$nombre,$destino);

			}else{
				$imagen_fondo = $this->input->post('ImagenFondoActual');
			}


			$parametros = array(
				'PROYECTO_NOMBRE' =>  $this->input->post('ProyectoNombre'),
				'URL' =>  $this->input->post('Url'),
				'PROYECTO_DESCRIPCION' =>  $this->input->post('ProyectoDescripcion'),
				'DURACION' =>  $this->input->post('ProyectoDuracion'),
				'IMAGEN' => $imagen,
				'IMAGEN_FONDO' => $imagen_fondo,
				'COLOR' =>  $this->input->post('ProyectoColor'),
				'TIPO' =>  $this->input->post('Tipo'),
				'FECHA_INICIO' =>  date('Y-m-d', strtotime($this->input->post('FechaInicio'))),
				'FECHA_FINAL' =>    date('Y-m-d', strtotime($this->input->post('FechaFinal'))),
				'ESTADO' =>  $this->input->post('Estado'),
				'ORDEN' =>  $this->input->post('Orden'),
			);

			if(!null==$this->input->post('FechaEntrega')){
				$parametros['FECHA_ENTREGA'] = date('Y-m-d',strtotime($this->input->post('FechaEntrega')));
			}

      $this->GeneralModel->actualizar('proyectos',['ID_PROYECTO'=>$this->input->post('Identificador')],$parametros);

			// Borro los metadatos existentes
			$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$this->input->post('Identificador'),'TIPO_OBJETO'=>'equipo']);
			// Meta Datos
			if(!empty($_POST['Meta'])){
				foreach($_POST['Meta'] as $nombre => $valor){
					$parametros_meta = array(
						'ID_OBJETO'=>$this->input->post('Identificador'),
						'DATO_NOMBRE'=>$nombre,
						'DATO_VALOR'=>$valor,
						'TIPO_OBJETO'=>'proyecto',
					);
					// Creo las entradas a la galeria
					$this->GeneralModel->crear('meta_datos',$parametros_meta);
				}
			}

			// USUARIOS
			// Borro las categorías existentes
			$this->GeneralModel->borrar('equipos_proyectos',['ID_PROYECTO'=>$this->input->post('Identificador')]);

			if(isset($_POST['ProyectoEquipos'])&&!empty($_POST['ProyectoEquipos'])){
				foreach($_POST['ProyectoEquipos'] as $equipo){
					$parametros = array(
						'ID_EQUIPO' => $equipo,
						'ID_PROYECTO' => $this->input->post('Identificador')
		      );
					// Creo la relación de categorías
		      $this->GeneralModel->crear('equipos_proyectos',$parametros);
				}
			}

			// Mensaje Feedback
			$this->session->set_flashdata('exito', 'Proyecto actualizado correctamente');

			redirect(base_url('proyectos/detalles?id='.$this->input->post('Identificador')));

    }else{

			$this->data['proyecto'] = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$_GET['id']]);
			$this->data['tipo'] = $this->data['proyecto']['TIPO'];
			// Open Tags
			$this->data['titulo']  = $this->data['proyecto']['PROYECTO_NOMBRE'];
			$this->data['descripcion']  = $this->data['proyecto']['PROYECTO_DESCRIPCION'];
			$this->data['imagen']  = base_url('contenido/img/equipos/'.$this->data['proyecto']['IMAGEN']);

			$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'equipo'],'','','');
			$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }

			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_form_actualizar_proyectos',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}

	}
	public function detalles(){
		$this->data['proyecto'] = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$_GET['id']]);
		$this->data['tipo'] = $this->data['proyecto']['TIPO'];
		// Open Tags
		$this->data['titulo']  = $this->data['proyecto']['PROYECTO_NOMBRE'];
		$this->data['descripcion']  = $this->data['proyecto']['PROYECTO_DESCRIPCION'];
		$this->data['imagen']  = base_url('contenido/img/proyectos/'.$this->data['proyecto']['IMAGEN']);

		$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'proyecto'],'','','');
		$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }

		// Variables de busqueda
		$parametros_and = array();
		$parametros_or = array();

		$parametros_and['tareas.ID_PROYECTO'] = $_GET['id'];

		$tablas_join = array();


		// Consultas
		$this->data['equipos'] = $this->GeneralModel->lista('equipos','',['ESTADO'=>'activo'],'','','');
		$this->data['tareas'] = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,'FECHA_INICIO ASC','','','');

		// Cargo Vistas
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_detalles_proyecto',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}

}
