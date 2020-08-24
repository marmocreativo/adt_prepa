<div class="contenido_principal">
	<div class="row mb-4">
		<div class="col-lg-3 col-md-3 col-sm-6">
	    <div class="widget">
	      <div class="widget-heading clearfix bg-primary">
	        <div class="pull-left">Mi perfil</div>
	      </div>
	      <div class="widget-body clearfix">
	        <div class="float-left">
	          <i class="fas fa-id-card"></i>
	        </div>

	        <div class="float-right number"> <a href="<?php echo base_url('usuarios/detalles'); ?>" class="btn btn-primary"> Ver mi perfil</a> </div>
	      </div>
	    </div>
	  </div>
		<div class="col-lg-3 col-md-3 col-sm-6">
	    <div class="widget">
	      <div class="widget-heading clearfix bg-danger">
	        <div class="pull-left">Mis Tareas Pendientes</div>
	      </div>
	      <div class="widget-body clearfix">
	        <div class="float-left">
	          <i class="fas fa-tasks"></i>
	        </div>
					<?php $cantidad_tareas_pendientes = $this->GeneralModel->conteo('tareas','','',['ID_USUARIO'=>$_SESSION['usuario']['id'],'ESTADO'=>'pendiente'],''); ?>
	        <div class="float-right number"><?php echo $cantidad_tareas_pendientes ?></div>
	      </div>
	    </div>
	  </div>
		<div class="col-lg-3 col-md-3 col-sm-6">
	    <div class="widget">
	      <div class="widget-heading clearfix bg-warning">
	        <div class="pull-left">Mis Tareas en proceso</div>
	      </div>
	      <div class="widget-body clearfix">
	        <div class="float-left">
	          <i class="fas fa-tasks"></i>
	        </div>
					<?php $cantidad_tareas_proceso = $this->GeneralModel->conteo('tareas','','',['ESTADO'=>'en proceso'],''); ?>
	        <div class="float-right number"><?php echo $cantidad_tareas_proceso ?></div>
	      </div>
	    </div>
	  </div>
		<div class="col-lg-3 col-md-3 col-sm-6">
	    <div class="widget">
	      <div class="widget-heading clearfix bg-success">
	        <div class="pull-left">Mis Equipos</div>
	      </div>
	      <div class="widget-body clearfix">
	        <div class="float-left">
	          <i class="fa fa-users"></i>
	        </div>
					<?php $cantidad_equipos = $this->GeneralModel->conteo('equipos_usuarios','','',['ID_USUARIO'=>$_SESSION['usuario']['id']],''); ?>
	        <div class="float-right number"><?php echo $cantidad_equipos; ?></div>
	      </div>
	    </div>
	  </div>
	</div>
</div>
