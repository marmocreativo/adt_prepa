<div class="estadisticas_generales mb-3">
	<h2>Estadísticas Generales</h2>
	<div class="row">
		<div class="col-8">
			<div class="estadistica_progreso">
				<div class="etiqueta">
					Status de proyectos
				</div>
				<div class="progreso">
					<div class="progress">
					  <div class="progress-bar" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
					  <div class="progress-bar bg-success" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
					  <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="estadistica_progreso">
				<div class="etiqueta">
					Proyectos terminados
				</div>
				<div class="progreso">
					<div class="progress">
					  <div class="progress-bar bg-primary" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
					  <div class="progress-bar bg-info" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="estadistica_progreso">
				<div class="etiqueta">
					Prioridad de proyectos
				</div>
				<div class="progreso">
					<div class="progress">
					  <div class="progress-bar" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
					  <div class="progress-bar bg-primary" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
					  <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
						<div class="progress-bar bg-primary" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-4">
			<p># Proyectos están en revisión</p>
			<p># Hay mas del 50% de proyectos urgentes</p>
			<p># Proyectos terminan esta semana</p>
		</div>
	</div>
</div>

<div class="lista_proyectos">
	<div class="d-flex">
		<div class="titulo">
				<h2>Mis proyectos</h2>
		</div>
		<div class="formulario">
			<form class="row" action="<?php echo base_url('proyectos/busqueda'); ?>" method="get">
				<div class="col">
					<input type="text" class="form-control" name="Busqueda" value="<?php echo verificar_variable('GET','Busqueda','Buscar'); ?>">
				</div>
				<div class="col">
					<button type="submit" class="btn btn-primary"> Aplicar </button>
				</div>
			</form>
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
