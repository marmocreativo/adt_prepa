<form action="<?php echo base_url('admin/usuarios/actualizar') ?>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="consulta" value="<?php echo verificar_variable('GET','consulta',''); ?>">
	<input type="hidden" name="Identificador" value="<?php echo $usuario['ID_USUARIO']; ?>">
	<input type="hidden" name="Tipo" value="<?php echo $usuario['TIPO']; ?>">
	<input type="hidden" name="Meta[secreto]" value="<?php if(isset($meta_datos['secreto'])){ echo $meta_datos['secreto']; }else{ echo generador_aleatorio(6); } ?>">
	<div class="row mb-4">
		<div class="col-8">
			<h3>Usuarios</h3>
		</div>
		<div class="col-4">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col">
			<?php retro_alimentacion(); ?>
			<h5>Actualizar Usuario</h5>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col-12 col-md-8">
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
			<small class="text-warning">Dejar los campos de contraseña vacíos a menos que se desee cambiar la contraseña</small>
			<div class="form-group">
				<label for="UsuarioPass">Contraseña</label>
				<input type="password" class="form-control" name="UsuarioPass" value="" autocomplete="new-password">
			</div>
			<div class="form-group">
				<label for="UsuarioPassConf">Confirmar Contraseña</label>
				<input type="password" class="form-control" name="UsuarioPassConf" value="" autocomplete="new-password">
			</div>
			<div class="form-group">
				<label for="UsuarioTelefono">Teléfono</label>
				<input type="text" class="form-control" name="UsuarioTelefono" value="<?php echo $usuario['USUARIO_TELEFONO']; ?>">
			</div>
			<div class="form-check">
				<label class="form-check-label" for="UsuarioListaDeCorreo" >
			 <input type="checkbox" class="form-check-input" name="UsuarioListaDeCorreo" <?php if($usuario['USUARIO_LISTA_DE_CORREO']=='si'){ echo 'checked'; } ?>>
			 Lista de Correo</label>
		 </div>
		</div>
		<div class="col-12 col-md-4">
			<div class="form-group">
				<label for="Estado">Estado</label>
				<select class="form-control" name="Estado">
					<option value="activo" <?php if($usuario['ESTADO']=='activo'){ echo 'checked'; } ?>>Activo</option>
					<option value="inactivo" <?php if($usuario['ESTADO']=='inactivo'){ echo 'checked'; } ?>>Inactivo</option>
				</select>
			</div>
			<div class="form-group">
				<label for="UsuarioFechaNacimiento">Fecha Nacimiento</label>
				<input type="text" class="form-control datepicker" name="UsuarioFechaNacimiento" value="<?php echo $usuario['USUARIO_FECHA_NACIMIENTO']; ?>">
			</div>
			<input type="hidden" name="FechaRegistro" value="<?php echo date('d-m-Y'); ?>">
			<hr>
			<h6>Grupos / Categorías</h6>
			<?php
			$categorias_seleccionadas = $this->GeneralModel->lista('categorias_objetos','',['TIPO'=>$tipo,'ID_OBJETO'=>$usuario['ID_USUARIO']],'','','');
				$id_categorias_seleccionadas = array();
				foreach($categorias_seleccionadas as $categoria){
					$id_categorias_seleccionadas[] = $categoria->ID_CATEGORIA;
				}
				multinivel($tipo,'checkbox',$id_categorias_seleccionadas,0);
			?>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
</form>
