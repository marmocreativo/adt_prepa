<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12">
            <?php if(isset($_GET['notif'])){notiget($_GET['notif']);} ?>
            <h3><?php echo $lista['TITULO']; ?></h3>
            <p><?php echo $lista['DESCRIPCION']; ?></p>
			<div class="p-4 border border-primary">
				<form action="<?php echo base_url('index.php/listas/crear_dimension'); ?>" method='post'>
                <input type="hidden" name="IdLista" value="<?php echo $lista['ID_LISTA'] ?>">
				<input type="hidden" name="Descripcion" value="">
					<div class="row">
						<div class="col">
							<div class="form-group">
								<input type="text" name="Titulo" class="form-control" placeholder='Título de la dimensión'>
							</div>
						</div>
                        <div class="col">
							<div class="form-group">
								<input type="text" name="Criterio1" class="form-control" placeholder='Criterio 1'>
							</div>
                            <div class="form-group">
								<textarea name="OpcionesCriterio1" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"></textarea>
							</div>
						</div>
                        <div class="col">
							<div class="form-group">
								<input type="text" name="Criterio2" class="form-control" placeholder='Criterio 2'>
							</div>
                            <div class="form-group">
								<textarea name="OpcionesCriterio2" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"></textarea>
							</div>
						</div>
                        <div class="col">
							<div class="form-group">
								<input type="text" name="Criterio3" class="form-control" placeholder='Criterio 3'>
							</div>
                            <div class="form-group">
								<textarea name="OpcionesCriterio3" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"></textarea>
							</div>
						</div>
                        <div class="col">
							<div class="form-group">
								<input type="text" name="Criterio4" class="form-control" placeholder='Criterio 4'>
							</div>
                            <div class="form-group">
								<textarea name="OpcionesCriterio4" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"></textarea>
							</div>
						</div>
                        <div class="col">
							<div class="form-group">
								<input type="text" name="Criterio5" class="form-control" placeholder='Criterio 5'>
							</div>
                            <div class="form-group">
								<textarea name="OpcionesCriterio5" class="form-control" placeholder='Opciones disponibles separadas por coma' rows="10"></textarea>
							</div>
						</div>
						<div class="col">
							<button type="submit" class="btn btn-success w-100">Crear dimensión</button>
						</div>
					</div>
				</form>
			</div>
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
                </ul>
                <div class="tab-content" id="myTabContent">
                    <?php $i=0; foreach($dimensiones as $dimension){ ?>
                    <div class="tab-pane fade <?php
                            if(isset($_GET['dimension'])&&!empty($_GET['dimension'])){
                                 if($_GET['dimension']==$dimension->ID_DIMENSION){
                                     echo 'show active';
                                }
                            }else{
                                 if($i==0){ echo 'show active'; }
                                } ?> " id="tab-<?php echo $dimension->ID_DIMENSION; ?>-pane" role="tabpanel" aria-labelledby="tab-<?php echo $dimension->ID_DIMENSION; ?>-pane" tabindex="0">
                                    <div class="border-primary p-3">
                                        <form action="<?php echo base_url('index.php/listas/crear_parametro'); ?>" method='post'>
                                        <input type="hidden" name='IdLista' value="<?php echo $lista['ID_LISTA']; ?>">
                                        <input type="hidden" name='IdDimension' value="<?php echo $dimension->ID_DIMENSION; ?>">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="Titulo">Título del parámetro</label>
                                                        <input type="text" class="form-control" name='Titulo' placeholder="Titulo">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="Obligatorio">Es un parámetro obligatorio?</label>
                                                        <select name="Obligatorio" class="form-control">
                                                            <option value="si">Obligatorio</option>
                                                            <option value="no">Opcional</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <?php if(!empty($dimension->CRITERIO_1)){ ?>
                                                    <?php $opciones_1 = explode(", ", $dimension->OPCIONES_1); ?>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="CriterioValor1"><?php echo $dimension->CRITERIO_1; ?></label>
                                                            <select name="CriterioValor1" class="form-control">
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
                                                        <div class="form-group">
                                                            <label for="CriterioValor2"><?php echo $dimension->CRITERIO_2; ?></label>
                                                            <select name="CriterioValor2" class="form-control">
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
                                                        <div class="form-group">
                                                            <label for="CriterioValor3"><?php echo $dimension->CRITERIO_3; ?></label>
                                                            <select name="CriterioValor3" class="form-control">
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
                                                        <div class="form-group">
                                                            <label for="CriterioValor4"><?php echo $dimension->CRITERIO_4; ?></label>
                                                            <select name="CriterioValor4" class="form-control">
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
                                                        <div class="form-group">
                                                            <label for="CriterioValor5"><?php echo $dimension->CRITERIO_5; ?></label>
                                                            <select name="CriterioValor5" class="form-control">
                                                                <?php foreach($opciones_5 as $opcion){ ?>
                                                                <option value="<?php echo $opcion; ?>"><?php echo $opcion; ?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                <?php }else{ ?>
                                                    <input type="hidden" name="CriterioValor5" value="">
                                                <?php } ?>
                                                <div class="col pt-1">
                                                    <button type='submit' class="btn btn-primary mt-4">Crear parámetro</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>TITULO</th>
                                            <th>OBLIGATORIO</th>
                                            <th>NIVEL ACCESIBILIDAD</th>
                                            <th>CRITERIO DE PRODUCCION</th>
                                            <th>NIVEL</th>
                                            <th>CONTROLES</th>
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
                                            <td><?php if(isset($meta_datos_parametros['nivel_accesibilidad'])){ echo $meta_datos_parametros['nivel_accesibilidad']; } ?></td>
                                            <td><?php if(isset($meta_datos_parametros['criterio_produccion'])){ echo $meta_datos_parametros['criterio_produccion']; } ?></td>
                                            <td><?php if(isset($meta_datos_parametros['nivel'])){ echo $meta_datos_parametros['nivel']; } ?></td>
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
                                                                    <div class="form-group">
                                                                        <select name="Meta[nivel_accesibilidad]" class="form-control">
                                                                            <option value="Accesibilidad A" <?php if(isset($meta_datos_parametros['nivel_accesibilidad'])&&$meta_datos_parametros['nivel_accesibilidad']=='Accesibilidad A'){ echo 'selected'; } ?>>Accesibilidad A</option>
                                                                            <option value="Accesibilidad AA" <?php if(isset($meta_datos_parametros['nivel_accesibilidad'])&&$meta_datos_parametros['nivel_accesibilidad']=='Accesibilidad AA'){ echo 'selected'; } ?>>Accesibilidad AA</option>
                                                                            <option value="Accesibilidad AAA" <?php if(isset($meta_datos_parametros['nivel_accesibilidad'])&&$meta_datos_parametros['nivel_accesibilidad']=='Accesibilidad AAA'){ echo 'selected'; } ?>>Accesibilidad AAA</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <select name="Meta[criterio_produccion]" class="form-control">
                                                                            <option value="si_criterio_produccion" <?php if(isset($meta_datos_parametros['criterio_de_produccion'])&&$meta_datos_parametros['criterio_de_produccion']=='si_criterio_produccion'){ echo 'selected'; } ?>>Es criterio de producción</option>
                                                                            <option value="no_criterio_produccion" <?php if(isset($meta_datos_parametros['criterio_de_produccion'])&&$meta_datos_parametros['criterio_de_produccion']=='no_criterio_produccion'){ echo 'selected'; } ?>>No es criterio de producción</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <select name="Meta[nivel]" class="form-control">
                                                                            <option value="nivel 1" <?php if(isset($meta_datos_parametros['nivel'])&&$meta_datos_parametros['nivel']=='nivel 1'){ echo 'selected'; } ?>>Nivel 1</option>
                                                                            <option value="nivel 2" <?php if(isset($meta_datos_parametros['nivel'])&&$meta_datos_parametros['nivel']=='nivel 2'){ echo 'selected'; } ?>>Nivel 2</option>
                                                                            <option value="nivel 3" <?php if(isset($meta_datos_parametros['nivel'])&&$meta_datos_parametros['nivel']=='nivel 3'){ echo 'selected'; } ?>>Nivel 3</option>
                                                                        </select>
                                                                    </div>
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
                                    <button type="button" class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#editar_dimension_<?php echo $dimension->ID_DIMENSION; ?>">Editar</button>
                                    <button data-enlace="<?php echo base_url('index.php/listas/borrar_dimension?id='.$dimension->ID_DIMENSION); ?>" class="btn btn-outline-danger btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Borrar dimensión <?php echo $dimension->TITULO; ?></button>

                                    <div class="modal fade" id="editar_dimension_<?php echo $dimension->ID_DIMENSION; ?>" tabindex="-1" aria-labelledby="editar_dimension_<?php echo $dimension->ID_DIMENSION; ?>" aria-hidden="true">
                                        <div class="modal-dialog">
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
                                                        <button type="submit" class="btn btn-primary">Actualizar</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                    <?php $i++; } ?>
                </div>
                <div>

                </div>
		</div>
	</div>
</div>
