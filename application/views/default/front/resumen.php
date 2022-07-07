<div class="estadisticas_generales mb-3">
	<h2>Estadísticas Generales PROBANDO</h2>
	<div class="row">
		<div class="col-12 col-md-8 line">
			<?php
				$proyectos_totales = 0;
				$proyectos_completos = 0;
				$proyectos_pendientes = 0;

				$tareas_totales = 0;
				$tareas_completas = 0;
				$tareas_pendientes = 0;
				$tareas_atrasadas = 0;

				$usuarios_totales = 0;
				$usuarios_con_tareas_pendientes = 0;
				$array_usuarios = array();

				foreach($proyectos as $proyecto){
					$proyectos_totales ++;
					if($proyecto->ESTADO=='terminado'){
						$proyectos_completos ++;
					}else{
						$proyectos_pendientes ++;
					}
				}

				foreach($usuarios as $usuario){
					$usuarios_totales ++;
					$array_usuarios[$usuario->ID_USUARIO] = array(
						'NOMBRE'=> $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS,
						'TAREAS_PENDIENTES'=> 0,
						'TAREAS_ATRASADAS'=> 0
					);
				}

				foreach($tareas as $tarea){
					$tareas_totales ++;
					if($tarea->ESTADO=='completo'){
						$tareas_completas ++;
					}else{
						$tareas_pendientes ++;
						$lista_usuarios = $this->GeneralModel->lista('usuarios_tareas','',['ID_TAREA'=>$tarea->ID_TAREA],'','','');
						foreach($lista_usuarios as $list_usuario){
							$array_usuarios[$list_usuario->ID_USUARIO]['TAREAS_PENDIENTES'] ++;
							if(date('Y-m-d')>date('Y-m-d', strtotime($tarea->FECHA_FINAL))&&$porcentaje_completo!=100){

							}
						}
					}
				}


			?>
			<table class="table">
				<tr>
					<td>Proyectos</td>
					<td><?php echo $proyectos_totales; ?></td>
				</tr>
				<tr>
					<td>Completos</td>
					<td><?php echo $proyectos_completos; ?></td>
				</tr>
				<tr>
					<td>Pendientes</td>
					<td><?php echo $proyectos_pendientes; ?></td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td>Tareas</td>
					<td><?php echo $tareas_totales; ?></td>
				</tr>
				<tr>
					<td>Completos</td>
					<td><?php echo $tareas_completas; ?></td>
				</tr>
				<tr>
					<td>Pendientes</td>
					<td><?php echo $tareas_pendientes; ?></td>
				</tr>
			</table>
			Usuarios
			<table class="table">
				<?php foreach($array_usuarios as $id => $array_usuario ){ ?>
					<tr>
						<td><?php echo $array_usuario['NOMBRE']; ?></td>
						<td><?php echo $array_usuario['TAREAS_PENDIENTES']; ?></td>
					</tr>
				<?php } ?>
			</table>
	</div>
		<div class="col-12 col-md-4 mt-3">
		</div>
	</div>
</div>

<div class="lista_proyectos d-none">
	<div class="d-flex row  aling-item-center">
    <div class="col-12 col-md-4">
      <div class="titulo">
				<h2>Mis proyectos</h2>
		</div>
    </div>
		<div class="col-12 col-md-7">
      <div class="formulario">
        <form class="row" action="<?php echo base_url('proyectos/busqueda'); ?>" method="get">
          <div class="col">
            <input type="text" class="form-control" name="Busqueda" value="<?php echo verificar_variable('GET','Busqueda','Buscar'); ?>">
          </div>
          <div class="col">
            <button type="submit" class="btn btn-secondary"> Aplicar </button>
          </div>
        </form>
      </div>
    </div>

	</div>
	<div class="slide encabezado_lista_proyectos  mt-4">
		<div class="col proyecto_nombre">
			Nombre
		</div>
		<div class="col-1 proyecto_status">
			Status
		</div>
		<div class="col-1 proyecto_prioridad">
			Prioridad
		</div>
		<div class="col-1 proyecto_fecha_inicio">
			Fecha Inicio
		</div>
		<div class="col-1 proyecto_fecha_final">
			Fecha Entrega
		</div>
		<div class="col-1 proyecto_enlace_editables">
			Editables
		</div>
		<div class="col-1 proyecto_enlace_entregable">
			Entregables
		</div>
	</div>
	<!-- Lista de proyectos -->
	<div class="slide proyecto  align-items-center ">

    <div class="col proyecto_nombre">
			Nombre
		</div>
		<div class="col-1 proyecto_status bg-s-atiempo">
			A tiempo
		</div>
		<div class="col-1 proyecto_prioridad bg-p-urgente">
			Urgente
		</div>
		<div class="col-1 proyecto_fecha_inicio">
			04-07-2021
		</div>
		<div class="col-1 proyecto_fecha_final">
			04-08-2021
		</div>
		<div class="col-1 proyecto_enlace_editables">
			<a href="#"><i class="fab fa-google-drive"></i></a>
		</div>
		<div class="col-1 proyecto_enlace_entregable">
			<a href="#"><i class="fas fa-link"></i></a>
		</div>

	</div>
	<!-- /lista de proyectos -->

</div>
