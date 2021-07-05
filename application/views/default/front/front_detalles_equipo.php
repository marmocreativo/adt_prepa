<div class="lista_proyectos">
	<div class="d-flex justify-content-between">
		<div class="titulo">
				<h2>Proyectos del equipo</h2>
		</div>
		<div class="formulario">
			<a href="<?php echo base_url('equipos/actualizar?id='.$equipo['ID_EQUIPO']); ?>" class="btn btn-warning"> <i class="fas fa-pencil-alt"></i> Editar equipo</a>
			<a href="<?php echo base_url('proyectos/crear?id_equipo='.$equipo['ID_EQUIPO']); ?>" class="btn btn-success"> <i class="fa fa-plus"></i> Nuevo</a>
		</div>
	</div>
	<div class="encabezado_lista_proyectos row">
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
	<a href="<?php echo base_url('proyectos/detalles?id='.$proyecto->ID_PROYECTO); ?>">
		<div class="proyecto row">
			<div class="col proyecto_nombre">
				<?php echo $proyecto->PROYECTO_NOMBRE; ?>
			</div>
			<div class="col-1 proyecto_status">
				<?php
					switch ($proyecto->ESTADO) {
						case 'activo':
							if($proyecto->FECHA_FINAL<date('Y-m-d')){
								$color_estado = 'bg-danger';
								$mensaje_estado = 'Retraso';
							}else{
								$color_estado = 'bg-success';
								$mensaje_estado = 'A tiempo';
							}
							break;
						case 'revision':
								$color_estado = 'bg-warning';
								$mensaje_estado = 'Revisión';
							break;
						case 'terminado':
								$color_estado = 'bg-light';
								$mensaje_estado = 'Terminado';
							break;

						default:
								$color_estado = 'bg-light';
								$mensaje_estado = 'N/A';
							break;
					}
				?>
				<span class="badge <?php echo $color_estado; ?>"><?php echo $mensaje_estado; ?></span>
			</div>
			<div class="col-1 proyecto_prioridad">
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
