<div class="mb-3">
	<?php
		$proyectos_totales = 0;
		$proyectos_completos = 0;
		$proyectos_pendientes = 0;
		$tareas_totales = 0;
		$tareas_completas = 0;
		$tareas_desarrollo = 0;
		$tareas_pendientes = 0;
		$tareas_atrasadas = 0;
		$usuarios_totales = 0;
		$usuarios_con_tareas_pendientes = 0;
		$array_usuarios = array();
		foreach($proyectos as $proyecto){
			$proyectos_totales ++;
			if($proyecto->ESTADO=='terminado'){
				$proyectos_completos ++;
			}else{
				$proyectos_pendientes ++;
			}
		}
		foreach($usuarios as $usuario){
			$usuarios_totales ++;
			$detalles_usuarios = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$usuario->ID_USUARIO]);
			$procesos_lista = $this->GeneralModel->lista('roles_historial','',['ID_USUARIO'=>$usuario->ID_USUARIO],'','','');
			$procesos = $this->GeneralModel->conteo_elementos('roles_historial',['ID_USUARIO'=>$usuario->ID_USUARIO]);
			$procesos_pendientes = $this->GeneralModel->conteo_elementos('roles_historial',['ID_USUARIO'=>$usuario->ID_USUARIO,'ESTADO'=>'pendiente']);
			$procesos_completados = $this->GeneralModel->conteo_elementos('roles_historial',['ID_USUARIO'=>$usuario->ID_USUARIO,'ESTADO'=>'completo']);
			$procesos_atrasados = 0;
			foreach($procesos_lista as $proceso_list){
				if($proceso_list->FECHA_TERMINADO>$proceso_list->FECHA){
					$procesos_atrasados ++;
				}
			}
			$array_usuarios[$usuario->ID_USUARIO] = array(
				'NOMBRE'=> $detalles_usuarios['USUARIO_NOMBRE'].' '.$detalles_usuarios['USUARIO_APELLIDOS'],
				'TAREAS'=> 0,
				'TAREAS_PENDIENTES'=> 0,
				'TAREAS_ATRASADAS'=> 0,
				'PROCESO'=> $procesos,
				'PROCESOS_PENDIENTES'=> $procesos_pendientes,
				'PROCESOS_COMPLETADOS'=> $procesos_completados,
				'PROCESOS_ATRASADOS'=> $procesos_atrasados
			);
			


		}
		foreach($tareas as $tarea){
			
			$tareas_totales ++;
			if($tarea->ESTADO=='completo'){
				$tareas_completas ++;
			}else{
				if($tarea->ESTADO=='pendiente'){
					$tareas_pendientes ++;
				}else{
					$tareas_desarrollo ++;
				}

				$lista_usuarios = $this->GeneralModel->lista('usuarios_tareas','',['ID_TAREA'=>$tarea->ID_TAREA],'','','');
				foreach($lista_usuarios as $list_usuario){
					if(isset($array_usuarios[$list_usuario->ID_USUARIO])){
						$array_usuarios[$list_usuario->ID_USUARIO]['TAREAS'] ++;
						$fecha_final = '';
						if($tarea->FECHA_FINAL != null ){ $fecha_final = $tarea->FECHA_FINAL; } 
						if(date('Y-m-d')>date('Y-m-d', strtotime($fecha_final))){
							$array_usuarios[$list_usuario->ID_USUARIO]['TAREAS_ATRASADAS'] ++;
						}else{
							$array_usuarios[$list_usuario->ID_USUARIO]['TAREAS_PENDIENTES'] ++;
						}
					}
				}
			}
		}

		$usuarios_labels = array();
		$usuarios_pendientes = array();
		$usuarios_astrasadas = array();
		foreach($array_usuarios as $usuarios){
			$usuarios_labels[]="'".$usuarios['NOMBRE']."'";
			$usuarios_pendientes[]=$usuarios['PROCESOS_PENDIENTES'];
			$usuarios_astrasadas[]=$usuarios['PROCESOS_ATRASADOS'];
		}
	?>
	<div class="row justify-content-center">
		<div class="col-9">
		<div id='calendar'></div>
			<hr>
			<div class="proyecto <?php echo $modo; ?> p-3">
				<h3>Usuarios</h3>
				<canvas id="GraficaUsuarios"></canvas>
				<script>
				const dataUsuarios = {
					labels: [<?php echo implode(', ', $usuarios_labels); ?>],
					datasets: [{
						label: 'En tiempo',
						backgroundColor: [
							'rgb(246, 155, 31)'
						],
						borderColor: 'rgb(246, 155, 31)',
						data: [<?php echo implode(', ', $usuarios_pendientes); ?>]
					},
					{
						label: 'Atrasadas',
						backgroundColor: [
							'rgb(240, 88, 37)'
						],
						borderColor: 'rgb(rgb, 88, 37)',
						data: [<?php echo implode(', ', $usuarios_astrasadas); ?>]
					}]
				};

				const configUsuarios = {
					type: 'bar',
					data: dataUsuarios,
					options: {
						indexAxis: 'y',
						scales: {
							x: {
								stacked: true,
							},
							y: {
								stacked: true
							}
						}
					}
				};

				const GraficaUsuarios = new Chart(
				 document.getElementById('GraficaUsuarios'),
				 configUsuarios
				);
				</script>
			</div>
		</div>
		<div class="col-3">
		<div class="proyecto card card-body text-center mb-3">
                <h3><i class="fas fa-calendar"></i> Hoy se deben entregar:</h3>
                <?php $entregas_hoy = $this->GeneralModel->lista_agrupada('roles_historial','',['ESTADO'=>'en desarrollo','FECHA'=>date('Y-m-d')],'','ID_TAREA'); ?>
                <table class='table table-bordered'>
                    <tr>
                        <th>Proceso</th>
                        <th>Tarea</th>
                    </tr>
                
                <?php foreach($entregas_hoy as $entrega){ ?>
                    <?php
						$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$entrega->ID_TAREA]);
						$detalles_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$entrega->ID_USUARIO]);
					?>
                    <tr>
                        <td><a href="<?php echo base_url('index.php/tareas/detalles?id='.$entrega->ID_TAREA); ?>" target='_blank'><?php echo $entrega->ETIQUETA; ?></a></td>
                        <td><a href="<?php echo base_url('index.php/tareas/detalles?id='.$entrega->ID_TAREA); ?>" target='_blank'>
						<b><?php echo $detalles_usuario['USUARIO_NOMBRE']; ?></b><br>
						<?php echo ellipsize($detalles_tarea['TAREA_TITULO'],20) ?></a></td>
                    </tr>
                <?php } ?>
                </table>
            </div>  
            <div class="proyecto card card-body text-center mb-3">
                <h3 class="text-danger"> <i class="fas fa-exclamation-triangle"></i> Están atrasados:</h3>
                <?php $entregas_hoy = $this->GeneralModel->lista_agrupada('roles_historial','',['ESTADO'=>'en desarrollo','FECHA <'=>date('Y-m-d')],'','ID_TAREA'); ?>
                <table class='table table-bordered'>
                    <tr>
                        <th>Proceso</th>
                        <th>Tarea</th>
                    </tr>
                
                <?php foreach($entregas_hoy as $entrega){ ?>
                    <?php 
						$detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$entrega->ID_TAREA]);
						$detalles_usuario = $this->GeneralModel->detalles('usuarios',['ID_USUARIO'=>$entrega->ID_USUARIO]);	
					?>
                    <tr>
                        <td> <a href="<?php echo base_url('index.php/tareas/detalles?id='.$entrega->ID_TAREA); ?>" target='_blank'> <?php echo $entrega->ETIQUETA; ?> </a></td>
                        <td><a href="<?php echo base_url('index.php/tareas/detalles?id='.$entrega->ID_TAREA); ?>" target='_blank'>
						<b><?php echo $detalles_usuario['USUARIO_NOMBRE']; ?></b><br>
						<?php echo ellipsize($detalles_tarea['TAREA_TITULO'],20) ?></a></td>
                    </tr>
                <?php } ?>
                </table>
            </div>  
			<hr>
			<div class="proyecto <?php echo $modo; ?> p-3">
				<h3>Proyectos</h3>
				<canvas id="GraficaProyectos"></canvas>
				<script>
			  const dataProyectos = {
			    labels: [
				    'Completos',
				    'En desarrollo'
				  ],
			    datasets: [{
			      label: 'Estado de proyectos',
						backgroundColor: [
				      'rgb(169, 207, 102)',
				      'rgb(246, 155, 31)'
				    ],
			      borderColor: 'rgb(169, 207, 102)',
			      data: [<?php echo $proyectos_completos; ?>, <?php echo $proyectos_pendientes; ?>]
			    }]
			  };

			  const configProyectos = {
			    type: 'pie',
			    data: dataProyectos,
			    options: {}
			  };

				const GraficaProyectos = new Chart(
				 document.getElementById('GraficaProyectos'),
				 configProyectos
			 );
			</script>
			<ul class="list-unstyled">
				<li class="mb-2"><span class="badge bg-primary rounded-circle" style="display: block; width:10px; height:10px;"></span> <b><?php echo $proyectos_totales; ?></b> Totales</li>
				<li class="mb-2"><span class="badge bg-success rounded-circle" style="display: block; width:10px; height:10px;"></span> <b><?php echo $proyectos_completos; ?></b> Completos</li>
				<li class="mb-2"><span class="badge bg-warning rounded-circle" style="display: block; width:10px; height:10px;"></span> <b><?php echo $proyectos_pendientes; ?></b> Desarrollo</li>
			</ul>
			</div>
			<hr>
			<div class="proyecto <?php echo $modo; ?> p-3">
				<h3>Tareas</h3>
				<canvas id="GraficaTareas"></canvas>
				<script>
				const dataTareas = {
					labels: [
						'Completos',
						'En desarrollo',
						'Pendientes'
					],
					datasets: [{
						label: 'Estado de proyectos',
						backgroundColor: [
							'rgb(169, 207, 102)',
							'rgb(246, 155, 31)',
							'rgb(240, 88, 37)'
						],
						borderColor: 'rgb(169, 207, 102)',
						data: [<?php echo $tareas_completas; ?>, <?php echo $tareas_desarrollo; ?>, <?php echo $tareas_pendientes; ?>]
					}]
				};

				const configTareas = {
					type: 'doughnut',
					data: dataTareas,
					options: {}
				};

				const GraficaTareas = new Chart(
				 document.getElementById('GraficaTareas'),
				 configTareas
			 );
			</script>
			<ul class="list-unstyled">
				<li class="mb-2"><span class="badge bg-primary rounded-circle" style="display: block; width:10px; height:10px;"></span> <b><?php echo $tareas_totales; ?></b> Totales</li>
				<li class="mb-2"><span class="badge bg-success rounded-circle" style="display: block; width:10px; height:10px;"></span> <b><?php echo $tareas_completas; ?></b> Completos</li>
				<li class="mb-2"><span class="badge bg-warning rounded-circle" style="display: block; width:10px; height:10px;"></span> <b><?php echo $tareas_desarrollo; ?></b> Desarrollo</li>
				<li class="mb-2"><span class="badge bg-danger rounded-circle" style="display: block; width:10px; height:10px;"></span> <b><?php echo $tareas_pendientes; ?></b> Pendientes</li>
			</ul>
			</div>
		</div>
	</div>
</div>

<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      headerToolbar: {
    left: 'prev,next today',
    center: 'title',
    right: 'dayGridMonth,timeGridWeek,timeGridDay'
  },

      events: '<?php echo base_url('index.php/ajax/calendario_procesos_todos'); ?>'
    });
        calendar.render();
      });

    </script>

