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
                    <th>Resumen</th>
                    <th>Dimensiones</th>
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
                        <?php
                            $respuestas_totales = $this->GeneralModel->lista('validacion_respuesta','',['ID_REVISION'=>$revision->ID_REVISION,'ID_TAREA'=>$detalles_tarea['ID_TAREA']],'','','');
                            $respuestas_validadas = $this->GeneralModel->lista('validacion_respuesta','',['ID_REVISION'=>$revision->ID_REVISION,'ID_TAREA'=>$detalles_tarea['ID_TAREA'],'VALOR'=>'validada'],'','','');
                            $numero_totales = count($respuestas_totales);
                            $numero_validadas = count($respuestas_validadas);
                            $total_totales += $numero_totales;
                            $total_validadas += $numero_validadas;
                        ?>
                        <td>
                            <?php echo $numero_validadas; ?> / <?php echo $numero_totales; ?><br>
                            <?php echo ($numero_validadas / $numero_totales) * 100; ?>%<br>
                        </td>
                        <td>
                            <table class="table">
                                <tr>
                                    <?php foreach($dimensiones as $dimension){ ?>
                                        <?php $parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION'=>$dimension->ID_DIMENSION],'','',''); ?> 
                                        <?php foreach($parametros as $parametro){ ?>
                                            <?php $respuesta = $this->GeneralModel->detalles('validacion_respuesta',['ID_REVISION'=>$revision->ID_REVISION,'ID_TAREA'=>$detalles_tarea['ID_TAREA'],'ID_PARAMETRO'=>$parametro->ID_PARAMETRO]); ?>
                                            <td><?php echo $parametro->TITULO; ?> <?php if($respuesta['VALOR']=='validada'){ echo '<i class="fa fa-check text-success"></i>';}else{ echo '<i class="fa fa-times text-danger"></i>'; } ?></td>
                                            
                                        <?php } ?>
                                    <?php } ?>
                                </tr>
                            </table>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
        <h4>Resultado final</h4>
        <p><?php echo $total_validadas; ?> / <?php echo $total_totales; ?><br>
            <?php echo round(($total_validadas / $total_totales) * 100,2); ?>%<br></p>
    </div>
    </div>
</div>
