<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios_Inicio extends CI_Controller {
	public function __construct(){
	parent::__construct();
		// Cargo las Opciones
		$this->data['op'] = opciones_default();

		// Verifico Sesión


		// reviso el dispositivo
		if($this->agent->is_mobile()){
			//$this->data['dispositivo']  = "mobile";
			$this->data['dispositivo']  = "";
		}else{
			$this->data['dispositivo']  = "";
		}
		// Cargo los modelos
		$this->load->model('UsuariosModel');
		$this->load->model('AutenticacionModel');
		// Variables Globales

		//Titulo
		$this->data['titulo']  = 'Autenticación de usuarios';
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
		// Open Tags
		$this->data['titulo']  = 'Usuarios | '.$this->data['op']['titulo_sitio'];
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		// Inicio Sesión
		if(!verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){
			redirect(base_url('index.php/login?url_redirect='.base_url('index.php/'.uri_string().'?'.$_SERVER['QUERY_STRING'])));
		}
		// Datos Generales
		$this->data['titulo']  = 'Panel de Usuario';
		// Vistas
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/pagina_inicio',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}
	public function crear()
	{
		// Open Tags
		$this->data['titulo']  = 'Usuarios | '.$this->data['op']['titulo_sitio'];
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		/*
		+ Validación de formulario
		*/

		$this->form_validation->set_rules('UsuarioNombre', 'Nombre', 'required', array('required' => 'Debes escribir tu %s.'));
		$this->form_validation->set_rules('UsuarioApellidos', 'Apellidos', 'required', array('required' => 'Debes escribir tus %s.'));
		$this->form_validation->set_rules('UsuarioCorreo', 'Correo Electrónico', 'required|valid_email|is_unique[usuarios.USUARIO_CORREO]', array(
			'required' => 'Debes escribir tu %s.',
			'valid_email' => 'Debes escribir una dirección de correo valida.',
			'is_unique' => 'La dirección de correo ya está registrada'
		));
		$this->form_validation->set_rules('UsuarioPass', 'Contraseña', 'required', array('required' => 'Debes escribir tu %s.'));
		$this->form_validation->set_rules('UsuarioPassConf', 'Contraseña Confirmación', 'required|matches[UsuarioPass]', array(
			'required' => 'Debes confirmar la Contraseña',
			'matches' => 'La confirmación de la contraseña no coincide.'
		));

		// FOrmulario Válido
		if($this->form_validation->run()){
			/*
			+ Éxito de validación de formulario
			*/
			// Creo el identificador Único
			$id_usuario = uniqid('', true);
			if(!$this->GeneralModel->campo_existe('usuarios',['ID_USUARIO'=>$id_usuario])){
				$id_usuario = uniqid('', true);
			}

			// Creo la contraseña
			$pass = password_hash($this->input->post('UsuarioPass'), PASSWORD_DEFAULT);

			$parametros = [
				'ID_USUARIO' => $id_usuario,
				'USUARIO_NOMBRE' => $this->input->post('UsuarioNombre'),
				'USUARIO_APELLIDOS' => $this->input->post('UsuarioApellidos'),
				'USUARIO_CORREO' => $this->input->post('UsuarioCorreo'),
				'USUARIO_PASSWORD' => $pass,
				'FECHA_REGISTRO' => date('Y-m-d H:i:s'),
				'FECHA_ACTUALIZACION' => date('Y-m-d H:i:s'),
				'TIPO' => 'usuario'
			];

			$usuario_id = $this->GeneralModel->crear('usuarios',$parametros);

			/*
			| -------------------------------------------------------------------------
			| PREPARO CORREO ELECTRÓNICO
			| -------------------------------------------------------------------------
			|
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
			|
			*/

			$this->data['info'] = array();
			$this->data['info']['Titulo'] = 'Bienvenido a '.$this->data['op']['titulo_sitio'];
			$this->data['info']['Usuario'] = $this->input->post('UsuarioNombre').' '.$this->input->post('UsuarioApellidos');
			$this->data['info']['Mensaje'] = 'Tu registro con nosotros está completo, podrás disfrutar de los beneficios de nuestro sitio.';
			$this->data['info']['TextoBoton'] = 'Iniciar sesión';
			$this->data['info']['EnlaceBoton'] = base_url('index.php/login');
			$this->data['info']['MensajeSecundario'] = 'Es un placer servirle, puedes encontrarnos en nuestro sitio web';
			$this->data['info']['Despedida'] = 'Suerte!';
			$this->data['info']['Contacto'] = 'Puedes encontrarnos en '.$this->data['op']['correo_sitio'];

			$mensaje = $this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/emails/mensaje_general',$this->data,true);
			$this->email->initialize($config);

			$this->email->from($this->data['op']['mailer_user'], $this->data['op']['titulo_sitio']);
			$this->email->to($this->input->post('UsuarioCorreo'));

			$this->email->subject('Bienvenido a '.$this->data['op']['titulo_sitio']);
			$this->email->message($mensaje);
			// envio el correo
			if($this->email->send()){
				// Genero la retroalimentacion
			}else{
				// Genero la retroalimentacion
			}

			// redirecciono
			redirect(base_url('index.php/login'));
		}else{
			// Si no hay formulario cargo vistas básicas
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_login',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/usuario_form_usuario',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}

	}
	public function detalles()
	{
		$this->data['usuario'] = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_SESSION['usuario']['id']]);
		$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'usuario'],'','','');
		$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
		// Reviso la vista especializada
		$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/front/','detalles_','usuarios','_'.$this->data['tipo']);

		// Cargo Vistas
		$this->load->view('default'.$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['vista'],$this->data);
		$this->load->view('default'.$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}
	public function actualizar()
	{

		$this->form_validation->set_rules('UsuarioNombre', 'Nombre', 'required', array('required' => 'Debes escribir tu %s.'));
		$this->form_validation->set_rules('UsuarioApellidos', 'Apellidos', 'required', array('required' => 'Debes escribir tus %s.'));
		$this->form_validation->set_rules('UsuarioCorreo', 'Correo Electrónico', 'required|valid_email', array(
			'required' => 'Debes escribir tu %s.',
			'valid_email' => 'Debes escribir una dirección de correo valida.'
		));

		$nuevo_pass = verificar_variable('POST','UsuarioPass','');

		if(!empty($nuevo_pass)){
			$this->form_validation->set_rules('UsuarioPass', 'Contraseña', 'required', array('required' => 'Debes escribir tu %s.'));
			$this->form_validation->set_rules('UsuarioPassConf', 'Contraseña Confirmación', 'required|matches[UsuarioPass]', array(
				'required' => 'Debes confirmar la Contraseña',
				'matches' => 'La confirmación de la contraseña no coincide.'
			));
		}

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
				$destino = $this->data['op']['ruta_imagenes'].'usuarios/';
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
				$nombre = 'usuario-'.uniqid();
				$destino = $this->data['op']['ruta_imagenes'].'usuarios/';
				// Subo la imagen y obtengo el nombre Default si va vacía
				$imagen_fondo = subir_imagen($archivo,$ancho,$alto,$corte,$extension,$tipo_imagen,$calidad,$nombre,$destino);

			}else{
				$imagen_fondo = $this->input->post('ImagenFondoActual');
			}

			$parametros = [
				'USUARIO_NOMBRE' => $this->input->post('UsuarioNombre'),
				'USUARIO_APELLIDOS' => $this->input->post('UsuarioApellidos'),
				'USUARIO_CORREO' => $this->input->post('UsuarioCorreo'),
				'USUARIO_TELEFONO' => $this->input->post('UsuarioTelefono'),
				'IMAGEN' => $imagen,
				'IMAGEN_FONDO' => $imagen_fondo,
				'COLOR' => $this->input->post('UsuarioColor'),
				'USUARIO_FECHA_NACIMIENTO' => date('Y-m-d', strtotime($this->input->post('UsuarioFechaNacimiento'))),
				'FECHA_ACTUALIZACION' => date('Y-m-d H:i:s'),
				'TIPO' => $this->input->post('Tipo')
			];

			$nuevo_pass = verificar_variable('POST','UsuarioPass','');

			if(!empty($nuevo_pass)){
				// Creo la contraseña
				$pass = password_hash($this->input->post('UsuarioPass'), PASSWORD_DEFAULT);
				$parametros['USUARIO_PASSWORD'] = $pass;
			}

			$this->GeneralModel->actualizar('usuarios',['ID_USUARIO'=>$this->input->post('Identificador')],$parametros);


			// Borro los metadatos existentes
			$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$this->input->post('Identificador'),'TIPO_OBJETO'=>'usuario']);
			// Meta Datos
			if(!empty($_POST['Meta'])){
				foreach($_POST['Meta'] as $nombre => $valor){
					$parametros_meta = array(
						'ID_OBJETO'=>$this->input->post('Identificador'),
						'DATO_NOMBRE'=>$nombre,
						'DATO_VALOR'=>$valor,
						'TIPO_OBJETO'=>'usuario',
					);
					// Creo las entradas a la galeria
					$this->GeneralModel->crear('meta_datos',$parametros_meta);
				}
			}

			// USUARIOS
			// Borro las categorías existentes
			$this->GeneralModel->borrar('equipos_usuarios',['ID_USUARIO'=>$this->input->post('Identificador')]);

			if(isset($_POST['EquiposUsuarios'])&&!empty($_POST['EquiposUsuarios'])){
				foreach($_POST['EquiposUsuarios'] as $equipo){
					$parametros = array(
						'ID_USUARIO' => $this->input->post('Identificador'),
						'ID_EQUIPO' => $equipo
					);
					// Creo la relación de categorías
					$this->GeneralModel->crear('equipos_usuarios',$parametros);
				}
			}

			// Redirecciono
			redirect(base_url('index.php/usuarios/detalles?id='.$this->input->post('Identificador')));

		}else{
			$this->data['usuario'] = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_SESSION['usuario']['id']]);
			$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'usuario'],'','','');
			$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
			// Reviso la vista especializada
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/usuario_form_actualizar_usuario',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}
	}
	public function actualizar_pass()
	{
		if(!verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){
			redirect(base_url('index.php/login?url_redirect='.base_url('index.php/'.uri_string().'?'.$_SERVER['QUERY_STRING'])));
		}
		// Open Tags
		$this->data['titulo']  = 'Usuarios | '.$this->data['op']['titulo_sitio'];
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');


		$this->form_validation->set_rules('UsuarioPassActual', 'Contraseña Actual', 'required', array('required' => 'Debes escribir tu %s.'));
		$this->form_validation->set_rules('UsuarioPass', 'Contraseña', 'required', array('required' => 'Debes escribir tu %s.'));
		$this->form_validation->set_rules('UsuarioPassConf', 'Contraseña Confirmación', 'required|matches[UsuarioPass]', array(
			'required' => 'Debes confirmar la Contraseña',
			'matches' => 'La confirmación de la contraseña no coincide.'
		));

		if($this->form_validation->run())
		{

			if($this->AutenticacionModel->verificar_password($_SESSION['usuario']['correo'],$this->input->post('UsuarioPassActual'))){
				$id = $_SESSION['usuario']['id'];
				$pass = password_hash($this->input->post('UsuarioPass'), PASSWORD_DEFAULT);
				$parametros = array(
					'USUARIO_PASSWORD' => $pass
				);
				// Actualizo la contraseña
				$this->AutenticacionModel->restaurar_pass($id,$parametros);
				redirect(base_url('index.php/usuarios/actualizar'));
			}else{
				// Repido proceso
				redirect(base_url('index.php/usuarios/actualizar_pass'));
			}
			//$usuario_id = $this->UsuariosModel->actualizar($_SESSION['usuario']['id'],$parametros);
			//
		}else{
			$this->data['usuario'] = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_SESSION['usuario']['id']]);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/usuario_form_actualizar_pass',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}
	}
}
