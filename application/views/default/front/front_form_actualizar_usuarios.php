<div class="lista_equipos">

<form action="<?php echo base_url('index.php/lista_usuarios/actualizar') ?>" method="post" enctype="multipart/form-data">

	<input type="hidden" name="consulta" value="<?php echo verificar_variable('GET','consulta',''); ?>">

	<input type="hidden" name="Identificador" value="<?php echo $usuario['ID_USUARIO']; ?>">

	<input type="hidden" name="Tipo" value="<?php echo $usuario['TIPO']; ?>">

	<input type="hidden" name="ImagenActual" value="<?php echo $usuario['IMAGEN'] ?>">

	<input type="hidden" name="ImagenFondoActual" value="<?php echo $usuario['IMAGEN_FONDO'] ?>">

	<input type="hidden" name="Meta[secreto]" value="<?php if(isset($meta_datos['secreto'])){ echo $meta_datos['secreto']; }else{ echo generador_aleatorio(6); } ?>">

	<div class="row mb-4">

		<div class="col-6">

			<h3>Usuarios</h3>

		</div>

		<!-- <div class="col-6">

			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>

		</div> -->

	</div>

	<div class="row mb-4">

		<div class="col">

			<?php retro_alimentacion(); ?>

			<h5>Actualizar Usuario</h5>

		</div>

	</div>

	<div class="row mb-4">

		<div class="col-12 col-md-3">
		<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario['IMAGEN']); ?>" alt="" class="img-fluid mx-auto mb-2">

		<div class="form-group">
			<label for="Imagen">Imágen</label>
			<input type="file" class="form-control" name="Imagen" value="" accept="image/*">
		</div>
		<hr>

			<div class="form-group">

				<label for="UsuarioNombre">Nombre</label>

				<input type="text" class="form-control" name="UsuarioNombre" value="<?php echo $usuario['USUARIO_NOMBRE']; ?>" required>

			</div>

			<div class="form-group">

				<label for="UsuarioApellidos">Apellidos</label>

				<input type="text" class="form-control" name="UsuarioApellidos" value="<?php echo $usuario['USUARIO_APELLIDOS']; ?>" >

			</div>

			

			<div class="form-group">

				<label for="UsuarioCorreo">Correo</label>

				<input type="text" class="form-control" name="UsuarioCorreo" value="<?php echo $usuario['USUARIO_CORREO']; ?>" required autocomplete="new-password">

			</div>

			<div class="form-group">
				<label for="UsuarioTelefono">Whatsapp</label>
				<input type="text" class="form-control" name="UsuarioTelefono" value="<?php echo $usuario['USUARIO_TELEFONO']; ?>">
				<div id="" class="form-text">Debe tener 12 dígitos sin espacios 525500000000</div>
			</div>
			<div class="form-group">

				<label for="Meta['curriculum']">Curriculum</label>

				<input type="text" class="form-control" name="Meta['curriculum']" value="<?php if(isset($meta_datos['curriculum'])){ echo $meta_datos['curriculum']; } ?>" >

			</div>
			<div class="form-group">

				<label for="UsuarioFechaNacimiento">Fecha Nacimiento</label>

				<input type="text" class="form-control datepicker" name="UsuarioFechaNacimiento" value="<?php echo date('d-m-Y', strtotime($usuario['USUARIO_FECHA_NACIMIENTO'])); ?>">

			</div>

			<input type="hidden" name="FechaRegistro" value="<?php echo date('d-m-Y'); ?>">
			<input type="hidden" name="UsuarioColor" value='primary'>

			<hr>
			<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario['IMAGEN_FONDO']); ?>" alt="" class="img-fluid mx-auto mb-2">
			<div class="form-group">
				<label for="ImagenFondo">Imágen Fondo <small class="text-danger"> Peso Máximo (<?php echo ini_get('upload_max_filesize'); ?>)</small></label>
				<input type="file" class="form-control" name="ImagenFondo" value="" accept="image/*">
			</div>

		</div>
		<div class="col-12 col-md-3">
		<div class="form-group">

		<label for="Estado">Estado</label>

		<select class="form-control" name="Estado">

			<option value="activo" <?php if($usuario['ESTADO']=='activo'){ echo 'checked'; } ?>>Activo</option>

			<option value="inactivo" <?php if($usuario['ESTADO']=='inactivo'){ echo 'checked'; } ?>>Inactivo</option>

		</select>

		</div>

		<small class="text-warning">Dejar los campos de contraseña vacíos a menos que se desee cambiar la contraseña</small>

			<div class="form-group">

				<label for="UsuarioPass">Contraseña</label>

				<input type="password" class="form-control" name="UsuarioPass" value="" autocomplete="new-password">

			</div>

			<div class="form-group">

				<label for="UsuarioPassConf">Confirmar Contraseña</label>

				<input type="password" class="form-control" name="UsuarioPassConf" value="" autocomplete="new-password">

			</div>

		</div>

		<div class="col-12 col-md-3">
			<h6>Areas del usuario</h6>

			<?php
				$areas = $this->GeneralModel->lista('areas','',['ESTADO'=>'activo'],'','','');
				$areas_usuarios = $this->GeneralModel->lista('areas_usuarios','',['ID_USUARIO'=>$usuario['ID_USUARIO']],'','','');
				$usuarios_asignados = array();
				foreach($areas_usuarios as $seleccion){
					$usuarios_asignados[] = $seleccion->ID_AREA;
				}
				?>
			<ul class="list-group">
				<?php foreach($areas as $area){ ?>
				<li  class="list-group-item text-dark">
						<label class="form-check-label" >
							<input type="checkbox" class="" name="AreasUsuarios[]"
							value="<?php echo $area->ID_AREA; ?>"
							<?php if(in_array($area->ID_AREA,$usuarios_asignados)){ echo "checked"; } ?>
							>
							<?php echo $area->AREA_NOMBRE; ?></label>
				</li>
			<?php } ?>
			</ul>

		</div>

		<div class="col-12 col-md-3">
					
		</div>

	</div>

	<div class="row">

		<div class="col">

			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>

		</div>

	</div>

</form>

</div>

