<div class="contenido_principal">
	<div class="encabezado_proyecto bg-<?php echo $equipo['COLOR']; ?> p-2">
		<div class="row">
			<div class="col-12">
				<h1 class="h4 mt-2"><img src="<?php echo base_url('contenido/img/equipos/'.$equipo['IMAGEN']); ?>" class="rounded-circle float-left mr-2" width="50"><?php echo $equipo['EQUIPO_NOMBRE']; ?></h1>
			</div>
		</div>
	</div>
	<div class="row py-3">
		<div class="col">
			<?php retro_alimentacion(); ?>
			<?php echo $equipo['EQUIPO_DESCRIPCION']; ?>
		</div>
		<div class="col-12 my-3">
			<a href="<?php echo base_url('admin/equipos/actualizar/?id='.$equipo['ID_EQUIPO']); ?>" class="btn btn-outline-warning btn-block"> <i class="fa fa-pencil-alt"></i> Editar</a>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col">
			<ul class="nav nav-tabs nav-fill">
			  <li class="nav-item">
			    <a class="nav-link" href="<?php echo base_url('admin/equipos/detalles?id='.$equipo['ID_EQUIPO']); ?>"> <i class="fa fa-users"></i> </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="<?php echo base_url('admin/equipos/proyectos?id='.$equipo['ID_EQUIPO']); ?>"> <i class="fas fa-project-diagram"></i> </a>
			  </li>
			</ul>
			<div class="bg-white p-2 py-4">
				<div class="row mb-3 ui-sortable">
					<?php foreach($proyectos as $proyecto){ ?>
					<div class="col-12 col-sm-6 col-md-4">
						<a href="<?php echo base_url('admin/proyectos/detalles?id='.$proyecto->ID_PROYECTO); ?>">
							<div class="card">
								<div class="card-body">
									<h2 class="h6 text-<?php echo $proyecto->COLOR; ?>"><?php echo $proyecto->PROYECTO_NOMBRE; ?></h2>
									<span class="badge bg-<?php echo $proyecto->COLOR; ?>"><?php echo $proyecto->DURACION; ?></span>
								</div>
								<div class="card-footer">
									<span class="float-left"> <i class="fa fa-check-square"></i> <?php echo $proyecto->ESTADO; ?></span>
									<span class="float-right"> <i class="fa fa-calendar"></i> <?php echo $proyecto->FECHA_ENTREGA; ?></span>
								</div>
							</div>
						</a>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
