<div class="contenido-principal">

	<div class="row">

		<div class="col-12 col-md-4">

			<div class="proyecto p-0">
				<div class="text-center">
					<div class="bg-image d-flex align-items-center" style="background-image: url(<?php echo base_url('contenido/img/usuarios/'.$usuario['IMAGEN_FONDO']); ?>); min-height:200px;"></div>
					<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario['IMAGEN']); ?>" class="rounded-circle imagen_perfil" style="width:100%; max-width: 200px; margin-top:-100px;">
				</div>
				<div class="p-4">
					<table class="table">
						<tr>
							<td class=""> <i class="fa fa-birthday-cake"></i>  <?php echo date('d-M / Y', strtotime($usuario['USUARIO_FECHA_NACIMIENTO'])); ?></td>
						</tr>
						<tr>
							<td class=""> <i class="fa fa-envelope"></i> <?php echo $usuario['USUARIO_CORREO']; ?></td>
						</tr>
						<tr>
							<td class=""> <i class="fa fa-phone"></i> <?php echo $usuario['USUARIO_TELEFONO']; ?></td>
						</tr>
						<tr>
							<td class=""> <i class="fa fa-key"></i> <?php echo $usuario['TIPO']; ?></td>
						</tr>
					</table>
					<hr>
					<a href="<?php echo base_url('index.php/lista_usuarios/actualizar?id='.$usuario['ID_USUARIO']); ?>" class="btn btn-link"> <i class="fas fa-pencil"></i> Editar perfil</a>
					<?php if($usuario['ID_USUARIO']==$_SESSION['usuario']['id']){ ?>
					<a href="<?php echo base_url('index.php/lista_usuarios/preferencias?id='.$usuario['ID_USUARIO']); ?>" class="btn btn-link"> <i class="fas fa-cogs"></i> Editar Preferencias</a>
					<?php } ?>
					<button data-enlace="<?php echo base_url('index.php/lista_usuarios/borrar?id='.$usuario['ID_USUARIO']); ?>" class="btn btn-danger btn-block btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar Usuario</a>
				</div>
			</div>
		</div>

		<div class="col-12 col-md-8">

			<?php $this->load->view('default'.$dispositivo.'/front/widgets/lista_tareas', $tareas); ?>

		</div>

	</div>



</div>

