<?php
        // Variables de busqueda
			$parametros_and = array();
			$parametros_or = array();

			$parametros_and['tareas.ID_PROYECTO'] = $_GET['id'];
            $parametros_and['tareas.ID_ETIQUETA'] = '';

			$tablas_join = array();
            $tareas = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,'tareas.FECHA_FINAL ASC','','','');

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
<div class="contenedor-etiquetas ui-sortable" data-tabla="tareas_etiquetas" data-columna="ID">
<?php if(!empty($tareas)){ ?>
<div class="etiqueta_contenedor" style="margin-bottom: 30px;">
    <div data-bs-toggle="collapse" href="#collapseGenerales" role="button" aria-expanded="false" aria-controls="collapseGenerales">
        <h4 class="border-top border-start border-end border-info text-info p-2 d-inline collapse show"><i class="fa fa-tag"></i> Generales <i class="fa fa-chevron-down"></i></h4>
        
    </div>
    <div class="border-bottom border-start border-end border-info p-4" id="collapseGenerales">
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
                <div class="d-flex justify-content-start align-items-center py-2 head-lista-tareas me-3">
                    <small class="status"><i class="fa-solid fa-bars-progress"></i> Estado</small>
                    <small class="me-auto">Nombre de la tarea</small>
                    <small class="usuario-activo"><i class="fa-solid fa-user"></i> Usuario activo</small>
                    <small class="proceso-actual me-4"><i class="fa-solid fa-bars-staggered"></i> Proceso activo</small>
                </div>
            <?php } ?>

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
                    if(!empty($detalles_proceso_activo)){
                        $usuario_proceso = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$detalles_proceso_activo['ID_USUARIO']]);
                    }else{
                        $usuario_proceso = null;
                    }
                    
                    $procesos_totales = $this->GeneralModel->conteo_elementos('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA]);
                    $procesos_pendiente = $this->GeneralModel->conteo_elementos('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA,'ESTADO'=>'pendiente']);
                    $procesos_completo = $this->GeneralModel->conteo_elementos('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA,'ESTADO'=>'completo']);
                ?>
                <div class="d-flex justify-content-start align-items-center py-2">
                    <small class="badge-tarea px-2 border <?php echo ' '.$color; ?> bg-opacity-25 me-3 rounded-pill"><i class="<?php echo $icono.' '; ?>"></i><?php echo ' '.$estado; ?></small>
                    <a class="me-auto nombre-tarea" href="<?php echo base_url('index.php/tareas/detalles?id='.$tarea->ID_TAREA); ?>">
                    <span title="<?php echo $tarea->ESTADO; ?>"> <?php echo $tarea->TAREA_TITULO; ?></span>
                    </a>
                    <?php if(!empty($detalles_proceso_activo)){ ?>
                    <a class="usuario-asignado text-muted pe-4">
                                <img src=" <?php echo base_url('contenido/img/usuarios/default.jpg'); ?>" title="<?php echo $usuario_proceso['USUARIO_NOMBRE'].' '.$usuario_proceso['USUARIO_APELLIDOS']; ?>" width="50px" class="rounded-circle border border-secondary" alt="">
                                <span><?php echo $usuario_proceso['USUARIO_NOMBRE']; ?></span>
                    </a>
                    <?php }else{ ?>
                    <a class="usuario-asignado text-muted pe-4">
                        <span>N/A</span>
                    </a>
                    <?php } ?>
                    <?php if($procesos_totales>0&&!empty($detalles_proceso_activo)){ ?>
                    <span class="pe-4 proceso-actual "><?php echo $procesos_completo; ?>/<?php echo $procesos_totales; ?> <?php echo $detalles_proceso_activo['ETIQUETA']; ?></span>
                        <?php }else{ ?>
                        <span class="pe-4 proceso-actual ">N/A</span>
                        <?php } ?>
                    <button data-enlace="<?php echo base_url('index.php/tareas/borrar?id='.$tarea->ID_TAREA); ?>" class="ml-2 btn btn-outline-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i></button>
                </div>

                </div>
            
            </li>
            <?php } ?>
        </ul>
    </div>
</div>
<?php } ?>
<?php foreach($etiquetas as $etiqueta){ ?>
    <?php
        // Variables de busqueda
			$parametros_and = array();
			$parametros_or = array();

			$parametros_and['tareas.ID_PROYECTO'] = $_GET['id'];
            $parametros_and['tareas.ID_ETIQUETA'] = $etiqueta->ID;

			$tablas_join = array();
            $tareas = $this->GeneralModel->lista_join('tareas',$tablas_join,$parametros_or,$parametros_and,'tareas.FECHA_FINAL ASC','','','');
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
<div class="etiqueta_contenedor ui-sortable-handle" style="margin-bottom: 30px;" id="item-<?php echo $etiqueta->ID; ?>">
    <div class="d-flex justify-content-start">
        <h4 class="border-top border-start border-end border-info text-info p-2 d-inline me-4" data-bs-toggle="collapse" href="#collapse<?php echo $etiqueta->ID ?>" role="button" aria-expanded="false" aria-controls="collapse<?php echo $etiqueta->ID ?>"><i class="fa fa-tag"></i> <?php echo $etiqueta->ETIQUETA ?> <i class="fa fa-chevron-down"></i></h4>
        <div class="dropdown">
        <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            opciones
        </button>
        <ul class="dropdown-menu">
            <li><a data-enlace="<?php echo base_url('index.php/proyectos/borrar_etiqueta?id='.$tarea->ID_PROYECTO.'&id_etiqueta='.$etiqueta->ID); ?>" class="dropdown-item borrar_entrada"> <i class="fas fa-trash"></i> Borrar</a></li>
            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#EditarEtiqueta<?php echo $etiqueta->ID; ?>"> <i class="fas fa-pencil"></i> Editar</a></li>
        </ul>
        </div>
        <!-- Modal edición etiqueta-->
        <div class="modal fade" id="EditarEtiqueta<?php echo $etiqueta->ID; ?>" tabindex="-1" aria-labelledby="EditarEtiqueta<?php echo $etiqueta->ID; ?>" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="NuevaTareaLabel">Editar Etiqueta</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="" action="<?php echo base_url('index.php/proyectos/actualizar_etiqueta'); ?>" method="post">
                        <input type="hidden" name="IdEtiqueta" value="<?php echo $etiqueta->ID; ?>">
                        <input type="hidden" name="IdProyecto" value="<?php echo $proyecto['ID_PROYECTO']; ?>">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="Etiqueta">Nuevo Nombre</label>
                                <input type="text" class="form-control" name="Etiqueta" value="<?php echo $etiqueta->ETIQUETA; ?>">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary"> <i class="fa fa-save"></i> Guardar</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="border-bottom border-start border-end border-info p-4 collapse show" id="collapse<?php echo $etiqueta->ID ?>">
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
                <div class="d-flex justify-content-start align-items-center py-2 head-lista-tareas me-3">
                    <small class="status"><i class="fa-solid fa-bars-progress"></i> Estado</small>
                    <small class="me-auto">Nombre de la tarea</small>
                    <small class="usuario-activo"><i class="fa-solid fa-user"></i> Usuario activo</small>
                    <small class="proceso-actual me-4"><i class="fa-solid fa-bars-staggered"></i> Proceso activo</small>
                </div>
            <?php } ?>

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
                    if(!empty($detalles_proceso_activo)){
                        $usuario_proceso = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$detalles_proceso_activo['ID_USUARIO']]);
                    }else{
                        $usuario_proceso = null;
                    }
                    
                    $procesos_totales = $this->GeneralModel->conteo_elementos('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA]);
                    $procesos_pendiente = $this->GeneralModel->conteo_elementos('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA,'ESTADO'=>'pendiente']);
                    $procesos_completo = $this->GeneralModel->conteo_elementos('roles_historial',['ID_TAREA'=>$tarea->ID_TAREA,'ESTADO'=>'completo']);
                ?>
                <div class="d-flex justify-content-start align-items-center py-2">
                    <small class="badge-tarea px-2 border <?php echo ' '.$color; ?> bg-opacity-25 me-3 rounded-pill"><i class="<?php echo $icono.' '; ?>"></i><?php echo ' '.$estado; ?></small>
                    <a class="me-auto nombre-tarea" href="<?php echo base_url('index.php/tareas/detalles?id='.$tarea->ID_TAREA); ?>">
                    <span title="<?php echo $tarea->ESTADO; ?>"> <?php echo $tarea->TAREA_TITULO; ?></span>
                    </a>
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
                    <?php if($procesos_totales>0&&isset($detalles_proceso_activo['ETIQUETA'])){ ?>
                    <span class="pe-4 proceso-actual "><?php echo $procesos_completo; ?>/<?php echo $procesos_totales; ?> <?php echo $detalles_proceso_activo['ETIQUETA']; ?></span>
                        <?php }else{ ?>
                        <span class="pe-4 proceso-actual ">N/A</span>
                        <?php } ?>
                    <button data-enlace="<?php echo base_url('index.php/tareas/borrar?id='.$tarea->ID_TAREA); ?>" class="ml-2 btn btn-outline-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i></button>
                </div>

                </div>
            
            </li>
            <?php } ?>
        </ul>
    </div>
</div>
<?php } ?>
</div>