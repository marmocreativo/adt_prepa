<?php
// Variables especiales para el tiempo de carga de la base de Datos
ini_set('max_execution_time', 0);
ini_set('memory_limit','2048M');
// Controlador normal
defined('BASEPATH') OR exit('No direct script access allowed');
class Admin_Base_De_Datos extends CI_Controller {
	public function __construct(){
		parent::__construct();
		// Cargo las Opciones
		$this->data['op'] = opciones_default();

		// Verifico Sesión
		if(!verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){
			redirect(base_url('index.php/login?url_redirect='.base_url('index.php/'.uri_string().'?'.$_SERVER['QUERY_STRING'])));
		}
		// Verifico Permiso
		if(!verificar_permiso(['administrador'])){
			redirect(base_url('index.php/usuario'));
		}


		// reviso el dispositivo
		if($this->agent->is_mobile()){
			//$this->data['dispositivo']  = "mobile";
			$this->data['dispositivo']  = "";
		}else{
			$this->data['dispositivo']  = "";
		}

		// Título General
		$this->data['titulo']  = 'Administrador | '.$this->data['op']['titulo_sitio'];
		$this->data['fecha_inicio'] = verificar_variable('GET','fecha_inicio',date('d-m-Y', strtotime(date('d-m-Y').' -15 days')));
		$this->data['fecha_fin'] = verificar_variable('GET','fecha_fin',date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s').' +15 days')));

		// Cargo los modelos
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
		// Datos Generales
		$this->data['titulo']  = 'Herramientas de base de datos';
		$this->data['descripcion']  = 'Respaldos y restauraciones';
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

		$this->load->view('default'.$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
		$this->load->view('default'.$this->data['dispositivo'].'/admin/base_de_datos',$this->data);
		$this->load->view('default'.$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
	}
	public function limpiar_vistas()
	{
		$fecha_minima =  date('Y-m-d', strtotime("-1 month"));

		$fechas = $this->GeneralModel->borrar('vistas',array('FECHA <=' => $fecha_minima));

		redirect(base_url('index.php/admin'));

	}
	public function respaldar()
	{
		// Load the DB utility class
		$this->load->dbutil();

		$prefs = array(
        'format'        => 'sql',                       // gzip, zip, txt
        'filename'      => 'recuperar.sql',              // File name - NEEDED ONLY WITH ZIP FILES
        'add_drop'      => TRUE,                        // Whether to add DROP TABLE statements to backup file
        'add_insert'    => TRUE,                        // Whether to add INSERT data to backup file
        'newline'       => "\n"                         // Newline character used in backup file
			);

		// Backup your entire database and assign it to a variable
		$backup = $this->dbutil->backup($prefs);

		// Load the file helper and write the file to your server
		$this->load->helper('file');
		write_file('contenido/respaldos/respaldo-'.date('Y-m-d-U').'.sql', $backup);

		// Load the download helper and send the file to your desktop
		$this->load->helper('download');
		force_download('respaldo-'.date('Y-m-d-U').'.sql', $backup);
	}
	public function restaurar()
	{
		$this->load->library('zip');
		if(isset($_FILES['zip_file']['name'])&&!empty($_FILES['zip_file']['name'])&& $_FILES['zip_file']['error'] == 0){
			$nombre_archivo = 'restauracion-'.date('U');
			$config['upload_path']          = 'contenido/restaurar/';
			$config['allowed_types']        = 'zip';
			$config['file_name']						=	$nombre_archivo;

			$this->load->library('upload', $config);

			if ( ! $this->upload->do_upload('zip_file'))
			 {
				   echo 'No se pudo subir';
				 $error = array('error' => $this->upload->display_errors());
				 var_dump($error);
			 }else{
				 $data = array('upload_data' => $this->upload->data());
				 $full_path = $data['upload_data']['full_path'];

				 $zip = new ZipArchive;

				 if ($zip->open($full_path) === TRUE)
				 {
						 $zip->extractTo(FCPATH.'/contenido/restaurar/');
						 $zip->close();
						 // Restauro la base de datos
						 $temp_line = '';
				     $lines = file('contenido/restaurar/recuperar.sql');
				     foreach ($lines as $line)
				     {
				         if (substr($line, 0, 2) == '--' || $line == '' || substr($line, 0, 1) == '#')
				             continue;
				         $temp_line .= $line;
				         if (substr(trim($line), -1, 1) == ';')
				         {
				             $this->db->query($temp_line);
				             $temp_line = '';
				         }
				     }
						 redirect(base_url('index.php/admin/base_de_datos'));
				 }
			 }
	 }else{
		 redirect(base_url('index.php/admin/base_de_datos'));
	 }

	}


}
