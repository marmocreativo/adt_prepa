<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_Usuarios extends CI_Controller {
	public function __construct(){
  parent::__construct();
		// Cargo las Opciones
		if (!$this->db->table_exists('opciones') ){
			redirect(base_url('reparar_EN_CMS'));
		}
		$this->data['op'] = opciones_default();

		// Verifico Sesión

		if(!verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){
			$this->session->set_flashdata('alerta', 'Debes iniciar sesión para continuar');
			redirect(base_url('login?url_redirect='.base_url(uri_string().'?'.$_SERVER['QUERY_STRING'])));
		}


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

		$parametros_and['usuarios.ESTADO !='] = 'borrador';

		if(!empty($busqueda)){
			$parametros_or['usuarios.USUARIO_NOMBRE'] = $busqueda;
			$parametros_or['usuarios.USUARIO_APELLIDOS'] = $busqueda;
			$parametros_or['usuarios.USUARIO_CORREO'] = $busqueda;
		}
		$tablas_join = array();

		// Paginador
		$this->data['pub_totales'] = $this->GeneralModel->conteo('usuarios',$tablas_join,$parametros_or,$parametros_and,$agrupar);
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
		$this->data['usuarios'] = $this->GeneralModel->lista_join('usuarios',$tablas_join,$parametros_or,$parametros_and,$orden,$mostrar_por_pagina,$this->data['offset'],$agrupar);


		// Open Tags
		$this->data['titulo']  = 'Usuarios';
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_lista_usuarios',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		// Vistas
	}

	public function crear()
	{
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

		if($this->form_validation->run())
    {

			// Creo el identificador Único
			$id_usuario = uniqid('', true);
			if(!$this->GeneralModel->campo_existe('usuarios',['ID_USUARIO'=>$id_usuario])){
				$id_usuario = uniqid('', true);
			}

			if(isset($_POST['UsuarioListaDeCorreo'])){ $lista_correo = 'si'; }else{ $lista_correo = 'no'; }

			// Creo la contraseña
			$pass = password_hash($this->input->post('UsuarioPass'), PASSWORD_DEFAULT);

			$parametros = [
				'ID_USUARIO' => $id_usuario,
				'USUARIO_NOMBRE' => $this->input->post('UsuarioNombre'),
				'USUARIO_APELLIDOS' => $this->input->post('UsuarioApellidos'),
				'USUARIO_CORREO' => $this->input->post('UsuarioCorreo'),
				'USUARIO_TELEFONO' => $this->input->post('UsuarioTelefono'),
				'USUARIO_FECHA_NACIMIENTO' => date('Y-m-d', strtotime($this->input->post('UsuarioFechaNacimiento'))),
				'USUARIO_PASSWORD' => $pass,
				'FECHA_REGISTRO' => date('Y-m-d H:i:s'),
				'FECHA_ACTUALIZACION' => date('Y-m-d H:i:s'),
				'TIPO' => $this->input->post('Tipo')
			];

			$usuario_id = $this->GeneralModel->crear('usuarios',$parametros);

			// Categorias
			if(isset($_POST['CategoriasObjeto'])&&!empty($_POST['CategoriasObjeto'])){
				foreach($_POST['CategoriasObjeto'] as $categoria){
					$parametros = array(
						'ID_CATEGORIA' => $categoria,
						'ID_OBJETO' => $usuario_id,
						'TIPO' => $this->input->post('Tipo'),
		      );
					// Creo la relación de categorías
		      $this->GeneralModel->crear('categorias_objetos',$parametros);
				}
			}

			if(!empty($_POST['Meta'])){
				foreach($_POST['Meta'] as $nombre => $valor){
					$parametros_meta = array(
						'ID_OBJETO'=>$id_usuario,
						'DATO_NOMBRE'=>$nombre,
						'DATO_VALOR'=>$valor,
						'TIPO_OBJETO'=>'usuario',
					);
					// Creo las entradas a la galeria
					$this->GeneralModel->crear('meta_datos',$parametros_meta);
				}
			}

			// Redirecciono
			$this->session->set_flashdata('exito', 'Usuario creado correctamente');
      redirect(base_url('lista_usuarios/detalles?id='.$id_usuario));

    }else{
			// Open Tags
			$this->data['titulo']  = 'Crear Usuario';
			$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
			$this->data['imagen']  = base_url('assets/img/share_default.jpg');

			// Reviso la vista especializada
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_form_usuarios',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}
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
				$this->session->set_flashdata('exito', 'Usuario actualizado correctamente');
	      redirect(base_url('lista_usuarios/detalles?id='.$this->input->post('Identificador')));

	    }else{
				$this->data['usuario'] = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_GET['id']]);
				// Open Tags
				$this->data['titulo']  = $this->data['usuario']['USUARIO_NOMBRE'].' '.$this->data['usuario']['USUARIO_APELLIDOS'];
				$this->data['descripcion']  = 'Detalles del usuario';
				$this->data['imagen']  = base_url('contenido/img/usuarios/'.$this->data['usuario']['IMAGEN']);

				$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'usuario'],'','','');
				$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
				// Reviso la vista especializada

				// Cargo Vistas
				$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
				$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_form_actualizar_usuarios',$this->data);
				$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
			}
	}

	public function detalles(){
		$this->data['usuario'] = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_GET['id']]);
		$this->data['tipo'] = $this->data['usuario']['TIPO'];
		// Open Tags
		$this->data['titulo']  = $this->data['usuario']['USUARIO_NOMBRE'].' '.$this->data['usuario']['USUARIO_APELLIDOS'];
		$this->data['descripcion']  = 'Detalles del usuario';
		$this->data['imagen']  = base_url('contenido/img/usuarios/'.$this->data['usuario']['IMAGEN']);

		$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'equipo'],'','','');
		$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }


		// Cargo Vistas
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_detalles_usuario',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}

}
