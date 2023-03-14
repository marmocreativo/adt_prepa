<div class="row mt-3">
		<div class="col-12 col-md-8">
			<div>
				<form class="row justify-content-end" action="<?php echo base_url('index.php/proyectos'); ?>" method="get">
					<!--
					<div class="col-12 col-md-3">
						<select name="todo" class="form-control">
							<option value="si">Todos los proyectos</option>
							<option value="no">Solo mis proyectos</option>
						</select>
					</div>
					-->
					<div class="col-12 col-md-3">
						<input type="text" name="busqueda" class="form-control" placeholder="Búsqueda" aria-label="">
					</div>
					<div class="col-12 col-md-2">
						<button type="submit" class="btn btn-primary w-100"> <i class="fa fa-search"></i> Buscar</button>
					</div>
					<div class="col-12 col-md-3 border-left">
					<a href="<?php echo base_url('index.php/proyectos/crear?id_equipo='); ?>" class="btn btn-success w-100"> <i class="fa fa-plus"></i> Nuevo proyecto </a>
					</div>
				</form>
			</div>
			<hr>
			<?php $this->load->view('default'.$dispositivo.'/front/widgets/lista_proyectos', $proyectos); ?>
			<?php if($cantidad_paginas>1){ ?>
				<div class="row justify-content-md-center">
					<div class="col-2">
						<a href="<?php echo base_url('index.php/proyectos?'.$consulta_anterior); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == 1){ echo 'disabled'; } ?>"> <i class="fa fa-chevron-left"></i> Anterior</a>
					</div>
					<div class="col-2">
						<form class="enviar_enter" action="<?php echo base_url('index.php/proyectos'); ?>" method="get">
							<input type="hidden" name="orden" value="<?php echo $consulta['orden'] ?>">
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
						<a href="<?php echo base_url('index.php/proyectos?'.$consulta_siguiente); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == $cantidad_paginas){ echo 'disabled'; } ?>"> Siguiente <i class="fa fa-chevron-right"></i> </a>
					</div>
				</div>
			<?php } ?>
		</div>
		<div class="col-12 col-md-4">

		</div>
</div>
<a href="<?php echo base_url('index.php/proyectos/crear?id_equipo='); ?>" class="btn btn-success btn-round btn-circulo-flotante"> <i class="fa fa-plus"></i> </a>

