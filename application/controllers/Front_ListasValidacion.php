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

		$this->data['listas'] = $this->GeneralModel->lista('validacion_lista','',['ESTADO'=>'activo'],'','','');

		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/front_lista_listas_validacion',$this->data);
		$this->load->view($this->data['op']['plantilla'].$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);

		// Vistas
	}

	public function crear(){
		if(isset($_POST['Titulo'])&&!empty($_POST['Titulo'])){
			$parametros = array(
				'ID_AREA' => $_SESSION['usuario']['area'],
				'TITULO' => $_POST['Titulo'],
				'DESCRIPCION' => $_POST['Descripcion'],
				'ESTADO' => 'activo'
			);

			$this->GeneralModel->crear('validacion_lista',$parametros);
		}

		redirect(base_url('index.php/listas'));
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
		$this->data['dimensiones'] = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$_GET['id'],'ESTADO'=>'activo'],'','','');

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
				'ESTADO' => 'activo'
			);

			$this->GeneralModel->crear('validacion_dimension',$parametros);
		}

		redirect(base_url('index.php/listas/dimensiones?id='.$_POST['IdLista']));
	} 


}
