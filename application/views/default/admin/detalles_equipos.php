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
			    <a class="nav-link active" href="<?php echo base_url('admin/equipos/detalles?id='.$equipo['ID_EQUIPO']); ?>"> <i class="fa fa-users"></i> </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="<?php echo base_url('admin/equipos/proyectos?id='.$equipo['ID_EQUIPO']); ?>"> <i class="fas fa-project-diagram"></i> </a>
			  </li>
			</ul>
			<div class="bg-white p-2 py-4">
				<div class="row">
				<?php foreach ($usuarios as $usuario) { ?>
					<div class="col-12 col-sm-6 col-md-3 mb-3">
						<a href="<?php echo base_url('admin/usuarios/detalles?id='.$usuario->ID_USUARIO); ?>">
							<div class="card equipo">
								<div class="card-body bg-light p-2">
									<div class="row">
										<div class="col-3">
											<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario->IMAGEN); ?>" class="rounded-circle img-fluid">
										</div>
										<div class="col-9">
											<p class="h6 text-<?php echo $usuario->COLOR; ?>"><?php echo $usuario->USUARIO_NOMBRE; ?></p>
										</div>
									</div>
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
