<?php
$revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_REVISION'=>$_GET['id_revision']]);
$lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$revision['ID_LISTA']]);
$dimensiones = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$revision['ID_LISTA']],'','','');

?>
<div class="row">
    <div class="col-12">
    <div class="table-responsive">
        <table class="table table-stripped">
            <thead>
                <tr>
                    <th>Tareas</th>
                    <?php foreach($dimensiones as $dimension){ ?>
                    <th><?php echo $dimension->TITULO; ?></th>
                    <?php } ?>
                </tr>
            </thead>
            <?php
                $total_totales= 0;
                $total_validadas= 0;
            ?>
            <tbody>
                    <?php $tareas = $this->GeneralModel->lista_agrupada('validacion_respuesta','',['ID_REVISION'=>$revision['ID_REVISION']],'','ID_TAREA'); ?>
                    <?php foreach($tareas as $tarea){ ?>
                        <?php $detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$tarea->ID_TAREA]); ?>
                        <tr>
                        <td><a href="<?php echo base_url('index.php/tareas/validacion_reporte?id='.$revision['ID_PROYECTO'].'&id_revision='.$revision['ID_REVISION'].'&fecha_revision='.$revision['FECHA'].'&tarea='.$tarea->ID_TAREA); ?>"> <b><?php echo $detalles_tarea['TAREA_TITULO']; ?></b> </a></td>
                        <?php foreach($dimensiones as $dimension){ ?>
                        <td>
                            <?php
                                $parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION' =>$dimension->ID_DIMENSION],'','','');
                                $respuestas = 0;
                                $respuestas_validadas = 0;
                                foreach($parametros as $parametro){
                                    $lista_respuestas = $this->GeneralModel->lista('validacion_respuesta','',['ID_REVISION'=>$revision['ID_REVISION'],'ID_PARAMETRO'=>$parametro->ID_PARAMETRO,'ID_TAREA'=>$tarea->ID_TAREA],'','','');
                                    foreach($lista_respuestas as $respuesta){
                                        $respuestas ++;
                                        if($respuesta->VALOR=='validada'){
                                            $respuestas_validadas ++;
                                        }
                                    }
                                    
                                }
                            ?>
                            <?php echo round(($respuestas_validadas*100)/$respuestas,2); ?>%
                        </td>
                        <?php } ?>
                    </tr>
                    <?php } ?>
            </tbody>
        </table>
        <h4>Resultado final</h4>
    </div>
    </div>
</div>
