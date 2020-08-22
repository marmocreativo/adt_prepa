<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_Tareas extends CI_Controller {
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


		$this->data['tipo'] = verificar_variable('GET','tipo','general');

		// reviso si existe la vista especializada


		// Título General
		$this->data['titulo']  = 'Tareas | Administrador | '.$this->data['op']['titulo_sitio'];
	}

	public function index()
	{
		// Inicializo Variables
		$this->data['consulta']=array();
		$parametros_or = array();
		$parametros_and = array();
		$tipo = $this->data['tipo'];
		$this->data['consulta']['tipo'] = $tipo;
		$orden = verificar_variable('GET','orden','TAREA_TITULO ASC');
		$this->data['consulta']['orden'] = $orden;
		$mostrar_por_pagina = verificar_variable('GET','mostrar_por_pagina',$this->data['op']['cantidad_publicaciones_por_pagina']);
		$this->data['consulta']['mostrar_por_pagina'] = $mostrar_por_pagina;
		$pagina = verificar_variable('GET','pagina','1');
		$this->data['consulta']['pagina'] = $pagina;
		$agrupar = 'tareas.ID_TAREA';
		$busqueda = verificar_variable('GET','busqueda','');
		$this->data['consulta']['busqueda'] = $busqueda;
		// Expando la busqueda y genero los $parametros_or
		if(!empty($busqueda)){
			$parametros_or['tareas.TAREA_TITULO']=$busqueda;
			$parametros_or['tareas.TAREA_DESCRIPCION']=$busqueda;
			$parametros_or['meta_datos.DATO_VALOR']=$busqueda;
		}
		// Genero los parametros AND
		$parametros_and['tareas.ESTADO !=']='papelera';
		$parametros_and['tareas.TIPO']=$tipo;
		$parametros_and['meta_datos.TIPO_OBJETO']='equipo';

		$tablas_join = array(
			'meta_datos' => 'meta_datos.ID_OBJETO = tareas.ID_TAREA'
		);

		// Busco si hay una vista especializada para el tipo
		$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/admin/','lista_','tareas','_'.$this->data['tipo']);

		// paginador
		$this->data['pub_totales'] = $this->GeneralModel->conteo('tareas',$tablas_join,$parametros_or,$parametros_and,$agrupar);
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
		$this->data['consulta_actual'] = 'tipo='.$tipo.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$pagina.'&busqueda='.$busqueda;
		$this->data['consulta_siguiente'] = 'tipo='.$tipo.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_siguiente'].'&busqueda='.$busqueda;
		$this->data['consulta_anterior'] = 'tipo='.$tipo.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_anterior'].'&busqueda='.$busqueda;

		// Consulta
		$this->data['tareas'] = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,$orden,$mostrar_por_pagina,$this->data['offset'],$agrupar);

		// Cargo Vistas
		$this->load->view('default'.$this->data['dispositivo'].'/admin/header_principal',$this->data);
		$this->load->view($this->data['vista'],$this->data);
		$this->load->view('default'.$this->data['dispositivo'].'/admin/footer_principal',$this->data);


	}

	public function papelera()
	{
		// Inicializo Variables
		$this->data['consulta']=array();
		$parametros_or = array();
		$parametros_and = array();
		$tipo = $this->data['tipo'];
		$this->data['consulta']['tipo'] = $tipo;
		$orden = verificar_variable('GET','orden','TAREA_TITULO ASC');
		$this->data['consulta']['orden'] = $orden;
		$mostrar_por_pagina = verificar_variable('GET','mostrar_por_pagina',$this->data['op']['cantidad_publicaciones_por_pagina']);
		$this->data['consulta']['mostrar_por_pagina'] = $mostrar_por_pagina;
		$pagina = verificar_variable('GET','pagina','1');
		$this->data['consulta']['pagina'] = $pagina;
		$agrupar = '';
		$busqueda = verificar_variable('GET','busqueda','');
		$this->data['consulta']['busqueda'] = $busqueda;
		// Expando la busqueda y genero los $parametros_or
		if(!empty($busqueda)){
			$parametros_or['tareas.TAREA_TITULO']=$busqueda;
			$parametros_or['tareas.TAREA_DESCRIPCION']=$busqueda;
		}
		// Genero los parametros AND
		$parametros_and['tareas.ESTADO']='papelera';
		$parametros_and['tareas.TIPO']=$tipo;

		$tablas_join = '';

		// Busco si hay una vista especializada para el tipo
		$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/admin/','papelera_','tareas','_'.$this->data['tipo']);

		// paginador
		$this->data['pub_totales'] = $this->GeneralModel->conteo('tareas',$tablas_join,$parametros_or,$parametros_and,$agrupar);
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
		$this->data['consulta_actual'] = 'tipo='.$tipo.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$pagina.'&busqueda='.$busqueda;
		$this->data['consulta_siguiente'] = 'tipo='.$tipo.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_siguiente'].'&busqueda='.$busqueda;
		$this->data['consulta_anterior'] = 'tipo='.$tipo.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_anterior'].'&busqueda='.$busqueda;

		// Consulta
		$this->data['tareas'] = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,$orden,$mostrar_por_pagina,$this->data['offset'],$agrupar);

		// Cargo Vistas
		$this->load->view('default'.$this->data['dispositivo'].'/admin/header_principal',$this->data);
		$this->load->view($this->data['vista'],$this->data);
		$this->load->view('default'.$this->data['dispositivo'].'/admin/footer_principal',$this->data);


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

		$id_borrador = generador_aleatorio(4);

		$parametros = array(
			'TAREA_TITULO' => 'Tarea '.$id_borrador,
			'URL' => 'borrador-'.$id_borrador,
			'TAREA_DESCRIPCION' => '',
			'TIPO' => $this->input->get('tipo'),
			'ESTADO' => 'inactivo',
			'ORDEN' => 0,
		);
		$tarea_id = $this->GeneralModel->crear('tareas',$parametros);

		//Meta autor
		$parametros_meta = array(
			'ID_OBJETO'=>$tarea_id,
			'DATO_NOMBRE'=>'meta_autor',
			'DATO_VALOR'=>$_SESSION['usuario']['nombre'].' '.$_SESSION['usuario']['apellidos'],
			'TIPO_OBJETO'=>'equipo',
		);

		$this->GeneralModel->crear('meta_datos',$parametros_meta);

		// Reenvio consulta
		$consulta = base64_encode(json_encode($consulta));


		$this->session->set_flashdata('exito', 'Borrador creado correctamente');
		redirect(base_url('admin/tareas/actualizar?id='.$tarea_id.'&consulta='.$consulta));
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




			$parametros = array(
				'TAREA_TITULO' =>  $this->input->post('EstadoNombre'),
				'URL' =>  $this->input->post('Url'),
				'TAREA_DESCRIPCION' =>  $this->input->post('ProyectoDescripcion'),
				'IMAGEN' => $imagen,
				'IMAGEN_FONDO' => $imagen_fondo,
				'COLOR' =>  $this->input->post('ProyectoColor'),
				'TIPO' =>  $this->input->post('Tipo'),
				'ESTADO' =>  $this->input->post('Estado'),
				'ORDEN' =>  $this->input->post('Orden'),
			);

      $this->GeneralModel->actualizar('tareas',['ID_CATEGORIA'=>$this->input->post('Identificador')],$parametros);

			// Borro los metadatos existentes
			$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$this->input->post('Identificador'),'TIPO_OBJETO'=>'equipo']);
			// Meta Datos
			if(!empty($_POST['Meta'])){
				foreach($_POST['Meta'] as $nombre => $valor){
					$parametros_meta = array(
						'ID_OBJETO'=>$this->input->post('Identificador'),
						'DATO_NOMBRE'=>$nombre,
						'DATO_VALOR'=>$valor,
						'TIPO_OBJETO'=>'equipo',
					);
					// Creo las entradas a la galeria
					$this->GeneralModel->crear('meta_datos',$parametros_meta);
				}
			}

			// Mensaje Feedback
			$this->session->set_flashdata('exito', 'Proyecto actualizado correctamente');
			//  Redirecciono
			switch ($this->input->post('Guardar')) {
				case 'Continuar':
					redirect(base_url('admin/tareas/actualizar?id='.$this->input->post('Identificador').'&consulta='.$_GET['consulta']));
					break;
				default:
					redirect(base_url('admin/tareas?tipo='.$consulta->tipo.'&orden='.$consulta->orden.'&mostrar_por_pagina='.$consulta->mostrar_por_pagina.'&pagina='.$consulta->pagina.'&busqueda='.$consulta->busqueda));
					break;
			}


    }else{

			$this->data['tarea'] = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_GET['id']]);
			$this->data['tipo'] = $this->data['equipo']['TIPO'];
			$this->data['meta'] = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'equipo'],'','','');
			$this->data['meta_datos'] = array(); foreach($this->data['meta'] as $m){ $this->data['meta_datos'][$m->DATO_NOMBRE]= $m->DATO_VALOR; }
			// Reviso la vista especializada
			$this->data['vista'] = vista_especializada('default'.$this->data['dispositivo'],'/admin/','form_actualizar_','tareas','_'.$this->data['tipo']);

			// Cargo Vistas
			$this->load->view('default'.$this->data['dispositivo'].'/admin/header_principal',$this->data);
			$this->load->view($this->data['vista'],$this->data);
			$this->load->view('default'.$this->data['dispositivo'].'/admin/footer_principal',$this->data);
		}

	}
	public function activar()
	{
		// Decodifico la consulta
		$consulta = json_decode(base64_decode($_GET['consulta']));
		// switch para activar o desactivar elemento usando el "estado" envio el estado actual
		$this->GeneralModel->activar('tareas',['ID_TAREA'=>$_GET['id']],$_GET['estado']);
		// Obtengo los datos de la entrada
		$entrada = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_GET['id']]);

		// Mensaje Feedback
		$this->session->set_flashdata('exito', 'Tareas actualizada correctamente');
		redirect(base_url('admin/tareas?tipo='.$consulta->tipo.'&orden='.$consulta->orden.'&mostrar_por_pagina='.$consulta->mostrar_por_pagina.'&pagina='.$consulta->pagina.'&busqueda='.$consulta->busqueda));
	}

	public function borrar()
	{
		// Decodifico la consulta
		$consulta = json_decode(base64_decode($_GET['consulta']));
		// switch para activar o desactivar elemento usando el "estado" envio el estado actual
		$parametros = array(
			'ESTADO'=>'papelera'
		);
		$this->GeneralModel->actualizar('tareas',['ID_TAREA'=>$_GET['id']],$parametros);

		// Mensaje Feedback
		$this->session->set_flashdata('exito', 'Proyecto enviado a la papelera');
		redirect(base_url('admin/tareas?tipo='.$consulta->tipo.'&orden='.$consulta->orden.'&mostrar_por_pagina='.$consulta->mostrar_por_pagina.'&pagina='.$consulta->pagina.'&busqueda='.$consulta->busqueda));
	}

	public function borrar_permanente()
	{
		$tareas = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_GET['id']]);

        // check if the institucione exists before trying to delete it
        if(isset($categoria['ID_TAREA']))
        {
						// Borro la categoría
            $this->GeneralModel->borrar('tareas',['ID_TAREA'=>$_GET['id']]);
						// Mensaje Feedback
						$this->session->set_flashdata('exito', 'Categorías borradas');
						//  Redirecciono
            redirect(base_url('admin/tareas?tipo='.$categoria['TIPO']));
        } else {
					// Mensaje Feedback
					$this->session->set_flashdata('alerta', 'La Entrada que intentaste borrar no existe');
					//  Redirecciono
	         redirect(base_url('admin/tareas'));
				}
	}
}
