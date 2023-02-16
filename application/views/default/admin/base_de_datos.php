<div class="row mb-4">
	<div class="col-8">
		<h3>Tipos | <?php echo $tipo; ?></h3>
	</div>
	<div class="col-2">
	</div>
	<div class="col-2">
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<?php retro_alimentacion(); ?>
	</div>
</div>
<div class="row">
	<div class="col-12 col-sm-4">
		<h3 class=""> Respaldar Base de datos </h3>
		<p>Crea un respaldo completo de la base de datos listo para descargar</p>
 	<a class="btn btn-success" href="<?php echo base_url('index.php/admin/base_de_datos/respaldar'); ?>"> <i class="fa fa-download"></i> Descargar respaldo</a>

	</div>
	<div class="col-12 col-sm-4">
		<h3 class=""> Restaurar Base de datos </h3>
		<form class="" action="<?php echo base_url('index.php/admin/base_de_datos/restaurar'); ?>" method="post" enctype="multipart/form-data">
			 <div class="form-group">
				 <label for="zip_file">Seleccionar Respaldo</label>
				 <input type="file" name="zip_file" class="form-control" accept="application/x-zip-compressed">
			 </div>
			 <button type="submit" class="btn btn-warning" name="button"><i class="fa fa-upload"></i> Subir Respaldo</button>
		 </form>
	</div>
</div>
