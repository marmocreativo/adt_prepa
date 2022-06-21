<a href="<?php echo base_url('proyectos/crear?id_equipo='); ?>" class="btn btn-success btn-round btn-circulo-flotante"> <i class="fa fa-plus"></i> </a>
<div class="">
	<!-- Lista de proyectos -->

	<?php foreach($proyectos as $proyecto){ ?>
	<div class="col-12">
		<a class="card card-body p-0 mb-2" style="border-radius: 50px; overflow:hidden;" href="<?php echo base_url('proyectos/detalles?id='.$proyecto->ID_PROYECTO); ?>">
			<div class="row">
				<div class="col proyecto_nombre d-flex align-items-center bg-image p-0" style="min-height: 30px; background-image: url(<?php echo base_url('contenido/img/proyectos/'.$proyecto->IMAGEN_FONDO); ?>)">
					<img src="<?php echo base_url('contenido/img/proyectos/'.$proyecto->IMAGEN); ?>" class="rounded-circle mx-3" width="50">
					<h3 class="h5"><?php echo $proyecto->PROYECTO_NOMBRE; ?></h3>
				</div>
				<?php
					$tareas = $this->GeneralModel->lista('tareas','',['ID_PROYECTO'=>$proyecto->ID_PROYECTO],'','','');
					$total_tareas = 0;
					$tareas_completas = 0;
					$tareas_incompletas = 0;
					foreach ($tareas as $tarea) {
						$total_tareas ++;
						if($tarea->ESTADO=='completo'){
							$tareas_completas ++;
						}else{
							$tareas_incompletas ++;
						}
					}
					$porcentaje_tareas = ($tareas_completas*100)/$total_tareas;
					$porcentaje_tareas = number_format($porcentaje_tareas,2);
				?>
					<div class="col">
						<div class="progress mt-3" style="background:transparent">
						  <div class="progress-bar" role="progressbar" style="width: <?php echo $porcentaje_tareas; ?>%" aria-valuenow="<?php echo $porcentaje_tareas; ?>" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
					<?php
							switch ($proyecto->ESTADO) {
								case 'activo':
									if($proyecto->FECHA_FINAL<date('Y-m-d')){
										$color_estado = 'bg-s-retraso';
										$mensaje_estado = 'Atraso';
									}else{
										$color_estado = 'bg-s-atiempo';
										$mensaje_estado = 'A tiempo';
									}
									break;
								case 'revision':
										$color_estado = 'bg-s-revision';
										$mensaje_estado = 'Revisión';
									break;
								case 'terminado':
										$color_estado = '.bg-s-terminado';
										$mensaje_estado = 'Terminado';
									break;

								default:
										$color_estado = 'bg-light';
										$mensaje_estado = 'N/A';
									break;
							}
						?>
				<div class="col-1 proyecto_status <?php echo $color_estado;?>">
					<span><?php echo $mensaje_estado; ?></span>
				</div>
			</div>
		</a>
	</div>
	<?php } ?>
	<!-- /lista de proyectos -->

</div>
