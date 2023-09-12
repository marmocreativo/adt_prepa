<div class="row">
<div class="col-12 col-md-6">
	<form class="" action="<?php echo base_url('index.php/tareas/actualizar'); ?>" method="post">
		<input type="hidden" name="Identificador" value="<?php echo $tarea['ID_TAREA']; ?>">
		<input type="hidden" name="Tipo" value="general">
	<div class="modal-body">
		<div class="form-group">
			<label for="TareaTitulo">Titulo</label>
			<input type="text" class="form-control" name="TareaTitulo" value="<?php echo $tarea['TAREA_TITULO']; ?>">
		</div>
		<div class="form-group">
			<label for="TareaDescripcion">Notas</label>
			<textarea name="TareaDescripcion" rows="3" class="form-control TextEditorSmall"><?php echo $tarea['TAREA_DESCRIPCION']; ?></textarea>
		</div>
		<div class="row my-2">
			<div class="col-12 col-md-6">
				<div class="form-group">
					<label for="FechaInicio">Fecha Inicio</label>
					<input type="date" class="form-control" name="FechaInicio" value="<?php echo date('Y-m-d', strtotime($tarea['FECHA_INICIO'])); ?>">
					<div class="form-text">Puede ser una fecha anterior</div>
				</div>
			</div>
			<div class="col-12 col-md-6">
				<div class="form-group">
					<label for="FechaFinal">Fecha Final</label>
					<input type="date" class="form-control" name="FechaFinal" value="<?php echo date('Y-m-d', strtotime($tarea['FECHA_FINAL'])); ?>">
					<div class="form-text">(Dead line) si la tarea se entrega después de esta fecha se considera atrasada</div>
				</div>
			</div>
		</div>
		<div class="row my-2">
			<div class="col-12 col-md-6">
				<div class="form-group">
					<label for="EnlaceEditables">Enlace Carpeta General</label>
					<input type="text" class="form-control" name="EnlaceEditables" value="<?php echo $tarea['TAREA_ENLACE_EDITABLES'] ?>">
				</div>
				<div class="form-group">
					<label for="EnlaceEntregables">Enlace Version Final</label>
					<input type="text" class="form-control" name="EnlaceEntregables" value="<?php echo $tarea['TAREA_ENLACE_ENTREGABLE'] ?>">
				</div>
			</div>
			<div class="col-12 col-md-6">
			<div class="form-group">
					<label for="IdProyecto">Proyecto</label>
					<?php $proyectos = $this->GeneralModel->lista('proyectos','',['ESTADO !='=>'borrado'],'','',''); ?>
					<select class="form-control" name="IdProyecto">
						<option value="" <?php if($tarea['ESTADO']=='pendiente'){ echo 'selected'; } ?>>Ningúno</option>
						<?php foreach($proyectos as $proyecto){ ?>
							<option value="<?php echo $proyecto->ID_PROYECTO; ?>" <?php if($tarea['ID_PROYECTO']==$proyecto->ID_PROYECTO){ echo 'selected'; } ?>><?php echo $proyecto->PROYECTO_NOMBRE; ?></option>
						<?php } ?>
					</select>
				</div>
				<input type="hidden" name="Prioridad" value="<?php echo $tarea['PRIORIDAD']; ?>">
				<div class="form-group">
					<?php $etiquetas = $this->GeneralModel->lista('tareas_etiquetas','',['ID_PROYECTO'=>$tarea['ID_PROYECTO']],'ORDEN ASC','',''); ?>
					<label for="Etiqueta">Etiqueta</label>
					<select class="form-control" name="Etiqueta">
						<option value="">Ningúna</option>
						<?php foreach($etiquetas as $etiqueta){ ?>
						<option value="<?php echo $etiqueta->ID; ?>" <?php if($tarea['ID_ETIQUETA']==$etiqueta->ID){ echo 'selected'; } ?>><?php echo $etiqueta->ETIQUETA; ?></option>
						<?php } ?>
					</select>
				</div>
				<input type="hidden" name="Estado" value="<?php echo $tarea['ESTADO']; ?>">
			</div>
		</div>
		<div class="">
			<?php
					$usuarios = $this->GeneralModel->lista('usuarios','',['usuarios.ESTADO'=>'activo'],'usuarios.USUARIO_NOMBRE ASC','','','');
					$id_asignados = $this->GeneralModel->lista('usuarios_tareas','',['ID_TAREA'=>$tarea['ID_TAREA']],'','','');
					$usuarios_asignados = array();
					foreach($id_asignados as $id_asig){
						$usuarios_asignados[] =$id_asig->ID_USUARIO;
					}
					//var_dump($usuarios);

			?>
			<h4>Personas que participarán en la tarea:</h4>
			<?php
				$detalles_proyecto = $this->GeneralModel->detalles('proyectos',['ID_PROYECTO'=>$tarea['ID_PROYECTO']]);
				if(!empty($detalles_proyecto)){
				$equipos_proyecto = $this->GeneralModel->lista('equipos_proyectos','',['ID_PROYECTO'=>$tarea['ID_PROYECTO']],'','','');
				$array_equipos = array();
				foreach($equipos_proyecto as $eq_pro){
					$array_equipos[] = $eq_pro->ID_EQUIPO;
				};
				/* CONSULTA PARA SOLO LOS USUARIOS EN LOS EQUIPOS */
				$this->db->select('*');
				$this->db->from('usuarios');
				$this->db->join('equipos_usuarios', 'equipos_usuarios.ID_USUARIO = usuarios.ID_USUARIO', 'left');
				$this->db->where_in('equipos_usuarios.ID_EQUIPO', $array_equipos);
				//$this->db->where('usuarios.ESTADO', 'activo');

				$query = $this->db->get();
				$usuarios_disponibles = $query->result();
			}else{
				$usuarios_disponibles = null;
			}
			
			?>
			<ul class="list-group">
				<?php foreach($usuarios_disponibles as $usuario){ ?>
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

	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary"> <i class="fa fa-save"></i> Guardar</button>
	</div>
	</form>
</div>
</div>
