<?php
	$equipos_proyecto = $this->GeneralModel->lista('equipos_proyectos','',['ID_PROYECTO'=>$proyecto['ID_PROYECTO']],'','','');
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
	$usuarios = $query->result();

	/* /CONSULTA PARA SOLO LOS USUARIOS EN LOS EQUIPOS */
?>
<div class="row ">
	<div class="col-12">
		<div class=" <?php echo $modo; ?>">
			<h2><b><?php echo $proyecto['PROYECTO_NOMBRE'] ?>
			<?php
				switch ($proyecto['ESTADO']) {
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
						$color_estado = 'primary';
						$texto_estado = 'text-white';
						break;
				}
			?>
			<span class="badge bg-<?php echo $color_estado.' '.$texto_estado; ?> "><?php echo $proyecto['ESTADO'] ?></span></b></h2>
			
			<div class="d-flex align-items-center border-bottom border-top p-2 bg-secondary bg-opacity-10">
			    <div class="p-2 pe-4 border-end">
				    <i class="fas fa-calendar mb-3 pe-2"></i>Duración</br>
					<b><span><?php if($proyecto['FECHA_INICIO'] != null ){ echo fechas_es($proyecto['FECHA_INICIO']); }else{ echo 'N/A'; } ?></span> -
					<span><?php if($proyecto['FECHA_FINAL'] != null ){ echo fechas_es($proyecto['FECHA_FINAL']); }else{ echo 'N/A'; } ?></span></b>
				</div>
			    <div class="py-2 px-4 border-end">
				    <i class="fa-solid fa-bars-progress mb-3 pe-2"></i></i>Estado</br>
					<b><span><?php echo $proyecto['ESTADO']; ?></span></b>
				</div>
			    <div class="me-auto py-2 px-4 border-end">
				    <i class="fa-solid fa-folder mb-2 pe-2"></i></i>Carpetas y documentos</br>
					<div class="btn-group"> 
					    <?php if(!empty($proyecto['ENLACE_EDITABLE'])){ ?>
						    <a class="enlace_carpetas btn btn-outline-secondary border-secondary-subtle" href="<?php echo $proyecto['ENLACE_EDITABLE']; ?>" target="_blank"> <i class="fa fa-tools"></i> Editables </a>
				        <?php } ?>
					    <?php if(!empty($proyecto['ENLACE_ENTREGABLE'])){ ?>
						    <a class="enlace_carpetas btn btn-outline-secondary border-secondary-subtle" href="<?php echo $proyecto['ENLACE_ENTREGABLE']; ?>" target="_blank"><i class="fa fa-folder"></i> Entregables</a>
				        <?php } ?>
                    </div>
				</div>
                <div class="p-2">
				    <a href="<?php echo base_url('index.php/proyectos/actualizar?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-outline-secondary btn-sm "> <i class="fas fa-pencil-alt"></i></a>
				</div>
                <div class="p-2">
				    <button data-enlace="<?php echo base_url('index.php/proyectos/borrar?id='.$proyecto['ID_PROYECTO']); ?>" class="ml-2 btn btn-outline-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i></button>
				</div>
			    </div>
			</div>

			<div class="row py-3 border-bottom border-top">
			    <h5>Validaciones del proyecto</h5>
				<button type="button" class="ml-2 btn btn-info" data-bs-toggle="modal" data-bs-target="#ValidacionesCont" title="Validaciones"><i class="fa-solid fa-list-check"></i> Validaciones del proyecto</button>
			</div>

			<div class="row pb-2 my-4 descripcion">
				<div class="col-12"><?php echo $proyecto['PROYECTO_DESCRIPCION']; ?></div>
			</div>
		</div>
	</div>
	<div class="row">
	    <div class="col-12 d-flex justify-content-between mt-4 mb-2">
			<h5>Tareas</h5>
		    <?php if($proyecto['ESTADO']!='terminado'){ ?>
			<button type="button" class="btn btn-sm px-4 rounded-pill btn-outline-primary" data-bs-toggle="modal" data-bs-target="#NuevaTarea" title="Nueva tarea">
				<i class="fa fa-plus"></i> Nueva tarea
			</button>
		    <?php } ?>
	    </div>
		<div class="col-12">
		    <?php $this->load->view('default'.$dispositivo.'/front/widgets/lista_tareas', $tareas); ?>
		</div>
	</div>
</div>
<?php if($proyecto['ESTADO']!='terminado'){ ?>
<button type="button" class="btn btn-success btn-circulo-flotante" data-bs-toggle="modal" data-bs-target="#NuevaTarea" title="Nueva tarea">
	<i class="fa fa-plus"></i>
</button>
<?php } ?>

<!-- Modal Validaciones-->
<div class="modal fade" id="ValidacionesCont" tabindex="-1" aria-labelledby="ValidacionesLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content <?php echo $modo; ?>">
			<div class="modal-header">
				<h5 class="modal-title" id="NuevaTareaLabel">Validaciones</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="py-3 border-bottom">
					<?php if($proyecto['VALIDACION']=='no'){ ?>
					<p>Este proyecto no requiere validación</p>
					<?php }else{ ?>
						<?php $detalles_lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$proyecto['ID_LISTA']]); ?>
						<div class="border-dotted">
							<form action="<?php echo base_url('index.php/proyectos/crear_validacion'); ?>" method='post'>
								<input type="hidden" name='IdProyecto' value="<?php echo $proyecto['ID_PROYECTO']; ?>">
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
												<option value="<?php echo $usuario->ID_USUARIO; ?>"><?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?></option>
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
						
						<?php $revisiones_agrupadas = $this->GeneralModel->lista('validacion_revisiones','',['ID_PROYECTO'=>$proyecto['ID_PROYECTO']],'FECHA DESC','',''); ?>
						<?php if(!empty($revisiones_agrupadas)){ ?>
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
								<?php foreach($revisiones_agrupadas as $revision){ ?>
									<?php $detalles_lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$revision->ID_LISTA]); ?>
									<?php $detalles_responsable = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$revision->ID_RESPONSABLE]); ?>
									<tr>
										<td><?php echo date('Y-m-d', strtotime($revision->FECHA)); ?></td>
										<td>
											<?php echo $detalles_lista['TITULO']; ?><br>
											<b><?php echo $detalles_responsable['USUARIO_NOMBRE'].' '.$detalles_responsable['USUARIO_APELLIDOS']; ?></b>
										</td>
										<td>
											<?php
											if($revision->TOTAL_PARAMETROS==0){
												$porcentaje_avance = 0;
											}else{
												$porcentaje_avance = round(($revision->TOTAL_VERIFICADOS*100)/$revision->TOTAL_PARAMETROS , 2);
											}
												
											?>
											<div class="progress" role="progressbar" aria-label="Progreso" aria-valuenow="<?php echo $porcentaje_avance; ?>" aria-valuemin="0" aria-valuemax="100">
											<div class="progress-bar" style="width: <?php echo $porcentaje_avance; ?>%"></div>
											</div>
										</td>
										<td>
											<div class="btn-group justify-end">
												<?php if($revision->ESTADO=='activo'){ ?>
												<a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$revision->ID_REVISION.'&fecha_revision='.$revision->FECHA); ?>" class="btn btn-success text-white" title="Formulario"> <i class="fas fa-clipboard-check"></i> Formulario</a>
												<button data-enlace="<?php echo base_url('index.php/proyectos/borrar_validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$revision->ID_REVISION); ?>" class="ml-2 btn btn-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar</a>
												<?php } ?>
												<?php if($revision->ESTADO=='finalizado'){ ?>
												<a href="<?php echo base_url('index.php/proyectos/validacion_reporte?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$revision->ID_REVISION.'&fecha_revision='.$revision->FECHA); ?>" class="btn btn-primary text-white" title="Reporte"><i class="fas fa-chart-bar"></i> Reporte</a>
												<button data-enlace="<?php echo base_url('index.php/proyectos/copiar_validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$revision->ID_REVISION); ?>" class="ml-2 btn btn-warning btn-sm borrar_entrada"> <i class="fa fa-copy"></i> Revalidar</a>
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

<!-- Modal -->
<div class="modal fade" id="NuevaTarea" tabindex="-1" aria-labelledby="NuevaTareaLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content <?php echo $modo; ?>">
			<div class="modal-header">
				<h5 class="modal-title" id="NuevaTareaLabel">Nueva Tarea</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="" action="<?php echo base_url('index.php/tareas/crear'); ?>" method="post">
					<input type="hidden" name="IdProyecto" value="<?php echo $proyecto['ID_PROYECTO']; ?>">
					<input type="hidden" name="Tipo" value="general">
				<div class="modal-body">
					<div class="row">
						<div class="col-8">
							<div class="form-group">
								<label for="TareaTitulo">Titulo</label>
								<input type="text" class="form-control" name="TareaTitulo" value="">
							</div>
							<div class="form-group">
								<label for="TareaDescripcion">Notas</label>
								<textarea name="TareaDescripcion" rows="3" class="form-control TextEditorSmall"></textarea>
							</div>
						</div>
						<div class="col-4">
							<div class="form-group">
								<label for="FechaInicio">Fecha Inicio</label>
								<input type="text" class="form-control datepicker" name="FechaInicio" value="<?php echo date('d-m-Y'); ?>">
								<div class="form-text">Puede ser una fecha anterior</div>
							</div>
							<div class="form-group">
								<label for="FechaFinal">Fecha Final </label>
								<input type="text" class="form-control datepicker" name="FechaFinal" value="">
								<div class="form-text">(Dead line) si la tarea se entrega después de esta fecha se considera atrasada</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="EnlaceEditables">Enlace Archivos Editables</label>
								<input type="text" class="form-control" name="EnlaceEditables" value="<?php echo $proyecto['ENLACE_EDITABLE'] ?>">
							</div>
							<div class="form-group">
								<label for="EnlaceEntregables">Enlace Archivos Entregables</label>
								<input type="text" class="form-control" name="EnlaceEntregables" value="<?php echo $proyecto['ENLACE_ENTREGABLE'] ?>">
							</div>
							<hr>
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
						<hr>		
						<h4>¿Quiénes participarán en esta tarea?:</h4>
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
