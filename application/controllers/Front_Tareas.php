<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_Tareas extends CI_Controller {
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
		$fecha_inicio = verificar_variable('GET','fecha_inicio',date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s').' -15 days')));
		$this->data['consulta']['fecha_inicio'] = date('Y-m-d H:i:s', strtotime($fecha_inicio));
		$fecha_final = verificar_variable('GET','fecha_final',date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s').' +15 days')));
		$this->data['consulta']['fecha_final'] = date('Y-m-d H:i:s', strtotime($fecha_final));
		$agrupar = '';
		$this->data['consulta']['agrupar'] = $agrupar;
		$parametros_and = array();
		$parametros_or = array();
		/*
		$parametros_and['tareas.FECHA_FINAL >='] = $this->data['consulta']['fecha_inicio'];
		$parametros_and['tareas.FECHA_FINAL <='] = $this->data['consulta']['fecha_final'];
		*/
		$parametros_and['tareas.ESTADO !='] = 'completo';
		$parametros_and['tareas.ID_AREA'] = $_SESSION['usuario']['area'];
		$tablas_join = array();
			$tablas_join['usuarios_tareas'] = 'usuarios_tareas.ID_TAREA = tareas.ID_TAREA';
		$parametros_and['usuarios_tareas.ID_USUARIO'] = $_SESSION['usuario']['id'];

		// Consulta
		$this->data['tareas'] = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,'tareas.FECHA_FINAL ASC','','',$agrupar);
		// Open Tags

		$this->data['titulo']  = 'Tareas';
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_tareas',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_lista_tareas',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		// Vistas
	}

	public function mensajes()
	{
		$mensajes = $this->GeneralModel->lista('tareas_mensajes','','','','','');
		foreach($mensajes as $mensaje){
			echo $mensaje->MENSAJE.' ----> '.$mensaje->TIPO.'<br>';
		}

	}

	public function crear()
	{
		$this->form_validation->set_rules('TareaTitulo', 'Nombre', 'required|max_length[255]', array( 'required' => 'Debes designar el %s.', 'max_length' => 'El nombre no puede superar los 255 caracteres' ));
		if($this->form_validation->run())

    	{
				if(!empty($this->input->post('FechaFinal'))){ $fecha_final = date('Y-m-d', strtotime($this->input->post('FechaFinal'))); }else{ $fecha_final = null; }

				$parametros = array(
					'ID_PROYECTO' => $this->input->post('IdProyecto'),
					'TAREA_TITULO' => $this->input->post('TareaTitulo'),
					'TAREA_DESCRIPCION' => $this->input->post('TareaDescripcion'),
					'TAREA_ENLACE_EDITABLES' =>  $this->input->post('EnlaceEditables'),
					'TAREA_ENLACE_ENTREGABLE' =>  $this->input->post('EnlaceEntregables'),
					'FECHA_INICIO' =>  date('Y-m-d', strtotime($this->input->post('FechaInicio'))),
					'FECHA_FINAL' =>    $fecha_final,
					'PRIORIDAD' =>  'normal',
					'TIPO' => $this->input->post('Tipo'),
					'ESTADO' => $this->input->post('Estado')
				);
				$tarea_id = $this->GeneralModel->crear('tareas',$parametros);

				if(isset($_POST['Usuarios'])&&!empty($_POST['Usuarios'])){

				/*
				| -------------------------------------------------------------------------
				| PREPARO CORREO ELECTRÓNICO
				| -------------------------------------------------------------------------
				*/
				// Parametros de correo

				$config['protocol']    = 'smtp';
				$config['smtp_host']    = $this->data['op']['mailer_host'];
				$config['smtp_port']    = $this->data['op']['mailer_port'];
				$config['smtp_timeout'] = '7';
				$config['smtp_user']    = $this->data['op']['mailer_user'];
				$config['smtp_pass']    = $this->data['op']['mailer_pass'];

				$config['charset']    = 'utf-8';
				$config['mailtype'] = 'html'; // or html
				$config['validation'] = TRUE; // bool whether to validate email or not
				/*
				| -------------------------------------------------------------------------
				| /PREPARO CORREO ELECTRÓNICO
				| -------------------------------------------------------------------------
				*/


					foreach($_POST['Usuarios'] as $usuario){
						$parametros = array(
							'ID_USUARIO' => $usuario,
							'ID_TAREA' => $tarea_id,
							'USUARIO_ASIGNACION'=> 'produccion',
							'FECHA_ASIGNACION'=>date('Y-m-d H:i:s')
			     		);
						// Creo la relación de categorías
			      		$this->GeneralModel->crear('usuarios_tareas',$parametros);

						$parametros_notificacion = array(
							'ID_USUARIO' => $usuario,
							'ENLACE'=> base_url('index.php/tareas/detalles?id='.$tarea_id),
							'GRUPO'=>'tareas',
							'NOTIFICACION_CONTENIDO'=>'Participarás en la tarea <b>'.$this->input->post('TareaTitulo').'</b>',
							'FECHA_CREACION'=>date('Y-m-d H:i:s'),
							'ESTADO'=>'pendiente'
						);

						$this->GeneralModel->crear('notificaciones',$parametros_notificacion);

						  // Datos para enviar por correo
						$datos_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario]);
						$this->data['info'] = array();
						$this->data['info']['Titulo'] = 'ASIGNACIÓN DE TAREA | POLARIS';
						$this->data['info']['Usuario'] = $datos_usuario['USUARIO_NOMBRE'].' '.$datos_usuario['USUARIO_APELLIDOS'];
						$this->data['info']['Mensaje'] = 'Se te ha asignado la tarea <b>'.$this->input->post('TareaTitulo').'</b>';
						$this->data['info']['TextoBoton'] = 'Ir a la tarea';
						$this->data['info']['EnlaceBoton'] = base_url('index.php//tareas/detalles?id='.$tarea_id);
						$this->data['info']['MensajeSecundario'] = '';
						$this->data['info']['Despedida'] = 'Saludos!';
						$this->data['info']['Contacto'] = '';

						$mensaje = $this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/emails/mensaje_general',$this->data,true);

						$this->email->initialize($config);
						$this->email->clear();
						$this->email->from($this->data['op']['mailer_user'], $this->data['op']['titulo_sitio']);
						$this->email->to($datos_usuario['USUARIO_CORREO']);
						$this->email->subject('Asignación de tarea | POLARIS');
						$this->email->message($mensaje);
						// envio el correo
						$this->email->send();


					}
				}

				if(empty($this->input->post('IdProyecto'))){
					redirect(base_url('index.php/tareas'));
				}else{
					redirect(base_url('index.php/proyectos/detalles?id='.$this->input->post('IdProyecto')));
				}
		}
	}

	public function detalles(){
		$this->data['tarea'] = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_GET['id']]);
		$this->data['tipo'] = $this->data['tarea']['TIPO'];
		// Open Tags
		$this->data['titulo']  = $this->data['tarea']['TAREA_TITULO'];
		$this->data['descripcion']  = $this->data['tarea']['TAREA_DESCRIPCION'];
		$this->data['imagen']  = base_url('contenido/img/proyectos/default.jpg');
		$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'tarea'],'','','');
		$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
		$this->data['todos_usuarios'] = $this->GeneralModel->lista('usuarios','','','','','');
		$this->data['array_usuarios'] = array();
		foreach($this->data['todos_usuarios'] as $user_data){
			$this->data['array_usuarios'][$user_data->ID_USUARIO]= array(
				'NOMBRE' => $user_data->USUARIO_NOMBRE.' '.$user_data->USUARIO_APELLIDOS,
				'CORREO' => $user_data->USUARIO_CORREO,
				'IMAGEN' => $user_data->IMAGEN,
				'USUARIO_TELEFONO' => $user_data->USUARIO_TELEFONO,
			);
		}

		// Cargo Vistas
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_tareas',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_detalles_tarea',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}

	public function borrar()
	{
		$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_GET['id']]);


		$this->GeneralModel->borrar('tareas',['ID_TAREA'=>$_GET['id']]);
		$this->GeneralModel->borrar('usuarios_tareas',['ID_TAREA'=>$_GET['id']]);
		$this->GeneralModel->borrar('tareas_mensajes',['ID_TAREA'=>$_GET['id']]);	
		$this->GeneralModel->borrar('validacion_revisiones',['ID_TAREA'=>$_GET['id']]);
		$this->GeneralModel->borrar('validacion_respuesta',['ID_TAREA'=>$_GET['id']]);	

		redirect(base_url('index.php/tareas/detalles?id='.$detalles_proceso['ID_TAREA']));
	}



	public function actualizar()
	{
		$this->form_validation->set_rules('TareaTitulo', 'Título', 'required|max_length[255]', array( 'required' => 'Debes designar el %s.', 'max_length' => 'El nombre no puede superar los 255 caracteres' ));
		if($this->form_validation->run())
    {
			$parametros = array(
				'ID_PROYECTO' =>  $this->input->post('IdProyecto'),
				'ID_TAREA_PADRE' =>  0,
				'TAREA_TITULO' => $this->input->post('TareaTitulo'),
				'TAREA_DESCRIPCION' =>  $this->input->post('TareaDescripcion'),
				'TAREA_ENLACE_EDITABLES' =>  $this->input->post('EnlaceEditables'),
				'TAREA_ENLACE_ENTREGABLE' =>  $this->input->post('EnlaceEntregables'),
				'FECHA_INICIO' =>  date('Y-m-d', strtotime($this->input->post('FechaInicio'))),
				'FECHA_FINAL' =>    date('Y-m-d', strtotime($this->input->post('FechaFinal'))),
				'PRIORIDAD' =>  $this->input->post('Prioridad'),
				'TIPO' =>  $this->input->post('Tipo'),
				'ESTADO' =>  $this->input->post('Estado'),
			);
			if($this->input->post('Estado')=='completo'){
				$parametros['FECHA_ENTREGA'] = date('Y-m-d');
			}
			
			$this->GeneralModel->actualizar('tareas',['ID_TAREA'=>$this->input->post('Identificador')],$parametros);
			
			
			// Borro los metadatos existentes
			$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$this->input->post('Identificador'),'TIPO_OBJETO'=>'equipo']);
			// Meta Datos
			if(!empty($_POST['Meta'])){
				foreach($_POST['Meta'] as $nombre => $valor){
					$parametros_meta = array(
						'ID_OBJETO'=>$this->input->post('Identificador'),
						'DATO_NOMBRE'=>$nombre,
						'DATO_VALOR'=>$valor,
						'TIPO_OBJETO'=>'tarea',
					);
					// Creo las entradas a la galeria
					$this->GeneralModel->crear('meta_datos',$parametros_meta);
				}
			}

			$this->GeneralModel->borrar('usuarios_tareas',['ID_TAREA'=>$this->input->post('Identificador')]);
			if(!empty($_POST['Usuarios'])){
				$mensaje = 'Se actualizó la información de la tarea';
			
				$usuarios_asignados = implode(', ', $_POST['Usuarios']);
				// Genero el mensaje
				/*
				$parametros = array(
					'ID_TAREA' => $this->input->post('Identificador'),
					'ID_USUARIO' => $_SESSION['usuario']['id'],
					'MENSAJE' => $mensaje,
					'ASIGNACIONES' => $usuarios_asignados,
				);
				$this->GeneralModel->crear('tareas_mensajes',$parametros);
				*/
				/*
				| -------------------------------------------------------------------------
				| PREPARO CORREO ELECTRÓNICO
				| -------------------------------------------------------------------------
				*/
				// Parametros de correo

				$config['protocol']    = 'smtp';
				$config['smtp_host']    = $this->data['op']['mailer_host'];
				$config['smtp_port']    = $this->data['op']['mailer_port'];
				$config['smtp_timeout'] = '7';
				$config['smtp_user']    = $this->data['op']['mailer_user'];
				$config['smtp_pass']    = $this->data['op']['mailer_pass'];

				$config['charset']    = 'utf-8';
				$config['mailtype'] = 'html'; // or html
				$config['validation'] = TRUE; // bool whether to validate email or not
				/*
				| -------------------------------------------------------------------------
				| /PREPARO CORREO ELECTRÓNICO
				| -------------------------------------------------------------------------
				*/
				foreach($_POST['Usuarios'] as $usuario){
					$parametros = array(
						'ID_USUARIO' => $usuario,
						'ID_TAREA' => $this->input->post('Identificador'),
						'USUARIO_ASIGNACION'=> 'produccion',
						'FECHA_ASIGNACION'=>date('Y-m-d H:i:s')
					);



					// Creo la relación de categorías
					$this->GeneralModel->crear('usuarios_tareas',$parametros);

					$parametros_notificacion = array(
						'ID_USUARIO' => $usuario,
						'ENLACE'=> base_url('index.php/tareas/detalles?id='.$this->input->post('Identificador')),
						'GRUPO'=>'tareas',
						'NOTIFICACION_CONTENIDO'=>'Se ha actualizado la tarea <b>'.$this->input->post('TareaTitulo').'</b> y participarás en ella',
						'FECHA_CREACION'=>date('Y-m-d H:i:s'),
						'ESTADO'=>'pendiente'
					);
					$this->GeneralModel->crear('notificaciones',$parametros_notificacion);
					  // Datos para enviar por correo
					  $datos_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario]);
					  $this->data['info'] = array();
					  $this->data['info']['Titulo'] = 'ASIGNACIÓN DE TAREA | POLARIS';
					  $this->data['info']['Usuario'] = $datos_usuario['USUARIO_NOMBRE'].' '.$datos_usuario['USUARIO_APELLIDOS'];
					  $this->data['info']['Mensaje'] = 'Se ha actualizado la tarea <b>'.$this->input->post('TareaTitulo').'</b> y participarás en ella';
					  $this->data['info']['TextoBoton'] = 'Ir a la tarea';
					  $this->data['info']['EnlaceBoton'] = base_url('index.php//tareas/detalles?id='.$this->input->post('Identificador'));
					  $this->data['info']['MensajeSecundario'] = '';
					  $this->data['info']['Despedida'] = 'Saludos!';
					  $this->data['info']['Contacto'] = '';

					  $mensaje = $this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/emails/mensaje_general',$this->data,true);

					  $this->email->initialize($config);
					  $this->email->clear();
					  $this->email->from($this->data['op']['mailer_user'], $this->data['op']['titulo_sitio']);
					  $this->email->to($datos_usuario['USUARIO_CORREO']);
					  $this->email->subject('Asignación de tarea | POLARIS');
					  $this->email->message($mensaje);
					  // envio el correo
					  $this->email->send();
				}

			}

			// Reviso el estatus del proyecto
			//$detalles_proyecto = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$this->input->post('IdProyecto')]);
			$lista_tareas = $this->GeneralModel->lista('tareas','',['ID_PROYECTO'=>$this->input->post('IdProyecto')],'','','');
			$todas_las_tareas = 0;
			$tareas_completas = 0;
			$tareas_pendientes = 0;
			foreach($lista_tareas as $lista_tarea){
				$todas_las_tareas ++;
				if($lista_tarea->ESTADO=='completo'){
					$tareas_completas ++;
				}else{
					$tareas_pendientes ++;
				}
			}

			if($todas_las_tareas==$tareas_completas){
				$this->GeneralModel->actualizar('proyectos',['ID_PROYECTO'=>$this->input->post('IdProyecto')],['ESTADO'=>'terminado']);
			}else{
				$this->GeneralModel->actualizar('proyectos',['ID_PROYECTO'=>$this->input->post('IdProyecto')],['ESTADO'=>'activo']);
			}

			// Mensaje Feedback
			//  Redirecciono
			redirect(base_url('index.php/tareas/detalles?id='.$this->input->post('Identificador')));

    }else{

			$this->data['tarea'] = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_GET['id']]);
			$this->data['proyecto'] = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$this->data['tarea']['ID_PROYECTO']]);
			$this->data['tipo'] = $this->data['tarea']['TIPO'];
			// Open Tags
			$this->data['titulo']  = $this->data['tarea']['TAREA_TITULO'];
			$this->data['descripcion']  = $this->data['tarea']['TAREA_DESCRIPCION'];
			$this->data['imagen']  = base_url('contenido/img/proyectos/default.jpg');
			$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'equipo'],'','','');
			$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
			// Reviso la vista especializada
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_tareas',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_form_actualizar_tarea',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}
	}

	public function agregar_mensaje()
	{
		$this->form_validation->set_rules('IdTarea', 'Identificador', 'required', array( 'required' => 'Debes designar el %s.' ));
		if($this->form_validation->run())
    	{
			$usuarios_anteriores = $_POST['asignaciones_actuales'];
			if(isset($_POST['Usuarios'])){
			$usuarios_asignados = implode(', ', $_POST['Usuarios']);
			}else{
				$usuarios_asignados = '';
			}
			$mensaje = $this->input->post('Mensaje');
			$tipo = 'mensaje';
			if($_POST['EstadoActual']!=$_POST['EstadoTarea']){
				$mensaje .= 'Se cambio el estado a: <b>'.$_POST['EstadoTarea'].'</b>';
			}

				if(!empty($this->input->post('FechaFinal'))){ $fecha_final = date('Y-m-d', strtotime($this->input->post('FechaFinal'))); }else{ $fecha_final = null; }
				$parametros = array(
					'ID_TAREA' => $this->input->post('IdTarea'),
					'ID_USUARIO' => $this->input->post('IdUsuario'),
					'MENSAJE' => $mensaje,
					'ASIGNACIONES' => $usuarios_asignados,
					'ENLACE' => $this->input->post('Enlace'),
					'TIPO' => $tipo
				);

				$this->GeneralModel->crear('tareas_mensajes',$parametros);
				$parametros = array(
					'ESTADO' => $this->input->post('EstadoTarea'),
				);
				$this->GeneralModel->actualizar('tareas',['ID_TAREA'=>$this->input->post('IdTarea')],$parametros);
				

				$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$this->input->post('IdTarea')]);
				$lista_tareas = $this->GeneralModel->lista('tareas','',['ID_PROYECTO'=>$detalles_tarea['ID_PROYECTO']],'','','');
				$todas_las_tareas = 0;
				$tareas_completas = 0;
				$tareas_pendientes = 0;
				foreach($lista_tareas as $lista_tarea){
					$todas_las_tareas ++;
					if($lista_tarea->ESTADO=='completo'){
						$tareas_completas ++;
					}else{
						$tareas_pendientes ++;
					}
				}
				if($todas_las_tareas==$tareas_completas){
					$this->GeneralModel->actualizar('proyectos',['ID_PROYECTO'=>$detalles_tarea['ID_PROYECTO']],['ESTADO'=>'terminado']);
				}else{
					$this->GeneralModel->actualizar('proyectos',['ID_PROYECTO'=>$detalles_tarea['ID_PROYECTO']],['ESTADO'=>'activo']);
				}
				redirect(base_url('index.php/tareas/detalles?id='.$this->input->post('IdTarea')));

		}
		

	}
	public function actualizar_mensaje(){
		$this->form_validation->set_rules('Identificador', 'Identificador', 'required', array( 'required' => 'Debes designar el %s.' ));
		if($this->form_validation->run())
		{
			$usuarios_anteriores = $_POST['asignaciones_actuales'];

			$mensaje = $this->input->post('Mensaje');
			$tipo = 'mensaje';
			if($_POST['EstadoActual']!=$_POST['EstadoTarea']){
				$mensaje .= 'Se cambio el estado a: <b>'.$_POST['EstadoTarea'].'</b>';
			}

				if(!empty($this->input->post('FechaFinal'))){ $fecha_final = date('Y-m-d', strtotime($this->input->post('FechaFinal'))); }else{ $fecha_final = null; }
				$parametros = array(
					'ID_TAREA' => $this->input->post('IdTarea'),
					'ID_USUARIO' => $this->input->post('IdUsuario'),
					'MENSAJE' => $mensaje,
					'ASIGNACIONES' => $usuarios_asignados,
					'ENLACE' => $this->input->post('Enlace'),
					'TIPO' => $tipo
				);

				$this->GeneralModel->actualizar('tareas_mensajes',['ID'=>$_POST['Identificador']],$parametros);
				$parametros = array(
					'ESTADO' => $this->input->post('EstadoTarea'),
				);
				$this->GeneralModel->actualizar('tareas',['ID_TAREA'=>$this->input->post('IdTarea')],$parametros);
				

				$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$this->input->post('IdTarea')]);
				$lista_tareas = $this->GeneralModel->lista('tareas','',['ID_PROYECTO'=>$detalles_tarea['ID_PROYECTO']],'','','');
				$todas_las_tareas = 0;
				$tareas_completas = 0;
				$tareas_pendientes = 0;
				foreach($lista_tareas as $lista_tarea){
					$todas_las_tareas ++;
					if($lista_tarea->ESTADO=='completo'){
						$tareas_completas ++;
					}else{
						$tareas_pendientes ++;
					}
				}
				if($todas_las_tareas==$tareas_completas){
					$this->GeneralModel->actualizar('proyectos',['ID_PROYECTO'=>$detalles_tarea['ID_PROYECTO']],['ESTADO'=>'terminado']);
				}else{
					$this->GeneralModel->actualizar('proyectos',['ID_PROYECTO'=>$detalles_tarea['ID_PROYECTO']],['ESTADO'=>'activo']);
				}
				redirect(base_url('index.php/tareas/detalles?id='.$this->input->post('IdTarea')));

		}
	}

	public function crear_validacion(){
		$proyecto = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$_POST['IdProyecto']]);
		$tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_POST['IdTarea']],'','','');
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
				'ID_TAREA'=>$tarea['ID_TAREA'],
				'ID_ENLACE'=>$tarea['TAREA_ENLACE_ENTREGABLE'],
				'ID_LISTA'=>$_POST['IdLista'],
				'FECHA'=>$fecha,
				'ID_RESPONSABLE'=>$_POST['IdResponsable'],
				'TOTAL_PARAMETROS'=>$total_parametros,
				'TOTAL_VERIFICADOS' => 0,
				'ESTADO'=>'activo',
				'FECHA'=>$fecha_limite,
			);

			$id_revision = $this->GeneralModel->crear('validacion_revisiones',$revision);

			foreach($array_parametros as $arry_param){
				$respuesta = array(
					'ID_REVISION'=>$id_revision,
					'ID_TAREA'=>$tarea['ID_TAREA'],
					'ID_ENLACE'=>$tarea['TAREA_ENLACE_ENTREGABLE'],
					'ID_PARAMETRO'=>$arry_param,
					'ID_RESPONSABLE'=>$_POST['IdResponsable'],
					'VALOR'=>'',
					'FECHA'=> $fecha
				);
				$this->GeneralModel->crear('validacion_respuesta',$respuesta);

			}

		redirect(base_url('index.php/tareas/detalles?id='.$tarea['ID_TAREA']));
	}

	public function validacion_faltante(){
		$revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_REVISION'=>$_GET['id_revision']]);
		$proyecto = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$revision['ID_PROYECTO']]);
		$tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_GET['tarea']],'','','');
		$lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$revision['ID_LISTA']]);
		$dimensiones = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$revision['ID_LISTA']],'','','');
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

			foreach($array_parametros as $arry_param){
				$respuesta = array(
					'ID_REVISION'=>$revision['ID_REVISION'],
					'ID_TAREA'=>$tarea['ID_TAREA'],
					'ID_ENLACE'=>$tarea['TAREA_ENLACE_ENTREGABLE'],
					'ID_PARAMETRO'=>$arry_param,
					'ID_RESPONSABLE'=>$revision['ID_RESPONSABLE'],
					'VALOR'=>'',
					'FECHA'=> $fecha
				);
				$this->GeneralModel->crear('validacion_respuesta',$respuesta);

			}

		redirect(base_url('index.php/proyectos/validacion?id='.$revision['ID_PROYECTO'].'&fecha_revision='.$revision['FECHA'].'&tarea='.$tarea['ID_TAREA']));
	}

	public function validacion_reporte(){
		$this->data['tarea'] = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_GET['tarea']]);
		$this->data['tipo'] = $this->data['tarea']['TIPO'];
		// Open Tags
		$this->data['titulo']  = $this->data['tarea']['TAREA_TITULO'];
		$this->data['descripcion']  = $this->data['tarea']['TAREA_DESCRIPCION'];
		$this->data['imagen']  = base_url('contenido/img/proyectos/default.jpg');
		$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'tarea'],'','','');
		$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
		$this->data['todos_usuarios'] = $this->GeneralModel->lista('usuarios','','','','','');
		$this->data['array_usuarios'] = array();
		foreach($this->data['todos_usuarios'] as $user_data){
			$this->data['array_usuarios'][$user_data->ID_USUARIO]= array(
				'NOMBRE' => $user_data->USUARIO_NOMBRE.' '.$user_data->USUARIO_APELLIDOS,
				'CORREO' => $user_data->USUARIO_CORREO,
				'IMAGEN' => $user_data->IMAGEN,
				'USUARIO_TELEFONO' => $user_data->USUARIO_TELEFONO,
			);
		}

		// Cargo Vistas
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_tareas',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_validacion_reporte_tarea',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}

	public function asignar_rol()
	{
		$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_POST['IdTarea']]);
		$parametros = array(
			'ID_TAREA' => $_POST['IdTarea'],
			'ID_USUARIO' => $_POST['IdUsuario'],
			'ETIQUETA' => $_POST['Etiqueta'],
			'PROCESO' => $_POST['Proceso'],
			'FECHA' => date('Y-m-d 00:00:00', strtotime($_POST['Fecha'])),
			'ESTADO' => 'pendiente',
			'FECHA_TERMINADO' => null
		);

		$id_proceso = $this->GeneralModel->crear('roles_historial',$parametros);

		if(empty($detalles_tarea['ID_PROCESO'])){
			$this->GeneralModel->actualizar('tareas',['ID_TAREA'=>$detalles_tarea['ID_TAREA']],['ID_PROCESO'=>$id_proceso]);
		}

		redirect(base_url('index.php/tareas/detalles?id='.$this->input->post('IdTarea')));

	}

	public function borrar_rol()
	{
		$detalles_proceso = $this->GeneralModel->detalles('roles_historial',['ID'=>$_GET['id']]);

		$parametros = [
			'ID'=>$_GET['id']
		];

		$this->GeneralModel->borrar('roles_historial',$parametros);

		redirect(base_url('index.php/tareas/detalles?id='.$detalles_proceso['ID_TAREA']));
	}

	public function completar_rol()
	{
		
		$detalles_proceso = $this->GeneralModel->detalles('roles_historial',['ID'=>$_POST['IdProcesoActual']]);
		$detalles_proceso_siguiente = $this->GeneralModel->detalles('roles_historial',['ID'=>$_POST['IdProcesoSiguiente']]);
		$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$detalles_proceso['ID_TAREA']]);

		$parametros_actual = [
			'ESTADO'=>'completo',
			'FECHA_TERMINADO'=>date('Y-m-d H:i:s')
		];

		$this->GeneralModel->actualizar('roles_historial',['ID'=>$_POST['IdProcesoActual']],$parametros_actual);
		$this->GeneralModel->actualizar('tareas',['ID_TAREA'=>$detalles_proceso['ID_TAREA']],['ID_PROCESO'=>$detalles_proceso_siguiente['ID']]);
		redirect(base_url('index.php/tareas/detalles?id='.$detalles_proceso['ID_TAREA']));
	}

}
