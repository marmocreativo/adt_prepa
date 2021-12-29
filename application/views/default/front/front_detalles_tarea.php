<div class="estadisticas_generales mb-3">
	<h2>Detalles de la tarea</h2>
	<div class="p-2">
		<a href="<?php echo base_url('tareas/actualizar?id='.$tarea['ID_TAREA']); ?>" class="btn btn-warning"> <i class="fas fa-pencil-alt"></i> Editar tarea</a>

	<div class="row">
		<div class="col-4 mt-3">
			<h3><?php echo $tarea['TAREA_TITULO']; ?></h3>
			<p>Fecha Creación: <b>04/07/2021</b></p>
			<p>Fecha de Entrega: <b>04/07/2021</b></p>
			<p><?php echo $tarea['TAREA_DESCRIPCION']; ?></p>
			<hr>
			<h4>Usuarios</h4>
			<?php $usuarios= $this->GeneralModel->lista('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA'],'ESTADO'=>'activo'],'','',''); ?>
			<?php foreach ($usuarios as $usuario) { ?>
				<?php $detalles_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario->ID_USUARIO]); ?>
				<img src="<?php echo base_url('contenido/img/usuarios/'.$detalles_usuario['IMAGEN']); ?>" alt="<?php echo $detalles_usuario['USUARIO_NOMBRE'].' '.$detalles_usuario['USUARIO_APELLIDOS']; ?>" width="50px" class="rounded-circle" alt="">
			<?php } ?>
		</div>
		<div class="col-8">
			<div class="detalles_tarea">
			</div>
		</div>
	</div>
</div>
</div>
