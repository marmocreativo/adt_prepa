<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8"/>
	<link rel="apple-touch-icon" sizes="76x76" href="<?php echo base_url('assets/img/apple-icon-76x76.png'); ?>">
	<link rel="icon" type="image/png" href="<?php echo base_url('assets/img/favicon-96x96.png'); ?>">
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
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!-- Main CSS -->
	<link href="<?php echo base_url('assets/css/'); ?>bootstrap.css" rel="stylesheet"/>

	<!-- Animation CSS -->
	<link href="<?php echo base_url('assets/css/'); ?>animate.css" rel="stylesheet"/>

	<!-- Lightbox CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<!-- Plugins CSS -->
	<link rel="stylesheet" href="<?php echo base_url('assets/plugins/'); ?>owl.carousel/dist/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="<?php echo base_url('assets/plugins/'); ?>owl.carousel/dist/assets/owl.theme.default.min.css">

	<!-- Custom CSS -->
	<link href="<?php echo base_url('assets/css/'); ?>estilos.css" rel="stylesheet"/>

</head>
<body>
	<div class="load-screen bg-secondary"><div class="lds-dual-ring"></div></div>

    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar" class="bg-primary active">
            <div class="sidebar-header">
                <a class="navbar-brand" href="<?php echo base_url(); ?>"><img src="<?php echo base_url('assets/img/logo_menu.png'); ?>" alt="" class="img-fluid"></a>
            </div>

            <ul class="list-unstyled components">
                <p>Tareas</p>
                <li>
                    <a href="#">Mis tareas de hoy</a>
                </li>
            </ul>
        </nav>

      <!-- Page Content  -->
      <div id="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-4 p-0">
							<button type="button" id="sidebarCollapse" class="btn btn-primary"> <i class="fas fa-align-justify"></i> </button>
						</div>
						<div class="col-4 text-center p-0">
							<img src="<?php echo base_url('assets/img/logo_menu.png'); ?>" alt="" width="50" class="">
						</div>
						<div class="col-4 text-right p-0">
								<?php $this->load->view($this->data['op']['plantilla'].$dispositivo.'/front/widgets/menu_usuarios'); ?>
						</div>
					</div>
				</div>
