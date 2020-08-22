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
		<form class="form-inline float-right" action="<?php echo base_url('admin/proyectos'); ?>" method="get" enctype="multipart/form-data">
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
			<button type="submit" class="btn btn-primary"> <i class="fa fa-search"></i> </button>

		</form>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="row mb-3 ui-sortable">
			<?php foreach($proyectos as $proyecto){ ?>
			<div class="col-12" id="item-<?php echo $proyecto->ID_PROYECTO; ?>" class="ui-sortable-handle">
				<div class="card equipo">
					<div class="card-body  bg-<?php echo $proyecto->COLOR; ?> p-3">
								<p class="h6 text-white"><img src="<?php echo base_url('contenido/img/proyectos/'.$proyecto->IMAGEN); ?>" class="rounded-circle float-left mr-2" width="50"><?php echo $proyecto->PROYECTO_NOMBRE; ?></p>
					</div>
					<?php if($proyecto->ESTADO!='papelera'){ ?>
					<div class="card-footer py-1">
						<div class="row">
							<div class="col-4 p-2">
								<?php if($proyecto->ESTADO=='activo'){ ?>
								<a href="<?php echo base_url('admin/proyectos/activar')."?id=".$proyecto->ID_PROYECTO."&estado=".$proyecto->ESTADO."&consulta=".base64_encode(json_encode($consulta)); ?>" class="btn btn-sm btn-block btn-outline-success"> <span class="fa fa-check-circle"></span> </a>
							<?php } ?>
							<?php if($proyecto->ESTADO=='inactivo'){ ?>
								<a href="<?php echo base_url('admin/proyectos/activar')."?id=".$proyecto->ID_PROYECTO."&estado=".$proyecto->ESTADO."&consulta=".base64_encode(json_encode($consulta)); ?>" class="btn btn-sm btn-block btn-outline-danger"> <span class="fa fa-times-circle"></span> </a>
							<?php } ?>
							<?php if($proyecto->ESTADO=='papelera'){ ?>
								<a href="<?php echo base_url('admin/proyectos/activar')."?id=".$proyecto->ID_PROYECTO."&estado=inactivo&consulta=".base64_encode(json_encode($consulta)); ?>" class="btn btn-sm btn-block btn-outline-danger"> Restaurar </a>
							<?php } ?>
							</div>
							<div class="col-4 p-2">
								<a href="<?php echo base_url('admin/proyectos/actualizar?id='.$proyecto->ID_PROYECTO."&consulta=".base64_encode(json_encode($consulta))); ?>" class="btn btn-sm btn-block btn-warning" title="Editar"> <span class="fa fa-pencil-alt"></span> </a>
							</div>
							<div class="col-4 p-2">
								<button data-enlace='<?php echo base_url('admin/proyectos/borrar?id='.$proyecto->ID_PROYECTO."&consulta=".base64_encode(json_encode($consulta))); ?>' class="btn btn-sm btn-danger btn-block borrar_entrada" title="Eliminar"> <span class="fa fa-trash"></span> </button>
							</div>
						</div>
					</div>
					<?php } ?>
				</div>
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
