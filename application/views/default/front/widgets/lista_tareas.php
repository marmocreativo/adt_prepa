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
<ul class="list-unstyled lista_tareas <?php echo $modo; ?>">
  <?php $fecha = ''; foreach($tareas as $tarea){ ?>
    <?php if($fecha != $tarea->FECHA_FINAL){ $fecha = $tarea->FECHA_FINAL; ?>
      <li class="border-0 border-bottom fecha_tareas">
        <p><i class="fas fa-calendar-alt"></i> <?php echo fechas_es($tarea->FECHA_FINAL); ?>
          <?php if(date('Y-m-d')>date('Y-m-d', strtotime($tarea->FECHA_FINAL))&&$porcentaje_completo!=100){ echo '<span class="badge bg-danger text-white">Atrasado</span>'; } ?>
          <?php if(date('Y-m-d')==date('Y-m-d', strtotime($tarea->FECHA_FINAL))&&$porcentaje_completo!=100){ echo '<span class="badge bg-warning text-white">Entrega hoy</span>'; } ?>
          <?php if(date('Y-m-d')<date('Y-m-d', strtotime($tarea->FECHA_FINAL))&&$porcentaje_completo!=100){ echo '<span class="badge bg-success text-white">A tiempo</span>'; } ?>
        </p>
      </li>
    <?php } ?>
  <li>
      <div class="row">
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
        <div class="col-2 col-md-1 fondo-icono d-flex justify-content-center align-items-center">
          <i class="<?php echo $icono.' '.$color; ?>"></i>
        </div>
        <div class="col-9 col-md-8 d-flex justify-content-start align-items-center pt-2">
          <a href="<?php echo base_url('index.php/tareas/detalles?id='.$tarea->ID_TAREA); ?>">
          <p title="<?php echo $tarea->ESTADO; ?>" style="word-break: break-word;"> <?php echo $tarea->TAREA_TITULO; ?></p>
          </a>
        </div>
        <div class="col-1 col-md-3">
        <button data-enlace="<?php echo base_url('index.php/tareas/borrar?id='.$tarea->ID_TAREA); ?>" class="ml-2 btn btn-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar tarea</button>
        </div>

      </div>
   
  </li>
<?php } ?>
</ul>
