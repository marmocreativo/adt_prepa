<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_Inicio extends CI_Controller {
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
		// Cargo los modelos
		// Variables Globales

			$this->data['tipo'] = verificar_variable('GET','tipo','publicaciones');
			$this->data['fecha_inicio'] = verificar_variable('GET','fecha_inicio',date('d-m-Y', strtotime(date('d-m-Y').' -15 days')));
			$this->data['fecha_fin'] = verificar_variable('GET','fecha_fin',date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s').' +15 days')));
		// reviso si existe la vista especializada

		// Open Tags
		$this->data['titulo']  = 'Inicio Administradores';
		$this->data['descripcion']  = $this->data['op']['acerca_sitio'];
		$this->data['imagen']  = base_url('assets/img/share_default.jpg');

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
		$this->load->dbforge();

        $fields = array(
            'ID' => array(
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => TRUE,
                'auto_increment' => TRUE
            ),
            'ID_PROYECTO' => array(
                'type' => 'INT',
                'constraint' => 11,
            ),
            'ETIQUETA' => array(
                'type' => 'VARCHAR',
                'constraint' => 256,
            ),
            'ORDEN' => array(
                'type' => 'INT',
                'constraint' => 11,
                'default' => 0,
            ),
        );

        $this->dbforge->add_field($fields);
        $this->dbforge->add_key('ID', TRUE);
        $this->dbforge->create_table('tareas_etiquetas');
        
        echo "Tabla creada exitosamente.";
	}
	
	public function ajuste_areas()
	{
		$usuarios = $this->GeneralModel->lista('usuarios','','','','','');
		foreach($usuarios as $usuario){
			$parametros = array(
				'ID_USUARIO' => $usuario->ID_USUARIO,
				'ID_AREA' => 1
			);

			$this->GeneralModel->crear('areas_usuarios',$parametros);
		}
	}

	public function opciones()
	{
		$this->form_validation->set_rules('Opciones[]', 'Opciones', 'required');
		if($this->form_validation->run())
    {
			foreach($_POST['Opciones']as $opcion => $valor){
				$parametros = array(
					'OPCION_VALOR' => $valor,
	      		);
				// Creo Actualizo la opción
				$this->GeneralModel->actualizar('opciones',['OPCION_NOMBRE'=>$opcion],$parametros);
			}

			// Redirecciono
			$this->session->set_flashdata('exito', 'Publicación creada correctamente');
      redirect(base_url('index.php/admin/opciones'));

    }else{

			// Reviso la vista especializada
			$this->data['vista'] = 'default'.$this->data['dispositivo'].'/admin/lista_opciones';
			$this->data['grupos_opciones'] = $this->GeneralModel->lista_agrupada('opciones','','','OPCION_TIPO DESC','OPCION_TIPO');

			// Cargo Vistas
			$this->load->view('default'.$this->data['dispositivo'].'/front/headers/header_principal',$this->data);
			$this->load->view('default'.$this->data['dispositivo'].'/admin/lista_opciones',$this->data);
			$this->load->view('default'.$this->data['dispositivo'].'/front/footers/footer_principal',$this->data);
		}
	}


}
