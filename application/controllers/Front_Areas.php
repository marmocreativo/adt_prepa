<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_Areas extends CI_Controller {
	public function __construct(){
  parent::__construct();
		// Cargo las Opciones
		if (!$this->db->table_exists('opciones') ){
			redirect(base_url('index.php/reparar_EN_CMS'));
		}
		$this->data['op'] = opciones_default();

		// Verifico Sesión

		if(!verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){
			redirect(base_url('index.php/login?url_redirect='.base_url('index.php/'.uri_string().'?'.$_SERVER['QUERY_STRING'])));
		}


		// reviso el dispositivo
		if($this->agent->is_mobile()){
			//$this->data['dispositivo']  = "mobile";
			$this->data['dispositivo']  = "";
		}else{
			$this->data['dispositivo']  = "";
		}

		$this->data['tipo'] = verificar_variable('GET','tipo','');
		$this->data['fecha_inicio'] = verificar_variable('GET','fecha_inicio',date('d-m-Y', strtotime(date('d-m-Y').' -15 days')));
		$this->data['fecha_fin'] = verificar_variable('GET','fecha_fin',date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s').' +15 days')));
		if(isset($_SESSION['usuario']['configuraciones']['modo_noche'])){
			$modo_noche = $_SESSION['usuario']['configuraciones']['modo_noche'];
		}else{
			$modo_noche='no';
		}
		if ($modo_noche=='si') {
			$this->data['modo'] = 'noche';
		}else{
			$this->data['modo'] = 'dia';
		}
	}

	public function index()
	{
		// Verifico el switch de mantenimiento
		if(verificar_mantenimiento($this->data['op']['modo_mantenimiento'])){ redirect(base_url('index.php/mantenimiento')); }

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

		$parametros_and['areas.ESTADO'] = 'activo';

		if(!empty($busqueda)){
			$parametros_or['areas.AREA_NOMBRE'] = $busqueda;
		}
		$tablas_join = array();
		if($todo=='no'){
			/*
			$tablas_join['areas_usuarios'] = 'areas_usuarios.ID_AREA = areas_usuarios.ID_AREA';
			$parametros_and['areas_usuarios.ID_AREA'] = $_SESSION['usuario']['id'];
			*/
		}

		// Paginador
		$this->data['pub_totales'] = $this->GeneralModel->conteo('areas',$tablas_join,$parametros_or,$parametros_and,$agrupar);
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
		$this->data['areas'] = $this->GeneralModel->lista_join('areas',$tablas_join,$parametros_or,$parametros_and,$orden,$mostrar_por_pagina,$this->data['offset'],$agrupar);


		// Open Tags
		$this->data['titulo']  = 'Áreas / Direcciones';
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_lista_areas',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		// Vistas
	}

	public function crear()
	{

		if(isset($_GET['consulta'])&&!empty($_GET['consulta'])){
			$consulta = json_decode(base64_decode($_GET['consulta']));
		}else{
				$consulta->tipo = '';
				$consulta->orden = '';
				$consulta->mostrar_por_pagina = '';
				$consulta->pagina = '';
				$consulta->busqueda = '';
		}

		$imagen = 'default.jpg';
		$imagen_fondo = 'fondo_default.jpg';
		$id_borrador = generador_aleatorio(4);

		$parametros = array(
			'AREA_NOMBRE' => 'Equipo '.$id_borrador,
			'URL' => 'borrador-'.$id_borrador,
			'AREA_DESCRIPCION' => '',
			'IMAGEN' => $imagen,
			'IMAGEN_FONDO' => $imagen_fondo,
			'TIPO' => 'general',
			'ESTADO' => 'activo',
			'ORDEN' => 0,
		);
		$area_id = $this->GeneralModel->crear('areas',$parametros);

		//Meta autor
		$parametros_meta = array(
			'ID_OBJETO'=>$area_id,
			'DATO_NOMBRE'=>'meta_autor',
			'DATO_VALOR'=>$_SESSION['usuario']['nombre'].' '.$_SESSION['usuario']['apellidos'],
			'TIPO_OBJETO'=>'area',
		);

		$this->GeneralModel->crear('meta_datos',$parametros_meta);

		// Reenvio consulta
		$consulta = base64_encode(json_encode($consulta));


		redirect(base_url('index.php/areas/actualizar?id='.$area_id.'&consulta='.$consulta));
	}

	public function actualizar()
	{
		$this->form_validation->set_rules('AreaNombre', 'Nombre', 'required|max_length[255]', array( 'required' => 'Debes designar el %s.', 'max_length' => 'El nombre no puede superar los 255 caracteres' ));

		if($this->form_validation->run())
    {
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
				$nombre = 'equipo-'.uniqid();
				$destino = $this->data['op']['ruta_imagenes'].'areas/';
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
				$ancho = $this->data['op']['ancho_imagenes_publicaciones'];
				$alto = $this->data['op']['alto_imagenes_publicaciones'];
				$corte = 'corte';
				$extension = '.jpg';
				$tipo_imagen = 'image/jpeg';
				$calidad = 80;
				$nombre = 'area-'.uniqid();
				$destino = $this->data['op']['ruta_imagenes'].'areas/';
				// Subo la imagen y obtengo el nombre Default si va vacía
				$imagen_fondo = subir_imagen($archivo,$ancho,$alto,$corte,$extension,$tipo_imagen,$calidad,$nombre,$destino);

			}else{
				$imagen_fondo = $this->input->post('ImagenFondoActual');
			}


			$parametros = array(
				'AREA_NOMBRE' =>  $this->input->post('EquipoNombre'),
				'URL' =>  $this->input->post('Url'),
				'AREA_DESCRIPCION' =>  $this->input->post('EquipoDescripcion'),
				'IMAGEN' => $imagen,
				'IMAGEN_FONDO' => $imagen_fondo,
				'COLOR' =>  $this->input->post('EquipoColor'),
				'TIPO' =>  $this->input->post('Tipo'),
				'ESTADO' =>  $this->input->post('Estado'),
				'ORDEN' =>  $this->input->post('Orden'),
			);

      $this->GeneralModel->actualizar('areas',['ID_AREA'=>$this->input->post('Identificador')],$parametros);

			// Borro los metadatos existentes
			$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$this->input->post('Identificador'),'TIPO_OBJETO'=>'area']);
			// Meta Datos
			if(!empty($_POST['Meta'])){
				foreach($_POST['Meta'] as $nombre => $valor){
					$parametros_meta = array(
						'ID_OBJETO'=>$this->input->post('Identificador'),
						'DATO_NOMBRE'=>$nombre,
						'DATO_VALOR'=>$valor,
						'TIPO_OBJETO'=>'area',
					);
					// Creo las entradas a la galeria
					$this->GeneralModel->crear('meta_datos',$parametros_meta);
				}
			}

			// USUARIOS
			// Borro las categorías existentes
			$this->GeneralModel->borrar('areas_usuarios',['ID_AREA'=>$this->input->post('Identificador')]);

			if(isset($_POST['AreasUsuarios'])&&!empty($_POST['EquiposUsuarios'])){
				foreach($_POST['AreasUsuarios'] as $usuario){
					$parametros = array(
						'ID_AREA' => $this->input->post('Identificador'),
						'ID_USUARIO' => $usuario
		      );
					// Creo la relación de categorías
		      $this->GeneralModel->crear('areas_usuarios',$parametros);
				}
			}

			// Mensaje Feedback
			//  Redirecciono
			redirect(base_url('index.php/areas/detalles?id='.$this->input->post('Identificador')));


    }else{

			$this->data['area'] = $this->GeneralModel->detalles('areas',['ID_AREA'=>$_GET['id']]);
			$this->data['tipo'] = $this->data['area']['TIPO'];
			// Open Tags
			$this->data['titulo']  = 'Areas';
			$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
			$this->data['imagen']  = base_url('assets/img/share_default.jpg');

			$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'area'],'','','');
			$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }

			// Cargo Vistas
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_form_actualizar_areas',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}

	}

	public function detalles(){
		$this->data['area'] = $this->GeneralModel->detalles('areas',['ID_AREA'=>$_GET['id']]);
		$this->data['tipo'] = $this->data['area']['TIPO'];
		// Open Tags
		$this->data['titulo']  = $this->data['area']['AREA_NOMBRE'];
		$this->data['descripcion']  = $this->data['area']['AREA_DESCRIPCION'];
		$this->data['imagen']  = base_url('contenido/img/areas/'.$this->data['area']['IMAGEN']);

		$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'area'],'','','');
		$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }

		// Variables de busqueda
		$parametros_and = array();
		$parametros_or = array();
		$parametros_and['ID_AREA'] = $_GET['id'];
		$parametros_and['ESTADO !='] = 'borrador';

		$tablas_join = array();
		//$tablas_join['area_proyectos'] = 'equipos_proyectos.ID_PROYECTO = proyectos.ID_PROYECTO';
		//$parametros_and['equipos_proyectos.ID_EQUIPO'] = $this->data['equipo']['ID_EQUIPO'];


		// Paginador
		$this->data['pub_totales'] = $this->GeneralModel->conteo('proyectos',$tablas_join,$parametros_or,$parametros_and,'');

		// Consulta
		$this->data['proyectos'] = $this->GeneralModel->lista_join('proyectos',$tablas_join,$parametros_or,$parametros_and,'FECHA_INICIO ASC','','','');

		// Cargo Vistas
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_detalles_area',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}

	public function borrar(){
		$equipo = $this->GeneralModel->detalles('equipos',['ID_EQUIPO'=>$_GET['id']]);

        // check if the institucione exists before trying to delete it
        if(isset($equipo['ID_EQUIPO']))
        {
						// Borro la categoría
            $this->GeneralModel->borrar('equipos',['ID_EQUIPO'=>$_GET['id']]);

						$proyectos = $this->GeneralModel->lista('equipos_proyectos','',['ID_EQUIPO'=>$_GET['id']],'','','');
						foreach($proyectos as $proyecto){
							$this->GeneralModel->borrar('proyectos',['ID_PROYECTO'=>$proyecto->ID_PROYECTO]);
							$this->GeneralModel->borrar('tareas',['ID_PROYECTO'=>$proyecto->ID_PROYECTO]);
						}
						$this->GeneralModel->borrar('equipos_proyectos',['ID_EQUIPO'=>$_GET['id']]);
						$this->GeneralModel->borrar('equipos_usuarios',['ID_EQUIPO'=>$_GET['id']]);



						// Mensaje Feedback
						//  Redirecciono
            redirect(base_url('index.php/equipos'));
        } else {
					// Mensaje Feedback
					//  Redirecciono
	         redirect(base_url('index.php/admin/proyectos'));
				}
	}
}
