<div class="contenido_principal">
	<div class="row">
		<div class="col-12 col-md-3">
			<div class="encabezado_proyecto p-2">
				<div class="row">
					<div class="col-12 mb-3">
						<h1 class="h5 text-<?php echo $proyecto['COLOR']; ?>"><?php echo $proyecto['PROYECTO_NOMBRE']; ?></h1>
					</div>
					<div class="col-5">
						<img src="<?php echo base_url('contenido/img/proyectos/'.$proyecto['IMAGEN']); ?>" class="rounded-circle img-fluid">
					</div>
					<div class="col-7">
						<table class="table table-sm">
							<tr>
								<td><i class="far fa-square text-<?php echo $proyecto['COLOR']; ?>"></i></td>
								<?php $cantidad_tareas_pendientes = $this->GeneralModel->conteo('tareas','','',['ESTADO'=>'pendiente'],''); ?>
								<td><b><?php echo $cantidad_tareas_pendientes; ?></b> Pendientes</td>
							</tr>
							<tr>
								<td><i class="fa fa-cogs text-<?php echo $proyecto['COLOR']; ?>"></i></td>
								<?php $cantidad_tareas_proceso = $this->GeneralModel->conteo('tareas','','',['ESTADO'=>'en desarrollo'],''); ?>
								<td><b><?php echo $cantidad_tareas_proceso; ?></b> en Desarrollo</td>
							</tr>
							<tr>
								<td><i class="far fa-check-square text-<?php echo $proyecto['COLOR']; ?>"></i></td>
								<?php $cantidad_tareas_completas = $this->GeneralModel->conteo('tareas','','',['ESTADO'=>'completas'],''); ?>
								<td><b><?php echo $cantidad_tareas_completas; ?></b> Completas</td>
							</tr>
						</table>
					</div>
					<div class="col-12 py-3">
						<a href="<?php echo base_url('index.php/admin/proyectos/actualizar/?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-outline-warning btn-block"> <i class="fa fa-pencil-alt"></i> Editar</a>
					</div>
					<div class="col-12">
						<?php echo $proyecto['PROYECTO_DESCRIPCION']; ?>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-9">
				<?php retro_alimentacion(); ?>
				<ul class="nav nav-tabs nav-fill">
				  <li class="nav-item">
				    <a class="nav-link active" href="<?php echo base_url('index.php/admin/proyectos/detalles?id='.$proyecto['ID_PROYECTO']); ?>"><i class="fas fa-tasks"></i></a>
				  </li>
					<li class="nav-item">
				    <a class="nav-link" href="<?php echo base_url('index.php/admin/proyectos/equipos?id='.$proyecto['ID_PROYECTO']); ?>"> <i class="fa fa-users"></i> </a>
				  </li>
				</ul>
				<div class="bg-white p-0 py-4">
					<div class="p-2">
						<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-success btn-block btn-sm" data-toggle="modal" data-target="#formulario_tarea">
							+ Tarea
							</button>

							<!-- Modal -->
							<div class="modal fade" id="formulario_tarea" tabindex="-1" role="dialog" aria-labelledby="formulario_tarea" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<form class="" action="<?php echo base_url('index.php/admin/tareas/crear'); ?>" method="post">
										<input type="hidden" name="IdProyecto" value="<?php echo $proyecto['ID_PROYECTO']; ?>">
										<input type="hidden" name="Tipo" value="general">
									<div class="modal-header bg-primary">
										<h5 class="modal-title">Nueva tarea</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
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
											<label for="FechaEntrega">Fecha de entrega</label>
											<input type="text" class="form-control datepicker" name="FechaEntrega" value="<?php echo date('d-m-Y', strtotime('+1day')); ?>">
										</div>
										<div class="row">
											<?php
											$colores = array('indigo', 'blue','purple','pink','red','orange','yellow','green','teal','cyan','white','gray','gray-dark','dark');
											?>
											<?php foreach($colores as $color){ ?>
											<div class="col-2 col-md-2 p-1">
												<label for="TareaColor<?php echo $color; ?>" title="<?php echo $color; ?>">
												<div class="card">
													<div class="card-body bg-<?php echo $color; ?>">
													</div>
													<div class="card-footer">
														<input  type="radio" name="TareaColor" id="TareaColor<?php echo $color; ?>" value="<?php echo $color; ?>" <?php if($usuario['COLOR']==$color){ echo 'checked'; } ?>>
													</div>
												</div>
												</label>
											</div>
										<?php } ?>
										</div>
										<div class="">
											<?php
												$id_equipos = array();
												foreach ($equipos as $equipo) {
													$id_equipos[] = $equipo->ID_EQUIPO;
												}
													$usuarios = $this->GeneralModel->lista_join('usuarios',['equipos_usuarios'=>'equipos_usuarios.ID_USUARIO = usuarios.ID_USUARIO'],'',['equipos_usuarios.ID_EQUIPO'=>$equipo->ID_EQUIPO,'usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','');
													echo $equipo->EQUIPO_NOMBRE.'<br>';
													echo '<pre>';
													var_dump($usuarios);
													echo '</pre>';

											?>
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
					<?php foreach($tareas_agrupadas as $tareas_grupo){ ?>
						<div class="d-flex p-2">
							<div class="col-2 text-center tareas_fecha p-0">
								<span class="badge bg-<?php echo $proyecto['COLOR']; ?>"><?php echo date('d',strtotime($tareas_grupo->FECHA_ENTREGA)); ?> <br> <?php echo date('M',strtotime($tareas_grupo->FECHA_ENTREGA)) ?></span>
							</div>
							<?php
							$parametros_or = array();
							$parametros_and = array('ID_TAREA_PADRE'=>null,'ID_PROYECTO'=>$tareas_grupo->ID_PROYECTO,'FECHA_ENTREGA'=>$tareas_grupo->FECHA_ENTREGA);
								$tareas = $this->GeneralModel->lista('tareas',$parametros_or,$parametros_and,'FECHA_INICIO ASC','','');
							?>
							<div class="col-10 p-0 tareas_lista">
								<ul class="list-group lista-tareas">
									<?php foreach($tareas as $tarea){ ?>
								  <li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="<?php echo base_url('index.php/admin/tareas/detalles?id='.$tarea->ID_TAREA); ?>">
											<?php echo $tarea->TAREA_TITULO; ?>
										</a>
								    <span class="badge badge-secondary badge-pill"><i class="far fa-check-square"></i></span>
								  </li>
									<?php } ?>
								</ul>
							</div>
						</div>
					<?php } ?>
				</div>
		</div>
	</div>
</div>
