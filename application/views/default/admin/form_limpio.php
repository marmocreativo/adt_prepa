<form action="<?php echo base_url('admin/tipos/crear') ?>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="Identificador" value="<?php echo $opcion['ID']; ?>">
	<div class="row mb-4">
		<div class="col-8">
			<h3>Titulo</h3>
		</div>
		<div class="col-4">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col">
			<?php retro_alimentacion(); ?>
			<h5>Acción</h5>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col">
			Formulario
		</div>
	</div>
	<div class="row">
		<div class="col">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
</form>
