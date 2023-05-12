<?php
$revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_PROYECTO'=>$_GET['id'],'FECHA'=>$_GET['fecha_revision'],'ID_TAREA'=>$_GET['tarea']]);
$lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$revision['ID_LISTA']]);
$dimensiones = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$revision['ID_LISTA']],'','','');

?>
<div class="row">
    <div class="col-8">
        <div class="table-responsive">
            <table class="table table-stripped">
                <thead>
                    <tr>
                        <th>Lista de cotejo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <?php
                            $total_totales= 0;
                            $total_validadas= 0;
                        ?>
                        <?php
                            $respuestas_totales = $this->GeneralModel->lista('validacion_respuesta','',['ID_REVISION'=>$revision['ID_REVISION'],'ID_TAREA'=>$tarea['ID_TAREA']],'','','');
                            $respuestas_validadas = $this->GeneralModel->lista('validacion_respuesta','',['ID_REVISION'=>$revision['ID_REVISION'],'ID_TAREA'=>$tarea['ID_TAREA'],'VALOR'=>'validada'],'','','');
                            $numero_totales = count($respuestas_totales);
                            $numero_validadas = count($respuestas_validadas);
                            $total_totales += $numero_totales;
                            $total_validadas += $numero_validadas;
                        ?>
                        <?php foreach($dimensiones as $dimension){ ?>
                            <table class="table">
                                <tr>
                                    <th><?php echo $dimension->TITULO; ?></th>
                                </tr>
                                <?php $parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION'=>$dimension->ID_DIMENSION],'','',''); ?> 
                                <?php foreach($parametros as $parametro){ ?>
                                     <tr>
                                    <?php $respuesta = $this->GeneralModel->detalles('validacion_respuesta',['ID_REVISION'=>$revision['ID_REVISION'],'ID_TAREA'=>$tarea['ID_TAREA'],'ID_PARAMETRO'=>$parametro->ID_PARAMETRO]); ?>
                                    <td><?php echo $parametro->TITULO; ?> <?php if($respuesta['VALOR']=='validada'){ echo '<i class="fa fa-check text-success"></i>';}else{ echo '<i class="fa fa-times text-danger"></i>'; } ?></td>

                                    </tr>
                                <?php } ?>
                            </table>
                        <?php } ?>
                    </tr>
                </tbody>            
            </table>
        </div>
    </div>
    <div class="col-4">
        <h4>Resumen</h4>
        <p><?php echo $total_validadas; ?> / <?php echo $total_totales; ?><br>
            <?php echo round(($total_validadas / $total_totales) * 100,2); ?>%<br></p>
    </div>
</div>
