<div class="p-3">
	
	<div class="dropdown">
		<button type="button" class="btn btn-outline-primary dropdown-toggle" data-bs-toggle="dropdown">
		Hola: <?php echo $_SESSION['usuario']['nombre']; ?>
		<?php $otras_areas = $this->GeneralModel->lista('areas_usuarios','',['ID_USUARIO'=>$_SESSION['usuario']['id']],'','',''); ?>
		</button>
		
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="<?php echo base_url('index.php/lista_usuarios/preferencias?id='.$_SESSION['usuario']['id']); ?>">Ir a mis preferencias</a></li>
			<li><hr class="dropdown-divider"></li>
			<?php foreach($otras_areas as $otra_area){ ?>
				<?php if($otra_area->ID_AREA != $_SESSION['usuario']['area']){ ?>
				<?php $detalles_otras_areas = $this->GeneralModel->detalles('areas',['ID_AREA'=>$otra_area->ID_AREA]); ?>
				<li><a class="dropdown-item" href="<?php echo base_url('index.php/areas/cambiar_area?id='.$otra_area->ID_AREA); ?>">Cambiar a <?php echo $detalles_otras_areas['AREA_NOMBRE']; ?></a></li>
				<?php } ?>
			<?php } ?>
		</ul>
	</div>
	<hr>
	<?php $detalles_area_activa = $this->GeneralModel->detalles('areas',['ID_AREA'=>$_SESSION['usuario']['area']]); ?>
	<h6><?php echo $detalles_area_activa['AREA_NOMBRE'];  ?></h6>
	<hr>
</div>
<ul class="nav nav-pills nav-flush flex-column mb-auto">
					<li class="nav-item">
						<a href="<?php echo base_url('index.php/resumen'); ?>" class="nav-link   py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Resumen">
							<i class="fas fa-columns fa-lg"></i> <span class="etiqueta_menu">Resumen</span>
						</a>
					</li>
					<?php
						$verificar_notificaciones = $this->GeneralModel->conteo('notificaciones','','',['ID_USUARIO'=>$_SESSION['usuario']['id'],'LEIDO'=>'no'],'');
						$ultima_notificacion = $this->GeneralModel->lista('notificaciones','',['ID_USUARIO'=>$_SESSION['usuario']['id']],'FECHA_CREACION DESC','1','');
						foreach($ultima_notificacion as $ultima){
						$_SESSION['ultima_notificacion'] = $ultima->FECHA_CREACION;
						}
					?>
							<li class="nav-item">
						<a href="<?php echo base_url('index.php/lista_usuarios/notificaciones'); ?>" class="nav-link  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Notificaciones">
							<?php if(empty($verificar_notificaciones)){ ?>
								<i class="far fa-bell"></i>
							<?php }else{ ?>
								<i class="fas fa-bell animate__animated animate__swing animate__infinite"></i> <span class="badge bg-danger text-white"><?php echo $verificar_notificaciones; ?></span>
							<?php } ?>
							<span class="etiqueta_menu">Notificaciones</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="<?php echo base_url('index.php/tareas'); ?>" class="nav-link  py-3 " aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Mis Tareas">
							<i class="fas fa-tasks fa-lg"></i> <span class="etiqueta_menu">Tareas</span>
						</a>
					</li>
							<li class="nav-item">
						<a href="<?php echo base_url('index.php/proyectos'); ?>" class="nav-link  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Proyectos">
							<i class="fas fa-project-diagram fa-lg"></i> <span class="etiqueta_menu">Proyectos</span>
						</a>
					</li>
							<li class="nav-item">
						<a href="<?php echo base_url('index.php/equipos'); ?>" class="nav-link  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Equipos">
							<i class="fas fa-users fa-lg"></i> <span class="etiqueta_menu">Equipos</span>
						</a>
					</li>
							<li class="nav-item">
						<a href="<?php echo base_url('index.php/lista_usuarios'); ?>" class="nav-link  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Usuarios">
							<i class="fas fa-user fa-lg"></i> <span class="etiqueta_menu">Usuarios</span>
						</a>
					</li>
							<li class="nav-item">
						<a href="<?php echo base_url('index.php/lista_usuarios/detalles?id='.$_SESSION['usuario']['id']); ?>" class="nav-link  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Usuarios">
							<i class="fas fa-address-card"></i> <span class="etiqueta_menu">Mi Perfil</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="<?php echo base_url('index.php/listas'); ?>" class="nav-link  py-3 " aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Mis Tareas">
							<i class="fas fa-list fa-lg"></i> <span class="etiqueta_menu">Listas validacion</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="<?php echo base_url('index.php/areas'); ?>" class="nav-link  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Áreas">
							<i class="fas fa-sitemap fa-lg"></i> <span class="etiqueta_menu">Áreas</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="<?php echo base_url('index.php/login/cerrar_sesion'); ?>" class="nav-link  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Cerrar sesión">
							<i class="fas fa-sign-out"></i> <span class="etiqueta_menu">Cerrar sesión</span>
						</a>
					</li>
					<li class="nav-item pl-3">
					<div class="toggle-btn" id="modo-toggle-btn">
						<label class="form-check-label" for="flexSwitchCheckDefault">Modo</label>
					    <input class="form-check-input configuracion_automatico" data-config='modo_noche' data-valor='<?php if($modo=='noche'){ echo 'no'; }else{ echo 'si'; }?>' type="checkbox" <?php if($modo=='noche'){ echo 'checked'; } ?> role="switch" id="flexSwitchCheckDefault">
					    <span></span>
					</div>
					</li>
						
		    	</ul>