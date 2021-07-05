<div class="lista_proyectos">
	<div class="d-flex justify-content-between">
		<div class="titulo">
				<h2>Proyectos del equipo</h2>
		</div>
		<div class="formulario">
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
	<div class="proyecto row">
		<div class="col proyecto_nombre">
			Nombre
		</div>
		<div class="col-1 proyecto_status">
			A tiempo
		</div>
		<div class="col-1 proyecto_prioridad">
			Urgente
		</div>
		<div class="col-1 proyecto_fecha_inicio">
			04-07-2021
		</div>
		<div class="col-1 proyecto_fecha_final">
			04-08-2021
		</div>
		<div class="col-1 proyecto_enlace_editables">
			<a href="#"><i class="fab fa-google-drive"></i></a>
		</div>
		<div class="col-1 proyecto_enlace_entregable">
			<a href="#"><i class="fas fa-link"></i></a>
		</div>
	</div>
	<!-- /lista de proyectos -->

</div>
