<?php
$revision = $this->GeneralModel->detalles('validacion_revisiones',['ID_REVISION'=>$_GET['id_revision']]);
$lista = $this->GeneralModel->detalles('validacion_lista',['ID_LISTA'=>$revision['ID_LISTA']]);
$dimensiones = $this->GeneralModel->lista('validacion_dimension','',['ID_LISTA'=>$revision['ID_LISTA']],'','','');
$mostrar_parametro = verificar_variable('GET','mostrar','todos');

?>
<div class="row">
    <div class="col-8">
        <div class="table-responsive">
            <table class="table table-stripped">
                <thead>
                    <tr>
                        <th>Lista de cotejo
                            <form action="<?php echo base_url('index.php/tareas/validacion_reporte?id='.$tarea['ID_PROYECTO'].'&fecha_revision='.$revision['FECHA'].'&tarea='.$tarea['ID_TAREA']); ?>">
                                <input type="hidden" name="id" value="<?php echo $tarea['ID_PROYECTO']; ?>">
                                <input type="hidden" name="id_revision" value="<?php echo $revision['ID_REVISION']; ?>">
                                <input type="hidden" name="fecha_revision" value="<?php echo $revision['FECHA']; ?>">
                                <input type="hidden" name="tarea" value="<?php echo $tarea['ID_TAREA']; ?>">
                            <div class="input-group">
                              <span class="input-group-text">Mostrar parámetros:</span>

                                <select name="mostrar" class="form-select" id="">
                                    <option value="todos">Todos</option>
                                    <option value="validados">Validados</option>
                                    <option value="no_validados">No Validados</option>
                                </select>
                                <button type="submit" class="btn btn-primary rounded-end-circle">Filtrar</button>
                            </div>
                    </form></th>
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
                                    <th colspan="2"><?php echo $dimension->TITULO; ?></th>
                                </tr>
                                <?php  $parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION'=>$dimension->ID_DIMENSION],'','',''); ?>
                                <?php foreach($parametros as $parametro){ ?>
                                    <?php $respuesta = $this->GeneralModel->detalles('validacion_respuesta',['ID_REVISION'=>$revision['ID_REVISION'],'ID_TAREA'=>$tarea['ID_TAREA'],'ID_PARAMETRO'=>$parametro->ID_PARAMETRO]); ?>
                                    <?php
                                        $clase_parametro = '';
                                        switch ($mostrar_parametro) {
                                            case 'todos':
                                                $clase_parametro = '';
                                                break;

                                            case 'validados':
                                                if($respuesta['VALOR']!='validada'){
                                                    $clase_parametro = 'd-none';
                                                }

                                                break;
                                            case 'no_validados':
                                                if($respuesta['VALOR']=='validada'){
                                                    $clase_parametro = 'd-none';
                                                }

                                                break;
                                        }
                                    ?>
                                <tr class="<?php echo $clase_parametro; ?>">

                                    <td>
                                        <p><?php echo $parametro->TITULO; ?> <?php if($respuesta['VALOR']=='validada'){ echo '<i class="fa fa-check text-success"></i>';}else{ echo '<i class="fa fa-times text-danger"></i>'; } ?></p>
                                        
                                    </td>
                                    <td>
                                         <p><?php if(!empty($respuesta['COMENTARIOS'])){ echo $respuesta['COMENTARIOS']; }else{ echo '-'; } ?></p>
                                    </td>

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
