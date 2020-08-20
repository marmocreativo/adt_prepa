<div class="row mb-4">
	<div class="col-12">
		<h5> <i class="fa fa-users"></i> Usuarios</h5>
	</div>
	<?php $tipos_publicaciones = $this->GeneralModel->lista('tipos','',['TIPO_OBJETO'=>'usuarios'],'','',''); ?>
	<?php foreach($tipos_publicaciones as $tipo_publicacion){ ?>
	<div class="col-3 mb-3">
		<div class="card">
			<div class="card-body">
				<h6><i class="fa fa-user"></i> <?php echo $tipo_publicacion->TIPO_NOMBRE_PLURAL; ?></h6>
				<?php $conteo = $this->GeneralModel->conteo_elementos('usuarios',['TIPO'=>$tipo_publicacion->TIPO_NOMBRE]); ?>
				<h2><?php echo $conteo; ?></h2>
			</div>
		</div>
	</div>
	<?php } ?>
</div>
<div class="row mb-4">
	<div class="col-12">
		<h5> <i class="fa fa-file"></i> Tareas</h5>
	</div>
	<?php $tipos_publicaciones = $this->GeneralModel->lista('tipos','',['TIPO_OBJETO'=>'publicaciones'],'','',''); ?>
	<?php foreach($tipos_publicaciones as $tipo_publicacion){ ?>
	<div class="col-3 mb-3">
		<div class="card">
			<div class="card-body">
				<h6> <i class="fa fa-file"></i> <?php echo $tipo_publicacion->TIPO_NOMBRE_PLURAL; ?></h6>
				<?php $conteo = $this->GeneralModel->conteo_elementos('publicaciones',['TIPO'=>$tipo_publicacion->TIPO_NOMBRE]); ?>
				<h2><?php echo $conteo; ?></h2>
			</div>
		</div>
	</div>
<?php } ?>
</div>
