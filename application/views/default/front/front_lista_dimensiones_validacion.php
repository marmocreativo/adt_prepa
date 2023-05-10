<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12">
            <h3><?php echo $lista['TITULO']; ?></h3>
            <p><?php echo $lista['DESCRIPCION']; ?></p>
			<div class="p-4 border border-primary">
				<form action="<?php echo base_url('index.php/listas/crear_dimension'); ?>" method='post'>
                <input type="hidden" name="IdLista" value="<?php echo $lista['ID_LISTA'] ?>">
				<input type="hidden" name="Descripcion" value="">
					<div class="row">
						<div class="col-9">
							<div class="form-group">
								<input type="text" name="Titulo" class="form-control" placeholder='Título de la dimensión'>
							</div>
						</div>
						<div class="col-3">
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
                            if(isset($_GET['id_dimension'])&&!empty($_GET['id_dimension'])){
                                 if($_GET['id_dimension']==$dimension->ID_DIMENSION){
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
                            if(isset($_GET['id_dimension'])&&!empty($_GET['id_dimension'])){
                                 if($_GET['id_dimension']==$dimension->ID_DIMENSION){
                                     echo 'active';
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
                                                        <input type="text" class="form-control" name='Titulo' placeholder="Titulo">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <select name="Obligatorio" class="form-control">
                                                            <option value="si">Obligatorio</option>
                                                            <option value="no">Opcional</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <select name="Meta[nivel_accesibilidad]" class="form-control">
                                                            <option value="Accesibilidad A">Accesibilidad A</option>
                                                            <option value="Accesibilidad AA">Accesibilidad AA</option>
                                                            <option value="Accesibilidad AAA">Accesibilidad AAA</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <select name="Meta[criterio_produccion]" class="form-control">
                                                            <option value="si_criterio_produccion">Es criterio de producción</option>
                                                            <option value="no_criterio_produccion">No es criterio de producción</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <select name="Meta[nivel]" class="form-control">
                                                            <option value="nivel 1">Nivel 1</option>
                                                            <option value="nivel 2">Nivel 2</option>
                                                            <option value="nivel 3">Nivel 3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <button type='submit' class="btn btn-primary">Crear parámetro</button>
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
                                        <td><button data-enlace="<?php echo base_url('index.php/listas/borrar_parametro?id='.$parametro->ID_PARAMETRO); ?>" class="btn btn-danger btn-block btn-sm borrar_entrada"> <i class="fas fa-trash"></i> Eliminar</button></td>
                                    </tr>
                                    <?php } ?>
                                </table>
                                </div>
                                
                    <?php $i++; } ?>
                </div>
                <div>
                    
                </div>
		</div>
	</div>
</div>
