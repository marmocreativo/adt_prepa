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
		 /*
		$fields = array(
			'ID_LISTA' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'ID_DIMENSION' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'TITULO' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
		);
		
		$this->dbforge->add_column('validacion_respuesta', $fields);
		
		 
		$fields = array(
			'CRITERIO_1' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'OPCIONES_1' => array(
				'type' => 'TEXT',
				'null' => true,
			),
			'CRITERIO_2' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'OPCIONES_2' => array(
				'type' => 'TEXT',
				'null' => true,
			),
			'CRITERIO_3' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'OPCIONES_3' => array(
				'type' => 'TEXT',
				'null' => true,
			),
			'CRITERIO_4' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'OPCIONES_4' => array(
				'type' => 'TEXT',
				'null' => true,
			),
			'CRITERIO_5' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'OPCIONES_5' => array(
				'type' => 'TEXT',
				'null' => true,
			),
		);
		
		$this->dbforge->add_column('validacion_dimension', $fields);
		 
		 
		$fields = array(
			'CRITERIO_VALOR_1' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'CRITERIO_VALOR_2' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'CRITERIO_VALOR_3' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'CRITERIO_VALOR_4' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
			'CRITERIO_VALOR_5' => array(
				'type' => 'VARCHAR',
				'constraint' => '255',
			),
		);
		
		$this->dbforge->add_column('validacion_parametros', $fields);
		 

		 
		// Borrar la tabla actual si existe
        $this->dbforge->drop_table('roles', TRUE);

        // Crear la nueva tabla
        $fields = array(
            'ID' => array(
                'type' => 'INT',
                'constraint' => 11,
                'auto_increment' => TRUE,
                'unsigned' => TRUE
            ),
            'ID_TAREA' => array(
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => TRUE
            ),
            'ID_USUARIO' => array(
                'type' => 'VARCHAR',
                'constraint' => 255
            ),
            'ETIQUETA' => array(
                'type' => 'VARCHAR',
                'constraint' => 255
            ),
            'TIPO_PROCESO' => array(
                'type' => 'VARCHAR',
                'constraint' => 255,
                'default' => 'produccion'
            )
        );

        $this->dbforge->add_field($fields);
        $this->dbforge->add_key('ID', TRUE);
        $this->dbforge->create_table('roles');
		 
		 
		// Crear la nueva tabla
        $fields = array(
            'ID' => array(
                'type' => 'INT',
                'constraint' => 11,
                'auto_increment' => TRUE,
                'unsigned' => TRUE
            ),
            'ID_ROL' => array(
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => TRUE
            ),
            'ID_TAREA' => array(
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => TRUE
            ),
            'ID_USUARIO' => array(
                'type' => 'VARCHAR',
                'constraint' => 255
            ),
            'ETIQUETA' => array(
                'type' => 'VARCHAR',
                'constraint' => 255
            ),
            'PROCESO' => array(
                'type' => 'VARCHAR',
                'constraint' => 255
            ),
            'FECHA' => array(
                'type' => 'DATETIME'
            )
        );

        $this->dbforge->add_field($fields);
        $this->dbforge->add_key('ID', TRUE);
        $this->dbforge->create_table('roles_historial');
		 
		$fields = array(
            'FECHA_LIMITE' => array(
                'type' => 'DATETIME',
                'null' => TRUE
            )
        );

        $this->dbforge->add_column('validacion_revisiones', $fields);
		
		// Nombre de la tabla y columna
			$table_name = 'validacion_revisiones';

			$fields = array(
				'FECHA' => array(
					'type' => 'TIMESTAMP',
					'null' => TRUE,
					'default' => NULL,
				),
			);

			// Modificar la columna
			$this->dbforge->modify_column($table_name, $fields );
		*/

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
