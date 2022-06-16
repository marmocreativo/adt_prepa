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
		<div class="col-12 col-md-4">
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
		<div class="col-12 col-md-8">
			<?php
			$cantidad_tareas = 0;
			$cantidad_tareas_completas = 0;
			foreach($tareas as $tarea){
				$cantidad_tareas ++;
				$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$tarea->ID_TAREA]);
				if($detalles_tarea['ESTADO']=='completo'){
					$cantidad_tareas_completas ++;
				}
			}
			if($cantidad_tareas>0){
				$porcentaje_completo = ($cantidad_tareas_completas*100)/$cantidad_tareas;
			}else{
				$porcentaje_completo =100;
			}
			$color = 'text-success';
			$icono = "far fa-clock";
			?>
			Progreso
			<div class="progress mb-3">
				<div class="progress-bar" role="progressbar" style="width: <?php echo $porcentaje_completo; ?>%" aria-valuenow="<?php echo $porcentaje_completo; ?>" aria-valuemin="0" aria-valuemax="100"></div>
			</div>
			<ul class="list-group">
				<?php $fecha = ''; foreach($tareas as $tarea){ ?>
					<?php if($fecha != $tarea->FECHA_FINAL){ $fecha = $tarea->FECHA_FINAL; ?>
						<li class="list-group-item border-0 border-bottom">
							<p class="h5"><i class="fas fa-calendar-alt"></i> <?php echo fechas_es($tarea->FECHA_FINAL); ?></p>
						</li>
					<?php } ?>
			  <li class="list-group-item">
					<a href="<?php echo base_url('tareas/detalles?id='.$tarea->ID_TAREA); ?>" class="d-flex row">
						<?php
							// variables de estado
							switch ($tarea->ESTADO) {
								case 'pendiente':
									$icono = "far fa-clock";
									$color = 'text-secondary';
									break;
								case 'en desarrollo':
									$icono = "far fa-square";
									$color = 'text-warning';
									// code...
									break;
								case 'completo':
									$icono = "fas fa-check-square";
									$color = 'text-success';
									break;
							}

							$parametros_and = array();
							$parametros_or = array();
							$tablas_join = array();
							$tablas_join['usuarios'] = 'usuarios_tareas.ID_USUARIO = usuarios.ID_USUARIO';
							$parametros_and['usuarios_tareas.ID_TAREA'] = $tarea->ID_TAREA;
							$usuarios = $this->GeneralModel->lista_join('usuarios_tareas',$tablas_join,$parametros_or,$parametros_and,'','','','');
						?>
						<div class="col-12 col-md-8">
							<p title="<?php echo $tarea->ESTADO; ?>"><i class="<?php echo $icono.' '.$color; ?>"></i> <?php echo $tarea->TAREA_TITULO; ?></p>
						</div>
						<div class="col-12 col-md-4">
							<ul class="list-inline">
								<?php foreach($usuarios as $usuario){ ?>
									<li class="list-inline-item" title="<?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?>">
										<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario->IMAGEN) ?>" width="20" class="rounded-circle" alt="">
									</li>
								<?php }; ?>
							</ul>

						</div>

					</a>
			  </li>
			<?php } ?>
			</ul>

		</div>
	</div>

</div>
