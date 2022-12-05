<div class="contenido-principal">
	<form action="<?php echo base_url('areas/actualizar') ?>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="Identificador" value="<?php echo $area['ID_AREA']; ?>">
		<input type="hidden" name="consulta" value="<?php echo verificar_variable('GET','consulta',''); ?>">
		<input type="hidden" name="ImagenActual" value="<?php echo $area['IMAGEN'] ?>">
		<input type="hidden" name="ImagenFondoActual" value="<?php echo $area['IMAGEN_FONDO'] ?>">
		<input type="hidden" name="Orden" value="<?php echo $area['ORDEN'] ?>">
		<input type="hidden" name="Tipo" value="<?php echo $area['TIPO'] ?>">
		<input type="hidden" name="Meta[autor]" value="<?php if(isset($meta_datos['autor'])){ echo $meta_datos['autor']; }else{ echo $_SESSION['usuario']['nombre'].' '.$_SESSION['usuario']['apellidos']; } ?>">
		<input type="hidden" name="areaColor" value="primary">
		<input type="hidden" class="form-control UrlAmigableResultado" name="Url" value="<?php echo $area['URL'] ?>" required>

		<div class="row mb-4">
			<div class="col-12 col-md-6 mb-4">
				<div class="form-group">
					<label for="AreaNombre">Nombre</label>
					<input type="text" class="form-control UrlAmigableOrigen" name="AreaNombre"
						data-tabla="areas"
						data-objeto="area"
						data-id="<?php echo $area['ID_AREA'] ?>"
						value="<?php echo $area['AREA_NOMBRE'] ?>" required>
				</div>
				<div class="form-group">
					<label for="AreaDescripcion">Descripción</label>
					<textarea name="AreaDescripcion" class="form-control TextEditorSmall" rows="8"><?php echo $area['AREA_DESCRIPCION'] ?></textarea>
				</div>
				<hr>
				<h6>Agregar areas</h6>
				<?php
					$usuarios = $this->GeneralModel->lista('usuarios','',['ESTADO'=>'activo'],'','','');
					$areas_usuarios = $this->GeneralModel->lista('areas_usuarios','',['ID_AREA'=>$area['ID_AREA']],'','','');
					$usuarios_asignados = array();
					foreach($areas_usuarios as $seleccion){
						$usuarios_asignados[] = $seleccion->ID_USUARIO;
					}
					?>
				<ul class="list-group">
					<?php foreach($usuarios as $usuario){ ?>
					<li  class="list-group-item text-dark">
							<label class="form-check-label" >
								<input type="checkbox" class="" name="areasUsuarios[]"
								value="<?php echo $usuario->ID_USUARIO; ?>"
								<?php if(in_array($usuario->ID_USUARIO,$usuarios_asignados)){ echo "checked"; } ?>
								>
								<?php echo $usuario->USUARIO_NOMBRE.''.$usuario->USUARIO_APELLIDOS; ?></label>
					</li>
				<?php } ?>
				</ul>
			</div>
			<div class="col-12 col-md-2 mb-4">
					<div class="form-group">
						<label for="Estado">Estado</label>
						<select class="form-control" name="Estado">
							<option value="activo" <?php if($area['ESTADO']=='activo'){ echo 'selected'; } ?>>Activo</option>
							<option value="inactivo" <?php if($area['ESTADO']=='inactivo'){ echo 'selected'; } ?>>Inactivo</option>
						</select>
					</div>
					<img src="<?php echo base_url('contenido/img/areas/'.$area['IMAGEN']); ?>" alt="" class="img-fluid mx-auto mb-2">
					<div class="form-group">
						<label for="Imagen">Imágen</label>
						<input type="file" class="form-control" name="Imagen" value="" accept="image/*">
					</div>
				<hr>
				<img src="<?php echo base_url('contenido/img/areas/'.$area['IMAGEN_FONDO']); ?>" alt="" class="img-fluid mx-auto mb-2">
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
</div>
