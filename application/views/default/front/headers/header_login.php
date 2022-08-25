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
	<link href="<?php echo base_url('assets/css/'); ?>bootstrap.css?v=<?php echo date('i'); ?>" rel="stylesheet"/>

	<!-- Animation CSS -->
	<link href="<?php echo base_url('assets/css/'); ?>animate.css" rel="stylesheet"/>

	<!-- Lightbox CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<!-- Plugins CSS -->
	<link rel="stylesheet" href="<?php echo base_url('assets/plugins/'); ?>owl.carousel/dist/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="<?php echo base_url('assets/plugins/'); ?>owl.carousel/dist/assets/owl.theme.default.min.css">

	<!-- Custom CSS -->
	<link href="<?php echo base_url('assets/css/'); ?>estilos.css?v=<?php echo date('i'); ?>" rel="stylesheet"/>

</head>
<body class="<?php echo $modo; ?>" >
	<div class="load-screen bg-secondary"><div class="lds-dual-ring"></div></div>

    <div class="wrapper">

      <!-- Page Content  -->
      <div id="content">
