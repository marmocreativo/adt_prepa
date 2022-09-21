<div class="contenido_principal p-3">
<form action="<?php echo base_url('lista_usuarios/crear') ?>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="Tipo" value="usuario">
	<input type="hidden" name="consulta" value="<?php echo verificar_variable('GET','consulta',''); ?>">
	<input type="hidden" name="Meta[secreto]" value="<?php if(isset($meta_datos['secreto'])){ echo $meta_datos['secreto']; }else{ echo generador_aleatorio(6); } ?>">
	<div class="row mb-4">
		<div class="col-6 col-md-8">
			<h3>Usuarios</h3>
		</div>
		<div class="col-6 col-md-4">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col">
			<?php retro_alimentacion(); ?>
			<h5>Crear Usuario</h5>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col-12 col-md-8">
			<div class="form-group">
				<label for="UsuarioNombre">Nombre</label>
				<input type="text" class="form-control" name="UsuarioNombre" value="" required>
			</div>
			<div class="form-group">
				<label for="UsuarioApellidos">Apellidos</label>
				<input type="text" class="form-control" name="UsuarioApellidos" value="" >
			</div>
			<div class="form-group">
				<label for="UsuarioCorreo">Correo</label>
				<input type="text" class="form-control" name="UsuarioCorreo" value="" required>
			</div>
			<div class="form-group">
				<label for="UsuarioPass">Contraseña</label>
				<input type="password" class="form-control" name="UsuarioPass" value="" required>
			</div>
			<div class="form-group">
				<label for="UsuarioPassConf">Confirmar Contraseña</label>
				<input type="password" class="form-control" name="UsuarioPassConf" value="" required>
			</div>
			<div class="form-group">
				<label for="UsuarioTelefono">Teléfono</label>
				<input type="text" class="form-control" name="UsuarioTelefono" value="">
			</div>
			<div class="form-check">
				<label class="form-check-label" for="UsuarioListaDeCorreo">
			 <input type="checkbox" class="form-check-input" name="UsuarioListaDeCorreo">
			 Lista de Correo</label>
		 </div>
		</div>
		<div class="col-12 col-md-4">
			<div class="form-group">
				<label for="Estado">Estado</label>
				<select class="form-control" name="Estado">
					<option value="activo">Activo</option>
					<option value="inactivo">Inactivo</option>
				</select>
			</div>
			<div class="form-group">
				<label for="UsuarioFechaNacimiento">Fecha Nacimiento</label>
				<input type="text" class="form-control datepicker" name="UsuarioFechaNacimiento" value="">
			</div>
			<input type="hidden" name="FechaRegistro" value="<?php echo date('d-m-Y'); ?>">
			<hr>
			<h6>Grupos / Categorías</h6>
			<?php $categorias_1 = $this->GeneralModel->lista('categorias','',['TIPO'=>$tipo,'CATEGORIA_PADRE'=>0],'','',''); ?>
			<ul>
				<?php foreach($categorias_1 as $categoria){ ?>
				<li>
						<label class="form-check-label" >
							<input type="checkbox" class="form-check-input" name="CategoriasObjeto[]" value="<?php echo $categoria->ID_CATEGORIA; ?>">
							<?php echo $categoria->CATEGORIA_NOMBRE; ?></label>
					<?php $categorias_2 = $this->GeneralModel->lista('categorias','',['TIPO'=>$tipo,'CATEGORIA_PADRE'=>$categoria->ID_CATEGORIA],'','',''); ?>
					<?php if(!empty($categorias_2)){ ?>
						<ul>
						<?php foreach($categorias_2 as $categoria){ ?>
							<li>
								<label class="form-check-label" >
									<input type="checkbox" class="form-check-input" name="CategoriasObjeto[]" value="<?php echo $categoria->ID_CATEGORIA; ?>">
									<?php echo $categoria->CATEGORIA_NOMBRE; ?></label>
								<?php $categorias_3 = $this->GeneralModel->lista('categorias','',['TIPO'=>$tipo,'CATEGORIA_PADRE'=>$categoria->ID_CATEGORIA],'','',''); ?>
								<?php if(!empty($categorias_3)){ ?>
									<ul>
									<?php foreach($categorias_3 as $categoria){ ?>
										<li>
											<label class="form-check-label" >
												<input type="checkbox" class="form-check-input" name="CategoriasObjeto[]" value="<?php echo $categoria->ID_CATEGORIA; ?>">
												<?php echo $categoria->CATEGORIA_NOMBRE; ?></label>
										</li>
									<?php }// Bucle Categorias Nivel 3 ?>
									</ul>
								<?php }// Condición subcategorias vacias 3?>
							</li>
						<?php }// Bucle Categorias Nivel 2 ?>
						</ul>
					<?php }// Condición subcategorias vacias 2?>
				</li>
			<?php } ?>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
</form>
</div>
