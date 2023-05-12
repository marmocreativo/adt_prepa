<?php if(!empty($tarea['ID_PROYECTO'])){ ?>

<a href="<?php echo base_url('index.php/proyectos/detalles?id='.$tarea['ID_PROYECTO']); ?>" class="btn btn-outline-primary"><i class="fas fa-chevron-circle-left"></i> Volver al proyecto</a>
<?php } ?>

<div class="pt-3">

<div class="row">

	<div class="col-12 col-md-4">
		
		<div class="proyecto <?php echo $modo; ?>" style="overflow: visible;">
		<h1 class="h4"><?php echo $tarea['TAREA_TITULO'] ?></h1>
		<?php
			switch ($tarea['ESTADO']) {
				case 'en desarrollo':
					$color_estado = 'warning';
					$texto_estado = 'text-white';
					break;
				
				case 'completo':
					$color_estado = 'success';
					$texto_estado = 'text-white';
					break;
				
				case 'pendiente':
					$color_estado = 'light';
					$texto_estado = '';
					break;
				
				default:
					$color_estado = 'light';
					$texto_estado = '';
					break;
			}
		?>
			<div class="alert bg-<?php echo $color_estado.' '.$texto_estado; ?> "><?php echo $tarea['ESTADO'] ?></div>
			<table class="table table-bordered table-sm">
				<tbody>
					<tr>
						<td title="Fecha de inicio"><i class="fas fa-calendar-plus"></i> <?php if($tarea['FECHA_INICIO'] != null ){ echo fechas_es($tarea['FECHA_INICIO']); }else{ echo 'N/A'; } ?></td>
						<td title="Dead line"><i class="fas fa-stopwatch"></i> <?php if($tarea['FECHA_FINAL'] != null ){ echo fechas_es($tarea['FECHA_FINAL']); }else{ echo 'N/A'; } ?></td>
						<td class="text-end"> <a href="<?php echo base_url('index.php/tareas/actualizar?id='.$tarea['ID_TAREA']); ?>"> <i class="fa fa-pencil"></i> Editar tarea </a> </td>
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
					<li class="list-inline-item dropup">
					<div class="dropdown">
						<img
							src="<?php echo base_url('contenido/img/usuarios/'.$detalles_usuario['IMAGEN']); ?>"
							title="<?php echo $detalles_usuario['USUARIO_NOMBRE']; ?>"
							width="50px"
							class="rounded-circle border border-secondary"
							alt=""
							role="button"
							data-bs-toggle="dropdown"
							aria-expanded="false">
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li class="dropdown-item"><b><?php echo $detalles_usuario['USUARIO_NOMBRE']; ?></b></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="<?php echo base_url('index.php/lista_usuarios/detalles?id='.$detalles_usuario['ID_USUARIO']); ?>">Ver perfil</a></li>
							<li><a class="dropdown-item" target="_blank"
							href="https://wa.me/<?php echo $detalles_usuario['USUARIO_TELEFONO']; ?>?text=<?php echo urlencode('Hola, se te ha asignado la tarea: *'.$tarea['TAREA_TITULO'].'* Puedes verla en: '.base_url('index.php/tareas/detalles?id='.$tarea['ID_TAREA'])); ?>">Notificar por Whatsapp </a></li>
						</ul>
					</div>
					</li>
				<?php } ?>
			</ul>
			<?php $proyecto = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$tarea['ID_PROYECTO']]); ?>
			<div class="py-3 border-top border-bottom border-success">
				<h4>Validación</h4>
				<?php if($proyecto['VALIDACION']=='no'){ ?>
				<p>Este proyecto no requiere validación</p>
				<?php }else{ ?>
					<?php $detalles_lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$proyecto['ID_LISTA']]); ?>
					<?php if(!empty($detalles_lista)){ ?>
					<p>Se usará la lista: <b><?php echo $detalles_lista['TITULO']; ?></b> para validar todas las tareas</p>
					<?php $revisiones_agrupadas = $this->GeneralModel->lista('validacion_revisiones','',['ID_TAREA'=>$tarea['ID_TAREA']],'','',''); ?>
					<?php if(!empty($revisiones_agrupadas)){ ?>
					<table class="table table-stripped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Fecha</th>
								<th>Resultados</th>
								<th>Controles</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach($revisiones_agrupadas as $revision){ ?>
								<tr>
									<td><?php echo $revision->ID_REVISION; ?></td>
									<td><?php echo $revision->FECHA; ?></td>
									<td>
									<a href="<?php echo base_url('index.php/tareas/validacion_reporte?id='.$proyecto['ID_PROYECTO'].'&fecha_revision='.$revision->FECHA.'&tarea='.$tarea['ID_TAREA']); ?>" class="btn btn-outline-success btn-sm">Ver resultados</a>
									</td>
									<td>
										<div class="btn-group">
											<a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&fecha_revision='.$revision->FECHA.'&tarea='.$tarea['ID_TAREA']); ?>" class="btn btn-outline-primary btn-sm">Ver formulario</a>
										</div>
									</td>
								</tr>
							<?php }//bucle revisiones ?>
						</tbody>
					</table>
					<?php } ?>
					<div>
						<form action="<?php echo base_url('index.php/tarea/crear_validacion'); ?>" method='post'>
							<input type="hidden" name='IdProyecto' value="<?php echo $proyecto['ID_PROYECTO']; ?>">
							<div class="row">
								<div class="col">
								<label for="IdResponsable">Responsable</label>
								</div>
								<div class="col">
									<div class="form-group">
										<select name="IdResponsable" class="form-control">
											<?php foreach($usuarios as $usuario){ ?>
												<?php $detalles_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario->ID_USUARIO]); ?>
											<option value="<?php echo $detalles_usuario['ID_USUARIO']; ?>"><?php echo $detalles_usuario['USUARIO_NOMBRE'].' '.$detalles_usuario['USUARIO_APELLIDOS']; ?></option>
											<?php }  ?>
										</select>
									</div>
								</div>
								<div class="col">
									<button type="submit"class="btn btn-outline-success w-100"> Crear revisión</button>
								</div>
							</div>
							
							
						</form>
						
					</div>
					<?php }// verifico que la lista exista ?>
				<?php } ?>
			</div>
		</div>
	</div>

	<div class="col-12 col-md-8 border-top">

		<div class="detalles_tarea p-3 mt-3">

			<div class="mb-3">

				<a class="btn btn-outline-success mb-3" data-bs-toggle="collapse" href="#formulario_mensaje" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
					+ Agregar un comentario
				</a>
				<div class="collapse p-4 bg-light" id='formulario_mensaje'>
						<form class="" action="<?php echo base_url('index.php/tareas/agregar_mensaje'); ?>" method="post">
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
							<div class="col-1 pr-0">
								<a href="<?php echo base_url('index.php/lista_usuarios/detalles?id='.$mensaje->ID_USUARIO); ?>" style="display:block; margin-top: -20px">
									<img src="<?php echo base_url('contenido/img/usuarios/'.$array_usuarios[$mensaje->ID_USUARIO]['IMAGEN']); ?>" title="<?php echo $array_usuarios[$mensaje->ID_USUARIO]['NOMBRE']; ?>" width="100%" class="rounded-circle border border-secondary" alt="">
								</a>
							</div>
							<div class="col-11 pl-0">
								<div class="proyecto" style="border-radius: 0 20px 20px 20px;">
									<h5><?php echo $array_usuarios[$mensaje->ID_USUARIO]['NOMBRE']; ?>:</h5>
									<?php echo $mensaje->MENSAJE; ?>
									<?php if($mensaje->TIPO=='reasignacion'){ ?>
										<hr>
										<?php if(!empty($mensaje->ASIGNACIONES)){ ?>
											<?php $lista_asignados = explode(', ',$mensaje->ASIGNACIONES); ?>
											<ul class="list-inline">
												<li class="list-inline-item">Reasignado a:</li>
												<?php foreach ($lista_asignados as $asignacion) { ?>
													<?php if(!empty($asignacion)){ ?>
													<li class="list-inline-item">
													<div class="dropdown">
														<img
															src="<?php echo base_url('contenido/img/usuarios/'.$array_usuarios[$asignacion]['IMAGEN']); ?>"
															title="<?php echo $array_usuarios[$asignacion]['NOMBRE']; ?>"
															width="25px"
															class="rounded-circle border border-secondary"
															alt=""
															role="button"
															data-bs-toggle="dropdown"
															aria-expanded="false">
														<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
															<li class="dropdown-item"><b><?php echo $array_usuarios[$asignacion]['NOMBRE']; ?></b></li>
															<li><hr class="dropdown-divider"></li>
															<li><a class="dropdown-item" href="<?php echo base_url('index.php/lista_usuarios/detalles?id='.$asignacion); ?>">Ver perfil</a></li>
															<li><a class="dropdown-item" target="_blank"
															href="https://wa.me/<?php echo $array_usuarios[$asignacion]['USUARIO_TELEFONO']; ?>?text=<?php echo urlencode('Hola, se te ha asignado la tarea: *'.$tarea['TAREA_TITULO'].'* Puedes verla en: '.base_url('index.php/tareas/detalles?id='.$tarea['ID_TAREA'])); ?>">Notificar por Whatsapp </a></li>
														</ul>
													</div>
													</li>
													<?php } ?>
												<?php } ?>
											</ul>
										<?php } ?>
									<?php } ?>
									<div class="text-end" style="font-size:12px;">
										<?php echo fechas_es($mensaje->FECHA_REGISTRO).' '.date('g:i a', strtotime($mensaje->FECHA_REGISTRO)); ?>
										<?php if($mensaje->ID_USUARIO==$_SESSION['usuario']['id']){ ?>
										<hr>
										<a class="btn btn-sm btn-outline-warning" data-bs-toggle="collapse" href="#formulario_mensaje_<?php echo $mensaje->ID; ?>" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
											Editar
										</a>
										<?php } ?>
													
										<div class="collapse p-4 bg-light" id='formulario_mensaje_<?php echo $mensaje->ID; ?>'>
												<form class="" action="<?php echo base_url('index.php/tareas/actualizar_mensaje'); ?>" method="post">
													<input type="hidden" name="Identificador" value="<?php echo $mensaje->ID; ?>">
													<input type="hidden" name="IdTarea" value="<?php echo $tarea['ID_TAREA']; ?>">
													<input type="hidden" name="IdUsuario" value="<?php echo $_SESSION['usuario']['id']; ?>">
													<input type="hidden" name="EstadoActual" value="<?php echo $tarea['ESTADO']; ?>">
													<input type="hidden" name="Enlace" value="">
													<div class="row">
														<div class="col-6">
															<div class="form-group">
																<label for="Mensaje">Comentario</label>
																<textarea name="Mensaje" class="TextEditorSmall"><?php echo $mensaje->MENSAJE; ?></textarea>
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
