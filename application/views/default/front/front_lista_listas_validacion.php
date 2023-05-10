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
				<li class="list-group-item d-flex justify-content-between"><?php echo $lista->TITULO; ?> <div class="btn-group"> <a href="<?php echo base_url('index.php/listas/dimensiones?id='.$lista->ID_LISTA); ?>" class="btn btn-sm btn-outline-primary"> Ver dimensiones</a> <button data-enlace="<?php echo base_url('index.php/listas/borrar_lista?id='.$lista->ID_LISTA); ?>" class="btn btn-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar</button></div></li>
			<?php } ?>
			</ul>
		</div>
	</div>
</div>
