<div class="estadisticas_generales mb-3">
	<h2>Tareas del proyecto</h2>
	<h5>Esta es una prueba</h5>
	<div class="p-2">
		<a href="<?php echo base_url('proyectos/actualizar?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-warning"> <i class="fas fa-pencil-alt"></i> Editar</a>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#NuevaTarea">
		  Nueva tarea
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
								<input type="hidden" name="IdProyecto" value="<?php echo $proyecto['ID_PROYECTO']; ?>">
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
									<label for="Prioridad">Prioridad</label>
									<select class="form-select" name="Prioridad">
										<option value="normal">Normal</option>
										<option value="alta">Alta</option>
										<option value="urgente">Urgente</option>
									</select>
								</div>
								<div class="form-group">
									<label for="EnlaceEditables">Enlace Archivos Editables</label>
									<input type="text" class="form-control" name="EnlaceEditables" value="<?php echo $proyecto['ENLACE_EDITABLE'] ?>">
								</div>
								<div class="form-group">
									<label for="EnlaceEntregables">Enlace Archivos Entregables</label>
									<input type="text" class="form-control" name="EnlaceEntregables" value="<?php echo $proyecto['ENLACE_ENTREGABLE'] ?>">
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

	</div>
	<div class="row g-0">
		<div class="col-12 col-md-3">
			<div class="etiqueta">
        Progreso
      </div>
    </div>
    <div class="col-12 col-md-8">
      <div class="progreso">
        <div class="progress mb-3">
          <div class="progress-bar striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
          <!-- <div class="progress-bar progress-bar-striped bg-s-terminado" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div> -->
        </div>
        
      </div>
    </div>
			
			<ul class="list-group">
				<?php foreach($tareas as $tarea){ ?>
			  <li class="list-group-item">
					<a href="<?php echo base_url('tareas/detalles?id='.$tarea->ID_TAREA); ?>">
				    <i class="fas fa-check-square text-success"></i>
				    <?php echo $tarea->TAREA_TITULO; ?>
					</a>
			  </li>
			<?php } ?>
			</ul>
		
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
