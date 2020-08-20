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
		<table class="table table-sm table-striped">
				<thead>
					<tr>
							<th>#</th>
							<th>Imágen</th>
							<th>Nombre</th>
							<th>Descripción</th>
							<th>Estado</th>
							<th class="text-right">Controles</th>
					</tr>
				</thead>
				<tbody class="ui-sortable" data-tabla="proyectos" data-columna="ID_PROYECTO">
				<?php foreach($proyectos as $proyecto){ ?>
					<tr id="item-<?php echo $proyecto->ID_PROYECTO; ?>" class="ui-sortable-handle">
						<th scope="row"><?php echo $proyecto->ID_PROYECTO; ?></th>
						<td>
							<img src="<?php echo base_url('contenido/img/categorias/'.$proyecto->IMAGEN); ?>" alt="" width="50px">
						</td>
						<?php $color = $this->GeneralModel->detalles('meta_datos',['DATO_NOMBRE'=>'color','ID_OBJETO'=>$proyecto->ID_PROYECTO,'TIPO_OBJETO'=>'categoria']); ?>
						<td><?php echo $proyecto->PROYECTO_NOMBRE; ?><br>
							<i style="display: block; width: 100%; height: 20px; background-color:<?php echo $color['DATO_VALOR']; ?>"></i>
						</td>
						<td><?php echo word_limiter($proyecto->PROYECTO_DESCRIPCION,10); ?></td>
						<td>
							<?php if($proyecto->ESTADO=='activo'){ ?>
							<a href="<?php echo base_url('admin/proyectos/activar')."?id=".$proyecto->ID_PROYECTO."&estado=".$proyecto->ESTADO."&consulta=".base64_encode(json_encode($consulta)); ?>" class="btn btn-sm btn-outline-success"> <span class="fa fa-check-circle"></span> </a>
						<?php } ?>
						<?php if($proyecto->ESTADO=='inactivo'){ ?>
							<a href="<?php echo base_url('admin/proyectos/activar')."?id=".$proyecto->ID_PROYECTO."&estado=".$proyecto->ESTADO."&consulta=".base64_encode(json_encode($consulta)); ?>" class="btn btn-sm btn-outline-danger"> <span class="fa fa-times-circle"></span> </a>
						<?php } ?>
						<?php if($proyecto->ESTADO=='papelera'){ ?>
							<a href="<?php echo base_url('admin/proyectos/activar')."?id=".$proyecto->ID_PROYECTO."&estado=inactivo&consulta=".base64_encode(json_encode($consulta)); ?>" class="btn btn-sm btn-outline-danger"> Restaurar </a>
						<?php } ?>
						</td>
						<td>
							<div class="btn-group float-right" role="group">
							<?php if($proyecto->ESTADO!='papelera'){ ?>
								<a href="<?php echo base_url('admin/categorias/actualizar?id='.$proyecto->ID_PROYECTO."&consulta=".base64_encode(json_encode($consulta))); ?>" class="btn btn-sm btn-warning" title="Editar"> <span class="fa fa-pencil-alt"></span> </a>
								<button data-enlace='<?php echo base_url('admin/categorias/borrar?id='.$proyecto->ID_PROYECTO."&consulta=".base64_encode(json_encode($consulta))); ?>' class="btn btn-sm btn-danger borrar_entrada" title="Eliminar"> <span class="fa fa-trash"></span> </button>
							<?php } ?>
						</div>
						</td>
					</tr>
				<?php } ?>
				</tbody>
		</table>
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
