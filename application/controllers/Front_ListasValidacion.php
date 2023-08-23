<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_ListasValidacion extends CI_Controller {
	public function __construct(){
  parent::__construct();
		// Cargo las Opciones
		if (!$this->db->table_exists('opciones') ){
			redirect(base_url('index.php/reparar_EN_CMS'));
		}
		$this->data['op'] = opciones_default();

		// reviso el dispositivo
		if($this->agent->is_mobile()){
			//$this->data['dispositivo']  = "mobile";
			$this->data['dispositivo']  = "";
		}else{
			$this->data['dispositivo']  = "";
		}

		if(!verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){
			redirect(base_url('index.php/login?url_redirect='.base_url('index.php/'.uri_string().'?'.$_SERVER['QUERY_STRING'])));
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

		// Open Tags
		$this->data['titulo']  = 'Listas de validacion';
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		$parametros_or = array();

		if(isset($_GET['Busqueda'])&&!empty($_GET['Busqueda'])){
			$parametros_or['TITULO'] = $_GET['Busqueda'];
		}

		$this->data['listas'] = $this->GeneralModel->lista('validacion_lista',$parametros_or,['ESTADO'=>'activo'],'','','');

		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_lista_listas_validacion',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		// Vistas
	}

	public function copiar()
	{
		$detalles_lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$_POST['Identificador']]);
		$parametros_lista = array(
			'ID_AREA'=>$detalles_lista['ID_AREA'],
			'TITULO'=>$_POST['Titulo'],
			'DESCRIPCION'=>$detalles_lista['DESCRIPCION'],
			'ESTADO'=>$detalles_lista['ESTADO'],
		);

		$id_lista = 0;
		$id_lista = $this->GeneralModel->crear('validacion_lista',$parametros_lista );
		//echo '<h3>Lista: '.$_POST['Titulo'].'</h3>';

		$dimensiones = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$_POST['Identificador']],'','','');
		foreach($dimensiones as $dimension){
			$parametros_dimension = array(
				'ID_LISTA'=>$id_lista,
				'TITULO'=>$dimension->TITULO,
				'DESCRIPCION'=>$dimension->DESCRIPCION,
				'ORDEN'=>$dimension->ORDEN,
				'ESTADO'=>$dimension->ESTADO,
				'CRITERIO_1'=>$dimension->CRITERIO_1,
				'OPCIONES_1'=>$dimension->OPCIONES_1,
				'CRITERIO_2'=>$dimension->CRITERIO_2,
				'OPCIONES_2'=>$dimension->OPCIONES_2,
				'CRITERIO_3'=>$dimension->CRITERIO_3,
				'OPCIONES_3'=>$dimension->OPCIONES_3,
				'CRITERIO_4'=>$dimension->CRITERIO_4,
				'OPCIONES_4'=>$dimension->OPCIONES_4,
				'CRITERIO_5'=>$dimension->CRITERIO_5,
				'OPCIONES_5'=>$dimension->OPCIONES_5,
			);
			$id_dimension = 0;

			$id_dimension = $this->GeneralModel->crear('validacion_dimension',$parametros_dimension );
			//echo '<h5>Dimension: '.$dimension->TITULO.'</h5>';

			
			$parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION'=>$dimension->ID_DIMENSION],'','','');
			foreach($parametros as $param){
				$parametros_parametros = array(
					'ID_DIMENSION'=>$id_dimension,
					'TITULO'=>$param->TITULO,
					'DESCRIPCION'=>$param->DESCRIPCION,
					'OBLIGATORIO'=>$param->OBLIGATORIO,
					'ORDEN'=>$param->ORDEN,
					'ESTADO'=>$param->ESTADO,
					'CRITERIO_VALOR_1'=>$param->CRITERIO_VALOR_1,
					'CRITERIO_VALOR_2'=>$param->CRITERIO_VALOR_2,
					'CRITERIO_VALOR_3'=>$param->CRITERIO_VALOR_3,
					'CRITERIO_VALOR_4'=>$param->CRITERIO_VALOR_4,
					'CRITERIO_VALOR_5'=>$param->CRITERIO_VALOR_5
				);
				//echo '<h6>Parametro: '.$param->TITULO.'</h6>';
				$this->GeneralModel->crear('validacion_parametros',$parametros_parametros );
			}
		}

		redirect(base_url('index.php/listas/dimensiones?id='.$id_lista));
	}

	public function crear(){
		if(isset($_POST['Titulo'])&&!empty($_POST['Titulo'])){
			$parametros = array(
				'ID_AREA' => $_SESSION['usuario']['area'],
				'TITULO' => $_POST['Titulo'],
				'DESCRIPCION' => $_POST['Descripcion'],
				'ESTADO' => 'activo'
			);

			$id_lista = $this->GeneralModel->crear('validacion_lista',$parametros);
		}

		redirect(base_url('index.php/listas/dimensiones?id='.$id_lista.'&notif=creado'));
	}

	public function actualizar()
	{
		if(isset($_POST['Titulo'])&&!empty($_POST['Titulo'])){
			$parametros = array(
				'ID_AREA' => $_SESSION['usuario']['area'],
				'TITULO' => $_POST['Titulo'],
				'DESCRIPCION' => $_POST['Descripcion']
			);

			$this->GeneralModel->actualizar('validacion_lista',['ID_LISTA'=>$_POST['Identificador']],$parametros);
		}

		redirect(base_url('index.php/listas/dimensiones?id='.$_POST['Identificador'].'&notif=actualizado'));
	}

	
	public function dimensiones()
	{
		// Verifico el switch de mantenimiento
		if(verificar_mantenimiento($this->data['op']['modo_mantenimiento'])){ redirect(base_url('index.php/mantenimiento')); }

		// Open Tags
		$this->data['titulo']  = 'Listas de validacion';
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		$this->data['lista'] = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$_GET['id']]);
		$this->data['dimensiones'] = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$_GET['id'],'ESTADO'=>'activo'],'ORDEN ASC','','');

		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_lista_dimensiones_validacion',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		// Vistas
	}

	public function crear_dimension(){
		if(isset($_POST['Titulo'])&&!empty($_POST['Titulo'])){
			$parametros = array(
				'ID_LISTA' => $_POST['IdLista'],
				'TITULO' => $_POST['Titulo'],
				'DESCRIPCION' => $_POST['Descripcion'],
				'CRITERIO_1' => $_POST['Criterio1'],
				'OPCIONES_1' => $_POST['OpcionesCriterio1'],
				'CRITERIO_2' => $_POST['Criterio2'],
				'OPCIONES_2' => $_POST['OpcionesCriterio2'],
				'CRITERIO_3' => $_POST['Criterio3'],
				'OPCIONES_3' => $_POST['OpcionesCriterio3'],
				'CRITERIO_4' => $_POST['Criterio4'],
				'OPCIONES_4' => $_POST['OpcionesCriterio4'],
				'CRITERIO_5' => $_POST['Criterio5'],
				'OPCIONES_5' => $_POST['OpcionesCriterio5'],
				'DESCRIPCION' => $_POST['Descripcion'],
				'ESTADO' => 'activo'
			);

			$this->GeneralModel->crear('validacion_dimension',$parametros);
		}

		redirect(base_url('index.php/listas/dimensiones?id='.$_POST['IdLista']));
	}

	public function actualizar_dimension(){
		if(isset($_POST['Titulo'])&&!empty($_POST['Titulo'])){
			$parametros = array(
				'TITULO' => $_POST['Titulo'],
				'DESCRIPCION' => $_POST['Descripcion'],
				'CRITERIO_1' => $_POST['Criterio1'],
				'OPCIONES_1' => $_POST['OpcionesCriterio1'],
				'CRITERIO_2' => $_POST['Criterio2'],
				'OPCIONES_2' => $_POST['OpcionesCriterio2'],
				'CRITERIO_3' => $_POST['Criterio3'],
				'OPCIONES_3' => $_POST['OpcionesCriterio3'],
				'CRITERIO_4' => $_POST['Criterio4'],
				'OPCIONES_4' => $_POST['OpcionesCriterio4'],
				'CRITERIO_5' => $_POST['Criterio5'],
				'OPCIONES_5' => $_POST['OpcionesCriterio5'],
				'DESCRIPCION' => $_POST['Descripcion'],
			);

			$this->GeneralModel->actualizar('validacion_dimension',['ID_DIMENSION'=>$_POST['Identificador']],$parametros);
		}

		redirect(base_url('index.php/listas/dimensiones?id='.$_POST['IdLista']));
	}

	
	
	public function crear_parametro(){
		$criterioValor1 = '';
		$criterioValor2 = '';
		$criterioValor3 = '';
		$criterioValor4 = '';
		$criterioValor5 = '';

		if(isset($_POST['CriterioValor1'])){ $criterioValor1 = $_POST['CriterioValor1']; }
		if(isset($_POST['CriterioValor2'])){ $criterioValor2 = $_POST['CriterioValor2']; }
		if(isset($_POST['CriterioValor3'])){ $criterioValor3 = $_POST['CriterioValor3']; }
		if(isset($_POST['CriterioValor4'])){ $criterioValor4 = $_POST['CriterioValor4']; }
		if(isset($_POST['CriterioValor5'])){ $criterioValor5 = $_POST['CriterioValor5']; }

		if(isset($_POST['Titulo'])&&!empty($_POST['Titulo'])){
			$parametros = array(
				'ID_DIMENSION' => $_POST['IdDimension'],
				'TITULO' => $_POST['Titulo'],
				'DESCRIPCION' => '',
				'OBLIGATORIO' => $_POST['Obligatorio'],
				'CRITERIO_VALOR_1' => $criterioValor1,
				'CRITERIO_VALOR_2' => $criterioValor2,
				'CRITERIO_VALOR_3' => $criterioValor3,
				'CRITERIO_VALOR_4' => $criterioValor4,
				'CRITERIO_VALOR_5' => $criterioValor5,
				'ESTADO' => 'activo'
			);

			$id_parametro = $this->GeneralModel->crear('validacion_parametros',$parametros);
		}

		redirect(base_url('index.php/listas/dimensiones?id='.$_POST['IdLista'].'&dimension='.$_POST['IdDimension']));
	}

	public function actualizar_parametro(){

		$criterioValor1 = '';
		$criterioValor2 = '';
		$criterioValor3 = '';
		$criterioValor4 = '';
		$criterioValor5 = '';

		if(isset($_POST['CriterioValor1'])){ $criterioValor1 = $_POST['CriterioValor1']; }
		if(isset($_POST['CriterioValor2'])){ $criterioValor2 = $_POST['CriterioValor2']; }
		if(isset($_POST['CriterioValor3'])){ $criterioValor3 = $_POST['CriterioValor3']; }
		if(isset($_POST['CriterioValor4'])){ $criterioValor4 = $_POST['CriterioValor4']; }
		if(isset($_POST['CriterioValor5'])){ $criterioValor5 = $_POST['CriterioValor5']; }

		if(isset($_POST['Titulo'])&&!empty($_POST['Titulo'])){
			$parametros = array(
				'ID_DIMENSION' => $_POST['IdDimension'],
				'TITULO' => $_POST['Titulo'],
				'DESCRIPCION' => '',
				'OBLIGATORIO' => $_POST['Obligatorio'],
				'CRITERIO_VALOR_1' => $criterioValor1,
				'CRITERIO_VALOR_2' => $criterioValor2,
				'CRITERIO_VALOR_3' => $criterioValor3,
				'CRITERIO_VALOR_4' => $criterioValor4,
				'CRITERIO_VALOR_5' => $criterioValor5
			);

			$id_parametro = $this->GeneralModel->actualizar('validacion_parametros',['ID_PARAMETRO'=>$this->input->post('Identificador')],$parametros);

		}

		redirect(base_url('index.php/listas/dimensiones?id='.$_POST['IdLista'].'&dimension='.$_POST['IdDimension']));
	}

	public function borrar_lista_permanente(){
		$lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$_GET['id']]);
		

        // check if the institucione exists before trying to delete it
        if(isset($lista['ID_LISTA']))
        {
			$dimensiones = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$lista['ID_LISTA']],'','','');
			foreach($dimensiones as $dimension){
				$parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION'=>$dimension->ID_DIMENSION],'','','');
				foreach($parametros as $parametro){
					//borro los metadatos
					$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$parametro->ID_PARAMETRO,'TIPO_OBJETO'=>'parametro']);
				}
				// borro los parametros
				$this->GeneralModel->borrar('validacion_parametros',['ID_DIMENSION'=>$dimension->ID_DIMENSION]);
			}
			//borro las dimensiones
			$this->GeneralModel->borrar('validacion_dimension',['ID_LISTA'=>$lista['ID_LISTA']]);

			// Borro las revisiones
				$this->GeneralModel->borrar('validacion_revisiones',['ID_LISTA'=>$lista['ID_LISTA']]);
				$this->GeneralModel->borrar('validacion_respuesta',['ID_LISTA'=>$lista['ID_LISTA']]);

			//borro la lista
			$this->GeneralModel->borrar('validacion_lista',['ID_LISTA'=>$_GET['id']]);

            redirect(base_url('index.php/listas'));
        } else {
					// Mensaje Feedback
					//  Redirecciono
		redirect(base_url('index.php/listas'));
		}
	}

	public function borrar_lista(){
		$lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$_GET['id']]);
		
        $parametros = array(
			'ESTADO' => 'borrado'
		);

		$this->GeneralModel->actualizar('validacion_lista',['ID_LISTA'=>$_GET['id']],$parametros);
		redirect(base_url('index.php/listas'));
		
	}

	public function borrar_dimension(){
		$dimension = $this->GeneralModel->detalles('validacion_dimension',['ID_DIMENSION'=>$_GET['id']]);
		

        // check if the institucione exists before trying to delete it
        if(isset($dimension['ID_DIMENSION']))
        {
			$parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION'=>$dimension['ID_DIMENSION']],'','','');
				foreach($parametros as $parametro){
					//borro los metadatos
					$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$parametro->ID_PARAMETRO,'TIPO_OBJETO'=>'parametro']);
				}
				// borro los parametros
				$this->GeneralModel->borrar('validacion_parametros',['ID_DIMENSION'=>$dimension['ID_DIMENSION']]);
			//borro las dimensiones
			$this->GeneralModel->borrar('validacion_dimension',['ID_DIMENSION'=>$dimension['ID_DIMENSION']]);
			//echo $dimension['ID_LISTA'];
            redirect(base_url('index.php/listas/dimensiones?id='.$dimension['ID_LISTA']));
        } else {
					// Mensaje Feedback
					//  Redirecciono
		redirect(base_url('index.php/listas/dimensiones?id='.$dimension['ID_LISTA']));
		}
	}

	public function borrar_parametro(){
		$parametro = $this->GeneralModel->detalles('validacion_parametros',['ID_PARAMETRO'=>$_GET['id']]);
		$dimension = $this->GeneralModel->detalles('validacion_dimension',['ID_DIMENSION'=>$parametro['ID_DIMENSION']]);

        // check if the institucione exists before trying to delete it
        if(isset($parametro['ID_PARAMETRO']))
        {
						// Borro la categoría
            $this->GeneralModel->borrar('validacion_parametros',['ID_PARAMETRO'=>$_GET['id']]);
			$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'parametro']);

			redirect(base_url('index.php/listas/dimensiones?id='.$dimension['ID_LISTA'].'&dimension='.$parametro['ID_DIMENSION']));
        } else {
					// Mensaje Feedback
					//  Redirecciono
		redirect(base_url('index.php/listas/dimensiones?id='.$dimension['ID_LISTA'].'&dimension='.$parametro['ID_DIMENSION']));
		}
	}

	public function borrar_parametro_lote ()
	{
		foreach($_POST['id_parametros'] as $id_parametro){
			$parametro = $this->GeneralModel->detalles('validacion_parametros',['ID_PARAMETRO'=>$id_parametro]);
			$dimension = $this->GeneralModel->detalles('validacion_dimension',['ID_DIMENSION'=>$parametro['ID_DIMENSION']]);
			$this->GeneralModel->borrar('validacion_parametros',['ID_PARAMETRO'=>$_GET['id']]);
			$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$_GET['id'],'TIPO_OBJETO'=>'parametro']);

		}
	}


}
