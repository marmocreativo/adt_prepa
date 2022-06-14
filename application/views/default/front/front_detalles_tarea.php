<div class="estadisticas_generales mb-3">
	<?php if(!empty($tarea['ID_PROYECTO'])){ ?>
	<p> <a href="<?php echo base_url('proyectos/detalles?id='.$tarea['ID_PROYECTO']); ?>">Volver al proyecto</a> </p>
<?php } ?>
	<div class="p-2">
	<div class="row">
		<div class="col-12 col-md-4 mt-3">
			<div class="d-flex justify-content-between align-items-center">
				<h3><?php echo $tarea['TAREA_TITULO']; ?></h3>
				<div class="dropdown">
				  <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				    <i class="fas fa-ellipsis-v"></i>
				  </button>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				    <li><a class="dropdown-item" href="<?php echo base_url('tareas/actualizar?id='.$tarea['ID_TAREA']); ?>">Editar</a></li>
				  </ul>
				</div>
			</div>

			<table class="table table-sm">
				<tbody>
					<tr>
						<td><i class="fas fa-calendar-plus"></i></td>
						<td><?php echo $tarea['FECHA_INICIO'] ?></td>
					</tr>
					<tr>
						<td><i class="fas fa-stopwatch"></i></td>
						<td><?php echo $tarea['FECHA_FINAL'] ?></td>
					</tr>
				</tbody>
			</table>
			<p><?php echo $tarea['TAREA_DESCRIPCION']; ?></p>
			<hr>
			<?php if(!empty($tarea['ENLACE_EDITABLE'])){ ?>
			<p><a href="<?php echo $tarea['ENLACE_EDITABLE']; ?>" <i class="fas fa-pencil-alt"></i> Archivos Editables</a></p>
			<?php } ?>
			<?php if(!empty($tarea['ENLACE_ENTREGABLE'])){ ?>
			<p><a href="<?php echo $tarea['ENLACE_ENTREGABLE']; ?>" <i class="fas fa-pencil-alt"></i> Archivos Entregables</a></p>
			<?php } ?>
			<hr>
			<h4>Usuarios</h4>
			<?php $usuarios= $this->GeneralModel->lista('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA'],'ESTADO'=>'activo'],'','',''); ?>
			<?php foreach ($usuarios as $usuario) { ?>
				<?php $detalles_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario->ID_USUARIO]); ?>
				<img src="<?php echo base_url('contenido/img/usuarios/'.$detalles_usuario['IMAGEN']); ?>" alt="<?php echo $detalles_usuario['USUARIO_NOMBRE'].' '.$detalles_usuario['USUARIO_APELLIDOS']; ?>" width="50px" class="rounded-circle" alt="">
			<?php } ?>
		</div>
		<div class="col-12 col-md-8">
			<div class="detalles_tarea">
				Estos son los detalles de la tarea
			</div>
		</div>
	</div>
</div>
</div>
