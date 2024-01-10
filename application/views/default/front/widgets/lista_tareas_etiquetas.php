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
        <h5 class="bg-secondary bg-opacity-10 text-secondary p-2 d-inline mb-0 me-4 rounded-top"><i class="fa fa-tag"></i> Generales <small class="fa fa-chevron-down"></small></h5>
        
    </div>
    <div class="p-3 bg-secondary bg-opacity-10 collapse show rounded-bottom" id="collapseGenerales">
        <ul class="list-unstyled lista_tareas <?php echo $modo; ?> m-0">

            <div class="d-flex justify-content-start align-items-center py-2 head-lista-tareas me-3">
            <small class="status"><i class="fa-solid fa-bars-progress"></i> Estado</small>
            <small class="me-auto">Tarea</small>
            <small class="usuario-activo"><i class="fa-solid fa-user"></i> Usuario</small>
            <small class="proceso-actual me-4"><i class="fa-solid fa-bars-staggered"></i> Proceso</small>
            <small class="me-4">Controles</small>
            </div>
            <?php $fecha = ''; foreach($tareas as $tarea){ ?>
            <?php if($fecha != $tarea->FECHA_FINAL){ $fecha = $tarea->FECHA_FINAL; ?>
            <?php } ?>

            <li class="px-2">
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
                        <?php if($procesos_totales>0){ ?>
                        <span class="pe-4">
                        <?php echo fechas_es($detalles_proceso_activo['FECHA']); ?>
                            <?php if(date('Y-m-d')>date('Y-m-d', strtotime($detalles_proceso_activo['FECHA']))&&$porcentaje_completo!=100){ echo '<span class="badge bg-danger text-white" title="'.$detalles_proceso_activo['FECHA'].'">Atrasado</span>'; } ?>
                            <?php if(date('Y-m-d')==date('Y-m-d', strtotime($detalles_proceso_activo['FECHA']))&&$porcentaje_completo!=100){ echo '<span class="" title="'.$detalles_proceso_activo['FECHA'].'">Entrega hoy</span>'; } ?>
                            <?php if(date('Y-m-d')<date('Y-m-d', strtotime($detalles_proceso_activo['FECHA']))&&$porcentaje_completo!=100){ echo '<span class="" title="'.$detalles_proceso_activo['FECHA'].'">A tiempo</span>'; } ?>
                        
                        </span>
                        <span class="pe-4 proceso-actual ">
                        <?php echo $procesos_completo; ?>/<?php echo $procesos_totales; ?> <?php echo $detalles_proceso_activo['ETIQUETA']; ?></span>
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
        <h5 class="boton_etiqueta bg-secondary bg-opacity-10 text-secondary p-2 d-inline mb-0 me-2 rounded-top" data-bs-toggle="collapse" href="#collapse<?php echo $etiqueta->ID ?>" role="button" aria-expanded="false" aria-controls="collapse<?php echo $etiqueta->ID ?>"><i class="fa fa-tag"></i> <?php echo $etiqueta->ETIQUETA ?> <small class="fa fa-chevron-down"></small></h5>
        <div class="dropdown">
            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-solid fa-bars"></i> 
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

    <div class="p-3 bg-secondary bg-opacity-10 collapse show rounded-bottom" id="collapse<?php echo $etiqueta->ID ?>">
        <ul class="list-unstyled lista_tareas <?php echo $modo; ?>">


        <?php $fecha = ''; foreach($tareas as $tarea){ ?>
        <?php if($fecha != $tarea->FECHA_FINAL){ $fecha = $tarea->FECHA_FINAL; ?>
            <div class="d-flex justify-content-start align-items-center py-2 head-lista-tareas me-3">
                <small class="status"><i class="fa-solid fa-bars-progress"></i> Estado</small>
                <small class="me-auto">Tarea</small>
                <small class="usuario-activo"><i class="fa-solid fa-user"></i> Usuario</small>
                <small class="proceso-actual me-4"><i class="fa-solid fa-bars-staggered"></i> Proceso</small>
                <small class="me-4">Controles</small>
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
                $usuario_proceso = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$detalles_proceso_activo['ID_USUARIO']]);
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
                <?php if($procesos_totales>0){ ?>
                    <span class="pe-4">
                    <?php echo fechas_es($detalles_proceso_activo['FECHA']); ?>
                    <?php if(date('Y-m-d')>date('Y-m-d', strtotime($detalles_proceso_activo['FECHA']))&&$porcentaje_completo!=100){ echo '<span class="badge bg-danger text-white" title="'.$detalles_proceso_activo['FECHA'].'">Atrasado</span>'; } ?>
                    <?php if(date('Y-m-d')==date('Y-m-d', strtotime($detalles_proceso_activo['FECHA']))&&$porcentaje_completo!=100){ echo '<span class="" title="'.$detalles_proceso_activo['FECHA'].'">Entrega hoy</span>'; } ?>
                    <?php if(date('Y-m-d')<date('Y-m-d', strtotime($detalles_proceso_activo['FECHA']))&&$porcentaje_completo!=100){ echo '<span class="" title="'.$detalles_proceso_activo['FECHA'].'">A tiempo</span>'; } ?>
                    
                    </span>
                    <span class="pe-4 proceso-actual ">
                    <?php echo $procesos_completo; ?>/<?php echo $procesos_totales; ?> <?php echo $detalles_proceso_activo['ETIQUETA']; ?></span>
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