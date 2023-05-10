<a href="<?php echo base_url('index.php/areas/crear?tipo='.$tipo."&consulta=".base64_encode(json_encode($consulta))); ?>" class="btn btn-success btn-circulo-flotante"> <i class="fa fa-plus"></i></a>
<div class="lista_areas">
	<div class="row mt-4">
		<?php foreach($areas as $area){ ?>
		<div class="col-12 col-md-4">
			<div class="area_contenedor pl-3">
				<div class="proyecto p-0">
					<a href="<?php echo base_url('index.php/areas/detalles?id='.$area->ID_AREA); ?>">
						<div class="bg-image d-flex align-items-center m-0 p-4" style="background-image: url(<?php echo base_url('contenido/img/areas/'.$area->IMAGEN_FONDO); ?>); min-height:120px;">
							<img src="<?php echo base_url('contenido/img/areas/'.$area->IMAGEN); ?>" class="rounded-circle mx-1" width="50">
							<h3 class="h5"> <?php echo $area->AREA_NOMBRE; ?></h3>
						</div>
					</a>
				</div>
				<?php $areas_hijas = $this->GeneralModel->lista('areas','',['ID_PADRE'=>$area->ID_AREA,'ESTADO'=>'activo'],'','',''); ?>
				<?php foreach($areas_hijas as $area_hija){ ?>
					<div class="area_contenedor py-3 border-left border-bottom border-primary pl-3" style="transform: translateX(10%);">
						<div class="proyecto p-0">
							<a href="<?php echo base_url('index.php/areas/detalles?id='.$area_hija->ID_AREA); ?>">
								<div class="bg-image d-flex align-items-center m-0 p-4" style="background-image: url(<?php echo base_url('contenido/img/areas/'.$area_hija->IMAGEN_FONDO); ?>); min-height:120px;">
									<img src="<?php echo base_url('contenido/img/areas/'.$area_hija->IMAGEN); ?>" class="rounded-circle mx-1" width="50">
									<h3 class="h5"> <?php echo $area_hija->AREA_NOMBRE; ?></h3>
								</div>
							</a>
						</div>
						<?php $areas_hijas_2 = $this->GeneralModel->lista('areas','',['ID_PADRE'=>$area_hija->ID_AREA,'ESTADO'=>'activo'],'','',''); ?>
						<?php foreach($areas_hijas_2 as $area_hija_2){ ?>
							<div class="area_contenedor pt-3 border-left border-bottom border-primary pl-3" style="transform: translateX(10%);">
								<div class="proyecto p-0">
									<a href="<?php echo base_url('index.php/areas/detalles?id='.$area_hija_2->ID_AREA); ?>">
										<div class="bg-image d-flex align-items-center m-0 p-4" style="background-image: url(<?php echo base_url('contenido/img/areas/'.$area_hija_2->IMAGEN_FONDO); ?>); min-height:120px;">
											<img src="<?php echo base_url('contenido/img/areas/'.$area_hija_2->IMAGEN); ?>" class="rounded-circle mx-1" width="50">
											<h3 class="h5"> <?php echo $area_hija_2->AREA_NOMBRE; ?></h3>
										</div>
									</a>
								</div>
							</div>
						<?php } ?>
					</div>
				<?php } ?>
			</div>
		</div>
		<?php } ?>
	</div>
	<?php if($cantidad_paginas>1){ ?>
	<div class="row justify-content-md-center">
		<div class="col-2">
			<a href="<?php echo base_url('index.php/areas?'.$consulta_anterior); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == 1){ echo 'disabled'; } ?>"> <i class="fa fa-chevron-left"></i> Anterior</a>
		</div>
		<div class="col-2">
			<form class="enviar_enter" action="<?php echo base_url('index.php/areas'); ?>" method="get">
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
			<a href="<?php echo base_url('index.php/areas?'.$consulta_siguiente); ?>" class="btn btn-outline-primary btn-block <?php if($pagina == $cantidad_paginas){ echo 'disabled'; } ?>"> Siguiente <i class="fa fa-chevron-right"></i> </a>
		</div>
	</div>
	<?php } ?>
</div>
