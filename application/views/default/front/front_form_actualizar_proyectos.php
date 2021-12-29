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
	<div class="row mb-4">
		<div class="col-6">
			<h3>Proyectos</h3>
		</div>
		<div class="col-6">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col">
			<?php retro_alimentacion(); ?>
			<h5>Actualizar Proyecto</h5>
		</div>
	</div>
	<div class="row mb-4">
		<div class="col-12 col-md-9">
			<div class="form-group">
				<label for="ProyectoNombre">Nombre</label>
				<input type="text" class="form-control UrlAmigableOrigen" name="ProyectoNombre"
					data-tabla="proyectos"
					data-objeto="proyecto"
					data-id="<?php echo $proyecto['ID_PROYECTO'] ?>"
					value="<?php echo $proyecto['PROYECTO_NOMBRE'] ?>" required>
			</div>
			<div class="form-group">
				<label for="Url">URL Amigable <small class="text-warning">Auto completado por el sistema</small> </label>
				<input type="text" class="form-control UrlAmigableResultado" name="Url" value="<?php echo $proyecto['URL'] ?>" required>
			</div>
			<div class="form-group">
				<label for="ProyectoDuracion">Duración</label>
				<select class="form-control" name="ProyectoDuracion" id="seleccionar_duracion_proyecto">
					<option value="permanente" <?php if($proyecto['DURACION']=='permanente'){ echo 'selected'; } ?>>Permanente</option>
					<option value="temporal" <?php if($proyecto['DURACION']=='temporal'){ echo 'selected'; } ?>>Temporal</option>
				</select>
			</div>
			<div class="collapse" id="formulario_duracion_proyecto">
				<div class="form-group">
					<label for="FechaEntrega">Fecha Entrega</label>
					<input type="text" class="form-control datepicker" name="FechaEntrega" value="<?php if(!empty($proyecto['FECHA_ENTREGA'])){ echo date('d-m-Y', strtotime($proyecto['FECHA_ENTREGA'])); } ?>">
				</div>
			</div>
			<div class="form-group">
				<label for="ProyectoDescripcion">Descripción</label>
				<textarea name="ProyectoDescripcion" class="form-control" rows="8"><?php echo $proyecto['PROYECTO_DESCRIPCION'] ?></textarea>
			</div>
			<hr>
			<h6>Agregar equipos</h6>
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
		<div class="col-12 col-md-3">
			<div class="form-group">
				<label for="Estado">Estado</label>
				<select class="form-control" name="Estado">
					<option value="activo" <?php if($proyecto['ESTADO']=='activo'){ echo 'selected'; } ?>>Activo</option>
					<option value="inactivo" <?php if($proyecto['ESTADO']=='inactivo'){ echo 'selected'; } ?>>Inactivo</option>
				</select>
			</div>
			<div class="form-group">
				<label for="FechaInicio">Fecha Inicio (Inicio del proyecto, puede ser una fecha antigua)</label>
				<input type="text" class="form-control datepicker" name="FechaInicio" value="<?php echo date('d-m-Y'); ?>">
			</div>
			<div class="form-group">
				<label for="FechaFinal">Fecha Final (Dead line)</label>
				<input type="text" class="form-control datepicker" name="FechaFinal" value="">
			</div>
			<hr>
				<img src="<?php echo base_url('contenido/img/proyectos/'.$proyecto['IMAGEN']); ?>" alt="" class="img-fluid mx-auto mb-2">
				<div class="form-group">
					<label for="Imagen">Imágen</label>
					<input type="file" class="form-control" name="Imagen" value="" accept="image/*">
				</div>
			<hr>
			<img src="<?php echo base_url('contenido/img/proyectos/'.$proyecto['IMAGEN_FONDO']); ?>" alt="" class="img-fluid mx-auto mb-2">
			<div class="form-group">
				<label for="ImagenFondo">Imágen Fondo <small class="text-danger"> Peso Máximo (<?php echo ini_get('upload_max_filesize'); ?>)</small></label>
				<input type="file" class="form-control" name="ImagenFondo" value="" accept="image/*">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar</button>
		</div>
	</div>
</form>
</div>
