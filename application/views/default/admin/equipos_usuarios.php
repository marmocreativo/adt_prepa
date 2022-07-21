<div class="contenido_principal">
	<div class="encabezado_usuario p-2" style="background-image: url('<?php echo base_url('contenido/img/usuarios/'.$usuario['IMAGEN_FONDO']); ?>');">
		<div class="row">
			<div class="col-12 text-center">
				<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario['IMAGEN']); ?>" class="rounded-circle imagen_perfil" width="50%"><?php echo $usuario['EQUIPO_NOMBRE']; ?>
			</div>
		</div>
	</div>
	<div class="row py-3">
		<div class="col text-center">
			<?php retro_alimentacion(); ?>
			 <h1 class="h5 text-<?php echo $usuario['COLOR']; ?>"><?php echo $usuario['USUARIO_NOMBRE'].' '.$usuario['USUARIO_APELLIDOS']; ?></h1>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col">
			<ul class="nav nav-tabs nav-fill">
			  <li class="nav-item">
			    <a class="nav-link" href="<?php echo base_url('admin/usuarios/detalles?id='.$usuario['ID_USUARIO']); ?>"> <i class="fa fa-id-card"></i> </a>
			  </li>
				<li class="nav-item">
			    <a class="nav-link active" href="<?php echo base_url('admin/usuarios/equipos?id='.$usuario['ID_USUARIO']); ?>"> <i class="fa fa-users"></i> </a>
			  </li>
			</ul>
			<div class="bg-white p-2 py-4">
				<?php foreach($equipos as $equipo){ ?>
				<div class="col-12 col-sm-4 col-md-3 p-1" id="item-<?php echo $equipo->ID_EQUIPO; ?>" class="ui-sortable-handle">
					<a href="<?php echo base_url('admin/equipos/detalles?id='.$equipo->ID_EQUIPO); ?>">
						<div class="card equipo">
							<div class="card-body bg-<?php echo $equipo->COLOR; ?>">
								<p class="h5 text-white"><img src="<?php echo base_url('contenido/img/equipos/'.$equipo->IMAGEN); ?>" class="rounded-circle float-left mr-2" width="50"><?php echo $equipo->EQUIPO_NOMBRE; ?></p>
							</div>
						</div>
					</a>
				</div>
				<?php } ?>
			</div>
		</div>
	</div>
</div>
