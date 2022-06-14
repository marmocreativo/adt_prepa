<div class="contenido-principal">
	<div class="d-flex justify-content-between">
		<div class="titulo">
				<h2>Perfil del usuario</h2>
		</div>
		<div class="formulario">
			<a href="<?php echo base_url('lista_usuarios/actualizar?id='.$usuario['ID_USUARIO']); ?>" class="btn btn-warning"> <i class="fas fa-pencil"></i></a>
			<a href="<?php echo base_url('lista_usuarios/borrar?id='.$usuario['ID_USUARIO']); ?>" class="btn btn-outline-danger"> <i class="fa fa-trash"></i></a>
		</div>
	</div>
  <hr>
	<div class="row">
		<div class="col-12">
			<div class="text-center" >
				<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario['IMAGEN']); ?>" class="rounded-circle imagen_perfil" width="50%">
			</div>

			<table class="table">
				<tr>
					<td class="text-center"> <i class="fa fa-birthday-cake"></i>  <?php echo date('d-M / Y', strtotime($usuario['USUARIO_FECHA_NACIMIENTO'])); ?></td>
				</tr>
				<tr>
					<td class="text-center"> <i class="fa fa-envelope"></i> <?php echo $usuario['USUARIO_CORREO']; ?></td>
				</tr>
				<tr>
					<td class="text-center"> <i class="fa fa-phone"></i> <?php echo $usuario['USUARIO_TELEFONO']; ?></td>
				</tr>
				<tr>
					<td class="text-center"> <i class="fa fa-key"></i> <?php echo $usuario['TIPO']; ?></td>
				</tr>
			</table>
		</div>
	</div>
</div>
