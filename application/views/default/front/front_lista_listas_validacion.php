<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12 col-md-8">
            <h3>Estas listas se pueden asignar a los proyectos para validar distintos parámetros</h3>
			<div class="p-4 border border-primary">
				<form action="<?php echo base_url('index.php/listas/crear'); ?>" method='post'>
				<input type="hidden" name="Descripcion" value="">
					<div class="row">
						<div class="col-9">
							<div class="form-group">
								<input type="text" name="Titulo" class="form-control" placeholder='Título de la lista de cotejo'>
							</div>
						</div>
						<div class="col-3">
							<button type="submit" class="btn btn-success w-100">Crear lista</button>
						</div>
					</div>
				</form>
			</div>
			<hr>
			<ul class="list-group">
			<?php foreach($listas as $lista){ ?>
				<li class="list-group-item d-flex justify-content-between">
					<?php echo $lista->TITULO; ?>
					<div class="btn-group">
						<a href="<?php echo base_url('index.php/listas/dimensiones?id='.$lista->ID_LISTA); ?>" class="btn btn-sm btn-outline-primary"> Ver dimensiones</a>
						<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editar_lista_<?php echo $lista->ID_LISTA; ?>">
						Editar
						</button>
						<button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#copiar_lista_<?php echo $lista->ID_LISTA; ?>">
						Copiar
						</button>
						<button data-enlace="<?php echo base_url('index.php/listas/borrar_lista?id='.$lista->ID_LISTA); ?>" class="btn btn-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar</button>
					</div>
					<div class="modal fade" id="editar_lista_<?php echo $lista->ID_LISTA; ?>" tabindex="-1" aria-labelledby="editar_lista_<?php echo $lista->ID_LISTA; ?>" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<form action="<?php echo base_url('index.php/listas/actualizar'); ?>" method='post'>
										<input type="hidden" name="Identificador" value="<?php echo $lista->ID_LISTA; ?>">
										<div class="form-group">
											<label for="Titulo">Titulo</label>
											<input type="text" class="form-control" name="Titulo" value="<?php echo $lista->TITULO; ?>">
										</div>
										<div class="form-group">
											<label for="Descripcion">Descripción</label>
											<textarea name="Descripcion" class="form-control" rows="5"><?php echo $lista->DESCRIPCION; ?></textarea>
										</div>
										<button type="submit" class="btn btn-primary">Actualizar</button>
									</form>
								</div>
							</div>
						</div>
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
	</div>
</div>
