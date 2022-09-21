<div class="contenido_principal">
<form action="<?php echo base_url('proyectos/actualizar') ?>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="Identificador" value="<?php echo $proyecto['ID_PROYECTO']; ?>">
	<input type="hidden" name="consulta" value="<?php echo verificar_variable('GET','consulta',''); ?>">
	<input type="hidden" name="ImagenActual" value="<?php echo $proyecto['IMAGEN'] ?>">
	<input type="hidden" name="ImagenFondoActual" value="<?php echo $proyecto['IMAGEN_FONDO'] ?>">
	<input type="hidden" name="Orden" value="<?php echo $proyecto['ORDEN'] ?>">
	<input type="hidden" name="Tipo" value="<?php echo $proyecto['TIPO'] ?>">
	<input type="hidden" name="Meta[autor]" value="<?php if(isset($meta_datos['autor'])){ echo $meta_datos['autor']; }else{ echo $_SESSION['usuario']['nombre'].' '.$_SESSION['usuario']['apellidos']; } ?>">
	<input type="hidden" name="ProyectoColor" value="primary">
	<input type="hidden" name="FechaEntrega" value="<?php if(!empty($proyecto['FECHA_ENTREGA'])){ echo date('d-m-Y', strtotime($proyecto['FECHA_ENTREGA'])); } ?>">
	<input type="hidden" class="form-control UrlAmigableResultado" name="Url" value="<?php echo $proyecto['URL'] ?>" required>

	<input type="hidden" name="ProyectoDuracion" value="temporal">
	<div class="row mb-4">
		<div class="col">
			<h5>Actualizar Proyecto</h5>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col-12 col-md-6">
			<div class="form-group">
				<label for="ProyectoNombre">Nombre</label>
				<input type="text" class="form-control UrlAmigableOrigen" name="ProyectoNombre"
					data-tabla="proyectos"
					data-objeto="proyecto"
					data-id="<?php echo $proyecto['ID_PROYECTO'] ?>"
					value="<?php echo $proyecto['PROYECTO_NOMBRE'] ?>" required>
			</div>

			<div class="form-group">
				<label for="ProyectoDescripcion">Notas</label>
				<textarea name="ProyectoDescripcion" class="form-control TextEditor"><?php echo $proyecto['PROYECTO_DESCRIPCION'] ?></textarea>
			</div>
			<hr>
			<div class="form-group">
				<label for="EnlaceEditable">Enlace Archivos Editables</label>
				<input type="text" class="form-control" name="EnlaceEditable" value="<?php echo $proyecto['ENLACE_EDITABLE'] ?>">
			</div>
			<div class="form-group">
				<label for="EnlaceEntregable">Enlace Archivos Entregables</label>
				<input type="text" class="form-control" name="EnlaceEntregable" value="<?php echo $proyecto['ENLACE_ENTREGABLE'] ?>">
			</div>
			<hr>
			<h6>Asignar equipos</h6>
			<?php
				$equipos = $this->GeneralModel->lista('equipos','',['ESTADO'=>'activo'],'','','');
				$equipos_proyectos = $this->GeneralModel->lista('equipos_proyectos','',['ID_PROYECTO'=>$proyecto['ID_PROYECTO']],'','','');
				$equipos_asignados = array();
				foreach($equipos_proyectos as $seleccion){
					$equipos_asignados[] = $seleccion->ID_EQUIPO;
				}
			?>

			<ul class="list-group">
				<?php foreach($equipos as $equipo){ ?>
				<li  class="list-group-item text-dark">
						<label class="form-check-label" >
							<input type="checkbox" class="" name="ProyectoEquipos[]"
							value="<?php echo $equipo->ID_EQUIPO; ?>"
							<?php if(in_array($equipo->ID_EQUIPO,$equipos_asignados)){ echo "checked"; } ?>
							>
							<?php echo $equipo->EQUIPO_NOMBRE; ?></label>
				</li>
			<?php } ?>
			</ul>
		</div>
		<div class="col-12 col-md-4">
			<div class="row my-2 py-2 border-bottom">
				<div class="col-12 col-md-6">
					<div class="form-group">
						<label for="FechaInicio">Fecha Inicio </label>
						<input type="text" class="form-control datepicker" name="FechaInicio" value="<?php if(empty($proyecto['FECHA_INICIO'])){ echo date('d-m-Y'); }else{ echo date('d-m-Y', strtotime($proyecto['FECHA_INICIO'])); }?>">
						<div class="form-text">(Inicio del proyecto, puede ser una fecha antigua)</div>
					</div>
				</div>
				<div class="col-12 col-md-6">
					<div class="form-group">
						<label for="FechaFinal">Fecha Final</label>
						<input type="text" class="form-control datepicker" name="FechaFinal" value="<?php if(empty($proyecto['FECHA_FINAL'])){ echo date('d-m-Y',strtotime('+1 month')); }else{ echo date('d-m-Y', strtotime($proyecto['FECHA_FINAL'])); }?>">
						<div class="form-text">(Dead line) si la tarea se entrega después de esta fecha se considera atrasada</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="Prioridad" value="normal">
			<div class="row">
				<div class="col-12 col-md-6">
					<div class="form-group">
						<label for="Estado">Estado</label>
						<select class="form-control" name="Estado">
							<option value="activo" <?php if($proyecto['ESTADO']=='activo'){ echo 'selected'; } ?>>Activo</option>
							<option value="revision" <?php if($proyecto['ESTADO']=='revision'){ echo 'selected'; } ?>>Revisión</option>
							<option value="terminado" <?php if($proyecto['ESTADO']=='terminado'){ echo 'selected'; } ?>>Terminado</option>
						</select>
					</div>
				</div>
				<div class="col-12 col-md-6">
					<button type="submit" class="btn btn-success w-100"> <i class="fa fa-save"></i> Guardar</button>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-2">
			<input type="hidden" name="Imagen" value="">
			<input type="hidden" name="ImagenFondo" value="">
		</div>
	</div>
</form>
</div>
