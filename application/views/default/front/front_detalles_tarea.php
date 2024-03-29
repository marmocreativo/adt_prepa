<?php if(!empty($tarea['ID_PROYECTO'])){ ?>

<!-- <a href="<?php echo base_url('index.php/proyectos/detalles?id='.$tarea['ID_PROYECTO']); ?>" class="btn btn-outline-primary"><i class="fas fa-chevron-circle-left"></i> Volver al proyecto</a>
<?php } ?> -->

<?php $listas_validacion = $this->GeneralModel->lista('validacion_lista','',['ESTADO'=>'activo','ID_AREA'=>$_SESSION['usuario']['area']],'','',''); ?>

<div class="pt-3">

<div class="row">

	<div class="col-8">

		<div class="proyecto <?php echo $modo; ?> p-3" style="overflow: visible;">
		<!-- <h3><b><?php echo $tarea['TAREA_TITULO'] ?>
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
		</b></h3> -->

		<div class="d-flex align-items-center border-bottom border-top p-2 bg-secondary bg-opacity-10">
		    <div class="p-2 pe-4 border-end">
				<i class="fas fa-calendar mb-3 pe-2"></i>Duración</br>
				<b><span><?php if ($tarea['FECHA_INICIO'] != null) {
							echo fechas_es($tarea['FECHA_INICIO']);
						} else {
							echo 'N/A';
						} ?>
					</span> -
					<span>
						<?php if ($tarea['FECHA_FINAL'] != null) {
							echo fechas_es($tarea['FECHA_FINAL']);
						} else {
							echo 'N/A';
						} ?>
					</span></b>
			</div>
			<div class="py-2 px-4 border-end">
				<i class="fa-solid fa-bars-progress mb-3 pe-2"></i></i>Estado</br>
				<b><span>
						<?php echo $tarea['ESTADO'] ?>
					</span></b>
			</div>
			<div class="py-2 px-4 border-end">
				<i class="fa-solid fa-link mb-2 pe-2"></i></i>Carpetas y documentos</br>
				<div class="btn-group">
				<?php if(!empty($tarea['TAREA_ENLACE_EDITABLES'])){ ?>
						<a class="enlace_carpetas btn btn-outline-secondary border-secondary-subtle btn-sm"
							href="<?php echo $tarea['TAREA_ENLACE_EDITABLES']; ?>" target="_blank"> <i class="fa fa-folder"></i> Carpeta
							General</a>
					<?php } ?>
					<?php if(!empty($tarea['TAREA_ENLACE_ENTREGABLE'])){ ?>
						<a class="enlace_carpetas btn btn-outline-secondary border-secondary-subtle btn-sm"
							href="<?php echo $tarea['TAREA_ENLACE_ENTREGABLE']; ?>" target="_blank"><i class="fa fa-file"></i> Version
							Final</a>
					<?php } ?>
				</div>
			</div>
            <div class="ms-2 p-2">
				<a href="<?php echo base_url('index.php/tareas/actualizar?id='.$tarea['ID_TAREA']); ?>" class="btn btn-outline-secondary btn"> <i class="fas fa-pencil-alt"></i></a>
			</div>
            <div class="p-2">
				<button data-enlace="<?php echo base_url('index.php/tareas/borrar?id='.$tarea['ID_TAREA']); ?>" class="ml-2 btn btn-outline-danger btn borrar_entrada"> <i class="fas fa-trash"></i></button>
			</div>
		</div>

		<div class="row mt-3 py-3 border-bottom">
			<div class="col-12">
		        <h5>Revisiones</h5>
				<button type="button" class="ml-2 btn btn-info" data-bs-toggle="modal" data-bs-target="#ValidacionesCont" title="Validaciones"> Validaciones de la tarea</button>
			</div>
		</div>

			<div class="tarea-descripcion mt-5"><?php echo $tarea['TAREA_DESCRIPCION']; ?></div>
			
			<hr>
			<h4>Personas que participarán:</h4>
			<?php $usuarios_asignados= $this->GeneralModel->lista_agrupada('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA']],'','ID_USUARIO'); ?>
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
		</div>
		<div class="detalles_tarea p-3 mt-3">

			<div class="mb-3">

				<a class="btn btn-outline-success mb-3" data-bs-toggle="collapse" href="#formulario_mensaje" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
					+ Agregar un comentario
				</a>
				<div class="collapse" id='formulario_mensaje'>
						<form class="" action="<?php echo base_url('index.php/tareas/agregar_mensaje'); ?>" method="post">
							<input type="hidden" name="IdTarea" value="<?php echo $tarea['ID_TAREA']; ?>">
							<input type="hidden" name="IdUsuario" value="<?php echo $_SESSION['usuario']['id']; ?>">
							<input type="hidden" name="EstadoActual" value="<?php echo $tarea['ESTADO']; ?>">
							<input type="hidden" name="Enlace" value="">
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<label for="Mensaje">Comentario</label>
										<textarea name="Mensaje" class="TextEditorSmall"></textarea>
									</div>
									<?php
												$usuarios = $this->GeneralModel->lista('usuarios','',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','');
												$id_asignados = $this->GeneralModel->lista_agrupada('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA']],'','ID_USUARIO');
												$usuarios_asignados = array();
												foreach($id_asignados as $id_asig){
													$usuarios_asignados[] =$id_asig->ID_USUARIO;
												}
												//var_dump($usuarios);
										?>
										
										<input type="hidden" name="asignaciones_actuales" value="<?php echo implode(', ', $usuarios_asignados); ?>">
										<input type="hidden" name="EstadoTarea" value="<?php echo $tarea['ESTADO']; ?>">
									<button type="submit" class="btn btn-primary btn-actualizar my-3">Publicar</button>
									<a class="btn btn-outline-danger mb-3" data-bs-toggle="collapse" href="#formulario_mensaje" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
										Cancelar
									</a>
								</div>
							</div>
						</form>
				</div>
			</div>

			<?php $mensajes = $this->GeneralModel->lista('tareas_mensajes','',['ID_TAREA'=>$tarea['ID_TAREA'],'ID_PADRE'=>'0'],'FECHA_REGISTRO DESC','',''); ?>

			<div class="row">

				<?php foreach($mensajes as $mensaje){ ?>

					<div class="col-12 mb-3">
						<div class="row">
							<div class="foto-perfil-comentario col-1 pr-0">
								<a href="<?php echo base_url('index.php/lista_usuarios/detalles?id='.$mensaje->ID_USUARIO); ?>" style="display:block;">
									<img src="<?php echo base_url('contenido/img/usuarios/'.$array_usuarios[$mensaje->ID_USUARIO]['IMAGEN']); ?>" title="<?php echo $array_usuarios[$mensaje->ID_USUARIO]['NOMBRE']; ?>" width="100%" class="rounded-circle border border-secondary" alt="">
								</a>
							</div>
							<div class="col-11 pl-0">
								<div class="comentario p-3" style="border-radius: 0 20px 20px 20px;">
									<h5><?php echo $array_usuarios[$mensaje->ID_USUARIO]['NOMBRE']; ?>:</h5>
									<?php echo $mensaje->MENSAJE; ?>
									<?php $respuestas = $this->GeneralModel->lista('tareas_mensajes','',['ID_TAREA'=>$tarea['ID_TAREA'],'ID_PADRE'=>$mensaje->ID],'FECHA_REGISTRO DESC','',''); ?>
									<?php foreach($respuestas as $respuesta){ ?>
										<div class='bg-light p-3 m-3'><b><?php echo $array_usuarios[$respuesta->ID_USUARIO]['NOMBRE']; ?>:</b> <?php echo $respuesta->MENSAJE; ?> </div>
										<?php } ?>
									<?php if($mensaje->TIPO=='reasignacion'){ ?>
										<hr>
										<?php if(!empty($mensaje->ASIGNACIONES)){ ?>
											<?php $lista_asignados = explode(', ',$mensaje->ASIGNACIONES); ?>
											<ul class="list-inline">
												<li class="list-inline-item">Reasignado a:</li>
												<?php foreach ($lista_asignados as $asignacion) { ?>
													<?php if(!empty($asignacion)&&!empty($array_usuarios[$asignacion]['NOMBRE'])){ ?>
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
										<a class="btn btn-sm btn-outline-success" data-bs-toggle="collapse" href="#formulario_responder_<?php echo $mensaje->ID; ?>" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
										<i class="ml-5 fa-solid fa-reply"></i> responder
										</a>
										<?php if($mensaje->ID_USUARIO==$_SESSION['usuario']['id']){ ?>
										<a class="btn btn-sm btn-secondary-link" data-bs-toggle="collapse" href="#formulario_mensaje_<?php echo $mensaje->ID; ?>" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
										<i class="ml-5 fa fa-pencil"></i> Editar comentario
										</a> | 
										<button data-enlace="<?php echo base_url('index.php/tareas/borrar_mensaje?id='.$mensaje->ID); ?>" class="ml-2 btn btn-outline-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar mensaje</button>
											|
										<?php } ?>
										
										<span class="px-3"><?php echo fechas_es($mensaje->FECHA_REGISTRO).' </span><span> '.date('g:i a', strtotime($mensaje->FECHA_REGISTRO)); ?></span>
										
										<div class="collapse p-4 bg-light text-start" id='formulario_responder_<?php echo $mensaje->ID; ?>'>
												<form class="" action="<?php echo base_url('index.php/tareas/agregar_mensaje'); ?>" method="post">
													<input type="hidden" name="Padre" value="<?php echo $mensaje->ID; ?>">
													<input type="hidden" name="IdTarea" value="<?php echo $tarea['ID_TAREA']; ?>">
													<input type="hidden" name="IdUsuario" value="<?php echo $_SESSION['usuario']['id']; ?>">
													<input type="hidden" name="EstadoActual" value="<?php echo $tarea['ESTADO']; ?>">
													<input type="hidden" name="Enlace" value="">
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<label for="Mensaje">Respuesta</label>
																<textarea name="Mensaje" class="form-control TextEditorXtraSmall"></textarea>
															</div>
															<?php
																		$usuarios = $this->GeneralModel->lista('usuarios','',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','');
																		$id_asignados = $this->GeneralModel->lista_agrupada('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA']],'','ID_USUARIO');
																		$usuarios_asignados = array();
																		foreach($id_asignados as $id_asig){
																			$usuarios_asignados[] =$id_asig->ID_USUARIO;
																		}
																?>
																
																<input type="hidden" name="asignaciones_actuales" value="<?php echo implode(', ', $usuarios_asignados); ?>">
																<input type="hidden" name="EstadoTarea" value="<?php echo $tarea['ESTADO']; ?>">
															<button type="submit" class="btn btn-primary btn-actualizar my-3">Actualizar</button>
															<a class="btn btn-sm btn-outline-danger" data-bs-toggle="collapse" href="#formulario_mensaje_<?php echo $mensaje->ID; ?>" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
																 Cancelar
																</a>
														</div>
													</div>
												</form>
										</div>

										<div class="collapse" id='formulario_mensaje_<?php echo $mensaje->ID; ?>'>
												<form class="" action="<?php echo base_url('index.php/tareas/actualizar_mensaje'); ?>" method="post">
													<input type="hidden" name="Identificador" value="<?php echo $mensaje->ID; ?>">
													<input type="hidden" name="IdTarea" value="<?php echo $tarea['ID_TAREA']; ?>">
													<input type="hidden" name="IdUsuario" value="<?php echo $_SESSION['usuario']['id']; ?>">
													<input type="hidden" name="EstadoActual" value="<?php echo $tarea['ESTADO']; ?>">
													<input type="hidden" name="Enlace" value="">
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<label for="Mensaje">Comentario</label>
																<textarea name="Mensaje" class="TextEditorSmall"><?php echo $mensaje->MENSAJE; ?></textarea>
															</div>
															<?php
																		$usuarios = $this->GeneralModel->lista('usuarios','',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','');
																		$id_asignados = $this->GeneralModel->lista_agrupada('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA']],'','ID_USUARIO');
																		$usuarios_asignados = array();
																		foreach($id_asignados as $id_asig){
																			$usuarios_asignados[] =$id_asig->ID_USUARIO;
																		}
																?>
																
																<input type="hidden" name="asignaciones_actuales" value="<?php echo implode(', ', $usuarios_asignados); ?>">
																<input type="hidden" name="EstadoTarea" value="<?php echo $tarea['ESTADO']; ?>">
															<button type="submit" class="btn btn-primary btn-actualizar my-3">Actualizar</button>
															<a class="btn btn-sm btn-outline-danger" data-bs-toggle="collapse" href="#formulario_mensaje_<?php echo $mensaje->ID; ?>" role="button" aria-expanded="false" aria-controls="formulario_mensaje">
																 Cancelar
																</a>
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
	<div class="col-4">
		<?php
		if(!empty($tarea['ID_PROYECTO'])){
			$equipos_proyecto = $this->GeneralModel->lista('equipos_proyectos','',['ID_PROYECTO'=>$tarea['ID_PROYECTO']],'','','');
			$array_equipos = array();
			foreach($equipos_proyecto as $eq_pro){
				$array_equipos[] = $eq_pro->ID_EQUIPO;
			};
			if(!empty($array_equipos)){
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
			
		}else{
			$usuarios_disponibles = null;
		}
		
		$detalles_proceso_actual = $this->GeneralModel->detalles('roles_historial',['ID'=>$tarea['ID_PROCESO']]);
		?>															
		<div class="card linea-tiempo">
			<div class="card-header" title="<?php echo $tarea['ID_PROCESO']; ?>">Línea de tiempo</div>
			<div class="card-body ps-5">
				
				<?php
					$procesos_post = $this->GeneralModel->lista('roles_historial','',['ID_TAREA'=>$tarea['ID_TAREA']],'ORDEN ASC','','');
					$array_procesos = array();
					$index_proceso = 0;
				?>
				<ul class="list-group ui-sortable linea-tiempo" id="myTab" role="tablist" data-tabla="roles_historial" data-columna="ID">
				    <li class="list-group-item lt-proceso lt-proceso-completo text-muted">
						<small>Inicio de la tarea: <?php if ($tarea['FECHA_INICIO'] != null) {
							echo fechas_es($tarea['FECHA_INICIO']);
						} else {
							echo 'N/A';
						} ?>
						</small>
					</li>
					<?php $i=1; $fecha_anterior = ''; foreach($procesos_post as $proceso){ ?>
						<?php $array_procesos[$index_proceso] = $proceso->ID; $index_proceso ++; ?>
						<?php 
							$detalle_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$proceso->ID_USUARIO]);
							$detalle_usuario_b = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$proceso->ID_USUARIO_B]);
							$detalle_usuario_c = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$proceso->ID_USUARIO_C]);
						?>
						<li class="list-group-item lt-proceso <?php if($proceso->ESTADO=='completo'){ echo 'lt-proceso-completo'; } ?> p-2 <?php if($proceso->ID==$tarea['ID_PROCESO']){ echo 'bg-info lt-proceso-actual'; } ?> ui-sortable-handle" id="item-<?php echo $proceso->ID; ?>" role="presentation" title="<?php echo $detalle_usuario['USUARIO_NOMBRE'].' '.$detalle_usuario['USUARIO_APELLIDOS']; ?>">
						<div class="d-flex w-100 align-items-start flex-column">
							
							<small
								class="lt-fecha mb-2 <?php if(!empty($fecha_anterior)&&$fecha_anterior>$proceso->FECHA){ echo 'text-danger'; } ?>"
								title="<?php echo $proceso->DIAS_DESPUES_ANTERIOR; ?> días después del anterior">
								Fecha límite: <?php echo fechas_es(date('Y-m-d', strtotime($proceso->FECHA))); ?>
							</small>
						    <strong class="mb-auto pb-2"><h5 class="fw-bold" title="<?php echo $proceso->ID; ?>">#<?php echo $i; ?> <?php echo $proceso->ETIQUETA; ?></h5></strong>
							<div class="d-flex w-100 justify-content-start align-items-center">
							<div class="w-100 mb-3">
							<img
							src="<?php echo base_url('contenido/img/usuarios/'.$detalle_usuario['IMAGEN']); ?>"
							title="<?php echo $detalle_usuario['USUARIO_NOMBRE']; ?>"
							width="25px"
							class="rounded-circle border border-secondary burbuja-sm me-2"
							alt=""
							role="button"
							data-bs-toggle="dropdown"
							aria-expanded="false">
							
							<span class="me-auto"><?php echo $detalle_usuario['USUARIO_NOMBRE']; ?> </span>
							<hr>
							<?php if(!empty($detalle_usuario_b)){ ?>
							<img
							src="<?php echo base_url('contenido/img/usuarios/'.$detalle_usuario_b['IMAGEN']); ?>"
							title="<?php echo $detalle_usuario_b['USUARIO_NOMBRE']; ?>"
							width="25px"
							class="rounded-circle border border-secondary burbuja-sm me-2"
							alt=""
							role="button"
							data-bs-toggle="dropdown"
							aria-expanded="false">
							
							<span class="me-auto"><?php echo $detalle_usuario_b['USUARIO_NOMBRE']; ?> </span>
							<?php } ?>

							<?php if(!empty($detalle_usuario_c)){ ?>
							<hr><img
							src="<?php echo base_url('contenido/img/usuarios/'.$detalle_usuario_c['IMAGEN']); ?>"
							title="<?php echo $detalle_usuario_c['USUARIO_NOMBRE']; ?>"
							width="25px"
							class="rounded-circle border border-secondary burbuja-sm me-2"
							alt=""
							role="button"
							data-bs-toggle="dropdown"
							aria-expanded="false">
							
							<span class="me-auto"><?php echo $detalle_usuario_c['USUARIO_NOMBRE']; ?> </span>
							<?php } ?>
							</div>
							<button class="btn btn-sm btn-outline-secondary border-0 me-2" type="button" data-bs-toggle="collapse" data-bs-target="#form-proceso-<?php echo $proceso->ID; ?>" aria-expanded="false" aria-controls=""><i class="fas fa-pencil-alt"></i></button>
							<a class="btn btn-sm btn-outline-secondary border-0" href="<?php echo base_url('index.php/tareas/borrar_rol?id='.$proceso->ID); ?>"><i class="fas fa-trash"></i></a>
						</div>
						<?php $validaciones = $this->GeneralModel->lista('validacion_revisiones','',['ID_PROCESO'=>$proceso->ID],'','',''); ?>
						<?php if(!empty($proceso->ID_LISTA)){ ?>
							<button class="btn btn-success w-100" data-bs-toggle="modal" data-bs-target="#validacionesProceso<?php echo $proceso->ID; ?>">Validaciones del proceso</button>
						<?php } ?>
						<div>
							<!-- Modal -->
								<div class="modal fade" id="validacionesProceso<?php echo $proceso->ID; ?>" tabindex="-1" aria-labelledby="validacionesProceso<?php echo $proceso->ID; ?>Label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
										<div class="modal-body">
											<h3>Validaciones del proceso</h3>
											<table class="table table-stripped">
												<thead>
													<tr>
														<th>#</th>
														<th>Fecha</th>
														<th>Lista</th>
														<th>Avance</th>
														<th>Controles</th>
													</tr>
												</thead>
												<tbody>
													<?php $e=1; foreach($validaciones as $validacion){ ?>
														<?php $detalles_revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_REVISION'=>$validacion->ID_REVISION]); ?>
														<?php $detalles_lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$detalles_revision['ID_LISTA']]); ?>
														<?php $detalles_responsable = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$detalles_revision['ID_RESPONSABLE']]); ?>
														<tr>
														<td><?php echo $e; ?></td>
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
																<p><?php echo $detalles_revision['TOTAL_VERIFICADOS']; ?>/<?php echo $detalles_revision['TOTAL_PARAMETROS']; ?> (<?php echo $porcentaje_avance; ?>%)</p>
															</td>
															<td>
																<div class="btn-group justify-end">
																	<?php if($detalles_revision['ESTADO']=='activo'){ ?>
																	<a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$tarea['ID_TAREA']); ?>" class="btn btn-success text-white" title="Formulario"> <i class="fas fa-clipboard-check"></i> Formulario</a>
																	<?php } ?>
																	<?php if($detalles_revision['ESTADO']=='finalizado'){ ?>
																	<a href="<?php echo base_url('index.php/tareas/validacion_reporte?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$tarea['ID_TAREA']); ?>" class="btn btn-primary text-white" title="Reporte"><i class="fas fa-chart-bar"></i> Reporte</a>
																	<button data-enlace="<?php echo base_url('index.php/proyectos/copiar_proceso_validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&id_tarea='.$detalles_revision['ID_TAREA'].'&id_proceso='.$proceso->ID); ?>" class="ml-2 btn btn-warning btn-sm borrar_entrada"> <i class="fa fa-copy"></i> Revalidar</a>
																	<?php } ?>
																	<?php if($_SESSION['usuario']['tipo_usuario']='administrador'){ ?>
																	<button data-enlace="<?php echo base_url('index.php/tareas/borrar_validacion?id='.$tarea['ID_TAREA'].'&id_revision='.$detalles_revision['ID_REVISION']); ?>" class="ml-2 btn btn-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar</a>
																	<?php } ?>
																</div>
															</td>
														</tr>
													<?php $e++; }//bucle revisiones ?>
												</tbody>
											</table>
										</div>
										</div>
									</div>
								</div>
													
						</div>
						<div class="w-100">
						
						<div class="m-3 p-3 collapse" id="form-proceso-<?php echo $proceso->ID; ?>">
							<form action="<?php echo base_url('index.php/tareas/actualizar_rol'); ?>" method="post" enctype="multipart/multipart/form-data">
							<input type="hidden" name="Identificador" value="<?php echo $proceso->ID; ?>">
							<input type="hidden" name="IdTarea" value="<?php echo $proceso->ID_TAREA; ?>">
							<input type="hidden" name="Proceso" value="<?php echo $proceso->PROCESO; ?>">
								<div class="form-group">
									<label for="Etiqueta">Etiqueta</label>
									<input type="text" required class="form-control" name="Etiqueta" placeholder='Nombre del proceso' value="<?php echo $proceso->ETIQUETA; ?>">
								</div>
								
								<h4>Usuarios asignados</h4>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="IdUsuarioPro">Usuario</label>
											<select name="IdUsuario" id="IdUsuarioPro" class="form-control">
												<?php foreach($usuarios_asignados as $usuario_disp){ ?>
												<?php $detalles_usuario_asignado = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario_disp]); ?>
												<option value="<?php echo $detalles_usuario_asignado['ID_USUARIO']; ?>" <?php if($proceso->ID_USUARIO==$detalles_usuario_asignado['ID_USUARIO']){ echo 'selected'; } ?>><?php echo $detalles_usuario_asignado['USUARIO_NOMBRE'].' '.$detalles_usuario_asignado['USUARIO_APELLIDOS']; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="col-6">
										<div id="Listas<?php echo $proceso->ID; ?>" class="">
											<div class="form-group">
												<label for="IdLista">Lista de validación </label>
												<select name="IdLista" class="form-control">
													<option value="">Ningúna</option>
													<?php foreach($listas_validacion as $lista){ ?>
													<option value="<?php echo $lista->ID_LISTA; ?>" <?php if($lista->ID_LISTA==$proceso->ID_LISTA){ echo 'selected'; } ?>><?php echo $lista->TITULO; ?></option>
													<?php }  ?>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="IdUsuarioPro"> Apoyo 1</label>
											<select name="IdUsuarioB" id="IdUsuarioPro" class="form-control">
												<option value="">Nadie</option>
												<?php foreach($usuarios_asignados as $usuario_disp){ ?>
												<?php $detalles_usuario_asignado = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario_disp]); ?>
												<option value="<?php echo $detalles_usuario_asignado['ID_USUARIO']; ?>" <?php if($proceso->ID_USUARIO_B==$detalles_usuario_asignado['ID_USUARIO']){ echo 'selected'; } ?>><?php echo $detalles_usuario_asignado['USUARIO_NOMBRE'].' '.$detalles_usuario_asignado['USUARIO_APELLIDOS']; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="col-6">
										<div id="Listas<?php echo $proceso->ID; ?>B" class="">
											<div class="form-group">
												<label for="IdListaB">Lista de validación</label>
												<select name="IdListaB" class="form-control">
													<option value="">Ningúna</option>
													<?php foreach($listas_validacion as $lista){ ?>
													<option value="<?php echo $lista->ID_LISTA; ?>" ><?php echo $lista->TITULO; ?></option>
													<?php }  ?>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									
									<div class="col-6">
										<div class="form-group">
											<label for="IdUsuarioPro">Apoyo 2</label>
											<select name="IdUsuarioC" id="IdUsuarioPro" class="form-control">
												<option value="">Nadie</option>
												<?php foreach($usuarios_asignados as $usuario_disp){ ?>
												<?php $detalles_usuario_asignado = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario_disp]); ?>
												<option value="<?php echo $detalles_usuario_asignado['ID_USUARIO']; ?>" <?php if($proceso->ID_USUARIO_C==$detalles_usuario_asignado['ID_USUARIO']){ echo 'selected'; } ?>><?php echo $detalles_usuario_asignado['USUARIO_NOMBRE'].' '.$detalles_usuario_asignado['USUARIO_APELLIDOS']; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="col-6">
										<div id="Listas<?php echo $proceso->ID; ?>C" class="">
											<div class="form-group">
												<label for="IdListaC">Lista de validación</label>
												<select name="IdListaC" class="form-control">
													<option value="">Ningúna</option>
													<?php foreach($listas_validacion as $lista){ ?>
													<option value="<?php echo $lista->ID_LISTA; ?>" ><?php echo $lista->TITULO; ?></option>
													<?php }  ?>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="Fecha">Fecha límite de entrega</label>
									<input type="date" required class="form-control" name="Fecha" placeholder='Fecha límite' value="<?php echo date('Y-m-d', strtotime($proceso->FECHA)); ?>">
								</div>
								<div class="form-check my-2">
								<input class="form-check-input" type="checkbox" id="recalcularFechas" name="recalcularFechas" value="si">
								<label class="form-check-label">Recalcular fechas siguientes</label>
								<hr>
								<div class="form-group">
									<label for="Proceso">Este proceso es parte de</label>
									<select name="Proceso" id="Proceso" class="form-control">
										<option value="preproduccion" <?php if($proceso->PROCESO=='preproduccion'){ echo 'selected'; } ?>>Preparación (pre-producción)</option>
										<option value="produccion"  <?php if($proceso->PROCESO=='produccion'){ echo 'selected'; } ?>>Producción (producción)</option>
										<option value="postproduccion" <?php if($proceso->PROCESO=='postproduccion'){ echo 'selected'; } ?>>Revisión (post-producción)</option>
									</select>
								</div>
								
								
								<hr>
								<button type="submit" class="btn btn-primary">Actualizar proceso</button>
							</form>
						</div>	
					</li>
					
					<?php $i++; $fecha_anterior = $proceso->FECHA; } ?>
				</ul>
				<?php
					
						$indice_actual = array_search($tarea['ID_PROCESO'], $array_procesos);
						if($indice_actual==0){
							$proceso_anterior = null;
						}else{
							$proceso_anterior = $array_procesos[$indice_actual-1];
						}
						
						if(isset($array_procesos[$indice_actual+1])){
							$proceso_siguiente = $array_procesos[$indice_actual+1];
						}else{
							$proceso_siguiente = null;
						}
					?>
				<button class="btn btn-sm btn-outline-success mt-3 <?php if($tarea['ESTADO']=='completo'){ echo 'd-none';} ?>" type="button" data-bs-toggle="collapse" data-bs-target="#form-postproduccion" aria-expanded="false" aria-controls="collapseWidthExample">
					+ Agregar y asignar proceso
				</button>
				<a class="btn btn-sm btn-outline-warning mt-3 <?php if($tarea['ESTADO']=='en desarrollo'){ echo 'd-none';} ?>" href="<?php echo base_url('index.php/tareas/reactivar_tarea?id='.$tarea['ID_TAREA']); ?>">
					Reactivar actividad
				</a>
				<div class="m-3 p-3 collapse" id="form-postproduccion">
					<form action="<?php echo base_url('index.php/tareas/asignar_rol'); ?>" method="post" enctype="multipart/multipart/form-data">
					<input type="hidden" name="IdTarea" value="<?php echo $tarea['ID_TAREA']; ?>">
					<input type="hidden" name="Proceso" value="postproduccion">
						<div class="form-group">
							<label for="Etiqueta">Etiqueta</label>
							<input type="text" required class="form-control" name="Etiqueta" placeholder='Nombre del proceso'>
						</div>
						<h4>Usuarios asignados</h4>
						<div class="row">
							<div class="col-6">
							<div class="form-group">
							<label for="IdUsuarioPro">Usuario</label>
							<select name="IdUsuario" id="IdUsuarioPro" class="form-control">
								<?php foreach($usuarios_asignados as $usuario_disp){ ?>
								<?php $detalles_usuario_asignado = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario_disp]); ?>
								<option value="<?php echo $detalles_usuario_asignado['ID_USUARIO']; ?>"><?php echo $detalles_usuario_asignado['USUARIO_NOMBRE'].' '.$detalles_usuario_asignado['USUARIO_APELLIDOS']; ?></option>
								<?php } ?>
							</select>
						</div>
							</div>
							<div class="col-6">
								<div id="Listas<?php echo $proceso->ID; ?>" class="">
									<div class="form-group">
										<label for="IdLista">Lista de validación (para revisión)</label>
										<select name="IdLista" class="form-control">
											<option value="">Ningúna</option>
											<?php foreach($listas_validacion as $lista){ ?>
											<option value="<?php echo $lista->ID_LISTA; ?>" ><?php echo $lista->TITULO; ?></option>
											<?php }  ?>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
							<div class="form-group">
									<label for="IdUsuarioPro"> Apoyo 1</label>
									<select name="IdUsuarioB" id="IdUsuarioProB" class="form-control">
										<option value="">Nadie</option>
										<?php foreach($usuarios_asignados as $usuario_disp){ ?>
										<?php $detalles_usuario_asignado = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario_disp]); ?>
										<option value="<?php echo $detalles_usuario_asignado['ID_USUARIO']; ?>"><?php echo $detalles_usuario_asignado['USUARIO_NOMBRE'].' '.$detalles_usuario_asignado['USUARIO_APELLIDOS']; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="col-6">
								<div id="Listas<?php echo $proceso->ID; ?>B" class="">
									<div class="form-group">
										<label for="IdListaB">Lista de validación (para revisión)</label>
										<select name="IdListaB" class="form-control">
											<option value="">Ningúna</option>
											<?php foreach($listas_validacion as $lista){ ?>
											<option value="<?php echo $lista->ID_LISTA; ?>" ><?php echo $lista->TITULO; ?></option>
											<?php }  ?>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label for="IdUsuarioPro">Apoyo 2</label>
									<select name="IdUsuarioC" id="IdUsuarioProC" class="form-control">
										<option value="">Nadie</option>
										<?php foreach($usuarios_asignados as $usuario_disp){ ?>
										<?php $detalles_usuario_asignado = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario_disp]); ?>
										<option value="<?php echo $detalles_usuario_asignado['ID_USUARIO']; ?>" ><?php echo $detalles_usuario_asignado['USUARIO_NOMBRE'].' '.$detalles_usuario_asignado['USUARIO_APELLIDOS']; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="col-6">
								<div id="Listas<?php echo $proceso->ID; ?>C" class="">
									<div class="form-group">
										<label for="IdListaC">Lista de validación (para revisión)</label>
										<select name="IdListaC" class="form-control">
											<option value="">Ningúna</option>
											<?php foreach($listas_validacion as $lista){ ?>
											<option value="<?php echo $lista->ID_LISTA; ?>" ><?php echo $lista->TITULO; ?></option>
											<?php }  ?>
										</select>
									</div>
								</div>
							</div>
							
						</div>
						<div class="form-group">
							<label for="Fecha">Fecha límite de entrega</label>
							<input type="date" required class="form-control" name="Fecha" placeholder='Fecha límite'>
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
						<button type="submit" class="btn btn-primary">Agregar proceso</button>
					</form>
				</div>
				
				<hr>
				<?php
					$ocultar_controles_linea_de_tiempo = false;
					if(empty($detalles_proceso_actual['ID_USUARIO'])){ $ocultar_controles_linea_de_tiempo = true; }
					if($detalles_proceso_actual['ID_USUARIO']!=$_SESSION['usuario']['id']){$ocultar_controles_linea_de_tiempo = true;}
					if($detalles_proceso_actual['FECHA']<date('Y-m-d H:i:s')){
						$ocultar_controles_linea_de_tiempo = false;
					}
				?>
				
				<div class="row <?php if($ocultar_controles_linea_de_tiempo){ echo 'd-none'; } ?>">
					<?php if($detalles_proceso_actual['FECHA']<date('Y-m-d')){ ?>
					<div class="col-12">
						<p class="text-info text-center"> <i class="fa fa-info-circle"></i><br> El proceso actual presenta un atraso por lo cual se han activado los controles para continuar con el proceso.</p>
					</div>
					<?php } ?>
					<div class="col-6">
						<?php
							if(empty($detalles_proceso_actual)){
								$proceso_anterior = null;
							}
							?>
						<?php if(!empty($proceso_anterior)){ ?>
						<form action="<?php echo base_url('index.php/tareas/completar_rol'); ?>" method="post">
							<input type="hidden" name="IdProcesoActual" value="<?php echo $tarea['ID_PROCESO']; ?>">
							<input type="hidden" name="IdProcesoSiguiente" value="<?php echo $proceso_anterior; ?>">
							<hr>
							<button class="btn btn-success w-100"><i class="fa fa-chevron-left"></i> Retroceder línea del tiempo</button>
						</form>
						<?php } ?>
					</div>
					<div class="col-6 <?php if($tarea['ESTADO']=='completo'){ echo 'd-none';} ?>">
						<?php
						if(empty($detalles_proceso_actual)){
							$proceso_siguiente = null;
						}
						 ?>
						
						<?php if(!empty($proceso_siguiente)){ ?>
						<form action="<?php echo base_url('index.php/tareas/completar_rol'); ?>" method="post">
							<input type="hidden" name="IdProcesoActual" value="<?php echo $tarea['ID_PROCESO']; ?>">
							<input type="hidden" name="IdProcesoSiguiente" value="<?php echo $proceso_siguiente; ?>">
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
				<?php if(empty($detalles_proceso_actual)&&$tarea['ESTADO']!='completo'){  ?>
				<div class="my-3">
					<div class="alert alert-danger text-center">
						<h5>¡Oh oh!, parece que ocurre un error con la línea del tiempo <a href="#" class="btn btn-link w-100" data-bs-toggle="modal" data-bs-target="#formCompletar">
					Click aquí para reparar
				</a></h5>
					</div>
					
				</div>
				<?php } ?>
				<?php if($_SESSION['usuario']['tipo_usuario']='administrador'){  ?>
				<div class="my-3">
					<div class="alert alert-info text-center">
						<h6>Si eres un administrador <a href="#" class="btn btn-link w-100" data-bs-toggle="modal" data-bs-target="#formCompletar">
					Puedes reparar la línea del tiempo dando click aquí
				</a></h6>
					</div>
					
				</div>
				<?php } ?>
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
		<h3>Repara la línea de tiempo</h3>
		<p>Selecciona el paso donde debe estar la línea de tiempo</p>
        <form action="<?php echo base_url('index.php/tareas/completar_rol'); ?>" method="post">
			<input type="hidden" name="IdProcesoActual" value="<?php echo $tarea['ID_PROCESO']; ?>">
			<div class="form-group">
				<label for="IdProcesoSiguiente">Siguiente paso</label>
				<?php $e=1; $procesos_siguientes = $this->GeneralModel->lista('roles_historial','',['ID_TAREA'=>$tarea['ID_TAREA']],'ORDEN ASC','',''); ?>
				<select name="IdProcesoSiguiente" id="IdProcesoSiguiente" class="form-control">
					<?php foreach($procesos_siguientes as $proceso){ ?>
					<option value="<?php echo $proceso->ID; ?>"><?php echo '#'.$e.' - '.$proceso->ETIQUETA; ?></option>
					<?php $e++; } ?>
				</select>
			</div>
			<hr>
			<button class="btn btn-success">Reparar línea del tiempo</button>
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
												<select name="IdLista" class="form-control">
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
									<th>#</th>
									<th>Proceso</th>
									<th>Fecha</th>
									<th>Lista</th>
									<th>Avance</th>
									<th>Controles</th>
								</tr>
							</thead>
							<tbody>
								<?php $i=1; foreach($respuestas_agrupadas as $respuesta_agru){ ?>
									<?php $detalles_revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_REVISION'=>$respuesta_agru->ID_REVISION]); ?>
									<?php $detalles_lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$detalles_revision['ID_LISTA']]); ?>
									<?php $detalles_responsable = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$detalles_revision['ID_RESPONSABLE']]); ?>
									<tr>
										<td><?php echo $i; ?></td>
										<td><?php echo $detalles_revision['ID_PROCESO']; ?></td>
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
											<p><?php echo $detalles_revision['TOTAL_VERIFICADOS']; ?>/<?php echo $detalles_revision['TOTAL_PARAMETROS']; ?> (<?php echo $porcentaje_avance; ?>%)</p>
										</td>
										<td>
											<div class="btn-group justify-end">
												<?php if($detalles_revision['ESTADO']=='activo'){ ?>
												<a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$tarea['ID_TAREA']); ?>" class="btn btn-success text-white" title="Formulario"> <i class="fas fa-clipboard-check"></i> Formulario</a>
												<?php } ?>
												<?php if($detalles_revision['ESTADO']=='finalizado'){ ?>
												<a href="<?php echo base_url('index.php/tareas/validacion_reporte?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$tarea['ID_TAREA']); ?>" class="btn btn-primary text-white" title="Reporte"><i class="fas fa-chart-bar"></i> Reporte</a>
												<button data-enlace="<?php echo base_url('index.php/proyectos/copiar_validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&id_tarea='.$detalles_revision['ID_TAREA']); ?>" class="ml-2 btn btn-warning btn-sm borrar_entrada"> <i class="fa fa-copy"></i> Revalidar</a>
												<?php } ?>
												<?php if($_SESSION['usuario']['tipo_usuario']='administrador'){ ?>
												<button data-enlace="<?php echo base_url('index.php/tareas/borrar_validacion?id='.$tarea['ID_TAREA'].'&id_revision='.$detalles_revision['ID_REVISION']); ?>" class="ml-2 btn btn-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar</a>
												<?php } ?>
											</div>
										</td>
									</tr>
								<?php $i ++; }//bucle revisiones ?>
							</tbody>
						</table>
						<?php } ?>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
