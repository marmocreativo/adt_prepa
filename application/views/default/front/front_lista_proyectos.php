<div class="lista_proyectos">
	<div class="row d-flex">
		<div class="col-12 col-md-6 titulo">
				<h2>Mis proyectos</h2>
		</div>
		<div class="col-12 col-md-6 formulario">
			<form class="row" action="<?php echo base_url('proyectos'); ?>" method="get">
				<div class="col-4 col-md-2">
					<input type="text" class="form-control" name="busqueda" value="<?php echo verificar_variable('GET','busqueda',''); ?>" placeholder="Buscar">
				</div>
				<!--
				<div class="col-4 col-md-2">
						<select class="form-control" name="todo">
							<option value="">Mostrar</option>
							<option value="si" <?php if(isset($_GET['todo'])&&$_GET['todo']=='si'){ echo 'selected'; } ?>>Todos los equipos</option>
							<option value="no" <?php if(isset($_GET['todo'])&&$_GET['todo']=='no'){ echo 'selected'; } ?>>Solo mis equipos</option>
						</select>
				</div>
			-->
				<div class="col-4 col-md-2">
						<select class="form-control" name="orden">
							<option value="">Ordenar por</option>
							<option value="ORDEN ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='ORDEN ASC'){ echo 'selected'; } ?>>Orden Personalizado</option>
							<option value="PROYECTO_NOMBRE ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='PROYECTO_NOMBRE ASC'){ echo 'selected'; } ?>>Alfabético A-Z</option>
						</select>
				</div>
				<div class="col-4 col-md-2">
						<select class="form-control" name="mostrar_por_pagina">
							<option value="">mostrar por página</option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina'] ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina'] ?></option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*2; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*2){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*2; ?></option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*5; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*5){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*5; ?></option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*10; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*10){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*10; ?></option>
						</select>
				</div>
				<div class="col-4 col-md-1">
					<button type="submit" class="btn btn-secondary"> Aplicar </button>
				</div>
			</form>
		</div>
	</div>

	<div class="slide encabezado_lista_proyectos  mt-4">
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
	</div>

	<!-- Lista de proyectos -->

	<?php foreach($proyectos as $proyecto){ ?>
	<a class="lista-p" href="<?php echo base_url('proyectos/detalles?id='.$proyecto->ID_PROYECTO); ?>">
		<div class="slide proyecto aling-item-center ">
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
			<div class="col-1 proyecto_prioridad bg-p-media">
				<?php echo $proyecto->PRIORIDAD; ?>
			</div>
			<div class="col-1 proyecto_fecha_inicio">
				<?php echo date('d-m-Y',strtotime($proyecto->FECHA_INICIO)); ?>
			</div>
			<div class="col-1 proyecto_fecha_final">
				<?php echo date('d-m-Y',strtotime($proyecto->FECHA_FINAL)); ?>
			</div>
		</div>
	</a>
	<?php } ?>
	<!-- /lista de proyectos -->

</div>
<!--
<div class="contenido_principal">
<div class="row  mb-4">
	<div class="col-12 col-md-8">
		<h3>Proyectos</h3>
	</div>
	<div class="col-12 col-md-4">
		<div class="btn-group btn-group float-right" role="group" aria-label="Barra de tareas">
				<a href="<?php echo base_url('admin/proyectos/papelera'); ?>" class="btn btn-outline-danger"> <i class="fa fa-trash"></i> ver papelera</a>
				<a href="<?php echo base_url('admin/proyectos/crear?tipo='.$tipo."&consulta=".base64_encode(json_encode($consulta))); ?>" class="btn btn-success"> <i class="fa fa-plus"></i> Nuevo</a>
		</div>
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<?php retro_alimentacion(); ?>
		<div class="collapse" id="formulario_orden">
			<form class="" action="<?php echo base_url('admin/proyectos'); ?>" method="get" enctype="multipart/form-data">
				<input type="hidden" name="tipo" value="<?php echo $tipo; ?>">
				<div class="form-group mr-2">
					<select class="form-control" name="orden">
						<option value="">Ordenar por</option>
						<option value="PROYECTO_NOMBRE ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='PROYECTO_NOMBRE ASC'){ echo 'selected'; } ?>>Alfabético A-Z</option>
						<option value="PROYECTO_NOMBRE DESC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='PROYECTO_NOMBRE DESC'){ echo 'selected'; } ?>>Alfabético Z-A</option>
						<option value="ORDEN ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='ORDEN ASC'){ echo 'selected'; } ?>>Orden Personalizado</option>
					</select>
				</div>
				<div class="form-group mr-2">
					<select class="form-control" name="mostrar_por_pagina">
						<option value="">mostrar por página</option>
						<option value="<?php echo $op['cantidad_publicaciones_por_pagina'] ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina'] ?></option>
						<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*2; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*2){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*2; ?></option>
						<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*5; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*5){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*5; ?></option>
						<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*10; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*10){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*10; ?></option>
					</select>
				</div>
				<div class="form-group mr-2">
					<input type="text" class="form-control" name="busqueda" value="<?php echo verificar_variable('GET','busqueda',''); ?>" placeholder="Buscar">
				</div>
				<button type="submit" class="btn btn-primary btn-block"> <i class="fa fa-search"></i> </button>
			</form>
		</div>
		<a class="btn btn-light btn-block mt-3" data-toggle="collapse" href="#formulario_orden" role="button" aria-expanded="false" aria-controls="formulario_orden"> + Filtrar y ordenar </a>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="row mb-3 ui-sortable">
			<?php foreach($proyectos as $proyecto){ ?>
			<div class="col-12 col-sm-6 col-md-4">
				<a href="<?php echo base_url('admin/proyectos/detalles?id='.$proyecto->ID_PROYECTO); ?>">
					<div class="card">
						<div class="card-body">
							<h2 class="h6 text-<?php echo $proyecto->COLOR; ?>"><?php echo $proyecto->PROYECTO_NOMBRE; ?></h2>
							<span class="badge bg-<?php echo $proyecto->COLOR; ?>"><?php echo $proyecto->DURACION; ?></span>
						</div>
						<div class="card-footer">
							<span class="float-left"> <i class="fa fa-check-square"></i> <?php echo $proyecto->ESTADO; ?></span>
							<span class="float-right"> <i class="fa fa-calendar"></i> <?php echo $proyecto->FECHA_ENTREGA; ?></span>
						</div>
					</div>
				</a>
			</div>
			<?php } ?>
		</div>
		<?php if($cantidad_paginas>1){ ?>
		<div class="row justify-content-md-center">
			<div class="col-2">
				<a href="<?php echo base_url('admin/categorias/?'.$consulta_anterior); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == 1){ echo 'disabled'; } ?>"> <i class="fa fa-chevron-left"></i> Anterior</a>
			</div>
			<div class="col-2">
				<form class="enviar_enter" action="<?php echo base_url('admin/categorias'); ?>" method="get">
					<input type="hidden" name="tipo_objeto" value="<?php echo $consulta['tipo_objeto'] ?>">
					<input type="hidden" name="tipo" value="<?php echo $consulta['tipo'] ?>">
					<input type="hidden" name="padre" value="<?php echo $consulta['padre'] ?>">
					<input type="hidden" name="orden" value="<?php echo $consulta['orden'] ?>">
					<input type="hidden" name="mostrar_por_pagina" value="<?php echo $consulta['mostrar_por_pagina'] ?>">
					<input type="hidden" name="busqueda" value="<?php echo $consulta['busqueda'] ?>">
					<div class="form-group">
						<div class="input-group">
							<input type="number" class="form-control" name="pagina" value="<?php echo $pagina; ?>" min="1" max="<?php echo $cantidad_paginas; ?>">
							<div class="input-group-append">
								<span class="input-group-text">/<?php echo $cantidad_paginas; ?></span>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-2">
				<a href="<?php echo base_url('admin/categorias/?'.$consulta_siguiente); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == $cantidad_paginas){ echo 'disabled'; } ?>"> Siguiente <i class="fa fa-chevron-right"></i> </a>
			</div>
		</div>
		<?php } ?>
	</div>
</div>
</div>
-->
