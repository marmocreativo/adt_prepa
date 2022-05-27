
<a href="<?php echo base_url('proyectos/crear?id_equipo='.$equipo['ID_EQUIPO']); ?>" class="btn btn-success btn-round"> <i class="fa fa-plus"></i> </a>
<div class="lista_proyectos">
	<div class="row d-flex justify-content-between">
		<div class=" col-12 col-md-4 titulo d-flex justify-content-between">
				<h2>Proyectos del equipo</h2>
				<div class="dropdown">
				  <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				    Opciones
				  </button>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<a href="<?php echo base_url('equipos/actualizar?id='.$equipo['ID_EQUIPO']); ?>" class="dropdown-item"> <i class="fas fa-pencil-alt"></i> Editar equipo</a>
						<a href="<?php echo base_url('equipos/borrar?id='.$equipo['ID_EQUIPO']); ?>" class="dropdown-item"> <i class="fas fa-trash"></i> Borrar equipo</a>
				  </ul>
				</div>
		</div>
		<div class="col-12 col-md-4 formulario p-2">

		</div>
	</div>
	<div class="slide encabezado_lista_proyectos mt-4">
		<div class="col proyecto_nombre">
			Nombre
		</div>
		<div class="col-1 proyecto_status">
			Status
		</div>
		<div class="col-1 proyecto_prioridad">
			Prioridad
		</div>
		<div class="col-1 proyecto_fecha_inicio">
			Fecha Inicio
		</div>
		<div class="col-1 proyecto_fecha_final">
			Fecha Entrega
		</div>
		<div class="col-1 proyecto_enlace_editables">
			Editables
		</div>
		<div class="col-1 proyecto_enlace_entregable">
			Entregables
		</div>
	</div>
	<!-- Lista de proyectos -->
	<?php foreach($proyectos as $proyecto){ ?>
	<a class="lista-p" href="<?php echo base_url('proyectos/detalles?id='.$proyecto->ID_PROYECTO); ?>">
		<div class="slide proyecto aling-item-center">
			<div class="col proyecto_nombre">
				<?php echo $proyecto->PROYECTO_NOMBRE; ?>
			</div>
      <?php
					switch ($proyecto->ESTADO) {
						case 'activo':
							if($proyecto->FECHA_FINAL<date('Y-m-d')){
								$color_estado = 'bg-s-retraso';
								$mensaje_estado = 'Retraso';
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
								$color_estado = 'bg-s-terminado';
								$mensaje_estado = 'Terminado';
							break;

						default:
								$color_estado = 'bg-light';
								$mensaje_estado = 'N/A';
							break;
					}
				?>
			<div class="col-1 proyecto_status <?php echo $color_estado; ?>">

				<span><?php echo $mensaje_estado; ?></span>
			</div>
			<div class="col-1 proyecto_prioridad bg-p-media">
				<?php echo $proyecto->PRIORIDAD; ?>
			</div>
			<div class="col-1 proyecto_fecha_inicio">
				<?php echo date('d-m-Y',strtotime($proyecto->FECHA_INICIO)); ?>
			</div>
			<div class="col-1 proyecto_fecha_final">
				<?php echo date('d-m-Y',strtotime($proyecto->FECHA_FINAL)); ?>
			</div>
			<div class="col-1 proyecto_enlace_editables">
				<?php if(!empty($proyecto->ENLACE_EDITABLE)){ ?>
				<a href="<?php echo $proyecto->ENLACE_EDITABLE; ?>"><i class="fab fa-google-drive"></i></a>
				<?php } ?>
			</div>
			<div class="col-1 proyecto_enlace_entregable">
				<?php if(!empty($proyecto->ENLACE_ENTREGABLE)){ ?>
				<a href="<?php echo $proyecto->ENLACE_ENTREGABLE; ?>"><i class="fas fa-link"></i></a>
				<?php } ?>
			</div>
		</div>
	</a>
	<?php } ?>
	<!-- /lista de proyectos -->
</div>
