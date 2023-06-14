<script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
<style>
    img{
        width:100% !important;
    }
</style>
<?php
	$usuarios = $this->GeneralModel->lista_join('usuarios',['equipos_usuarios'=>'equipos_usuarios.ID_USUARIO = usuarios.ID_USUARIO'],'',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','usuarios.ID_USUARIO');
    $detalles_revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_REVISION'=>$_GET['id_revision']]);
?>
<a href="<?php echo base_url('index.php/proyectos/detalles?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-outline-primary mb-3"><i class="fas fa-chevron-circle-left"></i> Volver al proyecto</a>
<div class="row ">
	<div class="col-12 col-md-4">
		<div class="proyecto <?php echo $modo; ?> border-0 border-bottom border-end">
        <h1 class="h4"><small>Proyecto:</small><br><?php echo $proyecto['PROYECTO_NOMBRE'] ?></h1>
        <p>Tareas incluidas en esta revisión</p>

            <ul class="list-group">
                <?php foreach($tareas as $tarea){ ?>
                    <?php $verificar_revision = $this->GeneralModel->detalles('validacion_respuesta',['ID_TAREA'=>$tarea->ID_TAREA,'ID_REVISION'=>$detalles_revision['ID_REVISION']]); ?>
                        
                            <li class="list-group-item d-flex justify-content-between ">
                                <p class="mb-0">
                                <a href="<?php echo base_url('index.php/tareas/detalles?id='.$tarea->ID_TAREA); ?>" title="<?php echo $tarea->TAREA_TITULO; ?>"><?php echo ellipsize($tarea->TAREA_TITULO, 20,1); ?></a>
                                </p>
                                <p class="mb-0">
                                    <?php
                                        $cantidad_parametros = $this->GeneralModel->conteo_elementos('validacion_respuesta',['ID_TAREA'=>$tarea->ID_TAREA,'ID_REVISION'=>$detalles_revision['ID_REVISION']]);
                                        $cantidad_validados = $this->GeneralModel->conteo_elementos('validacion_respuesta',['ID_TAREA'=>$tarea->ID_TAREA,'ID_REVISION'=>$detalles_revision['ID_REVISION'],'VALOR'=>'validada']);
                                    ?>
                                    validados: <b><?php echo $cantidad_validados; ?>/<?php echo $cantidad_parametros; ?></b>
                                </p>
                                <?php if(!isset($_GET['tarea'])||$_GET['tarea']!=$tarea->ID_TAREA){ ?>
                                <a  href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$_GET['fecha_revision'].'&tarea='.$tarea->ID_TAREA); ?>"
                                    class="btn btn-success btn-xs">Cotejar</a>                                
                                <?php } ?>
                                <?php if(isset($_GET['tarea'])&&$_GET['tarea']==$tarea->ID_TAREA){ ?>
                                <h4 class="mb-0"> <i class="fa fa-chevron-right"></i> </h4>
                                
                                <?php } ?>
                            </li>
                <?php }//bucle de tareas ?>
            </ul>
        </div>
	</div>
	<div class="col-12 col-md-8">
    <?php if(isset($_GET['tarea'])&&!empty($_GET['tarea'])){ ?>
        <?php
            $verificar_respuestas = $this->GeneralModel->detalles('validacion_respuesta',['ID_TAREA'=>$_GET['tarea'],'ID_REVISION'=>$detalles_revision['ID_REVISION']]);
            $lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$detalles_revision['ID_LISTA']]);
            $dimensiones = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$detalles_revision['ID_LISTA']],'','','');
            if(isset($_GET['dimension'])&&!empty($_GET['dimension'])){
                $dimension_activa = $this->GeneralModel->detalles('validacion_dimension',['ID_DIMENSION'=>$_GET['dimension']]);
            }else{
                $id_activa = '';
                $i= 0;
                foreach($dimensiones as $dimension){
                    if($i==0){ $id_activa = $dimension->ID_DIMENSION; }
                    $i++;
                }
                $dimension_activa = $this->GeneralModel->detalles('validacion_dimension',['ID_DIMENSION'=>$id_activa]);
            }
            $i=1;
            $lugar_dimension = '1';
            $orden_dimensiones = array();
            foreach($dimensiones as $dimension){
                $orden_dimensiones[$i] =  $dimension->ID_DIMENSION;
                if($dimension->ID_DIMENSION==$dimension_activa['ID_DIMENSION']){
                    $lugar_dimension = $i;
                }
                $i++;
            }
            $conteo_dimension = count($dimensiones);

        ?>
        <?php if(!empty($verificar_respuestas)){ ?>
            <div class="card card-body proyecto mb-3">
                <?php
                    $detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$_GET['tarea']]);
                ?>
                <h4><small>Tarea:</small><br><?php echo $detalles_tarea['TAREA_TITULO']; ?></h4>
            </div>
            <div class="card proyecto mb-3">
            <div class="card-header border-bottom border-primary d-flex" style="background-color: transparent;">
            <p class="ml-2"><?php echo $lugar_dimension; ?> de <?php echo $conteo_dimension; ?> | </p><h4 class="ml-2 text-primary display-6 fw-bold">  <?php echo $dimension_activa['TITULO']; ?></h4>
            <p class="text-secondary display-6 text-primary ms-3"></p>
            </div>
            <?php
                $enlace = array(
                    'id'=>$_GET['id'],
                    'id_revision' => $detalles_revision['ID_REVISION'],
                    'fecha_revision'=>$_GET['fecha_revision'],
                    'tarea'=>verificar_variable('GET','tarea',''),
                    'dimension'=> verificar_variable('GET','dimension',''),
                    'criterio_1' => verificar_variable('GET','criterio_1',''),
                    'criterio_2' => verificar_variable('GET','criterio_2',''),
                    'criterio_3' => verificar_variable('GET','criterio_3',''),
                    'criterio_4' => verificar_variable('GET','criterio_4',''),
                    'criterio_5' => verificar_variable('GET','criterio_5',''),
                );
            ?>

            <!-- Filtros -->
            <div class="row px-4 py-2">
                <div class="col-3 text-center"><p>Checklist</p></div>
                <?php if(!empty($dimension_activa['CRITERIO_1'])){ ?>
                <div class="col border-left text-center">
                    <div class="btn-group dropdown-center" role="group">
                        <button type="button" class="btn btn-outline-secondary dropdown-toggle border-0 border-bottom" data-bs-toggle="dropdown" aria-expanded="false">
                            <?php echo $dimension_activa['CRITERIO_1']; if(!empty(verificar_variable('GET','criterio_1',''))){ echo ' ('.verificar_variable('GET','criterio_1','').')';} ?>
                        </button>
                        <ul class="dropdown-menu">
                            
                            <?php $opciones_1 = explode(', ', $dimension_activa['OPCIONES_1']);?>
                            <?php foreach($opciones_1 as $opcion){ ?>
                                <?php $enlace_opcion = $enlace; $enlace_opcion['criterio_1'] = $opcion?>
                                <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>"><?php echo $opcion; ?></a></li>
                            <?php } ?>
                            <?php $enlace_opcion['criterio_1'] = ''?>
                            <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>">Ningúno</a></li>
                        </ul>
                    </div>
                </div>
                <?php } ?>
                <?php if(!empty($dimension_activa['CRITERIO_2'])){ ?>
                <div class="col border-left text-center">
                    <div class="btn-group dropdown-center" role="group">
                        <button type="button" class="btn btn-outline-secondary dropdown-toggle border-0 border-bottom" data-bs-toggle="dropdown" aria-expanded="false">
                            <?php echo $dimension_activa['CRITERIO_2']; if(!empty(verificar_variable('GET','criterio_2',''))){ echo ' ('.verificar_variable('GET','criterio_2','').')';} ?>
                        </button>
                        <ul class="dropdown-menu">
                            <?php $opciones_2 = explode(', ', $dimension_activa['OPCIONES_2']);?>
                            <?php foreach($opciones_2 as $opcion){ ?>
                                <?php $enlace_opcion = $enlace; $enlace_opcion['criterio_2'] = $opcion;  ?>
                                <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>"><?php echo $opcion; ?></a></li>
                            <?php } ?>
                            <?php $enlace_opcion['criterio_2'] = ''?>
                            <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>">Ningúno</a></li>
                        </ul>
                    </div>
                </div>
                <?php } ?>
                <?php if(!empty($dimension_activa['CRITERIO_3'])){ ?>
                <div class="col border-left text-center">
                    <div class="btn-group dropdown-center" role="group">
                        <button type="button" class="btn btn-outline-secondary dropdown-toggle border-0 border-bottom" data-bs-toggle="dropdown" aria-expanded="false">
                            <?php echo $dimension_activa['CRITERIO_3']; if(!empty(verificar_variable('GET','criterio_3',''))){ echo ' ('.verificar_variable('GET','criterio_3','').')';} ?>
                        </button>
                        <ul class="dropdown-menu">
                            <?php $opciones_3 = explode(', ', $dimension_activa['OPCIONES_3']);?>
                            <?php foreach($opciones_3 as $opcion){ ?>
                                <?php $enlace_opcion = $enlace; $enlace_opcion['criterio_3'] = $opcion;  ?>
                                <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>"><?php echo $opcion; ?></a></li>
                            <?php } ?>
                            <?php $enlace_opcion['criterio_3'] = ''?>
                            <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>">Ningúno</a></li>
                        </ul>
                    </div>
                </div>
                <?php } ?>
                <?php if(!empty($dimension_activa['CRITERIO_4'])){ ?>
                <div class="col border-left text-center">
                    <div class="btn-group dropdown-center" role="group">
                        <button type="button" class="btn btn-outline-secondary dropdown-toggle border-0 border-bottom" data-bs-toggle="dropdown" aria-expanded="false">
                            <?php echo $dimension_activa['CRITERIO_4']; if(!empty(verificar_variable('GET','criterio_4',''))){ echo ' ('.verificar_variable('GET','criterio_4','').')';} ?>
                        </button>
                        <ul class="dropdown-menu">
                            <?php $opciones_4 = explode(', ', $dimension_activa['OPCIONES_4']);?>
                            <?php foreach($opciones_4 as $opcion){ ?>
                                <?php $enlace_opcion = $enlace; $enlace_opcion['criterio_4'] = $opcion;  ?>
                                <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>"><?php echo $opcion; ?></a></li>
                            <?php } ?>
                            <?php $enlace_opcion['criterio_4'] = ''?>
                            <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>">Ningúno</a></li>
                        </ul>
                    </div>
                </div>
                <?php } ?>
                <?php if(!empty($dimension_activa['CRITERIO_5'])){ ?>
                <div class="col border-left text-center">
                    <div class="btn-group dropdown-center" role="group">
                        <button type="button" class="btn btn-outline-secondary dropdown-toggle border-0 border-bottom" data-bs-toggle="dropdown" aria-expanded="false">
                            <?php echo $dimension_activa['CRITERIO_5']; if(!empty(verificar_variable('GET','criterio_5',''))){ echo ' ('.verificar_variable('GET','criterio_5','').')';} ?>
                        </button>
                        <ul class="dropdown-menu">
                        <?php foreach($opciones_5 as $opcion){ ?>
                            <?php $opciones_5 = explode(', ', $dimension_activa['OPCIONES_5']);?>
                            <?php $enlace_opcion = $enlace; $enlace_opcion['criterio_5'] = $opcion;  ?>
                                <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>"><?php echo $opcion; ?></a></li>
                            <?php } ?>
                            <?php $enlace_opcion['criterio_5'] = ''?>
                            <li><a class="dropdown-item" href="<?php echo base_url('index.php/proyectos/validacion?'.http_build_query($enlace_opcion)); ?>">Ningúno</a></li>
                        </ul>
                    </div>
                </div>
                <?php } ?>
                <div class="col text-center"><p>Comentarios</p></div>
            </div>

            <!-- Cuerpo de listado -->
            <div class="card-body">
            <div class="list-group shadow-sm">
                <?php
                    $consulta_parametros = array(
                        'ID_DIMENSION'=>$dimension_activa['ID_DIMENSION']
                    );
                    if(isset($_GET['criterio_1'])&&!empty($_GET['criterio_1'])){ $consulta_parametros['CRITERIO_VALOR_1'] = $_GET['criterio_1']; }
                    if(isset($_GET['criterio_2'])&&!empty($_GET['criterio_2'])){ $consulta_parametros['CRITERIO_VALOR_2'] = $_GET['criterio_2']; }
                    if(isset($_GET['criterio_3'])&&!empty($_GET['criterio_3'])){ $consulta_parametros['CRITERIO_VALOR_3'] = $_GET['criterio_3']; }
                    if(isset($_GET['criterio_4'])&&!empty($_GET['criterio_4'])){ $consulta_parametros['CRITERIO_VALOR_4'] = $_GET['criterio_4']; }
                    if(isset($_GET['criterio_5'])&&!empty($_GET['criterio_5'])){ $consulta_parametros['CRITERIO_VALOR_5'] = $_GET['criterio_5']; }
                ?>
                <?php $parametros = $this->GeneralModel->lista('validacion_parametros','',$consulta_parametros,'','',''); ?>
                <?php foreach($parametros as $parametro){ ?>
                    <?php
                    $mostrar = '';
                    $respuesta = $this->GeneralModel->detalles('validacion_respuesta',['ID_REVISION'=>$detalles_revision['ID_REVISION'],'ID_PARAMETRO'=>$parametro->ID_PARAMETRO,'ID_TAREA'=>$_GET['tarea']]);
                    if(empty($respuesta)){
                        $mostrar = 'd-none';
                    }
                    ?>
                    <?php
                        $meta_parametros = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$parametro->ID_PARAMETRO,'TIPO_OBJETO'=>'parametro'],'','','');
                        $meta_datos_parametros = array(); foreach($meta_parametros as $m){ $meta_datos_parametros[$m->DATO_NOMBRE]= $m->DATO_VALOR; }
                    ?>
                    <li class="list-group-item <?php echo $mostrar; ?>">
                        <div class="row">
                            <div class="col-3">
                                <div class="me-auto">
                                    <div class="form-check">
                                    <input class="form-check-input check-respuesta" type="checkbox" value=""
                                        data-respuesta='<?php echo $respuesta['ID_RESPUESTA']; ?>'
                                        id="Check-<?php echo $parametro->ID_PARAMETRO; ?>"
                                        <?php if($respuesta['VALOR']=='validada'){ echo 'checked'; } ?>
                                        >
                                    <label class="z-2 form-check-label" for="Check-<?php echo $parametro->ID_PARAMETRO; ?>"><p><?php echo $parametro->TITULO; ?></p></label>
                                    </div>
                                </div>
                            </div>
                            <?php if(!empty($dimension_activa['CRITERIO_1'])){ ?>
                                <div class="col text-center border-left border-right">
                                    <span class="badge bg-info rounded-pill mx-1 text-white p-2"><?php echo $parametro->CRITERIO_VALOR_1; ?></span>
                                </div>
                            <?php } ?>
                            <?php if(!empty($dimension_activa['CRITERIO_2'])){ ?>
                                <div class="col text-center border-left border-right">
                                    <span class="badge bg-info rounded-pill mx-1 text-white p-2"><?php echo $parametro->CRITERIO_VALOR_2; ?></span>
                                </div>
                            <?php } ?>
                            <?php if(!empty($dimension_activa['CRITERIO_3'])){ ?>
                                <div class="col text-center border-left border-right">
                                    <span class="badge bg-info rounded-pill mx-1 text-white p-2"><?php echo $parametro->CRITERIO_VALOR_3; ?></span>
                                </div>
                            <?php } ?>
                            <?php if(!empty($dimension_activa['CRITERIO_4'])){ ?>
                                <div class="col text-center border-left border-right">
                                    <span class="badge bg-info rounded-pill mx-1 text-white p-2"><?php echo $parametro->CRITERIO_VALOR_4; ?></span>
                                </div>
                            <?php } ?>
                            <?php if(!empty($dimension_activa['CRITERIO_5'])){ ?>
                                <div class="col text-center border-left border-right">
                                    <span class="badge bg-info rounded-pill mx-1 text-white p-2"><?php echo $parametro->CRITERIO_VALOR_5; ?></span>
                                </div>
                            <?php } ?>
                            <div class="col text-center">
                                <button class="btn btn-primary rounded-circle px-2" type="button" data-bs-toggle="collapse" data-bs-target="#comment-<?php echo $parametro->ID_PARAMETRO; ?>" aria-expanded="false" aria-controls="comment-<?php echo $parametro->ID_PARAMETRO; ?>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chat mb-1" viewBox="0 0 16 16">
                                        <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                                    </svg>
                                </button>
                            </div>
                            <div class="collapse collapse-horizontal" id="comment-<?php echo $parametro->ID_PARAMETRO; ?>">
                                <div class="card card-body bg-light">
                                    <div class="input-group">
                                    <div>
                                        <label for="comentario-<?php echo $respuesta['ID_RESPUESTA']; ?>" class="form-label text-secondary">Comentarios</label>
                                        <textarea class="form-control comentario-respuesta" data-respuesta='<?php echo $respuesta['ID_RESPUESTA']; ?>' id="comentario-<?php echo $respuesta['ID_RESPUESTA']; ?>" rows="2"><?php echo $respuesta['COMENTARIOS'] ?></textarea>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                <?php }// Bucle de parametros ?>
            </div>
            </div>

            <div class="card-footer text-bg-secondary bg-opacity-25 text-end">
            <div class="btn-toolbar" role="toolbar" aria-label="Navegación de dimensiones">
              <div class="btn-group mr-2" role="group" aria-label="Navegacion adelante y atrás">
                <?php
                    $dimension_anterior = $lugar_dimension-1;
                    $dimension_siguiente = $lugar_dimension+1;
                ?>
                <?php if($dimension_anterior>0){ ?>
                <a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$_GET['tarea'].'&dimension='.$orden_dimensiones[$dimension_anterior]); ?>" class="btn btn-outline-primary btn-lg"><i class="fa-solid fa-chevron-left"></i> Anterior</a>
                <?php } ?>
                <?php if($dimension_siguiente<=$conteo_dimension){ ?>
                <a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$_GET['tarea'].'&dimension='.$orden_dimensiones[$dimension_siguiente]); ?>" class="btn btn-primary btn-lg">Siguiente <i class="fa-solid fa-chevron-right"></i></a>

                <?php }else{ ?>
                    <div class="btn-group" role="group" aria-label="Boton de terminar">
                        <a href="<?php echo base_url('index.php/proyectos/validacion_finalizar?id='.$proyecto['ID_PROYECTO'].'&id_revision='.$detalles_revision['ID_REVISION'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$_GET['tarea']); ?>" class="btn-secondary btn-lg">Finalizar</a>
                    </div>
                <?php } ?>
              </div>
              
            </div>
            </div>
        </div>
        </div>
        <?php }else{ ?>
            <div class="card card-body">
                <p>Esta tarea no fue considerada para está revisión es posible que no existiera cuando se solicitó la validación del trabajo.</p>
                <p>Si lo deseas puedes <a href="<?php echo base_url('index.php/tareas/validacion_faltante?id_revision='.$detalles_revision['ID_REVISION'].'&tarea='.$_GET['tarea']); ?>">Agregar esta tarea a la revisión</a></p>
            </div>
            <?php } ?>
    <?php }else{ ?>
        <p>Por favor selecciona una de las tareas de la izquierda para comenzar</p>
    <?php } ?>
    </div>

<script type="text/javascript">
    /*
        new QRCode(document.getElementById("qrcodeb"), {
            text: "<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']; ?>"
        });
        */
        /*-------------------*/
        const checkboxes = document.querySelectorAll('.check-respuesta');

        const textareas = document.querySelectorAll('.comentario-respuesta');

        textareas.forEach(function(textarea) {
            textarea.addEventListener('input', function() {
                const valor = this.value;
                const respuesta = this.dataset.respuesta;
                const xhr = new XMLHttpRequest();
                     // Crear un objeto con los datos del formulario
                     let datosFormulario = "?respuesta="+respuesta+"&comentario="+valor;
                    // Configurar la solicitud
                    xhr.open('GET', '<?php echo base_url('index.php/ajax/registrar_comentario'); ?>'+datosFormulario);

                    // Establecer el tipo de contenido de la solicitud
                    xhr.setRequestHeader('Content-Type', 'application/json');

                    // Definir el manejo de la respuesta
                    xhr.onload = function() {
                    if (xhr.status === 200) {
                        // Procesar la respuesta
                        const respuesta = xhr.responseText;
                        console.log(respuesta);
                    }
                    };


                    xhr.send();
            });
        });

        checkboxes.forEach(function(checkbox) {
            checkbox.addEventListener('click', function() {
                if (this.checked) {
                    const valor = this.dataset.respuesta;

                    const xhr = new XMLHttpRequest();
                     // Crear un objeto con los datos del formulario
                     let datosFormulario = "?marcada=si&respuesta="+valor;
                    // Configurar la solicitud
                    xhr.open('GET', '<?php echo base_url('index.php/ajax/registrar_respuesta'); ?>'+datosFormulario);

                    // Establecer el tipo de contenido de la solicitud
                    xhr.setRequestHeader('Content-Type', 'application/json');

                    // Definir el manejo de la respuesta
                    xhr.onload = function() {
                    if (xhr.status === 200) {
                        // Procesar la respuesta
                        const respuesta = xhr.responseText;
                        console.log(respuesta);
                    }
                    };


                    xhr.send();
                }else{
                    const valor = this.dataset.respuesta;

                    const xhr = new XMLHttpRequest();
                     // Crear un objeto con los datos del formulario
                     let datosFormulario = "?marcada=no&respuesta="+valor;
                    // Configurar la solicitud
                    xhr.open('GET', '<?php echo base_url('index.php/ajax/registrar_respuesta'); ?>'+datosFormulario);

                    // Establecer el tipo de contenido de la solicitud
                    xhr.setRequestHeader('Content-Type', 'application/json');

                    // Definir el manejo de la respuesta
                    xhr.onload = function() {
                    if (xhr.status === 200) {
                        // Procesar la respuesta
                        const respuesta = xhr.responseText;
                        console.log(respuesta);
                    }
                    };


                    xhr.send();
                }
            });
        });

</script>
