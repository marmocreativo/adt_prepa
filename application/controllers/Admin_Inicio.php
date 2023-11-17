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
		
       // Nombre de la tabla y nombre de la columna
	   $table_name = 'roles_historial';
	   $column_name = 'DIAS_DESPUES_ANTERIOR';

	   // Definir las características de la columna
	   $fields = array(
		   $column_name => array(
			   'type' => 'INT',
			   'constraint' => 11,
			   'default' => '0'
		   )
	   );

	   // Agregar la nueva columna a la tabla
	   if ($this->dbforge->add_column($table_name, $fields)) {
		   echo "La columna '$column_name' se ha creado con éxito en la tabla '$table_name'";
	   } else {
		   echo "Error al crear la columna '$column_name'";
	   }
	   


			
	}

	public function tareas_linea_de_tiempo(){
		$tareas = $this->GeneralModel->lista('tareas','','','ID_PROYECTO','','');
		foreach($tareas as $tarea){
			echo '<table border="1" style="border-collapse: true; margin-bottom: 20px;">';
				echo '<tr>';
					echo '<td style="padding:5px;">'.$tarea->TAREA_TITULO.'</td>';
					$color_estado = 'red';
					if($tarea->ESTADO=='completo'){ $color_estado = 'green';}
					echo '<td style="padding:5px; color:'.$color_estado.'">'.$tarea->ESTADO.'</td>';
					echo '<td style="padding:5px;">'.$tarea->FECHA_INICIO.'</td>';
					echo '<td style="padding:5px;">'.$tarea->FECHA_FINAL.'</td>';
					echo '<td style="padding:5px;">'.$tarea->ID_PROCESO.'</td>';
					$procesos = $this->GeneralModel->lista('roles_historial','',['ID_TAREA'=>$tarea->ID_TAREA],'ORDEN ASC','','');
					$linea_del_tiempo_completa = true;
					echo '<td style="padding:5px;">';
						echo '<table border="1">';
						$fechas = array();
						foreach($procesos as $proceso){
							echo '<tr>';
								echo '<td>'.$proceso->ID.'</td>';	
								echo '<td>'.$proceso->ORDEN.'</td>';
								echo '<td>'.$proceso->ETIQUETA.'</td>';
								$color_estado = 'red';
								if($proceso->ESTADO=='completo'){ $color_estado = 'green';}
								if($proceso->ESTADO=='en desarrollo'){ $linea_del_tiempo_completa = false; }
								echo '<td style="color: '.$color_estado.'">'.$proceso->ESTADO.'</td>';
								echo '<td>'.$proceso->FECHA.'</td>';
							echo '</tr>';
							if($proceso->ID==$tarea->ID_PROCESO){ $error_proceso = true; }
							$fechas[] = $proceso->FECHA;
						}
						echo '</table>';
						if(!empty($procesos)&&$tarea->FECHA_INICIO<$proceso->FECHA){
							echo '<p style="color: red; font-weight: bold;">Incongruencia con fechas</p>';
							$primer_fecha = reset($fechas);
							$ultima_fecha = end($fechas);

							//$this->GeneralModel->actualizar('tareas',['ID_TAREA'=>$tarea->ID_TAREA],['FECHA_INICIO'=>date('Y-m-d', strtotime($primer_fecha)),'FECHA_FINAL'=>date('Y-m-d', strtotime($ultima_fecha))]);
						}
					echo '</td>';
				echo '</tr>';
			echo '</table>';
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
