<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12 col-md-8">
			<ul class="list-unstyled lista_tareas <?php echo $modo; ?>">
				<?php foreach ($notificaciones as $notificacion) { ?>
				 <li class="p-4" <?php if($notificacion->ESTADO=='leido'){ echo 'style="text-decoration: line-through;"'; } ?>> <a href="<?php echo base_url('lista_usuarios/leer_notificaciones?id='.$notificacion->ID); ?>"> <?php echo $notificacion->NOTIFICACION_CONTENIDO; ?></a> </li>
				<?php } ?>
			</ul>
		</div>
	</div>
</div>
