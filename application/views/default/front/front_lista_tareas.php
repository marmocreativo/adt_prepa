<div class="estadisticas_generales mb-3">
	<h2>Tareas activas</h2>
	<div class="row">
		<?php
		$cantidad_tareas = 0;
		$cantidad_tareas_completas = 0;
		foreach($tareas as $tarea){
			$cantidad_tareas ++;
			$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$tarea->ID_TAREA]);
			if($detalles_tarea['ESTADO']=='completo'){
				$cantidad_tareas_completas ++;
			}
		}

		$porcentaje_completo = ($cantidad_tareas_completas*100)/$cantidad_tareas;
		?>
		<div class="col-4">
			Progreso
			<div class="progress mb-3">
			  <div class="progress-bar" role="progressbar" style="width: <?php echo $porcentaje_completo; ?>%" aria-valuenow="<?php echo $porcentaje_completo; ?>" aria-valuemin="0" aria-valuemax="100"></div>
			</div>
			<ul class="list-group">
				<?php foreach($tareas as $tarea){ ?>
			  <li class="list-group-item">
					<a href="<?php echo base_url('tareas/detalles?id='.$tarea->ID_TAREA); ?>">
				    <i class="fas fa-check-square text-success"></i>
				    <?php echo $tarea->TAREA_TITULO; ?>
					</a>
			  </li>
			<?php } ?>
			</ul>
		</div>
		<div class="col-8">
			<div class="detalles_tarea">
				<!--
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
			-->
			</div>
		</div>
	</div>
</div>
