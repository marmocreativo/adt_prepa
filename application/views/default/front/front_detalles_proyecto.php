<div class="estadisticas_generales mb-3">
	<h2>Tareas del proyecto</h2>
	<div class="row">
		<div class="col-4">
			Progreso
			<div class="progress mb-3">
			  <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
			</div>
			<ul class="list-group">
				<?php foreach($tareas as $tarea){ ?>
			  <li class="list-group-item">
			    <i class="fas fa-check-square text-success"></i>
			    <?php echo $tarea->TAREA_TITULO; ?>
			  </li>
			<?php } ?>
			</ul>
		</div>
		<div class="col-8">
			<div class="detalles_tarea">
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
			</div>
		</div>
	</div>
</div>
