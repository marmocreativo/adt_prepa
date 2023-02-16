<a href="<?php echo base_url('index.php/lista_usuarios/crear?tipo=usuario'); ?>" class="btn btn-success btn-circulo-flotante"> <i class="fa fa-plus"></i></a>
<div class="lista_equipos">
	<div class="row mt-3">
		<?php foreach($usuarios as $usuario){ ?>
		<div class="col-6 col-sm-4 col-md-3">
			<div class="proyecto p-0">
				<a href="<?php echo base_url('index.php/lista_usuarios/detalles?id='.$usuario->ID_USUARIO); ?>">
					<div class="">
						<div class="bg-image d-flex justify-content-center align-items-center" style="background-image: url(<?php echo base_url('contenido/img/usuarios/'.$usuario->IMAGEN_FONDO); ?>); min-height:100px; padding-top: 30px; padding-bottom:30px;">
							<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario->IMAGEN); ?>" class="rounded-circle imagen_perfil" style="width:80%; max-width: 200px;">
						</div>

					</div>
					<div class="p-2 text-center">
						<h3 class="h6"><?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?></h3>
					</div>
				</a>
			</div>
		</div>
		<?php } ?>
	</div>
	<?php if($cantidad_paginas>1){ ?>
	<div class="row justify-content-md-center">
		<div class="col-2">
			<a href="<?php echo base_url('index.php/lista_usuarios?'.$consulta_anterior); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == 1){ echo 'disabled'; } ?>"> <i class="fa fa-chevron-left"></i> Anterior</a>
		</div>
		<div class="col-2">
			<form class="enviar_enter" action="<?php echo base_url('index.php/lista_usuarios'); ?>" method="get">
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
			<a href="<?php echo base_url('index.php/lista_usuarios?'.$consulta_siguiente); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == $cantidad_paginas){ echo 'disabled'; } ?>"> Siguiente <i class="fa fa-chevron-right"></i> </a>
		</div>
	</div>
	<?php } ?>
</div>

<!--
<div class="">
	<?php retro_alimentacion(); ?>
<div class="d-flex justify-content-between">
	<div class="titulo">
		<h3>Usuarios</h3>
	</div>
	<div class="formulario">
		<form class="row" action="<?php echo base_url('index.php/lista_usuarios'); ?>" method="get" enctype="multipart/form-data">
			<div class="col">
				<div class="form-group mr-2">
					<input type="text" class="form-control" name="busqueda" value="<?php echo verificar_variable('GET','busqueda',''); ?>" placeholder="Buscar">
				</div>
			</div>
			<div class="col">
				<div class="form-group mr-2">
					<select class="form-control" name="orden">
						<option value="">Ordenar por</option>
						<option value="ORDEN ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='ORDEN ASC'){ echo 'selected'; } ?>>Orden Personalizado</option>
						<option value="USUARIO_NOMBRE ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='USUARIO_NOMBRE ASC'){ echo 'selected'; } ?>>Nombre A-Z</option>
						<option value="USUARIO_NOMBRE DESC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='USUARIO_NOMBRE DESC'){ echo 'selected'; } ?>>Nombre Z-A</option>
						<option value="USUARIO_APELLIDOS ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='USUARIO_APELLIDOS ASC'){ echo 'selected'; } ?>>Apellidos A-Z</option>
						<option value="USUARIO_APELLIDOS DESC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='USUARIO_APELLIDOS DESC'){ echo 'selected'; } ?>>Apellidos Z-A</option>
						<option value="FECHA_REGISTRO ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='FECHA_REGISTRO ASC'){ echo 'selected'; } ?>>Fecha Registro mas antiguos</option>
						<option value="FECHA_REGISTRO DESC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='FECHA_REGISTRO DESC'){ echo 'selected'; } ?>>Fecha Registro mas recientes</option>
					</select>
				</div>
			</div>
			<div class="col">
				<div class="form-group mr-2">
					<select class="form-control" name="mostrar_por_pagina">
						<option value="">mostrar por página</option>
						<option value="<?php echo $op['cantidad_publicaciones_por_pagina'] ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina'] ?></option>
						<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*2; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*2){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*2; ?></option>
						<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*5; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*5){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*5; ?></option>
						<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*10; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*10){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*10; ?></option>
					</select>
				</div>
			</div>
			<div class="col">
				<button type="submit" class="btn btn-primary"> <i class="fa fa-search"></i> </button>
			</div>
		</form>
	</div>
	<div class="controles">
		<div class="btn-group btn-group" role="group" aria-label="Barra de tareas">
			<a href="<?php echo base_url('index.php/admin/usuarios/descargar_excel?tipo='.$tipo.'&consulta='.base64_encode(json_encode($consulta))); ?>" class="btn btn-info"> <i class="fa fa-download"></i> Descargar</a>
				<a href="<?php echo base_url('index.php/admin/usuarios/crear?tipo='.$tipo.'&consulta='.base64_encode(json_encode($consulta))); ?>" class="btn btn-success"> <i class="fa fa-plus"></i> Nuevo</a>
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<table class="table table-striped">
				<thead>
					<tr>
							<th>Nombre</th>
							<th>Correo</th>
							<th>Teléfono</th>
							<th>Registrado el</th>
							<th>Estado</th>
							<th class="text-right">Contoles</th>
					</tr>
				</thead>
				<tbody>
				<?php foreach($usuarios as $usuario){ ?>
					<tr>
						<td><?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?></td>
						<td><?php echo $usuario->USUARIO_CORREO; ?></td>
						<td><?php echo $usuario->USUARIO_TELEFONO; ?></td>
						<td><?php echo date('d/m/Y',strtotime($usuario->FECHA_REGISTRO)); ?></td>
						<td>
							<?php if($usuario->ESTADO=='activo'){ ?>
							<a href="<?php echo base_url('index.php/admin/usuarios/activar')."?id=".$usuario->ID_USUARIO."&estado=".$usuario->ESTADO."&tipo=".$usuario->TIPO; ?>" class="btn btn-sm btn-outline-success"> <span class="fa fa-check-circle"></span> </a>
						<?php }else{ ?>
							<a href="<?php echo base_url('index.php/admin/usuarios/activar')."?id=".$usuario->ID_USUARIO."&estado=".$usuario->ESTADO."&tipo=".$usuario->TIPO; ?>" class="btn btn-sm btn-outline-danger"> <span class="fa fa-times-circle"></span> </a>
						<?php } ?>
						</td>
						<td>
							<div class="btn-group float-right" role="group">
							<a href="<?php echo base_url('index.php/admin/usuarios/actualizar?id='.$usuario->ID_USUARIO); ?>" class="btn btn-sm btn-warning" title="Editar"> <span class="fa fa-pencil-alt"></span> </a>
							<button data-enlace='<?php echo base_url('index.php/admin/usuarios/borrar?id='.$usuario->ID_USUARIO); ?>' class="btn btn-sm btn-danger borrar_entrada" title="Eliminar"> <span class="fa fa-trash"></span> </button>
						</div>
						</td>
					</tr>
				<?php } ?>
				</tbody>
		</table>
		<?php if($cantidad_paginas>1){ ?>
		<div class="row justify-content-md-center">
			<div class="col-2">
				<a href="<?php echo base_url('index.php/admin/usuarios/?'.$consulta_anterior); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == 1){ echo 'disabled'; } ?>"> <i class="fa fa-chevron-left"></i> Anterior</a>
			</div>
			<div class="col-2">
				<form class="enviar_enter" action="<?php echo base_url('index.php/admin/usuarios'); ?>" method="get">
					<input type="hidden" name="categoria" value="<?php echo $consulta['categoria'] ?>">
					<input type="hidden" name="tipo" value="<?php echo $consulta['tipo'] ?>">
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
				<a href="<?php echo base_url('index.php/admin/usuarios/?'.$consulta_siguiente); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == $cantidad_paginas){ echo 'disabled'; } ?>"> Siguiente <i class="fa fa-chevron-right"></i> </a>
			</div>
		</div>
		<?php } ?>
	</div>
</div>
</div>
-->
