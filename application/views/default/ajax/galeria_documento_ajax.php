<?php if(isset($_GET['id'])){ ?>
	<div class="row ui-sortable" data-tabla="galerias" data-columna="ID_GALERIA">
		<?php foreach($multimedia as $multimedio){ ?>
			<div id="item-<?php echo $multimedio->ID_GALERIA; ?>" class="col-12 col-sm-6 mb-3 ui-sortable-handle">
				<div class="card">
					<div class="card-body p-3">
						<div class="row">
							<div class="col-4 text-center">
								<?php
									$extension = explode('.',$multimedio->ARCHIVO);

									switch ($extension[1]) {
										case 'doc':
										case 'docx':

											$icono = 'fas fa-file-word';
											break;
										case 'pdf':

											$icono = 'fas fa-file-pdf';
											break;
										case 'txt':

											$icono = 'fas fa-file-alt';
											break;

										case 'jpg':
										case 'png':
										case 'gif':
										case 'webp':

											$icono = 'fas fa-file-image';
											break;

										default:
											$icono = 'fas fa-file';
											break;
									}
								?>
								<h1> <i class="<?php echo $icono; ?> fa-2x"></i> </h1>
							</div>
							<div class="col-8">
								<span class="d-none archivo-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>" href="<?php echo $multimedio->ARCHIVO; ?>"><?php echo $multimedio->ARCHIVO; ?></span>
								<input type="hidden" class="form-archivo-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?> d-none" value="<?php echo $multimedio->ARCHIVO; ?>">
								<h6><a href="<?php echo base_url('contenido/docs/'.$multimedio->ARCHIVO); ?>" target="_blank"> <?php echo $multimedio->ARCHIVO; ?> </a></h6>
								<h5 class="titulo-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>"><?php echo $multimedio->TITULO; ?></h5>
								<input type="text" class="form-control form-control-sm d-none form-titulo-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>" value="<?php echo $multimedio->TITULO; ?>">
								<p class="resumen-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>"><?php echo $multimedio->RESUMEN; ?></p>
								<textarea class="form-control form-control-sm d-none form-resumen-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>" rows="3"><?php echo $multimedio->RESUMEN; ?></textarea>
								<div class="btn-group mt-3 float-right">
									<button type="button" class="btn btn-outline-warning btn-sm editar_multimedia" name="button" data-id-objeto="<?php echo $multimedio->ID_MULTIMEDIA; ?>" title="Editar">
										<span class="mostrar_guardar-<?php echo $multimedio->ID_MULTIMEDIA; ?>"><i class="fa fa-pencil "></i></span>
										<span class="mostrar_guardar-<?php echo $multimedio->ID_MULTIMEDIA; ?> d-none"><i class="fa fa-save "></i> Guardar</span>
									</button>
									<button type="button" class="btn btn-outline-danger btn-sm borrar_multimedia" data-vista='galeria' data-id-multimedia="<?php echo $multimedio->ID_MULTIMEDIA; ?>" title="Borrar"> <i class="fa fa-trash "></i></button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		<?php } ?>
	</div>
<?php }else{ ?>
	<div class="row">
		<?php foreach($multimedia as $multimedio){ ?>
			<div class="col-12 col-sm-6 mb-3">
				<div class="card">
					<div class="card-body p-3">
						<div class="row">
							<div class="col-4 text-center">
								<?php
									$extension = explode('.',$multimedio->ARCHIVO);

									switch ($extension[1]) {
										case 'doc':
										case 'docx':

											$icono = 'fas fa-file-word';
											break;
										case 'pdf':

											$icono = 'fas fa-file-pdf';
											break;
										case 'txt':

											$icono = 'fas fa-file-alt';
											break;

										case 'jpg':
										case 'png':
										case 'gif':
										case 'webp':

											$icono = 'fas fa-file-image';
											break;

										default:
											$icono = 'fas fa-file';
											break;
									}
								?>
								<h1> <i class="<?php echo $icono; ?> fa-2x"></i> </h1>
							</div>
							<div class="col-8">
								<span class="d-none archivo-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>" href="<?php echo $multimedio->ARCHIVO; ?>"><?php echo $multimedio->ARCHIVO; ?></span>
								<input type="hidden" class="form-archivo-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?> d-none" value="<?php echo $multimedio->ARCHIVO; ?>">
								<h6><a href="<?php echo base_url('contenido/docs/'.$multimedio->ARCHIVO); ?>" target="_blank"> <?php echo $multimedio->ARCHIVO; ?> </a></h6>
								<h5 class="titulo-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>"><?php echo $multimedio->TITULO; ?></h5>
								<input type="text" class="form-control form-control-sm d-none form-titulo-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>" class="" name="" value="<?php echo $multimedio->TITULO; ?>">
								<p class="resumen-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>"><?php echo $multimedio->RESUMEN; ?></p>
								<textarea class="form-control form-control-sm d-none form-resumen-multimedia-<?php echo $multimedio->ID_MULTIMEDIA; ?>" rows="3"><?php echo $multimedio->RESUMEN; ?></textarea>
								<div class="btn-group mt-3 float-right">
									<button type="button" class="btn btn-outline-warning btn-sm editar_multimedia" name="button" data-id-objeto="<?php echo $multimedio->ID_MULTIMEDIA; ?>" title="Editar">
										<span class="mostrar_guardar-<?php echo $multimedio->ID_MULTIMEDIA; ?>"><i class="fa fa-pencil "></i></span>
										<span class="mostrar_guardar-<?php echo $multimedio->ID_MULTIMEDIA; ?> d-none"><i class="fa fa-save "></i> Guardar</span>
									</button>
									<button type="button" class="btn btn-outline-danger btn-sm borrar_multimedia" data-vista='multimedia' data-id-multimedia="<?php echo $multimedio->ID_MULTIMEDIA; ?>" title="Borrar"> <i class="fa fa-trash "></i></button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		<?php } ?>
	</div>
<?php } ?>
