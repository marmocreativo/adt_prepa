<div class="row">
<div class="col-4">
	<form class="" action="<?php echo base_url('tareas/actualizar'); ?>" method="post">
		<input type="hidden" name="Identificador" value="<?php echo $tarea['ID_TAREA']; ?>">
		<input type="hidden" name="IdProyecto" value="<?php echo $proyecto['ID_PROYECTO']; ?>">
		<input type="hidden" name="Tipo" value="general">
	<div class="modal-body">
		<div class="form-group">
			<label for="TareaTitulo">Titulo</label>
			<input type="text" class="form-control" name="TareaTitulo" value="<?php echo $tarea['TAREA_TITULO']; ?>">
		</div>
		<div class="form-group">
			<label for="TareaDescripcion">Descripción</label>
			<textarea name="TareaDescripcion" rows="3" class="form-control"><?php echo $tarea['TAREA_DESCRIPCION']; ?></textarea>
		</div>
		<div class="form-group">
			<label for="Prioridad">Prioridad</label>
			<select class="form-select" name="Prioridad">
				<option value="normal" <?php if($tarea['PRIORIDAD']=='normal'){ echo 'selected'; } ?>>Normal</option>
				<option value="alta" <?php if($tarea['PRIORIDAD']=='alta'){ echo 'selected'; } ?>>Alta</option>
				<option value="urgente" <?php if($tarea['PRIORIDAD']=='urgente'){ echo 'selected'; } ?>>Urgente</option>
			</select>
		</div>
		<div class="form-group">
			<label for="FechaEntrega">Fecha de Entrega</label>
			<input type="date" class="form-control" name="FechaEntrega" value="<?php echo date('d-m-Y',strtotime($tarea['FECHA_ENTREGA'])); ?>">
		</div>
		<div class="form-group">
			<label for="EnlaceEditables">Enlace Archivos Editables</label>
			<input type="text" class="form-control" name="EnlaceEditables" value="<?php echo $tarea['TAREA_ENLACE_EDITABLES'] ?>">
		</div>
		<div class="form-group">
			<label for="EnlaceEntregables">Enlace Archivos Entregables</label>
			<input type="text" class="form-control" name="EnlaceEntregables" value="<?php echo $tarea['TAREA_ENLACE_ENTREGABLE'] ?>">
		</div>
		<div class="">
			<?php
					$usuarios = $this->GeneralModel->lista_join('usuarios',['equipos_usuarios'=>'equipos_usuarios.ID_USUARIO = usuarios.ID_USUARIO'],'',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','usuarios.ID_USUARIO');
					$id_asignados = $this->GeneralModel->lista('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA']],'','','');
					$usuarios_asignados = array();
					foreach($id_asignados as $id_asig){
						$usuarios_asignados[] =$id_asig->ID_USUARIO;
					}
					//var_dump($usuarios_asignados);

			?>
			<h4>Asignar a:</h4>
			<ul class="list-group">
				<?php foreach($usuarios as $usuario){ ?>
				<li  class="list-group-item text-dark">
						<label class="form-check-label" >
							<input type="checkbox" class="" name="Usuarios[]"
							value="<?php echo $usuario->ID_USUARIO; ?>"
							<?php if(in_array($usuario->ID_USUARIO, $usuarios_asignados)){ echo 'checked'; }?>
								>
							<?php echo $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS; ?></label>
				</li>
			<?php } ?>
			</ul>
		</div>
		<div class="form-group">
			<label for="Estado">Estado</label>
			<select class="form-control" name="Estado">
				<option value="pendiente" <?php if($tarea['ESTADO']=='pendiente'){ echo 'selected'; } ?>>Pendiente</option>
				<option value="en desarrollo" <?php if($tarea['ESTADO']=='en desarrollo'){ echo 'selected'; } ?>>En Desarrollo</option>
				<option value="completo" <?php if($tarea['ESTADO']=='completo'){ echo 'selected'; } ?>>Completo</option>
			</select>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary"> <i class="fa fa-save"></i> Guardar</button>
	</div>
	</form>
</div>
</div>
