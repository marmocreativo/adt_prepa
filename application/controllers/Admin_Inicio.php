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



	public function dias_linea_de_tiempo(){
		echo '
		<style>
		table, th, td {
			border: 1px solid black;
  			border-collapse: collapse;
			padding:5px;
		}
		</style>
		  ';
		$tareas = $this->GeneralModel->lista('tareas','','','','','');
		foreach($tareas as $tarea){
			$procesos = $this->GeneralModel->lista('roles_historial', '',['ID_TAREA'=>$tarea->ID_TAREA],'ORDEN ASC','','');
			echo '<p style="color: green">';
			echo '<a href="'.base_url('index.php/tareas/detalles?id='.$tarea->ID_TAREA).'" target="_blank">'.$tarea->TAREA_TITULO.'</a>';
			echo '</p>';
			echo '<table >';
			echo '<tr>';
				echo '<th>';
					echo 'Orden';
				echo '</th>';
				echo '<th>';
					echo 'Proceso';
				echo '</th>';
				echo '<th>';
					echo 'Fecha';
				echo '</th>';
				echo '<th>';
					echo 'Días registrado';
				echo '</th>';
				echo '<th>';
					echo 'Días calculado';
				echo '</th>';
			echo '<tr>';
			foreach($procesos as $proceso){
				$detalles_proceso_anterior = $this->GeneralModel->detalles('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA, 'ORDEN'=>$proceso->ORDEN-1]);
				echo '<tr>';
				echo '<td>';
					echo $proceso->ORDEN;
				echo '</td>';
				echo '<td>';
					echo $proceso->ETIQUETA;
				echo '</td>';
				echo '<td>';
					echo $proceso->FECHA;
				echo '</td>';
				echo '<td>';
					echo $proceso->DIAS_DESPUES_ANTERIOR;
				echo '</td>';
				echo '<td>';
				if(empty($detalles_proceso_anterior)){
					$intervalo = 0;
					$dias = $intervalo;
				}else{
					$fecha1 = new DateTime($detalles_proceso_anterior['FECHA']); // Reemplaza '2023-01-01' con tu primera fecha
					$fecha2 = new DateTime($proceso->FECHA); // Reemplaza '2023-11-13' con tu segunda fecha

					$intervalo = $fecha1->diff($fecha2);
					$dias = $intervalo->days;
				}

				if($proceso->DIAS_DESPUES_ANTERIOR != $dias){
					$this->GeneralModel->actualizar('roles_historial',['ID'=>$proceso->ID],['DIAS_DESPUES_ANTERIOR'=>$dias]);
				}

				
				
					echo $dias;
				echo '</td>';
			echo '<tr>';
			}
			echo '</table>';
			echo '<hr>';
		}
	}

	public function procesos_olvidados(){
		$procesos = $this->GeneralModel->lista('roles_historial','','','','','');
		$no_procesos = 0;
		$tarea_borrada = 0;

		foreach($procesos as $proceso){
			$tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$proceso->ID_TAREA]);
			$no_procesos ++;
			if(empty($tarea)){
				$tarea = $this->GeneralModel->borrar('roles_historial',['ID_TAREA'=>$proceso->ID_TAREA]);
			}
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
