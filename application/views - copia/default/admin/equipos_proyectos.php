<div class="contenido_principal">
	<div class="row">
		<div class="col-12 col-md-3">
			<div class="encabezado_proyecto p-2">
				<div class="row">
					<div class="col-12 mb-3">
						<h1 class="h5 text-<?php echo $proyecto['COLOR']; ?>"><?php echo $proyecto['PROYECTO_NOMBRE']; ?></h1>
					</div>
					<div class="col-5">
						<img src="<?php echo base_url('contenido/img/proyectos/'.$proyecto['IMAGEN']); ?>" class="rounded-circle img-fluid">
					</div>
					<div class="col-7">
						<table class="table table-sm">
							<tr>
								<td><i class="far fa-square text-<?php echo $proyecto['COLOR']; ?>"></i></td>
								<?php $cantidad_tareas_pendientes = $this->GeneralModel->conteo('tareas','','',['ESTADO'=>'pendiente'],''); ?>
								<td><b><?php echo $cantidad_tareas_pendientes; ?></b> Pendientes</td>
							</tr>
							<tr>
								<td><i class="fa fa-cogs text-<?php echo $proyecto['COLOR']; ?>"></i></td>
								<?php $cantidad_tareas_proceso = $this->GeneralModel->conteo('tareas','','',['ESTADO'=>'en desarrollo'],''); ?>
								<td><b><?php echo $cantidad_tareas_proceso; ?></b> en Desarrollo</td>
							</tr>
							<tr>
								<td><i class="far fa-check-square text-<?php echo $proyecto['COLOR']; ?>"></i></td>
								<?php $cantidad_tareas_completas = $this->GeneralModel->conteo('tareas','','',['ESTADO'=>'completas'],''); ?>
								<td><b><?php echo $cantidad_tareas_completas; ?></b> Completas</td>
							</tr>
						</table>
					</div>
					<div class="col-12 py-3">
						<a href="<?php echo base_url('admin/proyectos/actualizar/?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-outline-warning btn-block"> <i class="fa fa-pencil-alt"></i> Editar</a>
					</div>
					<div class="col text-center">
						<?php echo $proyecto['PROYECTO_DESCRIPCION']; ?>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-9">

				<?php retro_alimentacion(); ?>
			<ul class="nav nav-tabs nav-fill">
			  <li class="nav-item">
			    <a class="nav-link" href="<?php echo base_url('admin/proyectos/detalles?id='.$proyecto['ID_PROYECTO']); ?>"><i class="fas fa-tasks"></i></a>
			  </li>
				<li class="nav-item">
			    <a class="nav-link active" href="<?php echo base_url('admin/proyectos/equipos?id='.$proyecto['ID_PROYECTO']); ?>"> <i class="fa fa-users"></i> </a>
			  </li>
			</ul>
			<div class="bg-white p-4">
				<div class="row">
					<?php foreach($equipos as $equipo){ ?>
					<div class="col-12 col-md-4" id="item-<?php echo $equipo->ID_EQUIPO; ?>" class="ui-sortable-handle">
						<a href="<?php echo base_url('admin/equipos/detalles?id='.$equipo->ID_EQUIPO); ?>">
							<div class="card equipo">
								<div class="card-body bg-<?php echo $equipo->COLOR; ?>">
									<p class="h5 text-white"><img src="<?php echo base_url('contenido/img/equipos/'.$equipo->IMAGEN); ?>" class="rounded-circle float-left mr-2" width="50"><?php echo $equipo->EQUIPO_NOMBRE; ?></p>
								</div>
							</div>
						</a>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
