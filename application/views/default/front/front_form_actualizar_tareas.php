<div class="contenido_principal">
<form action="<?php echo base_url('index.php/admin/tareas/actualizar') ?>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="Identificador" value="<?php echo $opcion['ID']; ?>">
	<input type="hidden" name="consulta" value="<?php echo verificar_variable('GET','consulta',''); ?>">
	<input type="hidden" name="ImagenActual" value="<?php echo $tarea['IMAGEN'] ?>">
	<input type="hidden" name="ImagenFondoActual" value="<?php echo $tarea['IMAGEN_FONDO'] ?>">
	<input type="hidden" name="Orden" value="<?php echo $tarea['ORDEN'] ?>">
	<input type="hidden" name="TareaColor" value="primary">
	<div class="row mb-4">
		<div class="col-8">
			<h3>Tareas</h3>
		</div>
		<div class="col-4">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col">
			<?php retro_alimentacion(); ?>
			<h5>Actualizar Tarea</h5>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col-12 col-md-9">
			<div class="form-group">
				<label for="TareaNombre">Nombre</label>
				<input type="text" class="form-control UrlAmigableOrigen" name="TareaNombre"
					data-tabla="tareas"
					data-objeto="tarea"
					data-id="<?php echo $tarea['ID_TAREA'] ?>"
					value="<?php echo $tarea['TAREA_TITULO'] ?>" required>
			</div>
			<div class="form-group">
				<label for="Url">URL Amigable <small class="text-warning">Auto completado por el sistema</small> </label>
				<input type="text" class="form-control UrlAmigableResultado" name="Url" value="<?php echo $tarea['URL'] ?>" required>
			</div>
			<div class="form-group">
				<label for="TareaDescripcion">Descripción</label>
				<textarea name="TareaDescripcion" class="form-control" rows="8"><?php echo $tarea['TAREA_DESCRIPCION'] ?></textarea>
			</div>
		</div>
		<div class="col-12 col-md-3">
			<div class="form-group">
				<label for="Estado">Estado</label>
				<select class="form-control" name="Estado">
					<option value="activo" <?php if($tarea['ESTADO']=='activo'){ echo 'selected'; } ?>>Activo</option>
					<option value="inactivo" <?php if($tarea['ESTADO']=='inactivo'){ echo 'selected'; } ?>>Inactivo</option>
				</select>
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
