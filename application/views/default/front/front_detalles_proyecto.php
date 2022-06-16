<div class="estadisticas_generales mb-3">
	<h2>Tareas del proyecto</h2>
	<div class="p-2">
		<a href="<?php echo base_url('proyectos/actualizar?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-warning"> <i class="fas fa-pencil-alt"></i> Editar</a>
		<!-- Button trigger modal -->
		<?php if($proyecto['ESTADO']!='terminado'){ ?>
		<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#NuevaTarea">
		  Nueva tarea
		</button>
		<a href="<?php echo base_url('proyectos/borrar?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-outline-danger"> <i class="fas fa-trash"></i> Eliminar</a>
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
	<div class="row ">
		<div class="col-12 col-md-4">
			<div class="card card-body">
				<h3>Proyecto: <?php echo $proyecto['PROYECTO_NOMBRE']; ?></h3>
			</div>
		</div>
		<div class="col-12 col-md-8">
			<ul class="list-group">
				<?php $fecha = ''; foreach($tareas as $tarea){ ?>
					<?php if($fecha != $tarea->FECHA_FINAL){ $fecha = $tarea->FECHA_FINAL; ?>
						<li class="list-group-item border-0 border-bottom">
							<p class="h5"><i class="fas fa-calendar-alt"></i> <?php echo fechas_es($tarea->FECHA_FINAL); ?></p>
						</li>
					<?php } ?>
			  <li class="list-group-item">
					<a href="<?php echo base_url('tareas/detalles?id='.$tarea->ID_TAREA); ?>" class="d-flex row">
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

							$parametros_and = array();
							$parametros_or = array();
							$tablas_join = array();
							$tablas_join['usuarios'] = 'usuarios_tareas.ID_USUARIO = usuarios.ID_USUARIO';
							$parametros_and['usuarios_tareas.ID_TAREA'] = $tarea->ID_TAREA;
							$usuarios = $this->GeneralModel->lista_join('usuarios_tareas',$tablas_join,$parametros_or,$parametros_and,'','','','');
						?>
						<div class="col-12 col-md-8">
							<p title="<?php echo $tarea->ESTADO; ?>"><i class="<?php echo $icono.' '.$color; ?>"></i> <?php echo $tarea->TAREA_TITULO; ?></p>
						</div>
						<div class="col-12 col-md-4">
							<ul class="list-inline">
								<?php foreach($usuarios as $usuario){ ?>
									<li class="list-inline-item" title="<?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?>">
										<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario->IMAGEN) ?>" width="20" class="rounded-circle" alt="">
									</li>
								<?php }; ?>
							</ul>

						</div>

					</a>
			  </li>
			<?php } ?>
			</ul>
		</div>
	</div>


  <div class="row">
    <div class="col-8">
			<div class="detalles_tarea">
				<!--
				AQUÍ SE VERAN LOS DETALLES DE LA TAREA
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
