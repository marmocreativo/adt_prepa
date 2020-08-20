<form action="<?php echo base_url('admin/equipos/actualizar') ?>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="Identificador" value="<?php echo $opcion['ID']; ?>">
	<input type="hidden" name="consulta" value="<?php echo verificar_variable('GET','consulta',''); ?>">
	<input type="hidden" name="ImagenActual" value="<?php echo $equipo['IMAGEN'] ?>">
	<input type="hidden" name="ImagenFondoActual" value="<?php echo $equipo['IMAGEN_FONDO'] ?>">
	<input type="hidden" name="Orden" value="<?php echo $equipo['ORDEN'] ?>">
	<div class="row mb-4">
		<div class="col-8">
			<h3>Equipos</h3>
		</div>
		<div class="col-4">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col">
			<?php retro_alimentacion(); ?>
			<h5>Actualizar Equipo</h5>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col-12 col-md-9">
			<div class="form-group">
				<label for="EquipoNombre">Nombre</label>
				<input type="text" class="form-control UrlAmigableOrigen" name="EquipoNombre"
					data-tabla="equipos"
					data-objeto="equipo"
					data-id="<?php echo $equipo['ID_EQUIPO'] ?>"
					value="<?php echo $equipo['EQUIPO_NOMBRE'] ?>" required>
			</div>
			<div class="form-group">
				<label for="Url">URL Amigable <small class="text-warning">Auto completado por el sistema</small> </label>
				<input type="text" class="form-control UrlAmigableResultado" name="Url" value="<?php echo $equipo['URL'] ?>" required>
			</div>
			<div class="form-group">
				<label for="EquipoDescripcion">Descripción</label>
				<textarea name="EquipoDescripcion" class="form-control" rows="8"><?php echo $equipo['EQUIPO_DESCRIPCION'] ?></textarea>
			</div>
			<div class="row">
				<?php
				$colores = array('indigo', 'blue', 'indigo','purple','pink','red','orange','yellow','green','teal','cyan','white','gray','gray-dark','primary','secondary','success','info','warning','danger','light','dark');
				?>
				<?php foreach($colores as $color){ ?>
				<div class="col-3 col-sm-2 col-md-1">
					<label for="EquipoColor<?php echo $color; ?>" title="<?php echo $color; ?>">
					<div class="card">
						<div class="card-body bg-<?php echo $color; ?>">
						</div>
						<div class="card-footer">
							<input  type="radio" name="EquipoColor" id="EquipoColor<?php echo $color; ?>" value="<?php echo $color; ?>" <?php if($equipo['COLOR']==$color){ echo 'checked'; } ?>>
						</div>
					</div>
					</label>
				</div>
			<?php } ?>
			</div>
			<!--
			<div class="form-group">
				<label for="Meta[color]">Color</label>
				<input type="text" class="form-control ColorPicker" autocomplete="no" name="Meta[color]" value="<?php if(isset($meta_datos['color'])){ echo $meta_datos['color']; } ?>">
			</div>
			<div class="form-group">
				<label for="Meta[icono]">Icono</label>
				<input type="text" class="form-control IconPicker" autocomplete="no" name="Meta[icono]" value="<?php if(isset($meta_datos['icono'])){ echo $meta_datos['icono']; } ?>">
			</div>
			-->
		</div>
		<div class="col-12 col-md-3">
			<div class="form-group">
				<label for="Estado">Estado</label>
				<select class="form-control" name="Estado">
					<option value="activo" <?php if($equipo['ESTADO']=='activo'){ echo 'selected'; } ?>>Activo</option>
					<option value="inactivo" <?php if($equipo['ESTADO']=='inactivo'){ echo 'selected'; } ?>>Inactivo</option>
				</select>
			</div>
			<hr>
				<img src="<?php echo base_url('contenido/img/equipos/'.$equipo['IMAGEN']); ?>" alt="" class="img-fluid mx-auto mb-2">
				<div class="form-group">
					<label for="Imagen">Imágen</label>
					<input type="file" class="form-control" name="Imagen" value="" accept="image/*">
				</div>
			<hr>
			<img src="<?php echo base_url('contenido/img/equipos/'.$equipo['IMAGEN_FONDO']); ?>" alt="" class="img-fluid mx-auto mb-2">
			<div class="form-group">
				<label for="ImagenFondo">Imágen Fondo <small class="text-danger"> Peso Máximo (<?php echo ini_get('upload_max_filesize'); ?>)</small></label>
				<input type="file" class="form-control" name="ImagenFondo" value="" accept="image/*">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
</form>
