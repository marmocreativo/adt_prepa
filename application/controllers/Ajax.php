<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Ajax extends CI_Controller {
	public function __construct(){
		parent::__construct();
		// Cargo las Opciones
		$this->data['op'] = opciones_default();

		// reviso el dispositivo
		if($this->agent->is_mobile()){
			//$this->data['dispositivo']  = "mobile";
			$this->data['dispositivo']  = "";
		}else{
			$this->data['dispositivo']  = "";
		}

		// Cargo los modelos

	}

	public function url_amigable()
	{
		$titulo = convert_accented_characters($this->input->get('url'));
		$url = url_title($titulo,'-',TRUE);

		if (existe_url($_GET['tabla'],$_GET['objeto'],$url,$_GET['id'])){
			echo $url.'-'.url_title(generador_aleatorio(4),'-',TRUE);
		}else{
			echo $url;
		}
	}

	public function lista_paises()
	{
		$paises = $this->GeneralModel->lista('direcciones_paises','',['ESTADO'=>'activo'],'PAIS_NOMBRE ASC','','');
		foreach($paises as $pais){
			echo '<option value="'.$pais->PAIS_NOMBRE.'" data-id-pais="'.$pais->ID_PAIS.'">'.$pais->PAIS_NOMBRE.'</option>';
		}
	}
	public function lista_estados()
	{
		$estados = $this->GeneralModel->lista('direcciones_estados','',['ID_PAIS'=>$_GET['id_pais'],'ESTADO'=>'activo'],'ESTADO_NOMBRE ASC','','');
		foreach($estados as $estado){
			echo '<option value="'.$estado->ESTADO_NOMBRE.'" data-id-estado="'.$estado->ID_ESTADO.'">'.$estado->ESTADO_NOMBRE.'</option>';
		}
	}

	public function lista_municipios()
	{
		$municipios = $this->GeneralModel->lista('direcciones_municipios','',['ID_ESTADO'=>$_GET['id_estado'],'ESTADO'=>'activo'],'MUNICIPIO_NOMBRE ASC','','');
		foreach($municipios as $municipio){
			echo '<option value="'.$municipio->MUNICIPIO_NOMBRE.'" >'.$municipio->MUNICIPIO_NOMBRE.'</option>';
		}
	}

	public function multimedia_ajax()
	{
		$this->data['multimedia'] = $this->GeneralModel->lista('multimedia','',['TIPO_ARCHIVO'=>$_GET['tipo']],'ID_MULTIMEDIA DESC','','');
		$this->load->view('default'.$this->data['dispositivo'].'/ajax/galeria_'.$_GET['tipo'].'_ajax',$this->data);
	}

	public function galeria_ajax()
	{
		$this->data['multimedia'] = $this->GeneralModel->lista_join('galerias',['multimedia'=>'galerias.ID_MULTIMEDIA = multimedia.ID_MULTIMEDIA'],'',
		[
			'galerias.ID_OBJETO'=>$_GET['id'],
			'galerias.TIPO_ARCHIVO'=>$_GET['tipo'],
			'galerias.TIPO_OBJETO'=>$_GET['tipo_objeto']
		],
			'galerias.ORDEN ASC','','','');
		$this->load->view('default'.$this->data['dispositivo'].'/ajax/galeria_'.$_GET['tipo'].'_ajax',$this->data);
	}

	public function actualizar_multimedia()
	{
		$parametros = array(
			'TITULO'=>$_POST['titulo'],
			'RESUMEN'=>$_POST['resumen'],
			'ARCHIVO'=>$_POST['archivo'],
		);

		$this->GeneralModel->actualizar('multimedia',['ID_MULTIMEDIA'=>$this->input->post('id')],$parametros);
	}

	public function borrar_multimedia()
	{
		$this->GeneralModel->borrar('multimedia',['ID_MULTIMEDIA'=>$_GET['id_multimedia']]);
		$this->GeneralModel->borrar('galerias',['ID_MULTIMEDIA'=>$_GET['id_multimedia']]);
	}

	public function select_objetos_relaciones()
	{
		switch ($_GET['objeto']) {
			case 'publicaciones':
					$this->data['publicaciones'] = $this->GeneralModel->lista_join('publicaciones','','',['TIPO'=>$_GET['tipo']],'PUBLICACION_TITULO ASC','','','');
				break;
			case 'usuarios':
					$this->data['usuarios'] = $this->GeneralModel->lista_join('usuarios','','',['TIPO'=>$_GET['tipo']],'USUARIO_NOMBRE ASC','','','');
				break;

			default:
				$this->data['publicaciones'] = $this->GeneralModel->lista_join('publicaciones','','',['TIPO'=>$_GET['tipo']],'PUBLICACION_TITULO ASC','','','');
				break;
		}

		$this->load->view('default'.$this->data['dispositivo'].'/ajax/select_'.$_GET['objeto'].'_relaciones_ajax',$this->data);
	}


	public function reordenar()
	{
		//var_dump($_GET);
		$i = 0;
		parse_str($_GET['objetos'],$objetos);
		foreach ( $objetos['item'] as $identificador) {
			$this->GeneralModel->actualizar($_GET['tabla'],[$_GET['columna']=>$identificador],['ORDEN'=>$i]);
		    $i++;
		}
		//
	}


	public function reordenar_menu()
	{
		//var_dump($_GET);

		$i = 0;
		parse_str($_GET['objetos'],$objetos);
		var_dump($objetos);
		foreach ( $objetos['elementos'] as $identificador => $padre) {

			$this->GeneralModel->actualizar('menu',['ID_MENU'=>$identificador],['MENU_PADRE'=>$padre,'ORDEN'=>$i]);
		    $i++;
		}
		//
	}

	public function vistas_por_dia()
	{
		$d = array();
		for($i = 0; $i < 35; $i++){
	    $d[] = date("Y-m-d", strtotime('today -31 days +'. $i .' days'));
		}
		$vistas_x_fecha = array();
		foreach($d as $d){
			$vistas = $this->GeneralModel->conteo_vistas_por_dia(['FECHA'=>$d],'');
			$fecha_dia = intval(date('U',strtotime($d)));
			if($vistas['cantidad_total']!=0){
				$vistas_x_fecha[]=[$fecha_dia,intval($vistas['cantidad_total'])];
			}else{
				$vistas_x_fecha[]=[$fecha_dia,0];
			}

		}
		$grafica['label']='Vistas de los últimos 35 días';
		$grafica['data'] = $vistas_x_fecha;
		$respuesta = json_encode($vistas_x_fecha);
		echo $respuesta;
	}

	public function registrar_respuesta()
	{
		if(isset($_GET)){
			if($_GET['marcada']=='si'){
				$this->GeneralModel->actualizar('validacion_respuesta',['ID_RESPUESTA'=>$_GET['respuesta']],['VALOR'=>'validada']);
			}
			if($_GET['marcada']=='no'){
				$this->GeneralModel->actualizar('validacion_respuesta',['ID_RESPUESTA'=>$_GET['respuesta']],['VALOR'=>'']);
			}
			$detalles_respuesta = $this->GeneralModel->detalles('validacion_respuesta',['ID_RESPUESTA'=>$_GET['respuesta']]);
			$detalles_revision = $this->GeneralModel->detalles('validacion_respuesta',['ID_REVISION'=>$detalles_respuesta['ID_REVISION']]);
			$cantidad_parametros = $this->GeneralModel->conteo_elementos('validacion_respuesta',['ID_REVISION'=>$detalles_revision['ID_REVISION']]);
			$cantidad_validados = $this->GeneralModel->conteo_elementos('validacion_respuesta',['ID_REVISION'=>$detalles_revision['ID_REVISION'],'VALOR'=>'validada']);
			$parametros = array(
				'TOTAL_PARAMETROS' => $cantidad_parametros,
				'TOTAL_VERIFICADOS' => $cantidad_validados
			);
	
			$this->GeneralModel->actualizar('validacion_revisiones',['ID_REVISION'=>$detalles_revision['ID_REVISION']], $parametros);
		}
	}

	public function registrar_comentario()
	{
		if(isset($_GET)){
				$this->GeneralModel->actualizar('validacion_respuesta',['ID_RESPUESTA'=>$_GET['respuesta']],['COMENTARIOS'=>$_GET['comentario']]);
		}
	}

	public function configuracion_auto()
	{	
		//var_dump($_POST);
		$parametros_meta = array(
			'VALOR'=>$_POST['valor']
		);
		// Creo las entradas a la galeria
		$this->GeneralModel->actualizar('usuarios_preferencias',['ID_USUARIO'=>$_SESSION['usuario']['id'],
		'CONFIGURACION'=>$_POST['configuracion']],$parametros_meta);

		$configuraciones_usuario = $this->GeneralModel->lista('usuarios_preferencias','',['ID_USUARIO'=>$_SESSION['usuario']['id']],'','','');
		//var_dump($configuraciones_usuario);

		foreach($configuraciones_usuario as $configuracion){
			$_SESSION['usuario']['configuraciones'][$configuracion->CONFIGURACION]=$configuracion->VALOR;
		}
	}

	public function borrar_parametros_en_lote()
	{
		foreach($_POST['ids'] as $index=>$id){
			$this->GeneralModel->borrar('validacion_parametros',['ID_PARAMETRO'=>$id]);
			$this->GeneralModel->borrar('meta_datos',['ID_OBJETO'=>$id,'TIPO_OBJETO'=>'parametro']);
		}
	}

	public function revisar_ultima_notificacion()
	{
		if(isset($_SESSION['usuario']['id'])){
			$ultima_notificacion = $this->GeneralModel->lista('notificaciones','',['ID_USUARIO'=>$_SESSION['usuario']['id']],'FECHA_CREACION DESC','1','');
			$datos_notif = array();
			foreach($ultima_notificacion as $valor){
				$datos_notif['ENLACE'] = $valor->ENLACE;
				$datos_notif['NOTIFICACION_CONTENIDO'] = $valor->NOTIFICACION_CONTENIDO;
				$datos_notif['FECHA_CREACION'] = $valor->FECHA_CREACION;
			}
			
			if($datos_notif['FECHA_CREACION']!=$_SESSION['ultima_notificacion']){
				echo $datos_notif['NOTIFICACION_CONTENIDO'];
				$_SESSION['ultima_notificacion'] = $datos_notif['FECHA_CREACION'];
			}
		}	
		
	}

	public function calendario_procesos()
	{	
		
		$fecha_inicio = verificar_variable('GET','fecha_inicio',date('Y-m-d 00:00:00', strtotime('today - 3 months')));
		$fecha_final = verificar_variable('GET','fecha_final',date('Y-m-d 00:00:00', strtotime('today + 3 months')));
		$procesos = $this->GeneralModel->lista('roles_historial','',['ID_USUARIO'=>$_SESSION['usuario']['id'],'ESTADO'=>'en desarrollo'],'','','');
		$eventos = array();
		foreach($procesos as $proceso){
			$detalles_tarea= $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$proceso->ID_TAREA]);
			if($proceso->FECHA >= date('Y-m-d 00:00:00')){
				$eventos[] = array(
					'title'=>$proceso->ETIQUETA,
					'description'=> $detalles_tarea['TAREA_TITULO'],
					'start'=>$proceso->FECHA,
					'allDay'=>'true',
					'url' => base_url('index.php/tareas/detalles?id='.$proceso->ID_TAREA),
					'backgroundColor' => '#0d6efd'
				);
			}else{
				$eventos[] = array(
					'title'=>$proceso->ETIQUETA,
					'description'=> $detalles_tarea['TAREA_TITULO'],
					'start'=>$proceso->FECHA,
					'allDay'=>'true',
					'url' => base_url('index.php/tareas/detalles?id='.$proceso->ID_TAREA),
					'backgroundColor' => '#dc3545'
				);
			}
		}
		

		echo json_encode($eventos);
		
	}
	public function calendario_procesos_todos()
	{	
		
		$fecha_inicio = verificar_variable('GET','fecha_inicio',date('Y-m-d 00:00:00', strtotime('today - 3 months')));
		$fecha_final = verificar_variable('GET','fecha_final',date('Y-m-d 00:00:00', strtotime('today + 3 months')));
		$procesos = $this->GeneralModel->lista('roles_historial','',['ESTADO'=>'en desarrollo'],'','','');
		$eventos = array();
		foreach($procesos as $proceso){
			$detalles_tarea= $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$proceso->ID_TAREA]);
			$detalles_usuarios= $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$proceso->ID_USUARIO]);
			if($proceso->FECHA >= date('Y-m-d 00:00:00')){
				$eventos[] = array(
					'title'=>$proceso->ETIQUETA.' | '.$detalles_tarea['TAREA_TITULO'].' | '.$detalles_usuarios['USUARIO_NOMBRE'], 
					'description'=> $detalles_tarea['TAREA_TITULO'],
					'start'=>$proceso->FECHA,
					'allDay'=>'true',
					'url' => base_url('index.php/tareas/detalles?id='.$proceso->ID_TAREA),
					'backgroundColor' => '#0d6efd'
				);
			}else{
				$eventos[] = array(
					'title'=>$proceso->ETIQUETA,
					'title'=>$proceso->ETIQUETA.' | '.$detalles_tarea['TAREA_TITULO'].' | '.$detalles_usuarios['USUARIO_NOMBRE'], 
					'start'=>$proceso->FECHA,
					'allDay'=>'true',
					'url' => base_url('index.php/tareas/detalles?id='.$proceso->ID_TAREA),
					'backgroundColor' => '#dc3545'
				);
			}
		}
		

		echo json_encode($eventos);
		
	}
}
