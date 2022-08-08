<div class="estadisticas_generales mb-3">
	<div class="row">
		<div class="col-12 col-md-8">
			<?php $this->load->view('default'.$dispositivo.'/front/widgets/lista_tareas', $tareas); ?>
		</div>
	</div>
</div>

<button type="button" class="btn btn-success btn-circulo-flotante" data-bs-toggle="modal" data-bs-target="#NuevaTarea">
	<i class="fa fa-plus"></i>
</button>

<!-- Modal -->
<div class="modal fade" id="NuevaTarea" tabindex="-1" aria-labelledby="NuevaTareaLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="NuevaTareaLabel">Nueva Tarea</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="" action="<?php echo base_url('tareas/crear'); ?>" method="post">
					<input type="hidden" name="IdProyecto" value="">
					<input type="hidden" name="Tipo" value="general">
				<div class="modal-body">
					<div class="form-group">
						<label for="TareaTitulo">Titulo</label>
						<input type="text" class="form-control" name="TareaTitulo" value="">
					</div>
					<div class="form-group">
						<label for="TareaDescripcion">Notas</label>
						<textarea name="TareaDescripcion" rows="3" class="form-control TextEditorSmall"></textarea>
					</div>
					<div class="row my-2">
						<div class="col-12 col-md-6">
							<div class="form-group">
								<label for="FechaInicio">Fecha Inicio</label>
								<input type="text" class="form-control datepicker" name="FechaInicio" value="<?php echo date('d-m-Y'); ?>">
								<div class="form-text">Puede ser una fecha anterior</div>
							</div>
						</div>
						<div class="col-12 col-md-6">
							<div class="form-group">
								<label for="FechaFinal">Fecha Final </label>
								<input type="text" class="form-control datepicker" name="FechaFinal" value="">
								<div class="form-text">(Dead line) si la tarea se entrega después de esta fecha se considera atrasada</div>
							</div>
						</div>
					</div>
					<div class="row my-2">
						<div class="col-12 col-md-6">
							<div class="form-group">
								<label for="EnlaceEditables">Enlace Archivos Editables</label>
								<input type="text" class="form-control" name="EnlaceEditables" value="">
							</div>
							<div class="form-group">
								<label for="EnlaceEntregables">Enlace Archivos Entregables</label>
								<input type="text" class="form-control" name="EnlaceEntregables" value="">
							</div>
						</div>
						<div class="col-12 col-md-6">
							<input type="hidden" name="Prioridad" value="normal">
							<input type="hidden" class="" name="Usuarios[]" value="<?php echo $_SESSION['usuario']['id']; ?>" >
							<div class="form-group">
								<label for="Estado">Estado</label>
								<select class="form-control" name="Estado">
									<option value="pendiente">Pendiente</option>
									<option value="en desarrollo">En Desarrollo</option>
								</select>
							</div>
						</div>
					</div>


				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary"> <i class="fa fa-save"></i> Guardar</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
