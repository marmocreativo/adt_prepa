<div class="contenido_principal">
<form action="<?php echo base_url('index.php/admin/tipos/crear') ?>" method="post" enctype="multipart/form-data">
<input type="hidden" name="Identificador" value="<?php echo $opcion['ID']; ?>">
<div class="row mb-4">
	<div class="col-8">
		<h3>Opciones</h3>
	</div>
	<div class="col-4">
		<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<?php retro_alimentacion(); ?>
		<h5>Crear Tipo <?php echo $tipo; ?></h5>
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<div class="form-group">
			<label for="TipoNombre">Nombre en sistema</label>
			<input type="text" class="form-control" name="TipoNombre" value="" required>
			 <small class="form-text text-warning">Debe estar escrito solo en minúsculas sin espacios</small>
		</div>
		<div class="form-group">
			<label for="TipoNombreSingular">Nombre en Singular</label>
			<input type="text" class="form-control" name="TipoNombreSingular" value="" required>
		</div>
		<div class="form-group">
			<label for="TipoNombrePlural">Nombre en Plural</label>
			<input type="text" class="form-control" name="TipoNombrePlural" value="" required>
		</div>
		<div class="form-group">
			<label for="TipoObjeto">Tipo</label>
			<input type="text" class="form-control" name="TipoObjeto" value="<?php echo $tipo ?>" required>
			<small class="form-text text-warning">No modificar el valor por defecto, a menos que se desee crear un nuevo grupo de tipos</small>
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
	</div>
</div>
</form>
</div>
