<div class="lista_equipos">
	<div class="row d-flex justify-content-between">
		<div class="col-12 col-md-4 titulo">
				<h2>Mis equipos</h2>
		</div>
		<div class="col-12 col-md-6 formulario pl-4">
			<form class="row" action="<?php echo base_url('equipos'); ?>" method="get">
				<div class="col-4 col-md-2">
					<input type="text" class="form-control" name="busqueda" value="<?php echo verificar_variable('GET','busqueda',''); ?>" placeholder="Buscar">
				</div>
				<div class="col-4 col-md-2">
						<select class="form-control" name="todo">
							<option value="">Mostrar</option>
							<option value="si" <?php if(isset($_GET['todo'])&&$_GET['todo']=='si'){ echo 'selected'; } ?>>Todos los equipos</option>
							<option value="no" <?php if(isset($_GET['todo'])&&$_GET['todo']=='no'){ echo 'selected'; } ?>>Solo mis equipos</option>
						</select>
				</div>
				<div class="col-4 col-md-2">
						<select class="form-control" name="orden">
							<option value="">Ordenar por</option>
							<option value="ORDEN ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='ORDEN ASC'){ echo 'selected'; } ?>>Orden Personalizado</option>
							<option value="EQUIPO_NOMBRE ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='EQUIPO_NOMBRE ASC'){ echo 'selected'; } ?>>Alfabético A-Z</option>
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
				<div class="col-4 col-md-2 mb-3">
					<button type="submit" class="btn btn-primary"> Aplicar </button>
				</div>
			</form>
		</div>
		<div class="col-6  col-md-2 controles">
			<a href="<?php echo base_url('equipos/crear?tipo='.$tipo."&consulta=".base64_encode(json_encode($consulta))); ?>" class="btn btn-success"> <i class="fa fa-plus"></i> Nuevo</a>
		</div>
	</div>
	<div class="row mt-4">

		<?php foreach($equipos as $equipo){ ?>
		<div class="col-12 col-md-2">
			<a href="<?php echo base_url('equipos/detalles?id='.$equipo->ID_EQUIPO); ?>">
				<div class="equipo card card-body mb-3">
					<h3 class="h5"><i class="fas fa-circle bg-icon-p-urgente"></i> <?php echo $equipo->EQUIPO_NOMBRE; ?></h3>
					<?php
						$numero_proyectos = $this->GeneralModel->conteo('equipos_proyectos','','',['ID_EQUIPO'=>$equipo->ID_EQUIPO],'');
						$numero_miembros = $this->GeneralModel->conteo('equipos_usuarios','','',['ID_EQUIPO'=>$equipo->ID_EQUIPO],'');
					?>
					<p><?php echo $numero_proyectos; ?> Proyectos activos </p>
					<p><?php echo $numero_miembros; ?> Miembros</p>
				</div>
			</a>
		</div>
		<?php } ?>
	</div>
	<?php if($cantidad_paginas>1){ ?>
	<div class="row justify-content-md-center">
		<div class="col-2">
			<a href="<?php echo base_url('equipos?'.$consulta_anterior); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == 1){ echo 'disabled'; } ?>"> <i class="fa fa-chevron-left"></i> Anterior</a>
		</div>
		<div class="col-2">
			<form class="enviar_enter" action="<?php echo base_url('equipos'); ?>" method="get">
				<input type="hidden" name="orden" value="<?php echo $consulta['orden'] ?>">
				<input type="hidden" name="mostrar_por_pagina" value="<?php echo $consulta['mostrar_por_pagina'] ?>">
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
			<a href="<?php echo base_url('equipos?'.$consulta_siguiente); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == $cantidad_paginas){ echo 'disabled'; } ?>"> Siguiente <i class="fa fa-chevron-right"></i> </a>
		</div>
	</div>
	<?php } ?>
</div>

<!--
<div class="contenido_principal">
<div class="row  mb-4">
	<div class="col-12 col-md-8">
		<h3>Equipos</h3>
	</div>
	<div class="col-12 col-md-4">
		<div class="btn-group btn-group float-right" role="group" aria-label="Barra de tareas">
				<a href="<?php echo base_url('admin/equipos/papelera'); ?>" class="btn btn-outline-danger"> <i class="fa fa-trash"></i> ver papelera</a>
				<a href="<?php echo base_url('admin/equipos/crear?tipo='.$tipo."&consulta=".base64_encode(json_encode($consulta))); ?>" class="btn btn-success"> <i class="fa fa-plus"></i> Nuevo</a>
		</div>
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<?php retro_alimentacion(); ?>
		<div class="collapse" id="formulario_orden">
			<form class="" action="<?php echo base_url('admin/equipos'); ?>" method="get" enctype="multipart/form-data">
				<input type="hidden" name="tipo" value="<?php echo $tipo; ?>">
				<div class="form-group mr-2">
					<select class="form-control" name="orden">
						<option value="">Ordenar por</option>
						<option value="EQUIPO_NOMBRE ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='EQUIPO_NOMBRE ASC'){ echo 'selected'; } ?>>Alfabético A-Z</option>
						<option value="EQUIPO_NOMBRE DESC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='EQUIPO_NOMBRE DESC'){ echo 'selected'; } ?>>Alfabético Z-A</option>
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
				<button type="submit" class="btn btn-primary btn-success"> <i class="fa fa-search"></i> </button>
			</form>
		</div>
		<a class="btn btn-light btn-block mt-3" data-toggle="collapse" href="#formulario_orden" role="button" aria-expanded="false" aria-controls="formulario_orden"> + Filtrar y ordenar </a>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="row mb-3 ui-sortable">
			<?php foreach($equipos as $equipo){ ?>
			<div class="col-12 col-sm-4 col-md-3 p-1" id="item-<?php echo $equipo->ID_EQUIPO; ?>" class="ui-sortable-handle">
				<a href="<?php echo base_url('admin/equipos/detalles?id='.$equipo->ID_EQUIPO); ?>">
					<div class="card equipo">
						<div class="card-body bg-<?php echo $equipo->COLOR; ?>">
							<p class="h5 text-white"><img src="<?php echo base_url('contenido/img/equipos/'.$equipo->IMAGEN); ?>" class="rounded-circle float-left mr-2" width="50"><?php echo $equipo->EQUIPO_NOMBRE; ?></p>
						</div>
						<!--
						<div class="card-footer py-1">
							<div class="row">
								<div class="col-4 p-2">
									<?php if($equipo->ESTADO=='activo'){ ?>
									<a href="<?php echo base_url('admin/equipos/activar')."?id=".$equipo->ID_EQUIPO."&estado=".$equipo->ESTADO."&consulta=".base64_encode(json_encode($consulta)); ?>" class="btn btn-sm btn-block btn-outline-success"> <span class="fa fa-check-circle"></span> </a>
								<?php } ?>
								<?php if($equipo->ESTADO=='inactivo'){ ?>
									<a href="<?php echo base_url('admin/equipos/activar')."?id=".$equipo->ID_EQUIPO."&estado=".$equipo->ESTADO."&consulta=".base64_encode(json_encode($consulta)); ?>" class="btn btn-sm btn-block btn-outline-danger"> <span class="fa fa-times-circle"></span> </a>
								<?php } ?>
								<?php if($equipo->ESTADO=='papelera'){ ?>
									<a href="<?php echo base_url('admin/equipos/activar')."?id=".$equipo->ID_EQUIPO."&estado=inactivo&consulta=".base64_encode(json_encode($consulta)); ?>" class="btn btn-sm btn-block btn-outline-danger"> Restaurar </a>
								<?php } ?>
								</div>
								<div class="col-4 p-2">
									<a href="<?php echo base_url('admin/equipos/actualizar?id='.$equipo->ID_EQUIPO."&consulta=".base64_encode(json_encode($consulta))); ?>" class="btn btn-sm btn-block btn-warning" title="Editar"> <span class="fa fa-pencil-alt"></span> </a>
								</div>
								<div class="col-4 p-2">
									<button data-enlace='<?php echo base_url('admin/equipos/borrar?id='.$equipo->ID_EQUIPO."&consulta=".base64_encode(json_encode($consulta))); ?>' class="btn btn-sm btn-danger btn-block borrar_entrada" title="Eliminar"> <span class="fa fa-trash"></span> </button>
								</div>
							</div>
						</div>
						- ->
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
