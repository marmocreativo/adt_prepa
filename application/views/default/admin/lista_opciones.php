<div class="contenido_principal">
<form action="<?php echo base_url('admin/opciones') ?>" method="post" enctype="multipart/form-data">
<div class="row  mb-4">
	<div class="col-8">
		<h3>Configuraciones </h3>
	</div>
	<div class="col-4">
		<div class="btn-group btn-group float-right" role="group" aria-label="Barra de tareas">
			<a class="btn btn-outline-info" href="<?php echo base_url('admin/crear_opcion'); ?>"> <i class="fa fa-cogs"></i> Crear nueva opción variable</a>
			<button type="submit" class="btn btn-success"> <i class="fa fa-save"></i> Guardar Todas</button>
		</div>
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<div class="border border-danger p-3">
			<h6 class="text-danger"> <i class="fa fa-exclamation-circle fa-2x"></i> Sección avanzada, alterar o eliminar los valores de esta sección puede provocar que el sistema deje de funcionar.<br>Por favor contacte al desarrollador si tiene dudas.</h6>
		</div>
	</div>
</div>
<div class="row mb-4">
	<div class="col">
		<?php retro_alimentacion(); ?>
		<ul class="nav nav-tabs" role="tablist">
			<?php $i=0; foreach($grupos_opciones as $grupo){ ?>
				<li class="nav-item">
						<a class="nav-link <?php if($i==0){ echo 'active'; } ?>" data-toggle="tab" href="#grupo_<?php echo $grupo->OPCION_TIPO; ?>"><?php echo $grupo->OPCION_TIPO; ?></a>
				</li>
			<?php $i++; } ?>
		</ul>

		<div class="tab-content">
			<?php $i=0; foreach($grupos_opciones as $grupo){ ?>
				<div class="tab-pane <?php if($i==0){ echo 'active'; } ?> ui-sortable" id="grupo_<?php echo $grupo->OPCION_TIPO; ?>" role="tabpanel" data-tabla="opciones" data-columna="ID">
					<?php $opciones = $this->GeneralModel->lista('opciones','',['OPCION_TIPO'=>$grupo->OPCION_TIPO],'ORDEN ASC','',''); ?>
					<?php foreach($opciones as $opcion){ ?>
						<div class="form-group" id="item-<?php echo $opcion->ID; ?>">
							<label for="Opciones[<?php echo $opcion->OPCION_NOMBRE; ?>]"><?php echo $opcion->OPCION_NOMBRE; ?></label>
							<?php if($opcion->OPCION_INPUT=='varchar'){ ?>
								<input type="text" class="form-control" name="Opciones[<?php echo $opcion->OPCION_NOMBRE; ?>]" value="<?php echo $opcion->OPCION_VALOR; ?>" required>
							<?php } ?>
							<?php if($opcion->OPCION_INPUT=='text'){ ?>
								<textarea  class="form-control" name="Opciones[<?php echo $opcion->OPCION_NOMBRE; ?>]" rows="5" required><?php echo $opcion->OPCION_VALOR; ?></textarea>
							<?php } ?>
							<?php if($opcion->OPCION_INPUT=='editor'){ ?>
								<textarea  class="form-control TextEditor" name="Opciones[<?php echo $opcion->OPCION_NOMBRE; ?>]" rows="5" required><?php echo $opcion->OPCION_VALOR; ?></textarea>
							<?php } ?>
							<?php if($opcion->OPCION_INPUT=='boolean'){ ?>
								<select class="form-control" name="Opciones[<?php echo $opcion->OPCION_NOMBRE; ?>]">
									<option value="si" <?php if($opcion->OPCION_VALOR=='si'){ echo 'selected'; } ?>>Si</option>
									<option value="no" <?php if($opcion->OPCION_VALOR=='no'){ echo 'selected'; } ?>>No</option>
								</select>
							<?php } ?>
							<div class="btn-group float-right mt-2">
								<a href="<?php echo base_url('admin/actualizar_opcion?id='.$opcion->ID); ?>" class="btn btn-sm btn-outline-warning"><i class="fa fa-pencil-alt"></i></a>
								<button type="button" data-enlace='<?php echo base_url('admin/borrar_opcion?id='.$opcion->ID); ?>' class="btn btn-sm btn-outline-danger borrar_entrada" title="Eliminar"> <span class="fa fa-trash"></span> </button>
							</div>
						</div>
					<?php } ?>
				</div>
			<?php $i++; } ?>
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<button type="submit" class="btn btn-success float-right"> <i class="fa fa-save"></i> Guardar todas</button>
	</div>
</div>
</form>
</div>
