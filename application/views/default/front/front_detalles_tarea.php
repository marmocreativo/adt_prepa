<?php if(!empty($tarea['ID_PROYECTO'])){ ?>

<a href="<?php echo base_url('index.php/proyectos/detalles?id='.$tarea['ID_PROYECTO']); ?>" class="btn btn-outline-primary"><i class="fas fa-chevron-circle-left"></i> Volver al proyecto</a>
<?php } ?>

<div class="pt-3">

<div class="row">

	<div class="col-8">

		<div class="proyecto <?php echo $modo; ?> p-3" style="overflow: visible;">
		<h2 class="h2"><b><?php echo $tarea['TAREA_TITULO'] ?>
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
					$color_estado = 'warning';
					$texto_estado = 'text-white';
					break;

				default:
					$color_estado = 'primary';
					$texto_estado = 'text-white';
					break;
			}
		?>
			<span class="badge bg-<?php echo $color_estado.' '.$texto_estado; ?> "><?php echo $tarea['ESTADO'] ?></span>
		</b></h2>
					<p>
						<i class="fas fa-calendar" title="Duración de la tarea"></i> <?php if($tarea['FECHA_INICIO'] != null ){ echo fechas_es($tarea['FECHA_INICIO']); }else{ echo 'N/A'; } ?> -
						 <?php if($tarea['FECHA_FINAL'] != null ){ echo fechas_es($tarea['FECHA_FINAL']); }else{ echo 'N/A'; } ?>
						<a href="<?php echo base_url('index.php/tareas/actualizar?id='.$tarea['ID_TAREA']); ?>"> <i class="ml-5 fa fa-pencil"></i> Editar tarea </a>
						<button data-enlace="<?php echo base_url('index.php/tareas/borrar?id='.$tarea['ID_TAREA']); ?>" class="ml-2 btn btn-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar tarea</button>
					</p>
			<p class="tarea-descripcion mt-5"><?php echo $tarea['TAREA_DESCRIPCION']; ?></p>
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
			
			<hr>
			<h4>Personas que participarán:</h4>
			<?php $usuarios_asignados= $this->GeneralModel->lista('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA']],'','',''); ?>
			<ul class="list-inline">
				<?php foreach ($usuarios_asignados as $usuario) { ?>
					<?php $detalles_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario->ID_USUARIO]); ?>
					<li class="list-inline-item dropup usuario-burbuja" >
						
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
						<span
							role="button"
							data-bs-toggle="dropdown"
							aria-expanded="false"><?php echo $detalles_usuario['USUARIO_NOMBRE']; ?><i class="fa-solid fa-chevron-down px-2"></i></span>
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
			<hr>
			<h4>Revisiones:</h4>
			<button type="button" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#ValidacionesCont" title="Validaciones"> Validaciones de la tarea</button>
		</div>
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
										<h4>Espacio para asignación:</h4>
										
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
									<button type="submit" class="btn btn-primary btn-actualizar w-100 my-3">Publicar</button>
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
								<a href="<?php echo base_url('index.php/lista_usuarios/detalles?id='.$mensaje->ID_USUARIO); ?>" style="display:block;">
									<img src="<?php echo base_url('contenido/img/usuarios/'.$array_usuarios[$mensaje->ID_USUARIO]['IMAGEN']); ?>" title="<?php echo $array_usuarios[$mensaje->ID_USUARIO]['NOMBRE']; ?>" width="100%" class="rounded-circle border border-secondary" alt="">
								</a>
							</div>
							<div class="col-11 pl-0">
								<div class="comentario p-3" style="border-radius: 0 20px 20px 20px;">
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
															class="rounded-circle border border-secondary burbuja-sm"
															alt=""
															role="button"
															data-bs-toggle="dropdown"
															aria-expanded="false">
														<span
															role="button"
															data-bs-toggle="dropdown"
															aria-expanded="false">
														<?php echo $detalles_usuario['USUARIO_NOMBRE']; ?></span>
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
										<hr>
										<a class="btn btn-sm btn-secondary-link" data-bs-toggle="collapse" href="#formulario_mensaje_<?php echo $mensaje->ID; ?>" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
										<i class="ml-5 fa fa-pencil"></i> Editar comentario
										</a> | 
										<span class="px-3"><?php echo fechas_es($mensaje->FECHA_REGISTRO).' </span><span> '.date('g:i a', strtotime($mensaje->FECHA_REGISTRO)); ?></span>
										<?php if($mensaje->ID_USUARIO==$_SESSION['usuario']['id']){ ?>
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
																?>
																<h4>Espacio para asignación</h4>
																
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
															<button type="submit" class="btn btn-primary btn-actualizar w-100 my-3">Actualizar</button>
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

	<div class="col-12 col-md-4">
		<?php
		if(!empty($tarea['ID_PROYECTO'])){
			$equipos_proyecto = $this->GeneralModel->lista('equipos_proyectos','',['ID_PROYECTO'=>$tarea['ID_PROYECTO']],'','','');
			$array_equipos = array();
			foreach($equipos_proyecto as $eq_pro){
				$array_equipos[] = $eq_pro->ID_EQUIPO;
			};
			/* CONSULTA PARA SOLO LOS USUARIOS EN LOS EQUIPOS */
			$this->db->select('*');
			$this->db->from('usuarios');
			$this->db->join('equipos_usuarios', 'equipos_usuarios.ID_USUARIO = usuarios.ID_USUARIO', 'left');
			$this->db->where_in('equipos_usuarios.ID_EQUIPO', $array_equipos);
			$this->db->where('usuarios.ESTADO', 'activo');

			$query = $this->db->get();
			$usuarios_disponibles = $query->result();
		}else{
			$usuarios_disponibles = null;
		}
		?>																
		<div class="card proyecto">
			<div class="card-header">Línea de tiempo</div>
			<div class="card-body">
				
				<?php $procesos_post = $this->GeneralModel->lista('roles_historial','',['ID_TAREA'=>$tarea['ID_TAREA']],'ORDEN ASC','',''); ?>
				<ul class="list-group ui-sortable" id="myTab" role="tablist" data-tabla="roles_historial" data-columna="ID">
					<?php foreach($procesos_post as $proceso){ ?>
						<?php $detalle_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$proceso->ID_USUARIO]);?>
					<li class="list-group-item <?php if($proceso->ID==$tarea['ID_PROCESO']){ echo 'bg-warning'; } ?> ui-sortable-handle" id="item-<?php echo $proceso->ID; ?>" role="presentation" style="<?php if($proceso->ESTADO=='completo'){ echo 'text-decoration: line-through'; } ?>" title="<?php echo $detalle_usuario['USUARIO_NOMBRE'].' '.$detalle_usuario['USUARIO_APELLIDOS']; ?>">
						
						<b class='text-primary'>#<?php echo $proceso->ORDEN; ?></b> <b><?php echo $proceso->ETIQUETA; ?></b> | <img
							src="<?php echo base_url('contenido/img/usuarios/'.$detalle_usuario['IMAGEN']); ?>"
							title="<?php echo $detalle_usuario['USUARIO_NOMBRE']; ?>"
							width="25px"
							class="rounded-circle border border-secondary burbuja-sm"
							alt=""
							role="button"
							data-bs-toggle="dropdown"
							aria-expanded="false"> <?php echo $detalle_usuario['USUARIO_NOMBRE']; ?> | <?php echo date('Y-m-d', strtotime($proceso->FECHA)); ?> | <a href="<?php echo base_url('index.php/tareas/borrar_rol?id='.$proceso->ID); ?>">Borrar</a>
					</li>
					<?php } ?>
				</ul>
				<button class="btn btn-sm btn-outline-success mt-3" type="button" data-bs-toggle="collapse" data-bs-target="#form-postproduccion" aria-expanded="false" aria-controls="collapseWidthExample">
					+ Agregar y asignar proceso
				</button>
				<div class="bg-light m-3 p-3 collapse" id="form-postproduccion">
					<form action="<?php echo base_url('index.php/tareas/asignar_rol'); ?>" method="post" enctype="multipart/multipart/form-data">
					<input type="hidden" name="IdTarea" value="<?php echo $tarea['ID_TAREA']; ?>">
					<input type="hidden" name="Proceso" value="postproduccion">
						<div class="form-group">
							<label for="Etiqueta">Etiqueta</label>
							<input type="text" required class="form-control" name="Etiqueta" placeholder='Nombre del proceso'>
						</div>
						<div class="form-group">
							<label for="IdUsuarioPro">Usuario</label>
							<select name="IdUsuario" id="IdUsuarioPro" class="form-control">
								<?php foreach($usuarios_asignados as $usuario_disp){ ?>
								<?php $detalles_usuario_asignado = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario_disp]); ?>
								<option value="<?php echo $detalles_usuario_asignado['ID_USUARIO']; ?>"><?php echo $detalles_usuario_asignado['USUARIO_NOMBRE'].' '.$detalles_usuario_asignado['USUARIO_APELLIDOS']; ?></option>
								<?php } ?>
							</select>
						</div>
						<div class="form-group">
							<label for="Fecha">Fecha límite de entrega</label>
							<input type="text" required class="form-control datepicker" name="Fecha" placeholder='Fecha límite'>
						</div>
						<div class="form-group">
							<label for="Proceso">Este proceso es parte de</label>
							<select name="Proceso" id="Proceso" class="form-control">
								<option value="preproduccion">Preparación (pre-producción)</option>
								<option value="produccion" selected>Producción (producción)</option>
								<option value="postproduccion">Revisión (post-producción)</option>
							</select>
						</div>
						<hr>
						<button type="submit" class="btn btn-primary">Agregar rol</button>
					</form>
				</div>
				<hr>
				<div class="row">
					<?php $detalles_proceso_actual = $this->GeneralModel->detalles('roles_historial',['ID'=>$tarea['ID_PROCESO']]); ?>
					<div class="col-6">
						<?php
							if(!empty($detalles_proceso_actual)){
								$proceso_anterior = $this->GeneralModel->detalles('roles_historial',['ID_TAREA'=>$tarea['ID_TAREA'],'ORDEN'=>$detalles_proceso_actual['ORDEN']-1]);
							}else{
								$proceso_anterior = null;
							}
							?>
						<?php if(!empty($proceso_anterior)){ ?>
						<form action="<?php echo base_url('index.php/tareas/completar_rol'); ?>" method="post">
							<input type="hidden" name="IdProcesoActual" value="<?php echo $tarea['ID_PROCESO']; ?>">
							<input type="hidden" name="IdProcesoSiguiente" value="<?php echo $proceso_anterior['ID']; ?>">
							<hr>
							<button class="btn btn-success w-100"><i class="fa fa-chevron-left"></i> Retroceder línea del tiempo</button>
						</form>
						<?php } ?>
					</div>
					<div class="col-6">
						<?php
						
						if(!empty($detalles_proceso_actual)){
							$proceso_siguiente = $this->GeneralModel->detalles('roles_historial',['ID_TAREA'=>$tarea['ID_TAREA'],'ORDEN'=>$detalles_proceso_actual['ORDEN']+1]);
						}else{
							$proceso_siguiente = null;
						}
						 ?>
						
						<?php if(!empty($proceso_siguiente)){ ?>
						<form action="<?php echo base_url('index.php/tareas/completar_rol'); ?>" method="post">
							<input type="hidden" name="IdProcesoActual" value="<?php echo $tarea['ID_PROCESO']; ?>">
							<input type="hidden" name="IdProcesoSiguiente" value="<?php echo $proceso_siguiente['ID']; ?>">
							<hr>
							<button class="btn btn-success w-100">Avanzar línea del tiempo <i class="fa fa-chevron-right"></i> </button>
						</form>
						<?php }else{ ?>
							<form action="<?php echo base_url('index.php/tareas/completar_rol_final'); ?>" method="post">
							<input type="hidden" name="IdProcesoActual" value="<?php echo $tarea['ID_PROCESO']; ?>">
							<hr>
							<button class="btn btn-danger w-100">Finalizar tarea <i class="fa fa-chevron-right"></i> </button>
						</form>
						<?php } ?>
					</div>
				</div>
				<div>
					<button type="button" class="btn btn-link w-100" data-bs-toggle="modal" data-bs-target="#formCompletar">
					Mover en línea del tiempo
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="formCompletar" tabindex="-1" aria-labelledby="formCompletarLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
		<h4>Selecciona el proceso siguiente, el usuario asignado recibirá la notificación de que es su turno</h4>
        <form action="<?php echo base_url('index.php/tareas/completar_rol'); ?>" method="post">
			<input type="hidden" name="IdProcesoActual" value="<?php echo $tarea['ID_PROCESO']; ?>">
			<div class="form-group">
				<label for="IdProcesoSiguiente">Siguiente paso</label>
				<?php $procesos_siguientes = $this->GeneralModel->lista('roles_historial','',['ID_TAREA'=>$tarea['ID_TAREA']],'FECHA ASC','',''); ?>
				<select name="IdProcesoSiguiente" id="IdProcesoSiguiente" class="form-control">
					<?php foreach($procesos_siguientes as $proceso){ ?>
					<option value="<?php echo $proceso->ID; ?>"><?php echo $proceso->ETIQUETA; ?></option>
					<?php } ?>
				</select>
			</div>
			<hr>
			<button class="btn btn-success">Avanzar línea del tiempo</button>
		</form>
      </div>
    </div>
  </div>
</div>


<!-- Modal Validaciones-->
<div class="modal fade" id="ValidacionesCont" tabindex="-1" aria-labelledby="ValidacionesLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content <?php echo $modo; ?>">
			<div class="modal-header">
				<h5 class="modal-title" id="NuevaTareaLabel">Validaciones</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div>
					<?php if($proyecto['VALIDACION']=='no'){ ?>
					<p>Este proyecto no requiere validación</p>
					<?php }else{ ?>
						<?php $detalles_lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$proyecto['ID_LISTA']]); ?>
						<div>
								<form action="<?php echo base_url('index.php/tareas/crear_validacion'); ?>" method='post'>

									<input type="hidden" name='IdProyecto' value="<?php echo $proyecto['ID_PROYECTO']; ?>">
									<input type="hidden" name='IdTarea' value="<?php echo $tarea['ID_TAREA']; ?>">
									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="IdLista">Lista</label>
												<select name="IdLista" class="form-control">ç
													<?php $listas_validacion = $this->GeneralModel->lista('validacion_lista','',['ESTADO'=>'activo','ID_AREA'=>$_SESSION['usuario']['area']],'','',''); ?>
													<?php foreach($listas_validacion as $lista){ ?>
													<option value="<?php echo $lista->ID_LISTA; ?>" <?php if($lista->ID_LISTA==$proyecto['ID_LISTA']){ echo 'selected'; } ?>><?php echo $lista->TITULO; ?></option>
													<?php }  ?>
												</select>
											</div>
										</div>
										<div class="col">
											<div class="form-group">
											<label for="IdResponsable">Responsable</label>
												<select name="IdResponsable" class="form-control">
													<?php foreach($usuarios as $usuario){ ?>
														<?php $detalles_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario->ID_USUARIO]); ?>
													<option value="<?php echo $detalles_usuario['ID_USUARIO']; ?>"><?php echo $detalles_usuario['USUARIO_NOMBRE'].' '.$detalles_usuario['USUARIO_APELLIDOS']; ?></option>
													<?php }  ?>
												</select>
											</div>
										</div>
										<div class="col">
										<div class="form-group">
											<label for="FechaLimite">Fecha limite validacion</label>
											<input type="date" name="FechaLimite" class="form-control">
										</div>
									</div>
										<div class="col pt-4">
											<button type="submit"class="btn btn-outline-success w-100 mt-2"> Crear revisión</button>
										</div>
									</div>
								</form>
							</div>
						<?php 
							$respuestas_agrupadas = $this->GeneralModel->lista_agrupada('validacion_respuesta','',['ID_TAREA'=>$tarea['ID_TAREA']],'','ID_REVISION');
							//var_dump($respuestas_agrupadas);
						?>
						
						<?php if(!empty($respuestas_agrupadas)){ ?>
							
							<table class="table table-stripped">
							<thead>
								<tr>
									<th>ID</th>
									<th>Lista</th>
									<th>Avance</th>
									<th>Controles</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach($respuestas_agrupadas as $respuesta_agru){ ?>
									<?php $detalles_revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_REVISION'=>$respuesta_agru->ID_REVISION]); ?>
									<?php $detalles_lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$detalles_revision['ID_LISTA']]); ?>
									<?php $detalles_responsable = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$detalles_revision['ID_RESPONSABLE']]); ?>
									<tr>
										<td><?php echo date('Y-m-d', strtotime($detalles_revision['FECHA'])); ?></td>
										<td>
										<?php echo $detalles_lista['TITULO']; ?><br>
											<b><?php echo $detalles_responsable['USUARIO_NOMBRE'].' '.$detalles_responsable['USUARIO_APELLIDOS']; ?></b>
										</td>
										<td>
											<?php
												$porcentaje_avance = round(($detalles_revision['TOTAL_VERIFICADOS']*100)/$detalles_revision['TOTAL_PARAMETROS'] , 2);
											?>
											<div class="progress" role="progressbar" aria-label="Progreso" aria-valuenow="<?php echo $porcentaje_avance; ?>" aria-valuemin="0" aria-valuemax="100">
											<div class="progress-bar" style="width: <?php echo $porcentaje_avance; ?>%"></div>
											</div>
										</td>
										<td>
											<div class="btn-group justify-end">
												<?php if($detalles_revision['ESTADO']=='activo'){ ?>
												<a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$tarea['ID_TAREA']); ?>" class="btn btn-success text-white" title="Formulario"> <i class="fas fa-clipboard-check"></i> Formulario</a>
												<?php } ?>
												<?php if($detalles_revision['ESTADO']=='finalizado'){ ?>
												<a href="<?php echo base_url('index.php/tareas/validacion_reporte?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$tarea['ID_TAREA']); ?>" class="btn btn-primary text-white" title="Reporte"><i class="fas fa-chart-bar"></i> Reporte</a>
												<?php } ?>
											</div>
										</td>
									</tr>
								<?php }//bucle revisiones ?>
							</tbody>
						</table>
						<?php } ?>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
