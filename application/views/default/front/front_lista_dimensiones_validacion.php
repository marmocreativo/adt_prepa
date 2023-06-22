<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12">
            <?php if(isset($_GET['notif'])){notiget($_GET['notif']);} ?>
            <h3><?php echo $lista['TITULO']; ?></h3>
            <p><?php echo $lista['DESCRIPCION']; ?></p>
			
			<hr>
			<ul class="nav nav-tabs" id="myTab" role="tablist">
                <?php $i=0; foreach($dimensiones as $dimension){ ?>
                <li class="nav-item" role="presentation">
                    <button class="nav-link <?php
                            if(isset($_GET['dimension'])&&!empty($_GET['dimension'])){
                                 if($_GET['dimension']==$dimension->ID_DIMENSION){
                                     echo 'active';
                                }
                            }else{
                                 if($i==0){ echo 'active'; }
                                } ?>"

                            id="tab-<?php echo $dimension->ID_DIMENSION; ?>" data-bs-toggle="tab" data-bs-target="#tab-<?php echo $dimension->ID_DIMENSION; ?>-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true"><?php echo $dimension->TITULO; ?></button>
                </li>
                <?php $i++; } ?>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="n-dimension-tab" data-bs-toggle="tab" data-bs-target="#n-dimension" type="button" role="tab" aria-controls="n-dimension" aria-selected="false"><i class="fa-solid fa-circle-plus"></i> Nueva Dimensión</button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <?php $i=0; foreach($dimensiones as $dimension){ ?>
                <div class="tab-pane fade pt-4 <?php
                            if(isset($_GET['dimension'])&&!empty($_GET['dimension'])){
                                 if($_GET['dimension']==$dimension->ID_DIMENSION){
                                     echo 'show active';
                                }
                            }else{
                                 if($i==0){ echo 'show active'; }
                                } ?> " id="tab-<?php echo $dimension->ID_DIMENSION; ?>-pane" role="tabpanel" aria-labelledby="tab-<?php echo $dimension->ID_DIMENSION; ?>-pane" tabindex="0">
                                    <div class="d-flex">
                                        <h3 class="pe-3 me-3 border-end"><?php echo $dimension->TITULO; ?></h3>
                                        <button type="button" class="btn btn-sm btn-outline-warning me-2" data-bs-toggle="modal" data-bs-target="#editar_dimension_<?php echo $dimension->ID_DIMENSION; ?>">Editar</button>
                                        <button data-enlace="<?php echo base_url('index.php/listas/borrar_dimension?id='.$dimension->ID_DIMENSION); ?>" class="btn btn-outline-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Borrar dimensión <?php echo $dimension->TITULO; ?></button>
                                    </div>
                                    <h4 class="mt-4">Añade un parámetro</h4>    
                                    <div class="border-primary px-3">
                                        <form action="<?php echo base_url('index.php/listas/crear_parametro'); ?>" method='post'>
                                        <input type="hidden" name='IdLista' value="<?php echo $lista['ID_LISTA']; ?>">
                                        <input type="hidden" name='IdDimension' value="<?php echo $dimension->ID_DIMENSION; ?>">
                                        <div class="row p-3 forma-crear-parametro">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <div class="input-group mb-3">
                                                            <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-pen"></i></span>
                                                            <input type="text" class="form-control input_discrete input_head" name='Titulo' placeholder="Titulo del parámetro">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group inputs-criterio d-flex flex-column justify-content-end align-items-start">
                                                        <label class=" " for="Obligatorio">Es un parámetro obligatorio?</label>
                                                        <select name="Obligatorio" class="form-control  ">
                                                            <option value="si">Obligatorio</option>
                                                            <option value="no">Opcional</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <?php if(!empty($dimension->CRITERIO_1)){ ?>
                                                    <?php $opciones_1 = explode(", ", $dimension->OPCIONES_1); ?>
                                                    <div class="col">
                                                        <div class="form-group inputs-criterio d-flex flex-column justify-content-end align-items-start">
                                                            <label class=" " for="CriterioValor1"><?php echo $dimension->CRITERIO_1; ?></label>
                                                            <select name="CriterioValor1" class="form-control  ">
                                                                <?php foreach($opciones_1 as $opcion){ ?>
                                                                <option value="<?php echo $opcion; ?>"><?php echo $opcion; ?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                <?php }else{ ?>
                                                    <input type="hidden" name="CriterioValor1" value="">
                                                <?php } ?>
                                                <?php if(!empty($dimension->CRITERIO_2)){ ?>
                                                    <?php $opciones_2 = explode(", ", $dimension->OPCIONES_2); ?>
                                                    <div class="col">
                                                        <div class="form-group inputs-criterio d-flex flex-column justify-content-end align-items-start">
                                                            <label class=" " for="CriterioValor2"><?php echo $dimension->CRITERIO_2; ?></label>
                                                            <select name="CriterioValor2" class="form-control  ">
                                                                <?php foreach($opciones_2 as $opcion){ ?>
                                                                <option value="<?php echo $opcion; ?>"><?php echo $opcion; ?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                <?php }else{ ?>
                                                    <input type="hidden" name="CriterioValor2" value="">
                                                <?php } ?>
                                                <?php if(!empty($dimension->CRITERIO_3)){ ?>
                                                    <?php $opciones_3 = explode(", ", $dimension->OPCIONES_3); ?>
                                                    <div class="col">
                                                        <div class="form-group inputs-criterio d-flex flex-column justify-content-end align-items-start">
                                                            <label class=" " for="CriterioValor3"><?php echo $dimension->CRITERIO_3; ?></label>
                                                            <select name="CriterioValor3" class="form-control  ">
                                                                <?php foreach($opciones_3 as $opcion){ ?>
                                                                <option value="<?php echo $opcion; ?>"><?php echo $opcion; ?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                <?php }else{ ?>
                                                    <input type="hidden" name="CriterioValor3" value="">
                                                <?php } ?>
                                                <?php if(!empty($dimension->CRITERIO_4)){ ?>
                                                    <?php $opciones_4 = explode(", ", $dimension->OPCIONES_4); ?>
                                                    <div class="col">
                                                        <div class="form-group inputs-criterio d-flex flex-column justify-content-end align-items-start">
                                                            <label class=" " for="CriterioValor4"><?php echo $dimension->CRITERIO_4; ?></label>
                                                            <select name="CriterioValor4" class="form-control  ">
                                                                <?php foreach($opciones_4 as $opcion){ ?>
                                                                <option value="<?php echo $opcion; ?>"><?php echo $opcion; ?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                <?php }else{ ?>
                                                    <input type="hidden" name="CriterioValor4" value="">
                                                <?php } ?>
                                                <?php if(!empty($dimension->CRITERIO_5)){ ?>
                                                    <?php $opciones_5 = explode(", ", $dimension->OPCIONES_5); ?>
                                                    <div class="col">
                                                        <div class="form-group inputs-criterio d-flex flex-column justify-content-end align-items-start">
                                                            <label class=" " for="CriterioValor5"><?php echo $dimension->CRITERIO_5; ?></label>
                                                            <select name="CriterioValor5" class="form-control  ">
                                                                <?php foreach($opciones_5 as $opcion){ ?>
                                                                <option value="<?php echo $opcion; ?>"><?php echo $opcion; ?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                <?php }else{ ?>
                                                    <input type="hidden" name="CriterioValor5" value="">
                                                <?php } ?>
                                                <div class="col-12 pt-1 d-flex justify-content-end">
                                                <button type='submit' class="btn btn-primary">Crear parámetro</button>
                                                </div>
                                            </div>
                                            
                                        </form>
                                    </div>
                                    <h4 class="mt-4">Tabla de parámetros</h4>
                                    <div class="overflow-tabla">
                                    <table class="table tabla-parametros">
                                        <tr>
                                            <th>TITULO</th>
                                            <th>OBLIGATORIO</th>
                                            <?php if(!empty($dimension->CRITERIO_1)){ ?>
                                            <th><?php echo $dimension->CRITERIO_1; ?></th>
                                            <?php } ?>
                                            <?php if(!empty($dimension->CRITERIO_2)){ ?>
                                            <th><?php echo $dimension->CRITERIO_2; ?></th>
                                            <?php } ?>
                                            <?php if(!empty($dimension->CRITERIO_3)){ ?>
                                            <th><?php echo $dimension->CRITERIO_3; ?></th>
                                            <?php } ?>
                                            <?php if(!empty($dimension->CRITERIO_4)){ ?>
                                            <th><?php echo $dimension->CRITERIO_4; ?></th>
                                            <?php } ?>
                                            <?php if(!empty($dimension->CRITERIO_5)){ ?>
                                            <th><?php echo $dimension->CRITERIO_5; ?></th>
                                            <?php } ?>
                                        </tr>
                                            <?php $lista_parametros = $this->GeneralModel->lista('validacion_parametros','',['ID_DIMENSION'=>$dimension->ID_DIMENSION],'','',''); ?>
                                            <?php foreach($lista_parametros as $parametro){ ?>
                                            <?php
                                                $meta_parametros = $this->GeneralModel->lista('meta_datos','',['ID_OBJETO'=>$parametro->ID_PARAMETRO,'TIPO_OBJETO'=>'parametro'],'','','');
                                                $meta_datos_parametros = array(); foreach($meta_parametros as $m){ $meta_datos_parametros[$m->DATO_NOMBRE]= $m->DATO_VALOR; }
                                            ?>
                                        <tr>
                                            <td><?php echo $parametro->TITULO; ?></td>
                                            <td><?php echo $parametro->OBLIGATORIO; ?></td>
                                            <?php if(!empty($dimension->CRITERIO_1)){ ?>
                                            <th><?php echo $parametro->CRITERIO_VALOR_1; ?></th>
                                            <?php } ?>
                                            <?php if(!empty($dimension->CRITERIO_2)){ ?>
                                            <th><?php echo $parametro->CRITERIO_VALOR_2; ?></th>
                                            <?php } ?>
                                            <?php if(!empty($dimension->CRITERIO_3)){ ?>
                                            <th><?php echo $parametro->CRITERIO_VALOR_3; ?></th>
                                            <?php } ?>
                                            <?php if(!empty($dimension->CRITERIO_4)){ ?>
                                            <th><?php echo $parametro->CRITERIO_VALOR_4; ?></th>
                                            <?php } ?>
                                            <?php if(!empty($dimension->CRITERIO_5)){ ?>
                                            <th><?php echo $parametro->CRITERIO_VALOR_5; ?></th>
                                            <?php } ?>
                                            
                                            <td>
                                            <div class="btn-group">
                                                <button data-enlace="<?php echo base_url('index.php/listas/borrar_parametro?id='.$parametro->ID_PARAMETRO); ?>" class="btn btn-danger btn-block btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar</button>
                                                <button type="button" class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#editar_parametro_<?php echo $parametro->ID_PARAMETRO; ?>">Editar</button>
                                            </div>
                                                <div class="modal fade" id="editar_parametro_<?php echo $parametro->ID_PARAMETRO; ?>" tabindex="-1" aria-labelledby="editar_parametro_<?php echo $parametro->ID_PARAMETRO; ?>" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content  <?php echo $modo; ?>">
                                                            <div class="modal-body">
                                                                <form action="<?php echo base_url('index.php/listas/actualizar_parametro'); ?>" method='post'>
                                                                    <input type="hidden" name="Identificador" value="<?php echo $parametro->ID_PARAMETRO; ?>">
                                                                    <input type="hidden" name="IdLista" value="<?php echo $lista['ID_LISTA']; ?>">
                                                                    <input type="hidden" name="IdDimension" value="<?php echo $parametro->ID_DIMENSION; ?>">
                                                                    <div class="form-group">
                                                                        <label for="Titulo">Titulo</label>
                                                                        <input type="text" class="form-control" name="Titulo" value="<?php echo $parametro->TITULO; ?>">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <select name="Obligatorio" class="form-control">
                                                                            <option value="si" <?php if($parametro->OBLIGATORIO=='si'){ echo 'selected';} ?>>Obligatorio</option>
                                                                            <option value="no" <?php if($parametro->OBLIGATORIO=='no'){ echo 'selected';} ?>>Opcional</option>
                                                                        </select>
                                                                    </div>
                                                                    <?php if(!empty($dimension->CRITERIO_1)){ ?>
                                                                    <div class="form-group">
                                                                        <label for="CiterioValor1"><?php echo $dimension->CRITERIO_1; ?></label>
                                                                        <?php $opciones_1 = explode(", ", $dimension->OPCIONES_1); ?>
                                                                        <select name="CriterioValor1" class="form-control">
                                                                            <?php foreach($opciones_1 as $opcion){ ?>
                                                                            <option value="<?php echo $opcion; ?>" <?php if($parametro->CRITERIO_VALOR_1==$opcion){ echo 'selected'; } ?>><?php echo $opcion; ?></option>
                                                                            <?php } ?>
                                                                        </select>
                                                                    </div>
                                                                    <?php } ?>
                                                                    <?php if(!empty($dimension->CRITERIO_2)){ ?>
                                                                    <div class="form-group">
                                                                        <label for="CiterioValor2"><?php echo $dimension->CRITERIO_2; ?></label>
                                                                        <?php $opciones_2 = explode(", ", $dimension->OPCIONES_2); ?>
                                                                        <select name="CriterioValor2" class="form-control">
                                                                            <?php foreach($opciones_2 as $opcion){ ?>
                                                                            <option value="<?php echo $opcion; ?>" <?php if($parametro->CRITERIO_VALOR_2==$opcion){ echo 'selected'; } ?>><?php echo $opcion; ?></option>
                                                                            <?php } ?>
                                                                        </select>
                                                                    </div>
                                                                    <?php } ?>
                                                                    <?php if(!empty($dimension->CRITERIO_3)){ ?>
                                                                    <div class="form-group">
                                                                        <label for="CiterioValor3"><?php echo $dimension->CRITERIO_3; ?></label>
                                                                        <?php $opciones_3 = explode(", ", $dimension->OPCIONES_3); ?>
                                                                        <select name="CriterioValor3" class="form-control">
                                                                            <?php foreach($opciones_3 as $opcion){ ?>
                                                                            <option value="<?php echo $opcion; ?>" <?php if($parametro->CRITERIO_VALOR_3==$opcion){ echo 'selected'; } ?>><?php echo $opcion; ?></option>
                                                                            <?php } ?>
                                                                        </select>
                                                                    </div>
                                                                    <?php } ?>
                                                                    <?php if(!empty($dimension->CRITERIO_4)){ ?>
                                                                    <div class="form-group">
                                                                        <label for="CiterioValor4"><?php echo $dimension->CRITERIO_4; ?></label>
                                                                        <?php $opciones_4 = explode(", ", $dimension->OPCIONES_4); ?>
                                                                        <select name="CriterioValor4" class="form-control">
                                                                            <?php foreach($opciones_4 as $opcion){ ?>
                                                                            <option value="<?php echo $opcion; ?>" <?php if($parametro->CRITERIO_VALOR_4==$opcion){ echo 'selected'; } ?>><?php echo $opcion; ?></option>
                                                                            <?php } ?>
                                                                        </select>
                                                                    </div>
                                                                    <?php } ?>
                                                                    <?php if(!empty($dimension->CRITERIO_5)){ ?>
                                                                    <div class="form-group">
                                                                        <label for="CiterioValor5"><?php echo $dimension->CRITERIO_5; ?></label>
                                                                        <?php $opciones_5 = explode(", ", $dimension->OPCIONES_5); ?>
                                                                        <select name="CriterioValor5" class="form-control">
                                                                            <?php foreach($opciones_5 as $opcion){ ?>
                                                                            <option value="<?php echo $opcion; ?>" <?php if($parametro->CRITERIO_VALOR_5==$opcion){ echo 'selected'; } ?>><?php echo $opcion; ?></option>
                                                                            <?php } ?>
                                                                        </select>
                                                                    </div>
                                                                    <?php } ?>
                                                                    <button type="submit" class="btn btn-primary">Actualizar</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>

                                        </tr>
                                        <?php } ?>
                                    </table>
                                    </div>
                                    

                                    <div class="modal fade" id="editar_dimension_<?php echo $dimension->ID_DIMENSION; ?>" tabindex="-1" aria-labelledby="editar_dimension_<?php echo $dimension->ID_DIMENSION; ?>" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content  <?php echo $modo; ?>">
                                                <div class="modal-body">
                                                    <form action="<?php echo base_url('index.php/listas/actualizar_dimension'); ?>" method='post'>
                                                        <input type="hidden" name="Identificador" value="<?php echo $dimension->ID_DIMENSION; ?>">
                                                        <input type="hidden" name="IdLista" value="<?php echo $lista['ID_LISTA']; ?>">
                                                        <input type="hidden" name="Descripcion">
                                                        <div class="form-group">
                                                            <label for="Titulo">Titulo</label>
                                                            <input type="text" class="form-control" name="Titulo" value="<?php echo $dimension->TITULO; ?>">
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <h5>Criterio 1</h5>
                                                                <div class="form-group">
                                                                    <input type="text" name="Criterio1" class="form-control" placeholder='Criterio 1' value="<?php echo $dimension->CRITERIO_1; ?>">
                                                                </div>
                                                                <div class="form-group">
                                                                    <textarea name="OpcionesCriterio1" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"><?php echo $dimension->OPCIONES_1; ?></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <h5>Criterio 2</h5>
                                                                <div class="form-group">
                                                                    <input type="text" name="Criterio2" class="form-control" placeholder='Criterio 2' value="<?php echo $dimension->CRITERIO_2; ?>">
                                                                </div>
                                                                <div class="form-group">
                                                                    <textarea name="OpcionesCriterio2" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"><?php echo $dimension->OPCIONES_2; ?></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <h5>Criterio 3</h5>
                                                                <div class="form-group">
                                                                    <input type="text" name="Criterio3" class="form-control" placeholder='Criterio 3' value="<?php echo $dimension->CRITERIO_3; ?>">
                                                                </div>
                                                                <div class="form-group">
                                                                    <textarea name="OpcionesCriterio3" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"><?php echo $dimension->OPCIONES_3; ?></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <h5>Criterio 4</h5>
                                                                <div class="form-group">
                                                                    <input type="text" name="Criterio4" class="form-control" placeholder='Criterio 4' value="<?php echo $dimension->CRITERIO_4; ?>">
                                                                </div>
                                                                <div class="form-group">
                                                                    <textarea name="OpcionesCriterio4" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"><?php echo $dimension->OPCIONES_4; ?></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <h5>Criterio 5</h5>
                                                                <div class="form-group">
                                                                    <input type="text" name="Criterio5" class="form-control" placeholder='Criterio 5' value="<?php echo $dimension->CRITERIO_5; ?>">
                                                                </div>
                                                                <div class="form-group">
                                                                    <textarea name="OpcionesCriterio5" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"><?php echo $dimension->OPCIONES_5; ?></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="submit" class="btn btn-primary">Actualizar</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                    <?php $i++; } ?>
                    <div class="tab-pane fade" id="n-dimension" role="tabpanel" aria-labelledby="n-dimension-tab">
                        <section class="p-4">
                            <form action="<?php echo base_url('index.php/listas/crear_dimension'); ?>" method='post'>
                                <input type="hidden" name="IdLista" value="<?php echo $lista['ID_LISTA'] ?>">
                                <input type="hidden" name="Descripcion" value="">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-pen"></i></span>
                                                <input type="text" name="Titulo" class="form-control input_discrete input_head"
                                                    placeholder='Título de la dimensión'>
                                            </div>
                                        </div>
                                        <h5>Establece los criterios</h5>
                                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="pills-criterio1-tab" data-bs-toggle="pill"
                                                    data-bs-target="#pills-criterio1" type="button" role="tab"
                                                    aria-controls="pills-criterio1" aria-selected="true">1</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="pills-criterio2-tab" data-bs-toggle="pill"
                                                    data-bs-target="#pills-criterio2" type="button" role="tab"
                                                    aria-controls="pills-criterio2" aria-selected="false">2</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="pills-criterio3-tab" data-bs-toggle="pill"
                                                    data-bs-target="#pills-criterio3" type="button" role="tab"
                                                    aria-controls="pills-criterio3" aria-selected="false">3</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="pills-criterio4-tab" data-bs-toggle="pill"
                                                    data-bs-target="#pills-criterio4" type="button" role="tab"
                                                    aria-controls="pills-criterio4" aria-selected="false">4</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="pills-criterio5-tab" data-bs-toggle="pill"
                                                    data-bs-target="#pills-criterio5" type="button" role="tab"
                                                    aria-controls="pills-criterio5" aria-selected="false">5</button>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="pills-tabContent">
                                            <div class="tab-pane fade show active" id="pills-criterio1" role="tabpanel"
                                                aria-labelledby="pills-criterio1-tab">
                                                <div class="form-group">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text" id="basic-addon1"><i
                                                                class="fa-solid fa-pen"></i></span>
                                                        <input type="text" name="Criterio1"
                                                            class="form-control rounded-0 input_discrete input_head"
                                                            placeholder='Nombre Criterio 1'>
                                                    </div>
                                                    <textarea name="OpcionesCriterio1" class="form-control opciones-criterio"
                                                        placeholder='Opciones del criterio separadas por coma' rows="5"></textarea>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="pills-criterio2" role="tabpanel"
                                                aria-labelledby="pills-criterio2-tab">
                                                <div class="form-group">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text" id="basic-addon1"><i
                                                                class="fa-solid fa-pen"></i></span>
                                                        <input type="text" name="Criterio2"
                                                            class="form-control rounded-0 input_discrete input_head"
                                                            placeholder='Nombre Criterio 2'>
                                                    </div>
                                                    <textarea name="OpcionesCriterio2" class="form-control opciones-criterio"
                                                        placeholder='Opciones del criterio separadas por coma' rows="5"></textarea>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="pills-criterio3" role="tabpanel"
                                                aria-labelledby="pills-criterio3-tab">
                                                <div class="form-group">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text" id="basic-addon1"><i
                                                                class="fa-solid fa-pen"></i></span>
                                                        <input type="text" name="Criterio3"
                                                            class="form-control rounded-0 input_discrete input_head"
                                                            placeholder='Nombre Criterio 3'>
                                                    </div>
                                                    <textarea name="OpcionesCriterio3" class="form-control opciones-criterio"
                                                        placeholder='Opciones del criterio separadas por coma' rows="5"></textarea>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="pills-criterio4" role="tabpanel"
                                                aria-labelledby="pills-criterio4-tab">
                                                <div class="form-group">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text" id="basic-addon1"><i
                                                                class="fa-solid fa-pen"></i></span>
                                                        <input type="text" name="Criterio4"
                                                            class="form-control rounded-0 input_discrete input_head"
                                                            placeholder='Nombre Criterio 4'>
                                                    </div>
                                                    <textarea name="OpcionesCriterio4" class="form-control opciones-criterio"
                                                        placeholder='Opciones del criterio separadas por coma' rows="5"></textarea>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="pills-criterio5" role="tabpanel"
                                                aria-labelledby="pills-criterio5-tab">
                                                <div class="form-group">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text" id="basic-addon1"><i
                                                                class="fa-solid fa-pen"></i></span>
                                                        <input type="text" name="Criterio5"
                                                            class="form-control rounded-0 input_discrete input_head"
                                                            placeholder='Nombre Criterio 5'>
                                                    </div>
                                                    <textarea name="OpcionesCriterio5" class="form-control opciones-criterio"
                                                        placeholder='Opciones del criterio separadas por coma' rows="5"></textarea>
                                                </div>
                                            </div>
                                        </div>
                    
                                        <button type="submit" class="btn btn-success w-100">Crear dimensión</button>
                                    </div>
                                </div>
                            </form>
                        </section>
                    </div>
                </div>
                <div>

                </div>
        </div>
    </div>
</div>
