<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12 col-md-8">
			<ul class="list-group">
				<?php foreach ($notificaciones as $notificacion) { ?>
				 <li class="list-group-item"> <a href="<?php echo $notificacion->ENLACE; ?>"> <?php echo $notificacion->NOTIFICACION_CONTENIDO; ?></a> </li>
				<?php } ?>
			</ul>
		</div>
	</div>
</div>
