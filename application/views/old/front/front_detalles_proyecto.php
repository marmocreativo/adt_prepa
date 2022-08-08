<div class="estadisticas_generales mb-3">
	<div class="row ">
		<div class="col-12 col-md-4">
			<div class="card card-body pt-0 border-0 border-bottom border-end">
				<div class="bg-image d-flex align-items-center" style="background-image: url(<?php echo base_url('contenido/img/proyectos/'.$proyecto['IMAGEN_FONDO']); ?>)">
					<img src="<?php echo base_url('contenido/img/proyectos/'.$proyecto['IMAGEN']); ?>" class="rounded-circle m-3" width="100">
					<h3><?php echo $proyecto['PROYECTO_NOMBRE']; ?></h3>
				</div>
				<a href="<?php echo base_url('proyectos/actualizar?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-link btn-sm"> <i class="fas fa-pencil-alt"></i> Editar</a>
				<hr>
				<?php echo $proyecto['PROYECTO_DESCRIPCION']; ?>
				<hr>
				<table class="table table-bordered">
					<tr>
						<td><i class="fas fa-calendar-plus"></i> Inicio</td>
						<td><?php echo fechas_es($proyecto['FECHA_INICIO']); ?></td>
					</tr>
					<tr>
						<td><i class="fas fa-stopwatch"></i>Final</td>
						<td><?php echo fechas_es($proyecto['FECHA_FINAL']); ?></td>
					</tr>
					<tr>
						<td>Estado</td>
						<td><?php echo $proyecto['ESTADO']; ?></td>
					</tr>
				</table>
				<hr>
				<div class="row">
					<?php if(!empty($proyecto['ENLACE_EDITABLE'])){ ?>
					<div class="col-12 col-md-6">
						<div class="enlace_carpetas">
							<a href="<?php echo $proyecto['ENLACE_EDITABLE']; ?>"> <i class="fa fa-tools"></i> Editables </a>
						</div>
					</div>
					<?php } ?>
					<?php if(!empty($proyecto['ENLACE_ENTREGABLE'])){ ?>
					<div class="col-12 col-md-6">
						<div class="enlace_carpetas">
							<a href="<?php echo $proyecto['ENLACE_ENTREGABLE']; ?>"><i class="fa fa-folder"></i> Entregables</a>
						</div>
					</div>
					<?php } ?>
				</div>

			</div>
		</div>
		<div class="col-12 col-md-8  border-top">
			<?php $this->load->view('default'.$dispositivo.'/front/widgets/lista_tareas', $tareas); ?>
		</div>
	</div>
	<?php if($proyecto['ESTADO']!='terminado'){ ?>
	<button type="button" class="btn btn-success btn-circulo-flotante" data-bs-toggle="modal" data-bs-target="#NuevaTarea" title="Nueva tarea">
		<i class="fa fa-plus"></i>
	</button>
	<?php } ?>
	<!-- Modal -->
	<div class="modal fade" id="NuevaTarea" tabindex="-1" aria-labelledby="NuevaTareaLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="NuevaTareaLabel">Nueva Tarea</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="" action="<?php echo base_url('tareas/crear'); ?>" method="post">
						<input type="hidden" name="IdProyecto" value="<?php echo $proyecto['ID_PROYECTO']; ?>">
						<input type="hidden" name="Tipo" value="general">
					<div class="modal-body">
						<div class="form-group">
							<label for="TareaTitulo">Titulo</label>
							<input type="text" class="form-control" name="TareaTitulo" value="">
						</div>
						<div class="form-group">
							<label for="TareaDescripcion">Notas</label>
							<textarea name="TareaDescripcion" rows="3" class="form-control TextEditorSmall"></textarea>
						</div>

						<div class="row my-2">
							<div class="col-12 col-md-6">
								<div class="form-group">
									<label for="FechaInicio">Fecha Inicio</label>
									<input type="text" class="form-control datepicker" name="FechaInicio" value="<?php echo date('d-m-Y'); ?>">
									<div class="form-text">Puede ser una fecha anterior</div>
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="form-group">
									<label for="FechaFinal">Fecha Final </label>
									<input type="text" class="form-control datepicker" name="FechaFinal" value="">
									<div class="form-text">(Dead line) si la tarea se entrega después de esta fecha se considera atrasada</div>
								</div>
							</div>
						</div>
						<div class="row my-2">
							<div class="col-12 col-md-6">
								<div class="form-group">
									<label for="EnlaceEditables">Enlace Archivos Editables</label>
									<input type="text" class="form-control" name="EnlaceEditables" value="<?php echo $proyecto['ENLACE_EDITABLE'] ?>">
								</div>
								<div class="form-group">
									<label for="EnlaceEntregables">Enlace Archivos Entregables</label>
									<input type="text" class="form-control" name="EnlaceEntregables" value="<?php echo $proyecto['ENLACE_ENTREGABLE'] ?>">
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="form-group">
									<label for="Prioridad">Prioridad</label>
									<select class="form-select" name="Prioridad">
										<option value="normal">Normal</option>
										<option value="alta">Alta</option>
										<option value="urgente">Urgente</option>
									</select>
								</div>

								<input type="hidden" class="" name="Usuarios[]" value="<?php echo $_SESSION['usuario']['id']; ?>" >
								<div class="form-group">
									<label for="Estado">Estado</label>
									<select class="form-control" name="Estado">
										<option value="pendiente">Pendiente</option>
										<option value="en desarrollo">En Desarrollo</option>
									</select>
								</div>
							</div>
						</div>
						<div class="">
							<?php
									$usuarios = $this->GeneralModel->lista_join('usuarios',['equipos_usuarios'=>'equipos_usuarios.ID_USUARIO = usuarios.ID_USUARIO'],'',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','usuarios.ID_USUARIO');
							?>
							<h4>Asignar a:</h4>
							<ul class="list-group">
								<?php foreach($usuarios as $usuario){ ?>
								<li  class="list-group-item text-dark">
										<label class="form-check-label" >
											<input type="checkbox" class="" name="Usuarios[]"
											value="<?php echo $usuario->ID_USUARIO; ?>" >
											<?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?></label>
								</li>
							<?php } ?>
							</ul>
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

</div>
