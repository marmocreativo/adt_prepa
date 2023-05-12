<script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
<style>
    img{
        width:100% !important;
    }
</style>
<?php
	$usuarios = $this->GeneralModel->lista_join('usuarios',['equipos_usuarios'=>'equipos_usuarios.ID_USUARIO = usuarios.ID_USUARIO'],'',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','usuarios.ID_USUARIO');
?>
<a href="<?php echo base_url('index.php/proyectos/detalles?id='.$proyecto['ID_PROYECTO']); ?>" class="btn btn-outline-primary mb-3"><i class="fas fa-chevron-circle-left"></i> Volver al proyecto</a>
<div class="row ">
	<div class="col-12 col-md-4">
		<div class="proyecto <?php echo $modo; ?> border-0 border-bottom border-end">
        <div class="row">
            <div class="col-8">
                <h1 class="h4"><?php echo $proyecto['PROYECTO_NOMBRE'] ?></h1>
                <p>Tareas incluidas en esta revisión</p>
            </div>
            <div class="col-4">
                <div id="qrcodeb"></div>
            </div>
        </div>
			
            <ul class="list-group">
                <?php foreach($tareas as $tarea){ ?>
                    <li class="list-group-item d-flex justify-content-between"><p><a href="<?php echo base_url('index.php/tareas/detalles?id='.$tarea->ID_TAREA); ?>"><?php echo $tarea->TAREA_TITULO; ?></a></p>
                    <?php if(!isset($_GET['tarea'])||$_GET['tarea']!=$tarea->ID_TAREA){ ?>
                        <a  href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&fecha_revision='.$_GET['fecha_revision'].'&tarea='.$tarea->ID_TAREA); ?>"
                            class="btn btn-success btn-xs">Cotejar</a>
                    </li>
                    <?php } // condición ?>
                <?php }//bucle de tareas ?>
            </ul>
        </div>
	</div>
	<div class="col-12 col-md-8">
    <?php if(isset($_GET['tarea'])&&!empty($_GET['tarea'])){ ?>
        <?php
            $detalles_revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_PROYECTO'=>$proyecto['ID_PROYECTO'],'FECHA'=>$_GET['fecha_revision'],'ID_TAREA'=>$_GET['tarea']]);
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
        <div class="card proyecto mb-3">
            <div class="card-header border-bottom border-primary d-flex" style="background-color: transparent;">
            <h4 class="text-secondary display-6 fw-bold"><?php echo $dimension_activa['TITULO']; ?></h4>
            <p class="text-secondary display-6 text-primary ms-3"><span class="ml-2"><?php echo $lugar_dimension; ?> de <?php echo $conteo_dimension; ?></span></p>
            </div>

            <!-- Filtros -->
            <div class="d-none">
                <div class="btn-group d-flex" role="group" aria-label="Filtros">
                <div class="btn-group flex-fill dropdown-center" role="group">
                <button type="button" class="btn btn-outline-secondary dropdown-toggle border-0 border-bottom" data-bs-toggle="dropdown" aria-expanded="false">
                    Criterio
                </button>
                <ul class="dropdown-menu">
                    <?php ?>
                    <li><a class="dropdown-item" href="#">Calidad</a></li>
                </ul>
                </div>
                <div class="btn-group flex-fill dropdown-center" role="group">
                <button type="button" class="btn btn-outline-secondary dropdown-toggle border-0 border-bottom" data-bs-toggle="dropdown" aria-expanded="false">
                    Nivel
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">1</a></li>
                    <li><a class="dropdown-item" href="#">2</a></li>
                    <li><a class="dropdown-item" href="#">3</a></li>
                </ul>
                </div>
                <div class="btn-group flex-fill dropdown-center" role="group">
                    <button type="button" class="btn btn-outline-secondary dropdown-toggle border-0 border-bottom" data-bs-toggle="dropdown" aria-expanded="false">
                    Accesibilidad
                    </button>
                    <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">A</a></li>
                    <li><a class="dropdown-item" href="#">AA</a></li>
                    <li><a class="dropdown-item" href="#">AAA</a></li>
                    </ul>
                </div>
                </div>
            </div>

            <!-- Cuerpo de listado -->
            <div class="card-body text-secondary">
            <div class="list-group shadow-sm">
                <?php $parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION'=>$dimension_activa['ID_DIMENSION']],'','',''); ?>
                <?php foreach($parametros as $parametro){ ?>
                    <?php
                    $mostrar = '';
                    $respuesta = $this->GeneralModel->detalles('validacion_respuesta',['ID_REVISION'=>$detalles_revision['ID_REVISION'],'ID_PARAMETRO'=>$parametro->ID_PARAMETRO]);    
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
                            <div class="col-7">
                                <div class="me-auto">
                                    <div class="form-check">
                                    <input class="form-check-input check-respuesta" type="checkbox" value=""
                                        data-respuesta='<?php echo $respuesta['ID_RESPUESTA']; ?>'
                                        id="Check-<?php echo $parametro->ID_PARAMETRO; ?>"
                                        <?php if($respuesta['VALOR']=='validada'){ echo 'checked'; } ?>
                                        >
                                    <label class="z-2 form-check-label" for="Check-<?php echo $parametro->ID_PARAMETRO; ?>"><h5><?php echo $parametro->TITULO; ?></h5></label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2 text-right">
                                <span class="badge bg-info rounded-pill mx-1 text-white"><?php echo $meta_datos_parametros['nivel_accesibilidad'] ?></span>
                            </div>
                            <div class="col-2 text-right">
                                <span class="badge bg-warning rounded-pill mx-1"><?php echo $meta_datos_parametros['nivel'] ?></span>
                            </div>
                            <div class="col-1 text-right">
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
            <div class="btn-group" role="group" aria-label="Navegación de dimensiones">
                <?php
                    $dimension_anterior = $lugar_dimension-1;
                    $dimension_siguiente = $lugar_dimension+1;
                ?>
                <?php if($dimension_anterior>0){ ?>
                <a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$_GET['tarea'].'&dimension='.$orden_dimensiones[$dimension_anterior]); ?>" class="btn btn-outline-secondary btn-lg">Anterior</a>
                <?php } ?>
                <?php if($dimension_siguiente<=$conteo_dimension){ ?>
                <a href="<?php echo base_url('index.php/proyectos/validacion?id='.$proyecto['ID_PROYECTO'].'&fecha_revision='.$detalles_revision['FECHA'].'&tarea='.$_GET['tarea'].'&dimension='.$orden_dimensiones[$dimension_siguiente]); ?>" class="btn btn-secondary btn-lg">Siguiente</a>
                <?php } ?>
            </div>
            </div>
        </div>
        </div>
    <?php }else{ ?>
        <p>Por favor selecciona una de las tareas de la izquierda para comenzar</p>
    <?php } ?>
    </div>

<script type="text/javascript">
        new QRCode(document.getElementById("qrcodeb"), {
            text: "<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']; ?>"
        });
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


