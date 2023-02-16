<div class="contenido_principal">
<div class="row mb-4">
	<div class="col-8">
		<h3>Tipos | <?php echo $tipo; ?></h3>
	</div>
	<div class="col-2">
		<form class="form-inline" action="<?php echo base_url('index.php/admin/tipos'); ?>" method="get" enctype="multipart/form-data">
			<input type="hidden" name="tipo" value="<?php echo $tipo; ?>">
			<div class="form-group mr-1">
				<input type="text" class="form-control" name="busqueda" value="<?php echo verificar_variable('GET','busqueda',''); ?>" placeholder="Buscar">
			</div>
			<button type="submit" class="btn btn-primary"> <i class="fa fa-search"></i> </button>

		</form>
	</div>
	<div class="col-2">
		<a href="<?php echo base_url('index.php/admin/tipos/crear?tipo='.$tipo); ?>" class="btn btn-success btn-block"> <i class="fa fa-plus"></i> Nuevo</a>
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<?php retro_alimentacion(); ?>
		<h5>Grupos</h5>
		<ul class="nav nav-pills nav-fill mb-0">
		<?php foreach($grupos_tipos as $grupos){ ?>
			<li class="nav-item border">
				<a class="nav-link <?php if($tipo==$grupos->TIPO_OBJETO){ echo 'active'; } ?>" href="<?php echo base_url('index.php//admin/tipos?tipo='.$grupos->TIPO_OBJETO); ?>"><?php echo $grupos->TIPO_OBJETO; ?></a>
			</li>
		<?php } ?>
		</ul>
	</div>
</div>
<div class="row">
	<div class="col">
		<table class="table table-sm table-striped">
				<thead>
					<tr>
							<th>#</th>
							<th>Nombre</th>
							<th>Nombre Plural</th>
							<th class="text-right">Controles</th>
					</tr>
				</thead>
				<tbody>
				<?php foreach($tipos as $tipo){ ?>
					<tr>
						<th scope="row"><?php echo $tipo->ID; ?></th>
						<td><?php echo $tipo->TIPO_NOMBRE; ?></td>
						<td><?php echo $tipo->TIPO_NOMBRE_PLURAL; ?></td>
						<td>
							<div class="btn-group float-right" role="group">
							<a href="<?php echo base_url('index.php/admin/tipos/actualizar?id='.$tipo->ID); ?>" class="btn btn-sm btn-warning" title="Editar"> <span class="fa fa-pencil-alt"></span> </a>
							<button data-enlace='<?php echo base_url('index.php/admin/tipos/borrar?id='.$tipo->ID); ?>' class="btn btn-sm btn-danger borrar_entrada" title="Eliminar"> <span class="fa fa-trash"></span> </button>
						</div>
						</td>
					</tr>
				<?php } ?>
				</tbody>
		</table>
	</div>
</div>
</div>
