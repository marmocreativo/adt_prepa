<div class="contenido_principal">
<form action="<?php echo base_url('admin/crear_opcion') ?>" method="post" enctype="multipart/form-data">
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
		<h5>Crear opción</h5>
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<div class="form-group">
			<label for="OpcionNombre">Nombre</label>
			<input type="text" class="form-control" name="OpcionNombre" value="" required>
			 <small class="form-text text-warning">Debe estar escrito solo en minúsculas sin espacios</small>
		</div>
		<div class="form-group">
			<label for="OpcionValor">Valor</label>
			<textarea class="form-control" name="OpcionValor" rows="8" required></textarea>
		</div>
		<div class="form-group">
			<label for="OpcionInput">Input</label>
			<select class="form-control" name="OpcionInput">
				<option value="varchar">Campo de texto</option>
				<option value="text">Área de texto</option>
				<option value="editor">Editor de texto</option>
				<option value="boolean">Interruptor</option>
			</select>
		</div>
		<div class="form-group">
			<label for="OpcionTipo">Tipos: <b><?php $i=0; foreach($grupos_opciones as $grupo){ echo $grupo->OPCION_TIPO.' | '; }?></b></label>
			<input type="text" class="form-control" name="OpcionTipo" value="" required>
			<small class="form-text text-warning">Debe estar escrito solo en minúsculas sin espacios</small>
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
