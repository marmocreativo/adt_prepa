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
	<!-- Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
	<!-- Main CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

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
	<!--
	<script src="https://cdn.tiny.cloud/1/y3nn7mnqo19xsacsvznxqarsmohkoz42yat38khcnolpk6bf/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
	<script src="<?php echo base_url('assets/plugins/tinymce-bootstrap-plugin'); ?>/plugin/plugin.min.js"></script>
	-->
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
  <!-- fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="<?php echo base_url('assets/css/'); ?>estilos.css?v=<?php echo date('i'); ?>" rel="stylesheet"/>

</head>
<body class="<?php echo $modo; ?>">
	<div class="load-screen"><div class="lds-dual-ring"></div></div>
		<div class="envolvente envolvente_<?php echo $modo; ?>">
			<div class="sidebar">
				<div class="logo_contenedor">
					<div class="row">
						<div class="col col-md-12">
							<img src="<?php echo base_url('assets/img/polaris_'.$modo.'.svg'); ?>" class="img-fluid" style="max-width:150px" alt="Polaris">
						</div>
						<div class="col-3 d-flex d-md-none justify-content-end align-items">
							<button type="button" name="button" class="mostrar_menu btn btn-light"><i class="fas fa-bars"></i></button>
						</div>
					</div>


				</div>
				<?php $this->load->view('default'.$this->data['dispositivo'].'/front/widgets/menu_principal',$this->data); ?>
			</div>
			<div class="contenedor_principal">
				<div class="logo_contenedor">
					<div class="row">
						<div class="col">
					      <img src="<?php echo base_url('assets/img/polaris_'.$modo.'.svg'); ?>" class="img-fluid" style="max-width:150px" alt="Polaris">
						</div>
						<div class="col-3 d-flex justify-content-center align-items-center">
							<button type="button" name="button" class="mostrar_menu btn btn-light"><i class="fas fa-bars"></i></button>
						</div>
					</div>
				</div>
				<div class="contenido_principal">
					<div class="row encabezado_principal d-flex justify-content-between mb-4">
						<div class="col-12 col-md-6 titulo">
							<h1 class="h3">Detalles del proyecto</h1>
						</div>
					</div>
