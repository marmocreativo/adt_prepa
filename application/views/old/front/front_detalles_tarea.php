<div class="estadisticas_generales mb-3">
	<?php if(!empty($tarea['ID_PROYECTO'])){ ?>
	<p> <a href="<?php echo base_url('proyectos/detalles?id='.$tarea['ID_PROYECTO']); ?>">Volver al proyecto</a> </p>
<?php } ?>
	<div class="p-2">
	<div class="row">
		<div class="col-12 col-md-4 mt-3 border-bottom border-end">
			<table class="table table-bordered table-sm">
				<tbody>
					<tr>
						<td title="Fecha de inicio"><i class="fas fa-calendar-plus"></i> <?php echo fechas_es($tarea['FECHA_INICIO']); ?></td>
						<td title="Dead line"><i class="fas fa-stopwatch"></i> <?php echo fechas_es($tarea['FECHA_FINAL']); ?></td>
						<td class="text-end"> <a href="<?php echo base_url('tareas/actualizar?id='.$tarea['ID_TAREA']); ?>"> <i class="fa fa-pencil"></i> Editar tarea </a> </td>
					</tr>
				</tbody>
			</table>
			<p><?php echo $tarea['TAREA_DESCRIPCION']; ?></p>
			<div class="row my-3">
				<?php if(!empty($tarea['TAREA_ENLACE_EDITABLES'])){ ?>
				<div class="col-12 col-md-6">
					<div class="enlace_carpetas">
						<a href="<?php echo $tarea['TAREA_ENLACE_EDITABLES']; ?>"> <i class="fa fa-tools"></i> Editables </a>
					</div>
				</div>
				<?php } ?>
				<?php if(!empty($tarea['TAREA_ENLACE_ENTREGABLE'])){ ?>
				<div class="col-12 col-md-6">
					<div class="enlace_carpetas">
						<a href="<?php echo $tarea['TAREA_ENLACE_ENTREGABLE']; ?>"><i class="fa fa-folder"></i> Entregables</a>
					</div>
				</div>
				<?php } ?>
			</div>
			<h4>Usuarios</h4>
			<?php $usuarios= $this->GeneralModel->lista('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA']],'','',''); ?>
			<ul class="list-inline">
				<?php foreach ($usuarios as $usuario) { ?>
					<?php $detalles_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario->ID_USUARIO]); ?>
					<li class="list-inline-item">
						<a href="<?php echo base_url('lista_usuarios/detalles?id='.$detalles_usuario['ID_USUARIO']); ?>">
						<img src="<?php echo base_url('contenido/img/usuarios/'.$detalles_usuario['IMAGEN']); ?>" title="<?php echo $detalles_usuario['USUARIO_NOMBRE'].' '.$detalles_usuario['USUARIO_APELLIDOS']; ?>" width="50px" class="rounded-circle border border-secondary" alt="">
						</a>
					</li>
				<?php } ?>
			</ul>
		</div>
		<div class="col-12 col-md-8 border-top">
			<div class="detalles_tarea p-3 mt-3">
				<div class="mb-3">
					<a class="btn btn-outline-success mb-3" data-bs-toggle="collapse" href="#formulario_mensaje" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
				    + Agregar un comentario
				  </a>
					<div class="collapse p-4 bg-light" id='formulario_mensaje'>

							<form class="" action="<?php echo base_url('tareas/agregar_mensaje'); ?>" method="post">
								<input type="hidden" name="IdTarea" value="<?php echo $tarea['ID_TAREA']; ?>">
								<input type="hidden" name="IdUsuario" value="<?php echo $_SESSION['usuario']['id']; ?>">
								<input type="hidden" name="EstadoActual" value="<?php echo $tarea['ESTADO']; ?>">
								<input type="hidden" name="Enlace" value="">
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="Mensaje">Comentario</label>
											<textarea name="Mensaje" class="TextEditorSmall"></textarea>
										</div>
									</div>
									<div class="col-3">
										<div class="">
											<?php
													$usuarios = $this->GeneralModel->lista('usuarios','',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','');
													$id_asignados = $this->GeneralModel->lista('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA']],'','','');
													$usuarios_asignados = array();
													foreach($id_asignados as $id_asig){
														$usuarios_asignados[] =$id_asig->ID_USUARIO;
													}
													//var_dump($usuarios);

											?>
											<h4>Asignar a:</h4>
											<ul class="list-group">
												<?php foreach($usuarios as $usuario){ ?>
												<li  class="list-group-item text-dark">
														<label class="form-check-label" >
															<input type="checkbox" class="" name="Usuarios[]"
															value="<?php echo $usuario->ID_USUARIO; ?>"
															<?php if(in_array($usuario->ID_USUARIO, $usuarios_asignados)){ echo 'checked'; }?>
																>
															<?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?></label>
												</li>
											<?php } ?>
											</ul>
											<input type="hidden" name="asignaciones_actuales" value="<?php echo implode(', ', $usuarios_asignados); ?>">
										</div>
									</div>
									<div class="col-3">
										<div class="form-group">
											<label for="EstadoTarea">Estado de la tarea</label>
											<select class="form-control" name="EstadoTarea">
												<option value="pendiente" <?php if($tarea['ESTADO']=='pendiente'){ echo 'selected'; } ?>>Pendiente</option>
												<option value="en desarrollo" <?php if($tarea['ESTADO']=='en desarrollo'){ echo 'selected'; } ?>>En Desarrollo</option>
												<option value="completo" <?php if($tarea['ESTADO']=='completo'){ echo 'selected'; } ?>>Completo</option>
											</select>
										</div>
										<button type="submit" class="btn btn-primary btn-actualizar w-100 my-3">Enviar</button>
									</div>
								</div>
							</form>
					</div>
				</div>
				<?php $mensajes = $this->GeneralModel->lista('tareas_mensajes','',['ID_TAREA'=>$tarea['ID_TAREA']],'FECHA_REGISTRO DESC','',''); ?>
				<div class="row">
					<?php foreach($mensajes as $mensaje){ ?>
						<div class="col-12 mb-3">
							<div class="row">
								<div class="col-1">
									<a href="<?php echo base_url('lista_usuarios/detalles?id='.$mensaje->ID_USUARIO); ?>" style="display:block; margin-top: -20px">
										<img src="<?php echo base_url('contenido/img/usuarios/'.$array_usuarios[$mensaje->ID_USUARIO]['IMAGEN']); ?>" title="<?php echo $array_usuarios[$mensaje->ID_USUARIO]['NOMBRE']; ?>" width="50px" class="rounded-circle border border-secondary" alt="">
									</a>
								</div>
								<div class="col-11">
									<div class="border border-secondary border-primary mb-3 p-4" style="border-radius: 0 20px 20px 20px;">
										<?php echo $mensaje->MENSAJE; ?>
										<?php if($mensaje->TIPO=='reasignacion'){ ?>
											<hr>
											<?php $lista_asignados = explode(', ',$mensaje->ASIGNACIONES); ?>
											<ul class="list-inline">
												<?php foreach ($lista_asignados as $asignacion) { ?>
													<li class="list-inline-item">
														<a href="<?php echo base_url('lista_usuarios/detalles?id='.$asignacion); ?>">
														<img src="<?php echo base_url('contenido/img/usuarios/'.$array_usuarios[$asignacion]['IMAGEN']); ?>" title="<?php echo $array_usuarios[$asignacion]['NOMBRE']; ?>" width="25px" class="rounded-circle border border-secondary" alt="">
														</a>
													</li>
												<?php } ?>
											</ul>
										<?php } ?>
										<div class="text-end" style="font-size:12px;">
											<?php echo fechas_es($mensaje->FECHA_REGISTRO).' '.date('g:i a', strtotime($mensaje->FECHA_REGISTRO)); ?>
										</div>
									</div>
								</div>
							</div>
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
</div>