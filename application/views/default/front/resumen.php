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
			$array_usuarios[$usuario->ID_USUARIO] = array(
				'NOMBRE'=> $usuario->USUARIO_NOMBRE.' '.$usuario->USUARIO_APELLIDOS,
				'TAREAS'=> 0,
				'TAREAS_PENDIENTES'=> 0,
				'TAREAS_ATRASADAS'=> 0
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
					$array_usuarios[$list_usuario->ID_USUARIO]['TAREAS'] ++;

					if(date('Y-m-d')>date('Y-m-d', strtotime($tarea->FECHA_FINAL))){
						$array_usuarios[$list_usuario->ID_USUARIO]['TAREAS_ATRASADAS'] ++;
					}else{
						$array_usuarios[$list_usuario->ID_USUARIO]['TAREAS_PENDIENTES'] ++;
					}
				}
			}
		}

		$usuarios_labels = array();
		$usuarios_pendientes = array();
		$usuarios_astrasadas = array();
		foreach($array_usuarios as $usuarios){
			$usuarios_labels[]="'".$usuarios['NOMBRE']."'";
			$usuarios_pendientes[]=$usuarios['TAREAS_PENDIENTES'];
			$usuarios_astrasadas[]=$usuarios['TAREAS_ATRASADAS'];
		}
	?>
	<div class="row justify-content-center">
		<div class="col-12 col-md-3">
			<div class="proyecto <?php echo $modo; ?>">
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
		</div>
		<div class="col-12 col-md-3">
			<div class="proyecto <?php echo $modo; ?>">
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
		<div class="col-12 col-md-6">
			<div class="proyecto <?php echo $modo; ?>">
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
	</div>
</div>

