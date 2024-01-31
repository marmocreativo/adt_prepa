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
<div class="d-flex justify-content-start align-items-center py-2 head-lista-tareas me-3">
          <small class="status"><i class="fa-solid fa-bars-progress"></i> Estado</small>
          <small class="me-auto">Tarea</small>
          <small class="usuario-activo"><i class="fa-solid fa-user"></i> Usuario</small>
          <small class="proceso-actual me-4"><i class="fa-solid fa-bars-staggered"></i> Proceso</small>
          <small class="me-4">Controles</small>
        </div>

  <?php $fecha = ''; foreach($tareas as $tarea){ ?>

  <li>
      <div class="row">
        <?php
          // variables de estado
          switch ($tarea->ESTADO) {
            case 'pendiente':
              $icono = "far fa-circle";
              $color = 'bg-secondary text-secondary border-secondary';
              $estado ='pendiente';
              break;
            case 'en desarrollo':
              $icono = "fa-solid fa-spinner";
              $color = 'bg-info text-bg-info border-info';
              $estado ='en curso';
              // code...
              break;
            case 'completo':
              $icono = "fas fa-circle-check";
              $color = 'bg-success text-success border-success';
              $estado ='finalizada';
              break;
          }

          $parametros_and = array();
          $parametros_or = array();
          $tablas_join = array();
          $tablas_join['usuarios'] = 'usuarios_tareas.ID_USUARIO = usuarios.ID_USUARIO';
          $parametros_and['usuarios_tareas.ID_TAREA'] = $tarea->ID_TAREA;
          $usuarios = $this->GeneralModel->lista_join('usuarios_tareas',$tablas_join,$parametros_or,$parametros_and,'','','','');
         
          $detalles_proceso_activo = $this->GeneralModel->detalles('roles_historial',['ID'=>$tarea->ID_PROCESO]);
          $usuario_proceso = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$detalles_proceso_activo['ID_USUARIO']]);
          $procesos_totales = $this->GeneralModel->conteo_elementos('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA]);
          $procesos_pendiente = $this->GeneralModel->conteo_elementos('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA,'ESTADO'=>'pendiente']);
          $procesos_completo = $this->GeneralModel->conteo_elementos('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA,'ESTADO'=>'completo']);
        ?>
        <div class="d-flex justify-content-start align-items-center py-2">
          <div style="width: 60%">
            <small class="badge-tarea px-2 border <?php echo ' '.$color; ?> bg-opacity-25 me-3 rounded-pill"><i class="<?php echo $icono.' '; ?>"></i><?php echo ' '.$estado; ?></small>
            <a class="me-auto nombre-tarea" href="<?php echo base_url('index.php/tareas/detalles?id='.$tarea->ID_TAREA); ?>">
              <span title="<?php echo $tarea->ESTADO; ?>"> <?php echo $tarea->TAREA_TITULO; ?></span>
            </a>
          </div>
          
          <div class="d-flex" style="width: 40%">
            <?php if(!empty($tarea->ID_PROCESO)){ ?>
            <a class="usuario-asignado text-muted pe-4">
              <img src=" <?php echo base_url('contenido/img/usuarios/default.jpg'); ?>" title="<?php echo $usuario_proceso['USUARIO_NOMBRE'].' '.$usuario_proceso['USUARIO_APELLIDOS']; ?>" width="50px" class="rounded-circle border border-secondary" alt="">
              <span><?php echo $usuario_proceso['USUARIO_NOMBRE']; ?></span>
            </a>
            <?php }else{ ?>
              <a class="usuario-asignado text-muted pe-4">
                <span>N/A</span>
              </a>
              <?php } ?>
              
              <div>
              <?php if($procesos_totales>0){ ?>
                  <span class="pe-4">
                    <?php 
                      if($detalles_proceso_activo['ORDEN']!=0){
                        $fecha_inicio = date('Y-m-d', strtotime($detalles_proceso_activo['FECHA'].' -'.$detalles_proceso_activo['DIAS_DESPUES_ANTERIOR'].' days'));
                      }else{
                        $fecha_inicio = $tarea->FECHA_INICIO;
                      }
                    ?>
                  <?php echo fechas_es($fecha_inicio).' - '.fechas_es($detalles_proceso_activo['FECHA']); ?>
                    <?php if(date('Y-m-d')>date('Y-m-d', strtotime($detalles_proceso_activo['FECHA']))&&$porcentaje_completo!=100){ echo '<span class="badge bg-danger text-white" title="'.$detalles_proceso_activo['FECHA'].'">Atrasado</span>'; } ?>
                    <?php if(date('Y-m-d')==date('Y-m-d', strtotime($detalles_proceso_activo['FECHA']))&&$porcentaje_completo!=100){ echo '<span class="" title="'.$detalles_proceso_activo['FECHA'].'">Entrega hoy</span>'; } ?>
                    <?php if(date('Y-m-d')<date('Y-m-d', strtotime($detalles_proceso_activo['FECHA']))&&$porcentaje_completo!=100){ echo '<span class="" title="'.$detalles_proceso_activo['FECHA'].'">A tiempo</span>'; } ?>
                  
                  </span>
                  <br>
                  <b class="pe-4 proceso-actual ">
                  <?php echo $procesos_completo; ?>/<?php echo $procesos_totales; ?> <?php echo $detalles_proceso_activo['ETIQUETA']; ?></b>
                <?php }else{ ?>
                  <span class="pe-4 proceso-actual ">N/A</span>
                <?php } ?>
              </div>
            </div>
          <button data-enlace="<?php echo base_url('index.php/tareas/borrar?id='.$tarea->ID_TAREA); ?>" class="ml-2 btn btn-outline-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i></button>
        </div>

      </div>
   
  </li>
<?php } ?>
</ul>
