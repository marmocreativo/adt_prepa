<a href="<?php echo base_url('proyectos/crear?id_equipo='); ?>" class="btn btn-success btn-round btn-circulo-flotante"> <i class="fa fa-plus"></i> </a>
<div class="lista_proyectos">
	<div class="row d-flex">
		<div class="col-12 col-md-6 titulo">
				<h2>Mis proyectos</h2>
		</div>
		<div class="col-12 col-md-6 formulario">
			<form class="row" action="<?php echo base_url('proyectos'); ?>" method="get">
				<div class="col-12 col-md-2">
					<input type="text" class="form-control" name="busqueda" value="<?php echo verificar_variable('GET','busqueda',''); ?>" placeholder="Buscar">
				</div>
				<!--
				<div class="col-4 col-md-2">
						<select class="form-control" name="todo">
							<option value="">Mostrar</option>
							<option value="si" <?php if(isset($_GET['todo'])&&$_GET['todo']=='si'){ echo 'selected'; } ?>>Todos los equipos</option>
							<option value="no" <?php if(isset($_GET['todo'])&&$_GET['todo']=='no'){ echo 'selected'; } ?>>Solo mis equipos</option>
						</select>
				</div>
			-->
				<div class="col-6 col-md-2">
						<select class="form-control" name="orden">
							<option value="">Ordenar por</option>
							<option value="ORDEN ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='ORDEN ASC'){ echo 'selected'; } ?>>Orden Personalizado</option>
							<option value="PROYECTO_NOMBRE ASC" <?php if(isset($_GET['orden'])&&$_GET['orden']=='PROYECTO_NOMBRE ASC'){ echo 'selected'; } ?>>Alfabético A-Z</option>
						</select>
				</div>
				<div class="col-6 col-md-2">
						<select class="form-control" name="mostrar_por_pagina">
							<option value="">mostrar por página</option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina'] ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina'] ?></option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*2; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*2){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*2; ?></option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*5; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*5){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*5; ?></option>
							<option value="<?php echo $op['cantidad_publicaciones_por_pagina']*10; ?>" <?php if(isset($_GET['mostrar_por_pagina'])&&$_GET['mostrar_por_pagina']==$op['cantidad_publicaciones_por_pagina']*10){ echo 'selected'; } ?>>Mostrar <?php echo $op['cantidad_publicaciones_por_pagina']*10; ?></option>
						</select>
				</div>
				<div class="col-12 col-md-1">
					<button type="submit" class="btn btn-secondary w-100"> Aplicar </button>
				</div>
			</form>
		</div>
	</div>

	<div class="slide encabezado_lista_proyectos  mt-4">
		<div class="col proyecto_nombre">
			Nombre
		</div>
		<div class="col-1 proyecto_status">
			Status
		</div>
		<div class="col-1 proyecto_prioridad">
			Prioridad
		</div>
		<div class="col-1 proyecto_fecha_inicio">
			Fecha Inicio
		</div>
		<div class="col-1 proyecto_fecha_final">
			Fecha Entrega
		</div>
	</div>

	<!-- Lista de proyectos -->

	<?php foreach($proyectos as $proyecto){ ?>
	<a class="lista-p" href="<?php echo base_url('proyectos/detalles?id='.$proyecto->ID_PROYECTO); ?>">
		<div class="slide proyecto aling-item-center ">
			<div class="col proyecto_nombre">
				<?php echo $proyecto->PROYECTO_NOMBRE; ?>
			</div>
      <?php
					switch ($proyecto->ESTADO) {
						case 'activo':
							if($proyecto->FECHA_FINAL<date('Y-m-d')){
								$color_estado = 'bg-s-retraso';
								$mensaje_estado = 'Atraso';
							}else{
								$color_estado = 'bg-s-atiempo';
								$mensaje_estado = 'A tiempo';
							}
							break;
						case 'revision':
								$color_estado = 'bg-s-revision';
								$mensaje_estado = 'Revisión';
							break;
						case 'terminado':
								$color_estado = '.bg-s-terminado';
								$mensaje_estado = 'Terminado';
							break;

						default:
								$color_estado = 'bg-light';
								$mensaje_estado = 'N/A';
							break;
					}
				?>
			<div class="col-1 proyecto_status <?php echo $color_estado;?>">

				<span><?php echo $mensaje_estado; ?></span>
			</div>
			<div class="col-1 proyecto_prioridad bg-p-media" style="text-transform: capitalize;">
				<?php echo $proyecto->PRIORIDAD; ?>
			</div>
			<div class="col-1 proyecto_fecha_inicio">
				<?php if($proyecto->FECHA_INICIO=='1970-01-01'){ echo '-';}else{ echo date('d-m-Y',strtotime($proyecto->FECHA_INICIO)); } ?>
			</div>
			<div class="col-1 proyecto_fecha_final">
				<?php if($proyecto->FECHA_FINAL=='1970-01-01'){ echo '-';}else{ echo date('d-m-Y',strtotime($proyecto->FECHA_FINAL)); } ?>
			</div>
		</div>
	</a>
	<?php } ?>
	<!-- /lista de proyectos -->

</div>
