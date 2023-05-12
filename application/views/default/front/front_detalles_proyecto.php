<?php
	$usuarios = $this->GeneralModel->lista_join('usuarios',['equipos_usuarios'=>'equipos_usuarios.ID_USUARIO = usuarios.ID_USUARIO'],'',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','usuarios.ID_USUARIO');
?>
<div class="row ">
	<div class="col-12 col-md-4">
		<div class="proyecto <?php echo $modo; ?> border-0 border-bottom border-end">
			<h1 class="h4"><?php echo $proyecto['PROYECTO_NOMBRE'] ?></h1>
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
						$color_estado = 'light';
						$texto_estado = '';
						break;
				}
			?>
			<div class="alert bg-<?php echo $color_estado.' '.$texto_estado; ?> "><?php echo $proyecto['ESTADO'] ?></div>
			<?php echo $proyecto['PROYECTO_DESCRIPCION']; ?>
			<hr>
			<table class="table table-bordered">
				<tr>
					<td><i class="fas fa-calendar-plus"></i> Inicio</td>
					<td><?php if($proyecto['FECHA_INICIO'] != null ){ echo fechas_es($proyecto['FECHA_INICIO']); }else{ echo 'N/A'; } ?></td>
				</tr>
				<tr>
					<td><i class="fas fa-stopwatch"></i>Final</td>
					<td><?php if($proyecto['FECHA_FINAL'] != null ){ echo fechas_es($proyecto['FECHA_FINAL']); }else{ echo 'N/A'; } ?></td>
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
			<hr>
			<div class="py-3 border-top border-bottom border-success">
				<h4>Validación</h4>
				<?php if($proyecto['VALIDACION']=='no'){ ?>
				<p>Este proyecto no requiere validación</p>
				<?php }else{ ?>
					<?php $detalles_lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$proyecto['ID_LISTA']]); ?>
					<?php if(!empty($detalles_lista)){ ?>
					<p>Se usará la lista: <b><?php echo $detalles_lista['TITULO']; ?></b> para validar todas las tareas</p>
					<?php $revisiones_agrupadas = $this->GeneralModel->lista_agrupada('validacion_revisiones','',['ID_PROYECTO'=>$proyecto['ID_PROYECTO']],'','FECHA'); ?>
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
										<div class="btn-group">
											<a href="<?php echo base_url('index.php/proyectos/validacion_reporte?id='.$proyecto['ID_PROYECTO'].'&fecha_revision='.$revision->FECHA); ?>">ver reporte</a>
										</div>
									</td>
									<td>
										<div class="btn-group">
											<a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&fecha_revision='.$revision->FECHA); ?>">ver formulario</a>
										</div>
									</td>
								</tr>
							<?php }//bucle revisiones ?>
						</tbody>
					</table>
					<?php } ?>
					<div>
						<form action="<?php echo base_url('index.php/proyectos/crear_validacion'); ?>" method='post'>
							<input type="hidden" name='IdProyecto' value="<?php echo $proyecto['ID_PROYECTO']; ?>">
							<div class="row">
								<div class="col">
								<label for="IdResponsable">Responsable</label>
								</div>
								<div class="col">
									<div class="form-group">
										<select name="IdResponsable" class="form-control">
											<?php foreach($usuarios as $usuario){ ?>
											<option value="<?php echo $usuario->ID_USUARIO; ?>"><?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?></option>
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
			<hr>
			<a href="<?php echo base_url('index.php/proyectos/actualizar?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-link btn-block btn-sm"> <i class="fas fa-pencil-alt"></i> Editar</a>
			<button data-enlace="<?php echo base_url('index.php/proyectos/borrar?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-danger btn-block btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar</a>
		</div>
	</div>
	<div class="col-12 col-md-8">
		<div class="mb-3">
		<?php if($proyecto['ESTADO']!='terminado'){ ?>
			<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#NuevaTarea" title="Nueva tarea">
				<i class="fa fa-plus"></i> Nueva tarea
			</button>
		<?php } ?>
		</div>
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
				<form class="" action="<?php echo base_url('index.php/tareas/crear'); ?>" method="post">
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
								<label for="Estado">Estado</label>
								<select class="form-control" name="Estado">
									<option value="pendiente">Pendiente</option>
									<option value="en desarrollo">En Desarrollo</option>
								</select>
							</div>
						</div>
					</div>
					<div class="">
						
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
