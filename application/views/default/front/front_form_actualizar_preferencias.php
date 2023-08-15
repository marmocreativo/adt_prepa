<div class="lista_equipos">

<form action="<?php echo base_url('index.php/lista_usuarios/preferencias') ?>" method="post" enctype="multipart/form-data">

	<input type="hidden" name="Identificador" value="<?php echo $usuario['ID_USUARIO']; ?>">

	<div class="row mb-4">

		<div class="col">

			<?php retro_alimentacion(); ?>

			<h5>Preferencias de Usuario</h5>

		</div>

	</div>
	<pre>
	<?php
	$arreglo_preferencias = array();
	foreach($preferencias as $preferencia){
		$arreglo_preferencias[$preferencia->CONFIGURACION] = $preferencia->VALOR;
	}
	?>
	</pre>
	<div class="row mb-4">

		<div class="col-12 col-md-3">

			<div class="form-group">
				<label for="Preferencias[modo_noche]">Modo noche</label>
				<select class="form-control" name="Preferencias[modo_noche]">
					<option value="no" <?php if(isset($arreglo_preferencias['modo_noche'])){ if($arreglo_preferencias['modo_noche']=='no'){ echo 'selected'; } } ?>>Apagado</option>
					<option value="si" <?php if(isset($arreglo_preferencias['modo_noche'])){ if($arreglo_preferencias['modo_noche']=='si'){ echo 'selected'; } } ?>>Activo</option>
				</select>
			</div>
			<div class="form-group">
				<label for="Preferencias[notificaciones]">Recibir notificaciones por</label>
				<select class="form-control" name="Preferencias[notificaciones]">
					<option value="correo_y_sistema" <?php if(isset($arreglo_preferencias['notificaciones'])){ if($arreglo_preferencias['notificaciones']=='correo_y_sistema'){ echo 'selected'; } } ?>>Correo y sistema</option>
					<option value="sistema" <?php if(isset($arreglo_preferencias['notificaciones'])){ if($arreglo_preferencias['notificaciones']=='sistema'){ echo 'selected'; } } ?>>Solo sistema</option>
				</select>
			</div>
			
			<hr>
			<button type="submit" class="btn btn-success w-100"> <i class="fa fa-save"></i> Actualizar</button>
		</div>

	</div>


</form>

</div>
