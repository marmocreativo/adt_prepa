<div class="estadisticas_generales mb-3">
	<h2>Tareas activas</h2>
	<div class="row">
		<?php
		$cantidad_tareas = 0;
		$cantidad_tareas_completas = 0;
		foreach($tareas as $tarea){
			$cantidad_tareas ++;
			$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$tarea->ID_TAREA]);
			if($detalles_tarea['ESTADO']=='completo'){
				$cantidad_tareas_completas ++;
			}
		}
		if($cantidad_tareas>0){
			$porcentaje_completo = ($cantidad_tareas_completas*100)/$cantidad_tareas;
		}else{
			$porcentaje_completo =100;
		}
		$color = 'text-success';
		$icono = "far fa-clock";
		?>
		<div class="col-12 col-md-4">
			Progreso
			<div class="progress mb-3">
			  <div class="progress-bar" role="progressbar" style="width: <?php echo $porcentaje_completo; ?>%" aria-valuenow="<?php echo $porcentaje_completo; ?>" aria-valuemin="0" aria-valuemax="100"></div>
			</div>
			<ul class="list-group">
				<?php foreach($tareas as $tarea){ ?>
			  <li class="list-group-item">
					<a href="<?php echo base_url('tareas/detalles?id='.$tarea->ID_TAREA); ?>">
						<?php
							// variables de estado
							switch ($tarea->ESTADO) {
								case 'pendiente':
									$icono = "far fa-clock";
									$color = 'text-secondary';
									break;
								case 'en desarrollo':
									$icono = "far fa-square";
									$color = 'text-warning';
									// code...
									break;
								case 'completo':
									$icono = "fas fa-check-square";
									$color = 'text-success';
									break;
							}
						?>
						<p class="h4"><?php echo date('d / M', strtotime($tarea->FECHA_FINAL)); ?></p>
				    <i class="<?php echo $icono.' '.$color; ?>"></i>
				    <?php echo $tarea->TAREA_TITULO; ?>
					</a>
			  </li>
			<?php } ?>
			</ul>
		</div>
		<div class="col-8">
			<div class="detalles_tarea">
				<!--
				<h3>Nombre de la tarea</h3>
				<p>Fecha Creación: <b>04/07/2021</b></p>
				<p>Fecha Final: <b>04/07/2021</b></p>
				<p>Descripción e instrucciones de la tarea a realizar</p>
				<hr>
				<h4>Usuarios</h4>
				<img src="<?php echo base_url('contenido/img/usuarios/default.jpg'); ?>" width="50px" class="rounded-circle" alt="">
				<img src="<?php echo base_url('contenido/img/usuarios/default.jpg'); ?>" width="50px" class="rounded-circle" alt="">
				<img src="<?php echo base_url('contenido/img/usuarios/default.jpg'); ?>" width="50px" class="rounded-circle" alt="">
				<img src="<?php echo base_url('contenido/img/usuarios/default.jpg'); ?>" width="50px" class="rounded-circle" alt="">
			-->
			</div>
		</div>
	</div>
</div>

<button type="button" class="btn btn-success btn-circulo-flotante" data-bs-toggle="modal" data-bs-target="#NuevaTarea">
	<i class="fa fa-plus"></i>
</button>

<!-- Modal -->
<div class="modal fade" id="NuevaTarea" tabindex="-1" aria-labelledby="NuevaTareaLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="NuevaTareaLabel">Nueva Tarea</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="" action="<?php echo base_url('tareas/crear'); ?>" method="post">
					<input type="hidden" name="IdProyecto" value="">
					<input type="hidden" name="Tipo" value="general">
				<div class="modal-body">
					<div class="form-group">
						<label for="TareaTitulo">Titulo</label>
						<input type="text" class="form-control" name="TareaTitulo" value="">
					</div>
					<div class="form-group">
						<label for="TareaDescripcion">Descripción</label>
						<textarea name="TareaDescripcion" rows="3" class="form-control"></textarea>
					</div>
					<div class="form-group">
						<label for="FechaInicio">Fecha Inicio (Fecha de asignación puede ser una fecha antigua)</label>
						<input type="text" class="form-control datepicker" name="FechaInicio" value="<?php echo date('d-m-Y'); ?>">
					</div>
					<div class="form-group">
						<label for="FechaFinal">Fecha Final (Dead line)</label>
						<input type="text" class="form-control datepicker" name="FechaFinal" value="">
					</div>
					<div class="form-group">
						<label for="Prioridad">Prioridad</label>
						<select class="form-select" name="Prioridad">
							<option value="normal">Normal</option>
							<option value="alta">Alta</option>
							<option value="urgente">Urgente</option>
						</select>
					</div>
					<div class="form-group">
						<label for="EnlaceEditables">Enlace Archivos Editables</label>
						<input type="text" class="form-control" name="EnlaceEditables" value="">
					</div>
					<div class="form-group">
						<label for="EnlaceEntregables">Enlace Archivos Entregables</label>
						<input type="text" class="form-control" name="EnlaceEntregables" value="">
					</div>
					<input type="hidden" class="" name="Usuarios[]"
					value="<?php echo $_SESSION['usuario']['id']; ?>" >
					<div class="form-group">
						<label for="Estado">Estado</label>
						<select class="form-control" name="Estado">
							<option value="pendiente">Pendiente</option>
							<option value="en desarrollo">En Desarrollo</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary"> <i class="fa fa-save"></i> Guardar</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
