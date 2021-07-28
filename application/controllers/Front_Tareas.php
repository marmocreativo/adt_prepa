<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_Tareas extends CI_Controller {
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
		$agrupar = 'tareas.ID_TAREA';
		$this->data['consulta']['agrupar'] = $agrupar;

		$parametros_and = array();
		$parametros_or = array();

		$parametros_and['tareas.ESTADO !='] = 'borrador';

		if(!empty($busqueda)){
			$parametros_or['tareas.TAREA_TITULO'] = $busqueda;
		}
		$tablas_join = array();
			$tablas_join['usuarios_tareas'] = 'usuarios_tareas.ID_TAREA = tareas.ID_TAREA';
		$parametros_and['usuarios_tareas.ID_USUARIO'] = $_SESSION['usuario']['id'];
		//var_dump($parametros_and);

		// Paginador
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
		$this->data['consulta_actual'] = 'busqueda='.$busqueda.'&todo='.$todo.'fecha_inicio='.$fecha_inicio.'&fecha_final='.$fecha_final.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$pagina;
		$this->data['consulta_siguiente'] = 'busqueda='.$busqueda.'&todo='.$todo.'fecha_inicio='.$fecha_inicio.'&fecha_final='.$fecha_final.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_siguiente'];
		$this->data['consulta_anterior'] = 'busqueda='.$busqueda.'&todo='.$todo.'fecha_inicio='.$fecha_inicio.'&fecha_final='.$fecha_final.'&orden='.$orden.'&mostrar_por_pagina='.$mostrar_por_pagina.'&pagina='.$this->data['pagina_anterior'];

		// Consulta
		$this->data['tareas'] = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,$orden,$mostrar_por_pagina,$this->data['offset'],$agrupar);

		// Open Tags
		$this->data['titulo']  = 'Tareas';
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_lista_tareas',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		// Vistas
	}
	public function crear()
	{
		$this->form_validation->set_rules('TareaTitulo', 'Nombre', 'required|max_length[255]', array( 'required' => 'Debes designar el %s.', 'max_length' => 'El nombre no puede superar los 255 caracteres' ));
		$this->form_validation->set_rules('FechaEntrega', 'Fecha de Entrega', 'required|max_length[255]', array( 'required' => 'Debes designar el %s.', 'max_length' => 'El nombre no puede superar los 255 caracteres' ));

		if($this->form_validation->run())
    {
				$parametros = array(
					'ID_PROYECTO' => $this->input->post('IdProyecto'),
					'TAREA_TITULO' => $this->input->post('TareaTitulo'),
					'TAREA_DESCRIPCION' => $this->input->post('TareaDescripcion'),
					'TAREA_ENLACE_EDITABLES' =>  $this->input->post('EnlaceEditables'),
					'TAREA_ENLACE_ENTREGABLE' =>  $this->input->post('EnlaceEntregables'),
					'PRIORIDAD' =>  $this->input->post('Prioridad'),
					'TIPO' => $this->input->post('Tipo'),
					'ESTADO' => $this->input->post('Estado')
				);
				$tarea_id = $this->GeneralModel->crear('tareas',$parametros);

				if(isset($_POST['Usuarios'])&&!empty($_POST['Usuarios'])){
					foreach($_POST['Usuarios'] as $usuario){
						$parametros = array(
							'ID_USUARIO' => $usuario,
							'ID_TAREA' => $tarea_id,
							'USUARIO_ASIGNACION'=> 'produccion',
							'FECHA_ASIGNACION'=>date('Y-m-d H:i:s'),
							'ESTADO'=>'activo'
			      );
						// Creo la relación de categorías
			      $this->GeneralModel->crear('usuarios_tareas',$parametros);
					}
				}

				$this->session->set_flashdata('exito', 'Tarea creada correctamente');
				redirect(base_url('proyectos/detalles?id='.$this->input->post('IdProyecto')));
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

		// Cargo Vistas
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_detalles_tarea',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
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
				'PRIORIDAD' =>  $this->input->post('Prioridad'),
				'TIPO' =>  $this->input->post('Tipo'),
				'ESTADO' =>  $this->input->post('Estado'),
			);

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
				foreach($_POST['Usuarios'] as $usuario){
					$parametros = array(
						'ID_USUARIO' => $usuario,
						'ID_TAREA' => $this->input->post('Identificador'),
						'USUARIO_ASIGNACION'=> 'produccion',
						'FECHA_ASIGNACION'=>date('Y-m-d H:i:s'),
						'ESTADO'=>'activo'
					);
					// Creo la relación de categorías
					$this->GeneralModel->crear('usuarios_tareas',$parametros);
				}
			}

			// Mensaje Feedback
			$this->session->set_flashdata('exito', 'Proyecto actualizado correctamente');
			//  Redirecciono
			redirect(base_url('tareas/detalles?id='.$this->input->post('Identificador')));


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
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_form_actualizar_tarea',$this->data);
			$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}
	}

}
