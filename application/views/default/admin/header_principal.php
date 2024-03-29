<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8"/>
	<link rel="apple-touch-icon" sizes="76x76" href="<?php echo base_url('assets/img/logo.png'); ?>">
	<link rel="icon" type="image/png" href="<?php echo base_url('assets/img/favicon.png'); ?>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title><?php echo $titulo ?></title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport'/>
		<!-- OPEN GRAPH -->
		<meta property="og:url"  content="<?php echo current_url(); ?>" />
		<meta property="og:type" content="website" />
		<meta property="og:title" content="<?php echo $titulo; ?>" />
		<meta property="og:description" content="<?php echo html_escape($descripcion); ?>" />
		<meta property="og:image" content="<?php echo $imagen; ?>" />

	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<!-- Main CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<!-- Animation CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

	<!-- Lightbox CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<!-- Plugins CSS -->
	<link rel="stylesheet" href="<?php echo base_url('assets/plugins/'); ?>owl.carousel/dist/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="<?php echo base_url('assets/plugins/'); ?>owl.carousel/dist/assets/owl.theme.default.min.css">
	<link href="<?php echo base_url('assets/plugins/'); ?>bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url('assets/plugins/'); ?>bootstrap-colorpicker/dist/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url('assets/plugins/'); ?>iconpicker/dist/css/fontawesome-iconpicker.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url('assets/plugins/'); ?>jquery-ui/jquery-ui.bundle.min.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url('assets/plugins/'); ?>summernote/dist/summernote.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url('assets/plugins/'); ?>dropzone/dist/dropzone.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url('assets/plugins/'); ?>bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url('assets/plugins/'); ?>sweetalert2/dist/sweetalert2.css" rel="stylesheet" type="text/css" />
	<script src="https://cdn.tiny.cloud/1/y3nn7mnqo19xsacsvznxqarsmohkoz42yat38khcnolpk6bf/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
		<script src="<?php echo base_url('assets/plugins/tinymce-bootstrap-plugin'); ?>/plugin/plugin.min.js"></script>
  <!-- fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="<?php echo base_url('assets/css/'); ?>estilos.css?v=<?php echo date('i'); ?>" rel="stylesheet"/>

</head>
<body>
	<div class="load-screen bg-secondary"><div class="lds-dual-ring"></div></div>
		<div class="envolvente">
			<div class="sidebar">
				<a href="<?php echo base_url(); ?>" class="d-block p-3 link-dark text-decoration-none" title="">
		      <img src="<?php echo base_url('assets/img/logo.png'); ?>" class="logo_menu" alt="">
		    </a>
				<ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
		      <li class="nav-item">
		        <a href="<?php echo base_url('index.php/resumen'); ?>" class="nav-link text-white  py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Resumen">
		         	<i class="fas fa-columns fa-lg"></i> <span class="etiqueta_menu">Inicio</span>
		        </a>
		      </li>
					<li class="nav-item">
		        <a href="<?php echo site_url('tareas'); ?>" class="nav-link text-white py-3 " aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Mis Tareas">
		         	<i class="fas fa-tasks fa-lg"></i> <span class="etiqueta_menu">Tareas</span>
		        </a>
		      </li>
					<li class="nav-item">
		        <a href="<?php echo base_url('index.php/proyectos'); ?>" class="nav-link text-white py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Proyectos">
		         	<i class="fas fa-project-diagram fa-lg"></i> <span class="etiqueta_menu">Proyectos</span>
		        </a>
		      </li>
					<li class="nav-item">
		        <a href="<?php echo base_url('index.php/equipos'); ?>" class="nav-link text-white py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Equipos">
		         	<i class="fas fa-users fa-lg"></i> <span class="etiqueta_menu">Equipos</span>
		        </a>
		      </li>
					<li class="nav-item">
		        <a href="<?php echo base_url('index.php/lista_usuarios'); ?>" class="nav-link text-white py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Usuarios">
		         	<i class="fas fa-user fa-lg"></i> <span class="etiqueta_menu">Usuarios</span>
		        </a>
		      </li>
					<?php $verificar_notificaciones = $this->GeneralModel->conteo('notificaciones','','',['ID_USUARIO'=>$_SESSION['usuario']['id'],'ESTADO'=>'pendiente'],''); ?>
					<li class="nav-item">
		        <a href="<?php echo base_url('index.php/notificaciones'); ?>" class="nav-link text-white py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Notificaciones">
		         	<?php if(empty($verificar_notificaciones)){ ?>
								<i class="far fa-bell"></i>
							<?php }else{ ?>
								<i class="fas fa-bell animate__animated animate__swing animate__infinite"></i> <span class="badge bg-danger text-white"><?php echo $verificar_notificaciones; ?></span>
							<?php } ?>
							<span class="etiqueta_menu">Notificaciones</span>
		        </a>
		      </li>
					<li class="nav-item">
		        <a href="<?php echo base_url('index.php/login/cerrar_sesion'); ?>" class="nav-link text-white py-3" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Cerrar sesión">
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
			</div>
			<div class="contenedor_principal">
				<div class="row encabezado_principal d-flex justify-content-between">
					<div class="col-12 col-md-6 titulo">
						<h1 class="h1"><?php echo $titulo; ?></h1>
					</div>
					<div class="col-12 col-md-3 controles d-none">
						<form class="row aling-item-center date" action="<?php echo base_url(); ?>" method="get">
							<div class="col-4 p-2">
								<div class="form-group d-flex">
									<input type="text" class="form-control form-control-sm datepicker" name="FechaInicio" value="<?php echo verificar_variable('GET','fecha_inicio',date('d-m-Y', strtotime(date('d-m-Y').' -30 days'))); ?>">
								</div>
							</div>
							<div class="col-4 p-2">
								<div class="form-group d-flex">
									<input type="text" class="form-control form-control-sm datepicker" name="FechaFInal" value="<?php echo verificar_variable('GET','fecha_final',date('d-m-Y')); ?>">
								</div>
							</div>
							<div class="col-4 p-2">
								<button type="submit" class="btn btn-secondary btn-sm w-100" name="button"> <i class="fas fa-search"></i> </button>
							</div>
						</form>

					</div>
				</div>
			<div class="contenido_principal">
