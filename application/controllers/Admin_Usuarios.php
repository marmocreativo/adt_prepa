<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// Cargo librerías de composer
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Admin_Usuarios extends CI_Controller {
	public function __construct(){
		parent::__construct();
		// Cargo las Opciones
		$this->data['op'] = opciones_default();

		// Verifico Sesión
		if(!verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){
			$this->session->set_flashdata('alerta', 'Debes iniciar sesión para continuar');
			redirect(base_url('login?url_redirect='.base_url(uri_string().'?'.$_SERVER['QUERY_STRING'])));
		}
		// Verifico Permiso
		if(!verificar_permiso(['administrador'])){
			$this->session->set_flashdata('alerta', 'No tienes permiso de entrar en esa sección');
			redirect(base_url('usuario'));
		}


		// reviso el dispositivo
		if($this->agent->is_mobile()){
			//$this->data['dispositivo']  = "mobile";
			$this->data['dispositivo']  = "";
		}else{
			$this->data['dispositivo']  = "";
		}
		// Cargo los modelos
		// Variables Globales
			$this->data['tipo'] = verificar_variable('GET','tipo','usuario');
			$this->data['fecha_inicio'] = verificar_variable('GET','fecha_inicio',date('d-m-Y', strtotime(date('d-m-Y').' -30 days')));
			$this->data['fecha_fin'] = verificar_variable('GET','fecha_fin',date('Y-m-d 00:00:00'));
		// reviso si existe la vista especializada


		// Título General
		$this->data['titulo']  = 'Usuarios | Administrador | '.$this->data['op']['titulo_sitio'];

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
		// Inicializo Variables
		$this->data['consulta']=array();
		$parametros_or = array();
		$parametros_and = array();
		// Tipo de categoría lo que carga los formularios con estilos especiales, se busca el tipo básico
		$tipo = $this->data['tipo'];
		$this->data['consulta']['tipo'] = $tipo;
		$categoria = verificar_variable('GET','categoria','');
		$this->data['consulta']['categoria'] = $categoria;
		$orden = verificar_variable('GET','orden','FECHA_REGISTRO DESC');
		$this->data['consulta']['orden'] = $orden;
		$mostrar_por_pagina = verificar_variable('GET','mostrar_por_pagina',$this->data['op']['cantidad_publicaciones_por_pagina']);
		$this->data['consulta']['mostrar_por_pagina'] = $mostrar_por_pagina;
		$pagina = verificar_variable('GET','pagina','1');
		$this->data['consulta']['pagina'] = $pagina;
		$agrupar = 'usuarios.ID_USUARIO';
		$busqueda = verificar_variable('GET','busqueda','');
		$this->data['consulta']['busqueda'] = $busqueda;
		// Expando la busqueda y genero los $parametros_or
		if(!empty($busqueda)){
			$parametros_or['usuarios.USUARIO_NOMBRE']=$busqueda;
			$parametros_or['usuarios.USUARIO_APELLIDOS']=$busqueda;
			$parametros_or['usuarios.USUARIO_CORREO']=$busqueda;
		}
		// Genero los parametros AND
		$parametros_and['usuarios.TIPO']=$tipo;

		$tablas_join = array();
		$tablas_join['meta_datos'] = 'meta_datos.ID_OBJETO = usuarios.ID_USUARIO';

		// Join con categoria
		if(!empty($categoria)){
			$tablas_join['categorias_objetos'] = 'categorias_objetos.ID_OBJETO = usuarios.ID_USUARIO';
			$parametros_and['categorias_objetos.ID_CATEGORIA']=$categoria;
		}


		// Busco si hay una vista especializada para el tipo
		$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/admin/','lista_','usuarios','_'.$this->data['tipo']);

		// paginador
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
		$this->data['consulta_actual'] = 'categoria='.$categoria.'&tipo='.$tipo.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$pagina.'&busqueda='.$busqueda;
		$this->data['consulta_siguiente'] = 'categoria='.$categoria.'&tipo='.$tipo.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_siguiente'].'&busqueda='.$busqueda;
		$this->data['consulta_anterior'] = 'categoria='.$categoria.'&tipo='.$tipo.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_anterior'].'&busqueda='.$busqueda;

		// Consulta
		$this->data['usuarios'] = $this->GeneralModel->lista_join('usuarios',$tablas_join,$parametros_or,$parametros_and,$orden,$mostrar_por_pagina,$this->data['offset'],$agrupar);

		// Cargo Vistas

		$this->load->view('default'.$this->data['dispositivo'].'/admin/header_principal',$this->data);
		$this->load->view($this->data['vista'],$this->data);
		$this->load->view('default'.$this->data['dispositivo'].'/admin/footer_principal',$this->data);
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
      redirect(base_url('admin/usuarios?tipo='.$this->input->post('Tipo')));

    }else{

			// Reviso la vista especializada
			$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/admin/','form_','usuarios','_'.$this->data['tipo']);

			// Cargo Vistas
			$this->load->view('default'.$this->data['dispositivo'].'/admin/header_principal',$this->data);
			$this->load->view($this->data['vista'],$this->data);
			$this->load->view('default'.$this->data['dispositivo'].'/admin/footer_principal',$this->data);
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
	      redirect(base_url('admin/usuarios/detalles?id='.$this->input->post('Identificador')));

	    }else{
				$this->data['usuario'] = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_GET['id']]);
				$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'usuario'],'','','');
				$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
				// Reviso la vista especializada
				$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/admin/','form_actualizar_','usuarios','_'.$this->data['tipo']);

				// Cargo Vistas
				$this->load->view('default'.$this->data['dispositivo'].'/admin/header_principal',$this->data);
				$this->load->view($this->data['vista'],$this->data);
				$this->load->view('default'.$this->data['dispositivo'].'/admin/footer_principal',$this->data);
			}
	}
	public function detalles()
	{
		$this->data['usuario'] = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_GET['id']]);
		$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'usuario'],'','','');
		$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
		// Reviso la vista especializada
		$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/admin/','detalles_','usuarios','_'.$this->data['tipo']);

		// Cargo Vistas
		$this->load->view('default'.$this->data['dispositivo'].'/admin/header_principal',$this->data);
		$this->load->view($this->data['vista'],$this->data);
		$this->load->view('default'.$this->data['dispositivo'].'/admin/footer_principal',$this->data);
	}
	public function equipos()
	{
		$this->data['usuario'] = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_GET['id']]);
		$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'usuario'],'','','');
		$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
		$this->data['equipos'] = $this->GeneralModel->lista_join('equipos_usuarios',['equipos'=>'equipos_usuarios.ID_EQUIPO = equipos.ID_EQUIPO'],'',['equipos_usuarios.ID_USUARIO'=>$this->data['usuario']['ID_USUARIO'],'equipos.ESTADO'=>'activo'],'equipos.EQUIPO_NOMBRE ASC','','','');
		// Reviso la vista especializada
		$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/admin/','equipos_','usuarios','_'.$this->data['tipo']);

		// Cargo Vistas
		$this->load->view('default'.$this->data['dispositivo'].'/admin/header_principal',$this->data);
		$this->load->view($this->data['vista'],$this->data);
		$this->load->view('default'.$this->data['dispositivo'].'/admin/footer_principal',$this->data);
	}
	public function relaciones()
	{
		// Parámetros de busqueda
		$parametros_or = array();
		$parametros_and = array();
		$tipo = verificar_variable('GET','tipo','');
		$objeto = 'usuario';
		$orden = verificar_variable('GET','orden','NOMBRE_RELACION ASC');
		$agrupar = '';

			// Reviso la vista especializada

		$this->data['usuario'] = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_GET['id']]);


		// Primera busqueda
		$parametros_and['OBJETO'] = $objeto;
		$parametros_and['TIPO'] = $this->data['usuario']['TIPO'];
		$parametros_and['OBJETO_REL'] = 'publicacion';
		$this->data['relaciones_publicaciones'] = $this->GeneralModel->lista('relaciones',$parametros_or,$parametros_and,$orden,'','');

		// Segunda busqueda
		$parametros_and = array();
		$parametros_and['OBJETO'] = $objeto;
		$parametros_and['TIPO'] = $this->data['usuario']['TIPO'];
		$parametros_and['OBJETO_REL'] = 'usuario';
		$this->data['relaciones_usuarios'] = $this->GeneralModel->lista_join('relaciones','',$parametros_or,$parametros_and,$orden,'','',$agrupar);

		// Meta datos
		$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'publicacion'],'','','');
		$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }

			// Reviso la vista especializada
		$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/admin/','lista_','relaciones_usuario','_'.$this->data['tipo']);

		// Cargo Vistas
		$this->load->view('default'.$this->data['dispositivo'].'/admin/header_principal',$this->data);
		$this->load->view($this->data['vista'],$this->data);
		$this->load->view('default'.$this->data['dispositivo'].'/admin/footer_principal',$this->data);
	}

	public function activar()
	{
		$this->GeneralModel->activar('usuarios',['ID_USUARIO'=>$_GET['id']],$_GET['estado']);
		$usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_GET['id']]);

		// Mensaje Feedback
		$this->session->set_flashdata('exito', 'Usuario actualizado correctamente');
		redirect(base_url('admin/usuarios?tipo='.$usuario['TIPO']));
	}
	public function borrar()
	{
		$usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$_GET['id']]);

      // check if the institucione exists before trying to delete it
      if(isset($usuario['ID_USUARIO']))
      {
					// Borro la categoría
          $this->GeneralModel->borrar('usuarios',['ID_USUARIO'=>$_GET['id']]);
					// Mensaje Feedback
					$this->session->set_flashdata('exito', 'Usuario borrado');
					//  Redirecciono
          redirect(base_url('admin/usuarios?tipo='.$usuario['TIPO']));
      } else {
				// Mensaje Feedback
				$this->session->set_flashdata('alerta', 'La Entrada que intentaste borrar no existe');
				//  Redirecciono
         redirect(base_url('admin/usuarios'));
			}
	}

	public function descargar_excel()
	{

		$parametros_or = array();
		$parametros_and = array();
		$orden = verificar_variable('GET','orden','');
		$busqueda = verificar_variable('GET','busqueda','');
		if(!empty($busqueda)){ $parametros_or['USUARIO_NOMBRE']=$busqueda; }
		if(!empty($busqueda)){ $parametros_or['USUARIO_APELLIDOS']=$busqueda; }
		if(!empty($busqueda)){ $parametros_or['USUARIO_CORREO']=$busqueda; }
		$parametros_and['TIPO']=verificar_variable('GET','tipo',$this->data['tipo']);

			// Reviso la vista especializada
		$this->data['usuarios'] = $this->GeneralModel->lista('usuarios',$parametros_or,$parametros_and,$orden,'','');

		$spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
		// Estilos encabezado
		$sheet->getStyle('A2:O2')
		->getFill()
    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
    ->getStartColor()
		->setARGB('3c8dbc');

		$spreadsheet->getActiveSheet()->getStyle('A2:O2')
    ->getFont()->getColor()->setARGB(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_WHITE);

		$spreadsheet->getActiveSheet()->getStyle('A2:O2')
    ->getAlignment()->setWrapText(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
		$spreadsheet->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);

		$sheet->setCellValue('A1', 'Usuarios tipo: '.$this->data['tipo']);
    $sheet->setCellValue('A2', 'ID_USUARIO');
		$sheet->setCellValue('B2', 'ID_SOCIAL');
		$sheet->setCellValue('C2', 'SOCIAL_LOGIN');
		$sheet->setCellValue('D2', 'USUARIO_NOMBRE');
		$sheet->setCellValue('E2', 'USUARIO_APELLIDOS');
		$sheet->setCellValue('F2', 'USUARIO_CORREO');
		$sheet->setCellValue('G2', 'USUARIO_TELEFONO');
		$sheet->setCellValue('H2', 'USUARIO_FECHA_NACIMIENTO');
		$sheet->setCellValue('I2', 'IMAGEN');
		$sheet->setCellValue('J2', 'USUARIO_PASSWORD');
		$sheet->setCellValue('K2', 'USUARIO_LISTA_DE_CORREO');
		$sheet->setCellValue('L2', 'FECHA_REGISTRO');
		$sheet->setCellValue('M2', 'FECHA_ACTUALIZACION');
		$sheet->setCellValue('N2', 'TIPO');
		$sheet->setCellValue('O2', 'ESTADO');

		$i = 3;
		foreach($this->data['usuarios'] as $usuario){

			// Creo la fila con Excel
	    $sheet->setCellValue('A'.$i, $usuario->ID_USUARIO);
			$sheet->setCellValue('B'.$i, $usuario->ID_SOCIAL);
			$sheet->setCellValue('C'.$i, $usuario->SOCIAL_LOGIN);
			$sheet->setCellValue('D'.$i, $usuario->USUARIO_NOMBRE);
			$sheet->setCellValue('E'.$i, $usuario->USUARIO_APELLIDOS);
			$sheet->setCellValue('F'.$i, $usuario->USUARIO_CORREO);
			$sheet->setCellValue('G'.$i, $usuario->USUARIO_TELEFONO);
			$sheet->setCellValue('H'.$i, $usuario->USUARIO_FECHA_NACIMIENTO);
			$sheet->setCellValue('I'.$i, $usuario->IMAGEN);
			$sheet->setCellValue('J'.$i, $usuario->USUARIO_PASSWORD);
			$sheet->setCellValue('K'.$i, $usuario->USUARIO_LISTA_DE_CORREO);
			$sheet->setCellValue('L'.$i, $usuario->FECHA_REGISTRO);
			$sheet->setCellValue('M'.$i, $usuario->FECHA_ACTUALIZACION);
			$sheet->setCellValue('N'.$i, $usuario->TIPO);
			$sheet->setCellValue('O'.$i, $usuario->ESTADO);
		$i ++;
		}

    $writer = new Xlsx($spreadsheet);

    $filename = 'usuarios'.date('d-m-Y H:i');

    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="'. $filename .'.xlsx"');
    header('Cache-Control: max-age=0');

    $writer->save('php://output'); // download file
	}
}
