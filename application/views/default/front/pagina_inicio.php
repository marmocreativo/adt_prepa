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
			<form class="row" action="<?php echo base_url('proyectos'); ?>" method="get">
				<div class="col">
					<input type="text" class="form-control" name="busqueda" value="<?php echo verificar_variable('GET','busqueda',''); ?>" placeholder="Buscar">
				</div>
				<div class="col">
						<select class="form-control" name="todo">
							<option value="">Mostrar</option>
							<option value="si" <?php if(isset($_GET['todo'])&&$_GET['todo']=='si'){ echo 'selected'; } ?>>Todos los equipos</option>
							<option value="no" <?php if(isset($_GET['todo'])&&$_GET['todo']=='no'){ echo 'selected'; } ?>>Solo mis equipos</option>
						</select>
				</div>
				<div class="col">
						<select class="form-control" name="orden">
							<option value="">Ordenar por</option>
							<option value="ORDEN ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='ORDEN ASC'){ echo 'selected'; } ?>>Orden Personalizado</option>
							<option value="PROYECTO_NOMBRE ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='PROYECTO_NOMBRE ASC'){ echo 'selected'; } ?>>Alfabético A-Z</option>
						</select>
				</div>
				<div class="col">
						<select class="form-control" name="mostrar_por_pagina">
							<option value="">mostrar por página</option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina'] ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina'] ?></option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*2; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*2){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*2; ?></option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*5; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*5){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*5; ?></option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*10; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*10){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*10; ?></option>
						</select>
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
