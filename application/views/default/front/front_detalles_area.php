<div class="">
	<div class="row ">
		<div class="col-12 col-md-4">
			<div class="proyecto p-0">
				<div class="bg-image d-flex align-items-center" style="background-image: url(<?php echo base_url('contenido/img/areas/'.$area['IMAGEN_FONDO']); ?>)">
					<img src="<?php echo base_url('contenido/img/areas/'.$area['IMAGEN']); ?>" class="rounded-circle m-3" width="100">
					<h3 class="text-primary"><?php echo $area['AREA_NOMBRE']; ?></h3>
				</div>
				<div class="p-4 mt-3">
					<?php echo $area['AREA_DESCRIPCION']; ?>
					<hr>
					<h4>Usuarios</h4>
					<?php $usuarios= $this->GeneralModel->lista('areas_usuarios','',['ID_AREA'=>$area['ID_AREA']],'','',''); ?>
					<ul class="list-inline">
						<?php foreach ($usuarios as $usuario) { ?>
							<?php $detalles_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario->ID_USUARIO]); ?>
							<li class="list-inline-item">
								<a href="<?php echo base_url('lista_usuarios/detalles?id='.$detalles_usuario['ID_USUARIO']); ?>">
								<img src="<?php echo base_url('contenido/img/usuarios/'.$detalles_usuario['IMAGEN']); ?>" title="<?php echo $detalles_usuario['USUARIO_NOMBRE'].' '.$detalles_usuario['USUARIO_APELLIDOS']; ?>" width="50px" class="rounded-circle border border-secondary" alt="">
								</a>
							</li>
						<?php } ?>
					</ul>
					<hr>
					<a href="<?php echo base_url('areas/actualizar?id='.$area['ID_AREA']); ?>" class="btn btn-link btn-sm"> <i class="fas fa-pencil-alt"></i> Editar</a>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-8">
			<?php var_dump($proyectos); ?>
			<?php $this->load->view('default'.$dispositivo.'/front/widgets/lista_proyectos', $proyectos); ?>
		</div>
	</div>
	<a href="<?php echo base_url('proyectos/crear?id_area='.$area['ID_AREA']); ?>" class="btn btn-success btn-round btn-circulo-flotante"> <i class="fa fa-plus"></i> </a>
</div>
