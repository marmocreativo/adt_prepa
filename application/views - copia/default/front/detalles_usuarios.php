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
			    <a class="nav-link active" href="<?php echo base_url('usuarios/detalles?id='.$usuario['ID_USUARIO']); ?>"> <i class="fa fa-id-card"></i> </a>
			  </li>
				<li class="nav-item">
			    <a class="nav-link" href="<?php echo base_url('usuarios/equipos?id='.$usuario['ID_USUARIO']); ?>"> <i class="fa fa-users"></i> </a>
			  </li>
			</ul>
			<div class="bg-white p-2 py-4">
				<table class="table">
					<tr>
						<td> <i class="fa fa-birthday-cake"></i></td>
						<td> <?php echo date('d-M / Y', strtotime($usuario['USUARIO_FECHA_NACIMIENTO'])); ?></td>
					</tr>
					<tr>
						<td> <i class="fa fa-envelope"></i></td>
						<td> <?php echo $usuario['USUARIO_CORREO']; ?></td>
					</tr>
					<tr>
						<td> <i class="fa fa-phone"></i></td>
						<td> <?php echo $usuario['USUARIO_TELEFONO']; ?></td>
					</tr>
					<tr>
						<td> <i class="fa fa-key"></i></td>
						<td> <?php echo $usuario['TIPO']; ?></td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="<?php echo base_url('usuarios/actualizar/?id='.$usuario['ID_USUARIO']); ?>" class="btn btn-outline-warning btn-block"> <i class="fa fa-pencil-alt"></i> Editar</a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<a class="btn btn-block btn-link" href="<?php echo base_url('usuarios/actualizar_pass'); ?>"> <i class="fa fa-lock"></i> Cambiar Contraseña</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
