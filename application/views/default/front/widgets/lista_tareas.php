<?php
$cantidad_tareas = 0;
$cantidad_tareas_completas = 0;
foreach($tareas as $tarea){
  $cantidad_tareas ++;
  $detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$tarea->ID_TAREA]);
  if($detalles_tarea['ESTADO']=='completo'){
    $cantidad_tareas_completas ++;
  }
}
if($cantidad_tareas>0){
  $porcentaje_completo = ($cantidad_tareas_completas*100)/$cantidad_tareas;
}else{
  $porcentaje_completo =100;
}
$color = 'text-success';
$icono = "far fa-clock";
?>
<ul class="list-unstyled lista_tareas">
  <?php $fecha = ''; foreach($tareas as $tarea){ ?>
    <?php if($fecha != $tarea->FECHA_FINAL){ $fecha = $tarea->FECHA_FINAL; ?>
      <li class="p-4 border-0 border-bottom">
        <p class="h4"><i class="fas fa-calendar-alt"></i> <?php echo fechas_es($tarea->FECHA_FINAL); ?>
          <?php if(date('Y-m-d')>date('Y-m-d', strtotime($tarea->FECHA_FINAL))&&$porcentaje_completo!=100){ echo '<span class="badge bg-danger text-white">Atrasado</span>'; } ?>
          <?php if(date('Y-m-d')==date('Y-m-d', strtotime($tarea->FECHA_FINAL))&&$porcentaje_completo!=100){ echo '<span class="badge bg-warning text-white">Entrega hoy</span>'; } ?>
          <?php if(date('Y-m-d')<date('Y-m-d', strtotime($tarea->FECHA_FINAL))&&$porcentaje_completo!=100){ echo '<span class="badge bg-success text-white">A tiempo</span>'; } ?>
        </p>
      </li>
    <?php } ?>
  <li class="ml-3 border-bottom border-light">
    <a href="<?php echo base_url('tareas/detalles?id='.$tarea->ID_TAREA); ?>" class="d-flex row">
      <?php
        // variables de estado
        switch ($tarea->ESTADO) {
          case 'pendiente':
            $icono = "far fa-clock";
            $color = 'text-secondary';
            break;
          case 'en desarrollo':
            $icono = "far fa-square";
            $color = 'text-warning';
            // code...
            break;
          case 'completo':
            $icono = "fas fa-check-square";
            $color = 'text-success';
            break;
        }

        $parametros_and = array();
        $parametros_or = array();
        $tablas_join = array();
        $tablas_join['usuarios'] = 'usuarios_tareas.ID_USUARIO = usuarios.ID_USUARIO';
        $parametros_and['usuarios_tareas.ID_TAREA'] = $tarea->ID_TAREA;
        $usuarios = $this->GeneralModel->lista_join('usuarios_tareas',$tablas_join,$parametros_or,$parametros_and,'','','','');
      ?>
      <div class="col-1 col-md-1 bg-light d-flex justify-content-center align-items-center">
        <i class="<?php echo $icono.' '.$color; ?>"></i>
      </div>
      <div class="col-8 col-md-8 d-flex justify-content-start align-items-center pt-2">
        <p title="<?php echo $tarea->ESTADO; ?>" style="word-break: break-word;"> <?php echo $tarea->TAREA_TITULO; ?></p>
      </div>
      <div class="col-3 col-md-3 d-flex justify-content-center align-items-center pt-2">
        <ul class="list-inline justify-content-start">
          <?php foreach($usuarios as $usuario){ ?>
            <li class="list-inline-item" title="<?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?>">
              <img src="<?php echo base_url('contenido/img/usuarios/'.$usuario->IMAGEN) ?>" width="20" class="rounded-circle border border-primary" alt=""> <span class="badge bg-primary text-white d-none d-sm-inline"><?php echo $usuario->USUARIO_NOMBRE; ?></span>
            </li>
          <?php }; ?>
        </ul>

      </div>

    </a>
  </li>
<?php } ?>
</ul>
