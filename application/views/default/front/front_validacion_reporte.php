<?php
$revisiones = $this->GeneralModel->lista('validacion_revisiones','',['ID_PROYECTO'=>$_GET['id'],'FECHA'=>$_GET['fecha_revision']],'','','');
$lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$revisiones[0]->ID_LISTA]);
$dimensiones = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$revisiones[0]->ID_LISTA],'','','');

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
                <?php foreach($revisiones as $revision){ ?>
                    <?php $detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$revision->ID_TAREA]); ?>
                    <tr>
                        <td><?php echo $detalles_tarea['TAREA_TITULO']; ?></td>
                        <?php foreach($dimensiones as $dimension){ ?>
                        <td>
                            <?php
                                $parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION' =>$dimension->ID_DIMENSION],'','','');
                                $respuestas = 0;
                                $respuestas_validadas = 0;
                                foreach($parametros as $parametro){
                                    $detalles_respuesta = $this->GeneralModel->detalles('validacion_respuesta',['ID_REVISION'=>$revision->ID_REVISION,'ID_PARAMETRO'=>$parametro->ID_PARAMETRO]);
                                    $respuestas ++;
                                    if($detalles_respuesta['VALOR']=='validada'){
                                        $respuestas_validadas ++;
                                    }
                                }
                            ?>
                            <?php echo ($respuestas_validadas*100)/$respuestas; ?>%
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
