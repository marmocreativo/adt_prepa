<!-- Lista de proyectos -->
<div class="row g-3 gy-35">
<?php foreach($proyectos as $proyecto){ ?>
<div class="col-sm-6 col-xs-12 col-lg-3 ">
<div class="proyecto p-4 <?php echo $modo; ?>">
  <a href="<?php echo base_url('index.php/proyectos/detalles?id='.$proyecto->ID_PROYECTO); ?>">
    <div class="row">
      <div class="col-12">
        <div class="row">
          <div class="col-2 text-center">
            <img src="<?php echo base_url('assets/img/folder.png'); ?>" class="img-fluid" alt="Proyecto">
          </div>
          <div class="col-10">
            <h3 class="h5"><?php echo $proyecto->PROYECTO_NOMBRE; ?></h3>
          </div>
        </div>

      </div>
      <div class="col-12">
        <div class="row">
          <div class="col-12 mb-2">
            <?php
              $tareas = $this->GeneralModel->lista('tareas','',['ID_PROYECTO'=>$proyecto->ID_PROYECTO],'','','');
              $total_tareas = 0;
              $tareas_completas = 0;
              $tareas_incompletas = 0;
              $total_usuario = 0;
              foreach ($tareas as $tarea) {
                $usuarios_asignados = $this->GeneralModel->conteo('usuarios_tareas','','',['ID_TAREA'=>$tarea->ID_TAREA],'ID_USUARIO');
                $total_usuario += $usuarios_asignados;
                $total_tareas ++;
                if($tarea->ESTADO=='completo'){
                  $tareas_completas ++;
                }else{
                  $tareas_incompletas ++;
                }
              }
              if($total_tareas<=0){
                $porcentaje_tareas = 0;
              }else{
                $porcentaje_tareas = ($tareas_completas*100)/$total_tareas;
              }

              $porcentaje_tareas = number_format($porcentaje_tareas,2);

              if($porcentaje_tareas<50){
                $color = 'bg-danger';
              }
              if($porcentaje_tareas>=50){
                $color = 'bg-warning';
              }
              if($porcentaje_tareas==100){
                $color = 'bg-success';
              }
            ?>
            <div class="progress <?php if($modo!='noche'){ echo 'bg-dark'; } ?> mt-3">
              <div class="progress-bar <?php echo $color; ?>" role="progressbar" style="width: <?php echo $porcentaje_tareas; ?>%" aria-valuenow="<?php echo $porcentaje_tareas; ?>" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
          </div>
          <div class="col-6">
            <p class="m-0 opacity-75"><i class="fas fa-clipboard-list"></i> <?php echo $tareas_completas; ?> / <?php echo $total_tareas; ?> Tareas</p>
          </div>
          <div class="col-6">
            <p class="m-0 opacity-75"><i class="fas fa-users"></i> <?php echo $total_usuario; ?> Usuarios</p>
          </div>
        </div>
      </div>
    </div>
  </a>
</div>
</div>

<?php } ?>
</div>
<!-- /lista de proyectos -->
