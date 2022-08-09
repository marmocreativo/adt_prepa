<div class="contenido_principal">
<form action="<?php echo base_url('admin/actualizar_opcion') ?>" method="post" enctype="multipart/form-data">
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
		<h5>Actualizar opción</h5>
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<div class="form-group">
			<label for="OpcionNombre">Nombre</label>
			<input type="text" class="form-control" name="OpcionNombre" value="<?php echo $opcion['OPCION_NOMBRE']; ?>" required>
			 <small class="form-text text-warning">Debe estar escrito solo en minúsculas sin espacios</small>
		</div>
		<div class="form-group">
			<label for="OpcionValor">Valor</label>
			<textarea class="form-control" name="OpcionValor" rows="8" required><?php echo $opcion['OPCION_VALOR']; ?></textarea>
		</div>
		<div class="form-group">
			<label for="OpcionInput">Input</label>
			<select class="form-control" name="OpcionInput">
				<option value="varchar" <?php if($opcion['OPCION_INPUT']=='varchar'){ echo 'selected';} ?>>Campo de texto</option>
				<option value="text" <?php if($opcion['OPCION_INPUT']=='text'){ echo 'selected';} ?>>Área de texto</option>
				<option value="editor" <?php if($opcion['OPCION_INPUT']=='editor'){ echo 'selected';} ?>>Editor de texto</option>
				<option value="boolean" <?php if($opcion['OPCION_INPUT']=='boolean'){ echo 'selected';} ?>>Interruptor</option>
			</select>
		</div>
		<div class="form-group">
			<label for="OpcionTipo">Tipos: <?php $i=0; foreach($grupos_opciones as $grupo){ echo $grupo->OPCION_TIPO.' | '; }?></label>
			<input type="text" class="form-control" name="OpcionTipo" value="<?php echo $opcion['OPCION_TIPO']; ?>" required>
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
