<div class="lista_equipos">

<form action="<?php echo base_url('lista_usuarios/preferencias') ?>" method="post" enctype="multipart/form-data">

	<input type="hidden" name="Identificador" value="<?php echo $usuario['ID_USUARIO']; ?>">

	<div class="row mb-4">

		<div class="col">

			<?php retro_alimentacion(); ?>

			<h5>Preferencias de Usuario</h5>

		</div>

	</div>
	<pre>
	<?php var_dump($preferencias); ?>
	</pre>
	<div class="row mb-4">

		<div class="col-12 col-md-3">

			<div class="form-group">
				<label for="Preferencias[modo_noche]">Modo noche</label>
				<select class="form-control" name="Preferencias[modo_noche]">
					<option value="no" <?php if(isset($_SESSION['usuario']['configuraciones']['modo_noche'])){ if($_SESSION['usuario']['configuraciones']['modo_noche']=='no'){ echo 'selected'; } } ?>>Apagado</option>
					<option value="si" <?php if(isset($_SESSION['usuario']['configuraciones']['modo_noche'])){ if($_SESSION['usuario']['configuraciones']['modo_noche']=='si'){ echo 'selected'; } } ?>>Activo</option>
				</select>
			</div>
			<button type="submit" class="btn btn-success w-100"> <i class="fa fa-save"></i> Actualizar</button>
		</div>

	</div>


</form>

</div>
