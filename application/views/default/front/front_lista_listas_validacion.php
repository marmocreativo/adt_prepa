<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12 col-md-8">
			<div class="bg-light p-4">
				<form action="<?php echo base_url('index.php/listas'); ?>" class="d-flex justify-content-end" method="get">
					<div class="form-group me-3">
						<input type="text" class="form-control" name="Busqueda" value="<?php echo verificar_variable('GET','Busqueda','') ?>" placeholder="Buscar">
					</div>
					<button type="submit" class="btn btn-success"> <i class="fa fa-search"></i> Buscar</button>
				</form>
			</div>
			<ul class="list-group">
			<?php foreach($listas as $lista){ ?>
				<li class="list-group-item d-flex justify-content-between">
					<?php $conteo_dimensiones = $this->GeneralModel->conteo_elementos('validacion_dimension',['ID_LISTA'=>$lista->ID_LISTA]); ?>
					<span><?php echo $lista->TITULO; ?> (<?php echo $conteo_dimensiones; ?> Dimensiones)
					    
					</span>
					<div class="edicion-lista">
						<a href="<?php echo base_url('index.php/listas/dimensiones?id='.$lista->ID_LISTA); ?>" class="btn">Editar lista</a>
						<button type="button" class="btn ml-2" data-bs-toggle="modal" data-bs-target="#copiar_lista_<?php echo $lista->ID_LISTA; ?>" data-bs-toggle="tooltip" data-bs-placement="top" title="Copiar lista">
						<i class="fa-regular fa-copy"></i>
						</button>
						<button data-enlace="<?php echo base_url('index.php/listas/borrar_lista?id='.$lista->ID_LISTA); ?>" class="btn ml-2 border-danger borrar_entrada" data-bs-toggle="tooltip" data-bs-placement="top" title="Borrar lista"> <i class="fas fa-trash"></i></button>
					</div>
					
					<div class="modal fade" id="copiar_lista_<?php echo $lista->ID_LISTA; ?>" tabindex="-1" aria-labelledby="copiar_lista_<?php echo $lista->ID_LISTA; ?>" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<form action="<?php echo base_url('index.php/listas/copiar'); ?>" method='post'>
										<input type="hidden" name="Identificador" value="<?php echo $lista->ID_LISTA; ?>">
										<div class="form-group">
											<label for="Titulo">Nuevo Titulo</label>
											<input type="text" class="form-control" name="Titulo" value="<?php echo $lista->TITULO; ?>">
										</div>
										<button type="submit" class="btn btn-primary">Copiar</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</li>
			<?php } ?>
			</ul>
		</div>
		<div class="col-12 col-md-4">
		<p>Estas listas se pueden asignar a los proyectos para validar distintos parámetros</p>
			<div class="p-4 border border-primary">
				<form action="<?php echo base_url('index.php/listas/crear'); ?>" method='post'>
				<input type="hidden" name="Descripcion" value="">
					<div class="row">
						<div class="col-9">
							<div class="form-group">
								<input type="text" name="Titulo" class="form-control" placeholder='Título de la lista de cotejo' required>
							</div>
						</div>
						<div class="col-3">
							<button type="submit" class="btn btn-success w-100">Crear lista</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
