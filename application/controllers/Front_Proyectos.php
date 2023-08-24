<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_Proyectos extends CI_Controller {
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
		$mostrar_por_pagina = verificar_variable('GET','mostrar_por_pagina','36');
		$this->data['consulta']['mostrar_por_pagina'] = $mostrar_por_pagina;
		$pagina = verificar_variable('GET','pagina','1');
		$this->data['consulta']['pagina'] = $pagina;
		$agrupar = '';
		$this->data['consulta']['agrupar'] = $agrupar;
		$parametros_and = array();
		$parametros_or = array();

		$parametros_and['proyectos.ESTADO !='] = 'borrador';
		$parametros_and['proyectos.ID_AREA'] = $_SESSION['usuario']['area'];

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
			'ID_AREA' => $_SESSION['usuario']['area'],
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

		redirect(base_url('index.php/proyectos/actualizar?id='.$proyecto_id));
	}
	public function actualizar()
	{

		$this->form_validation->set_rules('ProyectoNombre', 'Nombre', 'required|max_length[255]', array( 'required' => 'Debes designar el %s.', 'max_length' => 'El nombre no puede superar los 255 caracteres' ));

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
				'ID_AREA' => $_SESSION['usuario']['area'],
				'PRIORIDAD' =>  $this->input->post('Prioridad'),
				'DURACION' =>  $this->input->post('ProyectoDuracion'),
				'ENLACE_EDITABLE' =>  $this->input->post('EnlaceEditable'),
				'ENLACE_ENTREGABLE' =>  $this->input->post('EnlaceEntregable'),
				'IMAGEN' => $imagen,
				'IMAGEN_FONDO' => $imagen_fondo,
				'COLOR' =>  $this->input->post('ProyectoColor'),
				'TIPO' =>  $this->input->post('Tipo'),
				'FECHA_INICIO' =>  date('Y-m-d', strtotime($this->input->post('FechaInicio'))),
				'FECHA_FINAL' =>    date('Y-m-d', strtotime($this->input->post('FechaFinal'))),
				'ESTADO' =>  $this->input->post('Estado'),
				'ORDEN' =>  $this->input->post('Orden'),
				'VALIDACION' =>  $this->input->post('Validacion'),
				'ID_LISTA' =>  $this->input->post('IdLista'),
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

			redirect(base_url('index.php/proyectos/detalles?id='.$this->input->post('Identificador')));

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
		if(!empty($this->data['proyecto'])){
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
			$this->data['tareas'] = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,'tareas.FECHA_FINAL ASC','','','');

			// Cargo Vistas
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_proyectos',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_detalles_proyecto',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		}else{

			// Open Tags
			$this->data['titulo']  = 'Proyecto no encontrado';
			$this->data['descripcion']  = 'El contenido al que intentaste acceder no está disponible';
			$this->data['imagen']  = base_url('contenido/img/proyectos/default.jpg');

			// Cargo Vistas
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_proyecto_no_encontrado',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		}
		
	}

	public function borrar(){
		$proyecto = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$_GET['id']]);

        // check if the institucione exists before trying to delete it
        if(isset($proyecto['ID_PROYECTO']))
        {
						// Borro la categoría
            $this->GeneralModel->borrar('proyectos',['ID_PROYECTO'=>$_GET['id']]);
						//echo 'Borrar proyecto con el ID: '.$_GET['id'];
						//echo '<br>';
						$tareas = $this->GeneralModel->lista('tareas','',['ID_PROYECTO'=>$_GET['id']],'','','');

						foreach($tareas as $tarea){
							//$this->GeneralModel->borrar('usuarios_tareas',['ID_TAREA'=>$tarea->ID_TAREA]);
							//echo 'Borrar asignación del usuario con el ID: '.$tarea->ID_TAREA;
							//echo '<br>';
							$this->GeneralModel->borrar('tareas_mensajes',['ID_TAREA'=>$tarea->ID_TAREA]);
							//echo 'Borrar los mensajes de las tareas con ID: '.$tarea->ID_TAREA;
							//echo '<br>';
							$this->GeneralModel->borrar('tareas',['ID_TAREA'=>$tarea->ID_TAREA]);
							$this->GeneralModel->borrar('usuarios_tareas',['ID_TAREA'=>$tarea->ID_TAREA]);
							$this->GeneralModel->borrar('tareas_mensajes',['ID_TAREA'=>$tarea->ID_TAREA]);	
							$this->GeneralModel->borrar('validacion_revisiones',['ID_TAREA'=>$tarea->ID_TAREA]);
							$this->GeneralModel->borrar('validacion_respuesta',['ID_TAREA'=>$tarea->ID_TAREA]);	
						}

						
						//echo 'Borrar tareas con el ID_PROYECTO: '.$_GET['id'];
						//echo '<br>';
						// Mensaje Feedback
						//  Redirecciono
            redirect(base_url('index.php/proyectos'));
        } else {
					// Mensaje Feedback
					//  Redirecciono
	         redirect(base_url('index.php/proyectos'));
				}
	}

	public function crear_validacion(){
		$proyecto = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$_POST['IdProyecto']]);
		$tareas = $this->GeneralModel->lista('tareas','',['ID_PROYECTO'=>$_POST['IdProyecto']],'','','');
		$lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$_POST['IdLista']]);
		$dimensiones = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$_POST['IdLista']],'','','');
		$array_parametros = array();
		foreach($dimensiones as $dimension){
			$parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION'=>$dimension->ID_DIMENSION],'','','');
			foreach($parametros as $parametro){
				$array_parametros[] = $parametro->ID_PARAMETRO;
			}
		}
		$total_parametros = count($array_parametros);

		$fecha = date('Y-m-d H:i:s');
		$fecha_limite = null;
		if(isset($_POST['FechaLimite'])){
			$fecha_limite = date('Y-m-d H:i:s', strtotime($_POST['FechaLimite']));
		}
		
		$revision = array(
			'ID_PROYECTO'=>$proyecto['ID_PROYECTO'],
			'ID_TAREA'=>'',
			'ID_ENLACE'=>'',
			'ID_LISTA'=>$_POST['IdLista'],
			'FECHA'=>$fecha,
			'ID_RESPONSABLE'=>$_POST['IdResponsable'],
			'TOTAL_PARAMETROS'=>$total_parametros,
			'TOTAL_VERIFICADOS' => 0,
			'FECHA_LIMITE'=>$fecha_limite,
			'ESTADO'=>'activo'
		);

		$id_revision = $this->GeneralModel->crear('validacion_revisiones',$revision);

		$parametros_notificacion = array(
			'ID_USUARIO' => $_POST['IdResponsable'],
			'ENLACE'=> base_url('/index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$id_revision.'&fecha_revision='.$fecha),
			'GRUPO'=>'validaciones',
			'NOTIFICACION_CONTENIDO'=>'Se te ha asignado la lista de validación <b>'.$lista['TITULO'].'</b> del proyecto <b>'.$proyecto['PROYECTO_NOMBRE'].'</b>',
			'FECHA_CREACION'=>date('Y-m-d H:i:s'),
			'ESTADO'=>'pendiente'
		);
		$this->GeneralModel->crear('notificaciones',$parametros_notificacion);

		foreach($tareas as $tarea){
			

			foreach($array_parametros as $arry_param){
				$respuesta = array(
					'ID_REVISION'=>$id_revision,
					'ID_TAREA'=>$tarea->ID_TAREA,
					'ID_ENLACE'=>$tarea->TAREA_ENLACE_ENTREGABLE,
					'ID_PARAMETRO'=>$arry_param,
					'ID_RESPONSABLE'=>$_POST['IdResponsable'],
					'VALOR'=>'',
					'FECHA'=> $fecha
				);
				$this->GeneralModel->crear('validacion_respuesta',$respuesta);

			}
		}

		redirect(base_url('index.php/proyectos/detalles?id='.$proyecto['ID_PROYECTO']));
	}

	public function validacion()
	{
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
		$this->data['tareas'] = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,'tareas.FECHA_FINAL ASC','','','');
		$this->data['revisiones'] = $this->GeneralModel->lista('validacion_revisiones','',['ID_PROYECTO'=>$_GET['id']],'','','');
		// Cargo Vistas
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_proyectos',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_validacion_proyecto',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}

	public function validacion_finalizar()
	{
		$detalles_revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_PROYECTO'=>$_GET['id'],'FECHA'=>$_GET['fecha_revision']]);
		$cantidad_parametros = $this->GeneralModel->conteo_elementos('validacion_respuesta',['ID_REVISION'=>$detalles_revision['ID_REVISION']]);
		$cantidad_validados = $this->GeneralModel->conteo_elementos('validacion_respuesta',['ID_REVISION'=>$detalles_revision['ID_REVISION'],'VALOR'=>'validada']);
		
		$parametros = array(
			'TOTAL_PARAMETROS' => $cantidad_parametros,
			'TOTAL_VERIFICADOS' => $cantidad_validados,
			'ESTADO' => 'finalizado'
		);

		$this->GeneralModel->actualizar('validacion_revisiones',['ID_REVISION'=>$detalles_revision['ID_REVISION']], $parametros);

		redirect(base_url('index.php/proyectos/detalles?id='.$_GET['id']));
	}

	public function copiar_validacion()
	{
		$detalles_revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_REVISION'=>$_GET['id_revision']]);
		$lista_respuestas = $this->GeneralModel->lista('validacion_respuesta','',['ID_REVISION'=>$detalles_revision['ID_REVISION'],'VALOR'=>''],'','','');
		
		$parametros_revision = array(
			'ID_PROYECTO' => $detalles_revision['ID_PROYECTO'],
			'ID_TAREA'=> $detalles_revision['ID_TAREA'],
			'ID_ENLACE'=> $detalles_revision['ID_ENLACE'],
			'ID_LISTA'=> $detalles_revision['ID_LISTA'],
			'FECHA'=> date('Y-m-d H:i:s'),
			'ID_RESPONSABLE'=> $detalles_revision['ID_RESPONSABLE'],
			'TOTAL_PARAMETROS'=> $detalles_revision['TOTAL_PARAMETROS'],
			'TOTAL_VERIFICADOS'=> 0,
			'ESTADO'=> 'activo',
			'TIPO'=> 'revalidacion',
			'FECHA_LIMITE'=> date('Y-m-d H:i:s', strtotime('today + 3 days'))
		);
		
		$id_revision = $this->GeneralModel->crear('validacion_revisiones',$parametros_revision);
		$i = 0;
		foreach($lista_respuestas as $respuesta){
			$parametros_respuesta = array(
				'ID_REVISION' => $id_revision,
				'ID_TAREA' => $respuesta->ID_TAREA,
				'ID_ENLACE' => $respuesta->ID_ENLACE,
				'ID_PARAMETRO' => $respuesta->ID_PARAMETRO,
				'ID_RESPONSABLE' => $respuesta->ID_RESPONSABLE,
				'VALOR' => '',
				'COMENTARIOS' => '',
				'ID_LISTA' => $respuesta->ID_LISTA,
				'ID_DIMENSION' => $respuesta->ID_DIMENSION,
				'TITULO' => $respuesta->TITULO
				
			);
			$id_resuesta = $this->GeneralModel->crear('validacion_respuesta',$parametros_respuesta);
			$i ++;
		}

		$parametros_revision_act = array(
			'TOTAL_PARAMETROS'=> $i
		);
		$this->GeneralModel->actualizar('validacion_revisiones',['ID_REVISION'=>$id_revision],$parametros_revision_act);

		redirect(base_url('index.php/proyectos/detalles?id='.$detalles_revision['ID_PROYECTO']));
	}

	public function validacion_reporte()
	{
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
		$this->data['tareas'] = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,'tareas.FECHA_FINAL ASC','','','');
		$this->data['revisiones'] = $this->GeneralModel->lista('validacion_revisiones','',['ID_PROYECTO'=>$_GET['id'],'FECHA'=>$_GET['fecha_revision']],'','','');
		// Cargo Vistas
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_proyectos',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_validacion_reporte',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}

	public function borrar_validacion(){
		$proyecto = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$_GET['id']]);
		$revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_REVISION'=>$_GET['id_revision']]);

        // check if the ID_REVISION exists before trying to delete it
        if(isset($revision['ID_PROYECTO']))
        {
			// Borro la categoría
			$this->GeneralModel->borrar('validacion_revisiones',['ID_REVISION'=>$_GET['id_revision']]);
			$this->GeneralModel->borrar('validacion_respuesta',['ID_REVISION'=>$_GET['id_revision']]);
						
            redirect(base_url('index.php/proyectos/detalles?id='.$_GET['id']));
        } else {
					// Mensaje Feedback
					//  Redirecciono
	         redirect(base_url('index.php/proyectos'));
				}
	}


}
