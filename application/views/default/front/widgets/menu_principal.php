<ul class="nav nav-pills nav-flush flex-column mb-auto">
					<li class="nav-item">
						<a href="<?php echo base_url('index.php/resumen'); ?>" class="nav-link   py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Resumen">
							<i class="fas fa-columns fa-lg"></i> <span class="etiqueta_menu">Resumen</span>
						</a>
					</li>
					<?php $verificar_notificaciones = $this->GeneralModel->conteo('notificaciones','','',['ID_USUARIO'=>$_SESSION['usuario']['id'],'LEIDO'=>'no'],''); ?>
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
						<a href="<?php echo site_url('tareas'); ?>" class="nav-link  py-3 " aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Mis Tareas">
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
						<a href="<?php echo base_url('index.php/areas'); ?>" class="nav-link  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Áreas">
							<i class="fas fa-sitemap fa-lg"></i> <span class="etiqueta_menu">Áreas</span>
						</a>
					</li>
							<li class="nav-item">
						<a href="<?php echo base_url('index.php/login/cerrar_sesion'); ?>" class="nav-link  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Cerrar sesión">
							<i class="fas fa-sign-out"></i> <span class="etiqueta_menu">Cerrar sesión</span>
						</a>
					</li>
							<!--
							<li class="nav-item">
						<a href="<?php echo base_url('index.php/opciones'); ?>" class="nav-link text-white py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Home">
							<i class="fas fa-cogs fa-lg"></i> <span class="etiqueta_menu">Opciones</span>
						</a>
					</li>
						-->
		    	</ul>
