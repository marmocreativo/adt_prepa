<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12 col-md-8">
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
                                
                            id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true"><?php echo $dimension->TITULO; ?></button>
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
                                } ?> " id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">...</div>
                    <?php $i++; } ?>
                </div>
		</div>
	</div>
</div>
