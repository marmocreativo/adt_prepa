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
		
		// Carga la librería de base de datos
			$this->load->dbforge();
		/*	
			// Define los campos de la tabla
			$fields = array(
				'ID_LISTA' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE,
					'auto_increment' => TRUE
				),
				'ID_AREA' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'TITULO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255
				),
				'DESCRIPCION' => array(
					'type' => 'TEXT'
				),
				'ESTADO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255,
					'default' => 'activo'
				)
			);

			// Define la clave primaria de la tabla
			$this->dbforge->add_key('ID_LISTA', TRUE);

			// Crea la tabla
			$this->dbforge->add_field($fields);
			$this->dbforge->create_table('validacion_lista');
			



			// Define los campos de la tabla
			$fields = array(
				'ID_DIMENSION' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE,
					'auto_increment' => TRUE
				),
				'ID_LISTA' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'TITULO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255
				),
				'DESCRIPCION' => array(
					'type' => 'TEXT'
				),
				'ORDEN' => array(
					'type' => 'INT',
					'constraint' => 11,
					'default' => 0
				),
				'ESTADO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255,
					'default' => 'activo'
				)
			);

			// Define la clave primaria de la tabla
			$this->dbforge->add_key('ID_DIMENSION', TRUE);

			// Crea la tabla
			$this->dbforge->add_field($fields);
			$this->dbforge->create_table('validacion_dimension');
			


			// Define los campos de la tabla
			$fields = array(
				'ID_PARAMETRO' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE,
					'auto_increment' => TRUE
				),
				'ID_DIMENSION' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'TITULO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255
				),
				'DESCRIPCION' => array(
					'type' => 'TEXT'
				),
				'OBLIGATORIO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255,
					'default' => 'no'
				),
				'ORDEN' => array(
					'type' => 'INT',
					'constraint' => 11,
					'default' => 0
				),
				'ESTADO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255,
					'default' => 'activo'
				)
			);

			// Define la clave primaria de la tabla
			$this->dbforge->add_key('ID_PARAMETRO', TRUE);

			// Crea la tabla
			$this->dbforge->add_field($fields);
			$this->dbforge->create_table('validacion_parametros');
			


			// Define los campos de la tabla
			$fields = array(
				'ID_REVISION' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE,
					'auto_increment' => TRUE
				),
				'ID_PROYECTO' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'ID_TAREA' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'ID_ENLACE' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'ID_LISTA' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'FECHA' => array(
					'type' => 'TIMESTAMP'
				),
				'ID_RESPONSABLE' => array(
					'type' => 'VARCHAR',
					'constraint' => 255
				),
				'TOTAL_PARAMETROS' => array(
					'type' => 'INT',
					'constraint' => 11,
					'default' => 0
				),
				'TOTAL_VERIFICADOS' => array(
					'type' => 'INT',
					'constraint' => 11,
					'default' => 0
				),
				'ESTADO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255,
					'default' => 'activo'
				)
			);

			// Define la clave primaria de la tabla
			$this->dbforge->add_key('ID_REVISION', TRUE);

			// Crea la tabla
			$this->dbforge->add_field($fields);
			$this->dbforge->create_table('validacion_revisiones');
			

				// Define los campos de la tabla
				$fields = array(
					'ID_RESPUESTA' => array(
						'type' => 'INT',
						'constraint' => 11,
						'unsigned' => TRUE,
						'auto_increment' => TRUE
					),
					'ID_REVISION' => array(
						'type' => 'INT',
						'constraint' => 11,
						'unsigned' => TRUE
					),
					'ID_TAREA' => array(
						'type' => 'INT',
						'constraint' => 11,
						'unsigned' => TRUE
					),
					'ID_ENLACE' => array(
						'type' => 'INT',
						'constraint' => 11,
						'unsigned' => TRUE
					),
					'ID_PARAMETRO' => array(
						'type' => 'INT',
						'constraint' => 11,
						'unsigned' => TRUE
					),
					'ID_RESPONSABLE' => array(
						'type' => 'VARCHAR',
						'constraint' => 255
					),
					'VALOR' => array(
						'type' => 'VARCHAR',
						'constraint' => 255
					),
					'FECHA' => array(
						'type' => 'TIMESTAMP'
					)
				);

				// Define la clave primaria de la tabla
				$this->dbforge->add_key('ID_RESPUESTA', TRUE);

				// Crea la tabla
				$this->dbforge->add_field($fields);
				$this->dbforge->create_table('validacion_respuesta');
			


			// Define los campos de la tabla
			$fields = array(
				'ID_ENLACE' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE,
					'auto_increment' => TRUE
				),
				'ID_PROYECTO' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'ID_TAREA' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'ETIQUETA' => array(
					'type' => 'VARCHAR',
					'constraint' => 255
				),
				'ENLACE' => array(
					'type' => 'VARCHAR',
					'constraint' => 255
				),
				'TIPO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255
				)
			);

			// Define la clave primaria de la tabla
			$this->dbforge->add_key('ID_ENLACE', TRUE);

			// Crea la tabla
			$this->dbforge->add_field($fields);
			$this->dbforge->create_table('enlaces');
			



			// Define los campos de la tabla
			$fields = array(
				'ID_ROL' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE,
					'auto_increment' => TRUE
				),
				'ID_TAREA' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'ID_USUARIO' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => TRUE
				),
				'ETIQUETA' => array(
					'type' => 'VARCHAR',
					'constraint' => 255
				)
			);

			// Define la clave primaria de la tabla
			$this->dbforge->add_key('ID_ROL', TRUE);

			// Crea la tabla
			$this->dbforge->add_field($fields);
			$this->dbforge->create_table('roles');
			

			// Define las columnas a agregar
			$fields = array(
				'VALIDACION' => array(
					'type' => 'VARCHAR',
					'constraint' => 255,
					'default' => 'si'
				),
				'ID_LISTA' => array(
					'type' => 'INT',
					'constraint' => 11,
					'default' => 0
				)
			);

			// Agrega las columnas a la tabla
			$this->dbforge->add_column('proyectos', $fields);
			


			// Define la columna a agregar
			$field = array(
				'ID_PADRE' => array(
					'type' => 'INT',
					'constraint' => 11,
					'default' => 0
				)
			);

			// Agrega la columna a la tabla
			$this->dbforge->add_column('areas', $field);
			*/
			// Carga la librería de base de datos
			$this->load->dbforge();

			// Borra la tabla
			$this->dbforge->drop_table('areas_usuarios');

			// Define las columnas de la tabla
			$fields = array(
				'ID' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => true,
					'auto_increment' => true
				),
				'ID_USUARIO' => array(
					'type' => 'VARCHAR',
					'constraint' => 255,
				),
				'ID_AREA' => array(
					'type' => 'INT',
					'constraint' => 11,
					'unsigned' => true,
				),
			);

			// Carga la librería de base de datos
			$this->load->dbforge();

			// Agrega las columnas a la tabla
			$this->dbforge->add_field($fields);

			// Define la clave primaria
			$this->dbforge->add_key('ID', true);

			// Crea la tabla
			$this->dbforge->create_table('areas_usuarios');

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
