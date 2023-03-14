<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12 col-md-8">
			<div>
				<form class="row justify-content-end" action="<?php echo base_url('index.php/lista_usuarios/notificaciones'); ?>" method="get">
					
					<div class="col-12 col-md-3">
						<select name="mostrar" class="form-control">
							<option value="todo">Todas las notificaciones</option>
							<option value="pendientes">Solo no leidos</option>
						</select>
					</div>
					<div class="col-12 col-md-3">
						<input type="text" name="busqueda" class="form-control" placeholder="Búsqueda" aria-label="">
					</div>
					<div class="col-12 col-md-2">
						<button type="submit" class="btn btn-primary w-100"> <i class="fa fa-search"></i> Buscar</button>
					</div>
				</form>
				<ul class="list-inline my-3">
					<li class="list-inline-item"><a href="<?php echo base_url('index.php/lista_usuarios/leer_todas_las_notificaciones'); ?>" > <i class="fa fa-envelope-open"></i> Marcar todo como leido </a></li>
					<li class="list-inline-item"><a href="<?php echo base_url('index.php/lista_usuarios/borrar_todas_las_notificaciones'); ?>" > <i class="fa fa-trash"></i> Borrar todas las notificaciones </a></li>
				</ul>
			</div>
			<hr>
			<ul class="list-unstyled lista_tareas <?php echo $modo; ?>">
				<?php foreach ($notificaciones as $notificacion) { ?>
				 <li class="p-2">
				 <a href="<?php echo base_url('index.php/lista_usuarios/leer_notificaciones?id='.$notificacion->ID); ?>" <?php if($notificacion->ESTADO=='leido'){ echo 'style="color: #AAAAAA"'; } ?>>
				 <?php if($notificacion->ESTADO=='leido'){ echo '<i class="fa fa-envelope-open"></i>'; }else{ echo '<i class="fa fa-envelope"></i>';} ?>
				 <?php echo $notificacion->NOTIFICACION_CONTENIDO; ?></a>
				</li>
				<?php } ?>
			</ul>
			<hr>
			<?php if($cantidad_paginas>1){ ?>
				<div class="row justify-content-md-center">
					<div class="col-2">
						<a href="<?php echo base_url('index.php/lista_usuarios/notificaciones?'.$consulta_anterior); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == 1){ echo 'disabled'; } ?>"> <i class="fa fa-chevron-left"></i> Anterior</a>
					</div>
					<div class="col-2">
						<form class="enviar_enter" action="<?php echo base_url('index.php/lista_usuarios/notificaciones'); ?>" method="get">
							<input type="hidden" name="mostrar_por_pagina" value="<?php echo $consulta['mostrar_por_pagina'] ?>">
							<div class="form-group">
								<div class="input-group">
									<input type="number" class="form-control" name="pagina" value="<?php echo $pagina; ?>" min="1" max="<?php echo $cantidad_paginas; ?>">
									<div class="input-group-append">
										<span class="input-group-text">/<?php echo $cantidad_paginas; ?></span>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-2">
						<a href="<?php echo base_url('index.php/lista_usuarios/notificaciones?'.$consulta_siguiente); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == $cantidad_paginas){ echo 'disabled'; } ?>"> Siguiente <i class="fa fa-chevron-right"></i> </a>
					</div>
				</div>
			<?php } ?>
		</div>
	</div>
</div>
