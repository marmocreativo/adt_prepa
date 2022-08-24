<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Autenticacion extends CI_Controller {
	public function __construct(){
	parent::__construct();
		// Cargo las Opciones
		$this->data['op'] = opciones_default();

		// reviso el dispositivo
		if($this->agent->is_mobile()){
			//$this->data['dispositivo']  = "mobile";
			$this->data['dispositivo']  = "";
		}else{
			$this->data['dispositivo']  = "";
		}
		// Cargo los modelos
		$this->load->model('AutenticacionModel');
		// Variables Globales
		$this->data['titulo']  = 'Autenticación de usuarios';
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
		$this->data['titulo']  = 'Usuarios | '.$this->data['op']['titulo_sitio'];
		$this->data['descripcion']  = 'Autenticación de usuarios';
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		if(verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){
			redirect(base_url('usuarios'));
		}else{
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_login',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/usuario_form_login',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}
	}
	public function iniciar_sesion()
	{
		$this->data['titulo']  = 'Usuarios | '.$this->data['op']['titulo_sitio'];
		$this->data['descripcion']  = 'Autenticación de usuarios';
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		// Valido el Formulario
		$this->form_validation->set_rules('UsuarioCorreo', 'Correo Electrónico', 'required|valid_email', array( 'required' => 'Debes escribir tu %s.', 	'valid_email' => 'Debes escribir una dirección de correo valida.' ));
		$this->form_validation->set_rules('UsuarioPass', 'Contraseña', 'required', array('required' => 'Debes escribir tu %s.'));

		if($this->form_validation->run())
		{
				$correo = $this->input->post('UsuarioCorreo');
				$pass = $this->input->post('UsuarioPass');
			// Verifico si el correo está registrado y si coincide la contraseña
			if( $this->AutenticacionModel->verificar_registro($correo) && $this->AutenticacionModel->verificar_password($correo, $pass) ){
				// Si todo está correcto inicio sesión
				$parametros = $this->GeneralModel->detalles('usuarios',['USUARIO_CORREO'=>$correo]);
				if($parametros['ESTADO']!='activo'){
						// Mensaje de feedback
						// redirección
						redirect(base_url('login'));
				}else{
					// Función de Iniciar Sesión
					iniciar_sesion($parametros);
					// Reviso si hay redirección
					if(!null==$this->input->post('UrlRedirect') ){
						// redireccono a la URL anterior
						redirect($this->input->post('UrlRedirect'));
					}else{
						// Redirecciono al panel del usuario
						redirect(base_url(''));
					}
				}
			}else{
				// Mensaje de feedback
				// redirección
					// Si no coinciden vuelvo a cargar el formulario
					redirect(base_url('login'));
			}
		}else{
			// Si el formulario no se verifica cargo de nuevo el Login
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_login',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/usuario_form_login',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}
	}
	public function recuperar_pass()
	{
		$this->data['titulo']  = 'Usuarios | '.$this->data['op']['titulo_sitio'];
		$this->data['descripcion']  = 'Autenticación de usuarios';
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');
		// Valido el Formulario
		$this->form_validation->set_rules('UsuarioCorreo', 'Correo Electrónico', 'required|valid_email', array( 'required' => 'Debes escribir tu %s.', 	'valid_email' => 'Debes escribir una dirección de correo valida.' ));

		if($this->form_validation->run())
		{
			$correo = $this->input->post('UsuarioCorreo');
			// Verifico si el correo está registrado y si coincide la contraseña
			if( $this->AutenticacionModel->verificar_registro($correo)){
				// Si todo está correcto inicio sesión
				$datos_usuario = $this->GeneralModel->detalles('usuarios',['USUARIO_CORREO'=>$correo]);

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

				// Datos para enviar por correo
				$this->data['info'] = array();

				$this->data['info']['Titulo'] = 'Recuperar Contraseña';
				$this->data['info']['Usuario'] = $datos_usuario['USUARIO_NOMBRE'].' '.$datos_usuario['USUARIO_APELLIDOS'];
				$this->data['info']['Mensaje'] = 'Se ha solicitado la restauración de tu contraseña, puedes restaurarla dando click en el siguiente enlace.';
				$this->data['info']['TextoBoton'] = 'Restaurar Contraseña';
				$this->data['info']['EnlaceBoton'] = base_url('login/restaurar_pass?id='.$datos_usuario['ID_USUARIO'].'&clave='.$this->AutenticacionModel->crear_pin($datos_usuario['ID_USUARIO']));
				$this->data['info']['MensajeSecundario'] = 'Si no has solicitado esta restauración ignora este mensaje si tienes dudas por favor contacta con nosotros';
				$this->data['info']['Despedida'] = 'Saludos!';
				$this->data['info']['Contacto'] = 'Puedes encontrarnos en '.$this->data['op']['correo_sitio'];

				$mensaje = $this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/emails/mensaje_general',$this->data,true);
				$this->email->initialize($config);

				$this->email->from($this->data['op']['mailer_user'], $this->data['op']['titulo_sitio']);
				$this->email->to($correo);

				$this->email->subject('Recupera tu contraseña');
				$this->email->message($mensaje);
				// envio el correo

				// envio el correo
				if($this->email->send()){
					// Genero la retroalimentacion
				}else{
					// Genero la retroalimentacion
				}
				// redirecciono
				redirect(base_url('login'));

			}else{
					// Si no coinciden vuelvo a cargar el formulario
					// Mensaje de feedback
					// redirección
					redirect(base_url('login/recuperar_pass'));
			}
		}else{
			// Si el formulario no se verifica cargo de nuevo el Login
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_login',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/usuario_form_recuperar_pass',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}
	}
	public function restaurar_pass()
	{
		$this->data['titulo']  = 'Usuarios | '.$this->data['op']['titulo_sitio'];
		$this->data['descripcion']  = 'Autenticación de usuarios';
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');
		// valido que tenga las variables id y clave en el GET
		if(isset($_GET['id'])&&!empty($_GET['id'])&&isset($_GET['clave'])&&!empty($_GET['clave'])){

			$id = $_GET['id'];
			$clave = $_GET['clave'];

			// Solo si el PIN es válido verifico el formulario
			// Valido el Formulario
			$this->form_validation->set_rules('UsuarioPass', 'Contraseña', 'required', array('required' => 'Debes escribir tu %s.'));
			$this->form_validation->set_rules('UsuarioPassConf', 'Contraseña Confirmación', 'required|matches[UsuarioPass]', array(
				'required' => 'Debes confirmar la Contraseña',
				'matches' => 'La confirmación de la contraseña no coincide.'
			));

			if($this->form_validation->run())
	    {
				// Si el formulario es válido creo el HASH de la contraseña
				$pass = password_hash($this->input->post('UsuarioPass'), PASSWORD_DEFAULT);
				$parametros = array(
					'USUARIO_PASSWORD' => $pass
	      );
				$this->AutenticacionModel->restaurar_pass($id,$parametros);
				$this->AutenticacionModel->desactivar_pin($id,$clave);
				// Mensaje de feedback
				redirect(base_url('login'));
			}else{
				if($this->AutenticacionModel->verificar_pin($id,$clave)){
						// Si el formulario no se verifica cargo de nuevo el Login
						$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_login',$this->data);
						$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/usuario_form_restaurar_pass',$this->data);
						$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
				}else{
					// Mensaje de feedback
					// SI el PIN no es valido regreso y mando error
					redirect(base_url('login'));
				}
			}

		}else{
			// Si no tengo las variables definidas redirecciono directo al Login
			redirect(base_url('login'));
		}
	}
	public function cerrar_sesion()
	{
		// Login Form
		session_destroy();
		redirect(base_url('login'));
	}
}
