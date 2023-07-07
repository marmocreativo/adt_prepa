<div class="contenido-principal">

	<div class="row">

		<div class="col-12 col-md-3">

			<div class="proyecto p-0">
				<div class="text-center">
					<div class="bg-image d-flex align-items-center" style="background-image: url(<?php echo base_url('contenido/img/usuarios/'.$usuario['IMAGEN_FONDO']); ?>); min-height:200px;"></div>
					<img src="<?php echo base_url('contenido/img/usuarios/'.$usuario['IMAGEN']); ?>" class="rounded-circle imagen_perfil" style="width:100%; max-width: 200px; margin-top:-100px;">
				</div>
			</div>
		</div>

		<div class="col-12 col-md-9">
            <div>
                <?php
                    $procesos_lista = $this->GeneralModel->lista('roles_historial','',['ID_USUARIO'=>$usuario['ID_USUARIO']],'','','');
                    $procesos = $this->GeneralModel->conteo_elementos('roles_historial',['ID_USUARIO'=>$usuario['ID_USUARIO']]);
                    $procesos_pendientes = $this->GeneralModel->conteo_elementos('roles_historial',['ID_USUARIO'=>$usuario['ID_USUARIO'],'ESTADO'=>'pendiente']);
                    $procesos_completados = $this->GeneralModel->conteo_elementos('roles_historial',['ID_USUARIO'=>$usuario['ID_USUARIO'],'ESTADO'=>'completo']);
                    $procesos_atrasados = 0;
                    foreach($procesos_lista as $proceso_list){
                        if($proceso_list->FECHA_TERMINADO>$proceso_list->FECHA){
                            $procesos_atrasados ++;
                        }
                    }

                    $procesos_preproduccion = $this->GeneralModel->conteo_elementos('roles_historial',['ID_USUARIO'=>$usuario['ID_USUARIO'],'PROCESO'=>'preproduccion']);
                    $procesos_produccion = $this->GeneralModel->conteo_elementos('roles_historial',['ID_USUARIO'=>$usuario['ID_USUARIO'],'PROCESO'=>'produccion']);
                    $procesos_postproduccion = $this->GeneralModel->conteo_elementos('roles_historial',['ID_USUARIO'=>$usuario['ID_USUARIO'],'PROCESO'=>'postproduccion']);
                ?>
                <div class="row">
                    <div class="col-4">
                    <h3>Estado de Asignaciones:</h3>
                        <canvas id="GraficaEstado"></canvas>
                        <script>
                            const dataEstado = {
                            labels: [
                                'Completos',
                                'En desarrollo'
                                ],
                            datasets: [{
                                label: 'Estado de asignaciones',
                                    backgroundColor: [
                                    'rgb(169, 207, 102)',
                                    'rgb(246, 155, 31)'
                                ],
                                borderColor: 'rgb(169, 207, 102)',
                                data: [<?php echo $procesos_completados; ?>, <?php echo $procesos_pendientes; ?>]
                            }]
                            };

                            const configEstado = {
                            type: 'pie',
                            data: dataEstado,
                            options: {}
                            };

                            const GraficaEstado = new Chart(
                                document.getElementById('GraficaEstado'),
                                configEstado
                            );
                        </script>
                    </div>
                    <div class="col-4">
                    <h3>Tipos de Asignaciones:</h3>
                        <canvas id="GraficaTipos"></canvas>
                        <script>
                            const dataTipos = {
                            labels: [
                                'Preproduccion',
                                'Produccion',
                                'Postproduccion'
                                ],
                            datasets: [{
                                label: 'Tipos de asignaciones',
                                backgroundColor: [
                                    'rgb(169, 207, 102)',
                                    'rgb(246, 155, 31)',
                                    'rgb(207, 169, 246)',
                                ],
                                data: [<?php echo $procesos_preproduccion; ?>, <?php echo $procesos_produccion; ?>, <?php echo $procesos_postproduccion; ?>]
                            }]
                            };

                            const configTipos = {
                            type: 'pie',
                            data: dataTipos,
                            options: {}
                            };

                            const GraficaTipos = new Chart(
                                document.getElementById('GraficaTipos'),
                                configTipos
                            );
                        </script>
                    </div>
                    <div class="col-4">

                    </div>
                </div>
                <div>
                    <h2>Progreso en validaciones</h2>
                </div>
                <div class="row">
                    <div class="col-12">
                        <?php
                        $array_etiquetas = '';
                        $array_valores = '';
                            foreach($tareas as $tarea){
                                //Reviso si hay revisión
                                $revisiones = $this->GeneralModel->lista_agrupada('validacion_respuesta','',['ID_TAREA'=>$tarea->ID_TAREA],'','ID_TAREA');
                                if(!empty($revisiones)){
                                    $array_etiquetas .= '"'.$tarea->TAREA_TITULO.'", ';
                                    $conteo_total = $this->GeneralModel->conteo_elementos('validacion_respuesta',['ID_TAREA'=>$tarea->ID_TAREA]);
                                    $conteo_validadas = $this->GeneralModel->conteo_elementos('validacion_respuesta',['ID_TAREA'=>$tarea->ID_TAREA,'VALOR'=>'validada']);
                                    $porcentaje = ($conteo_validadas*100)/$conteo_total;
                                    $array_valores .= $porcentaje.', ';
                                }
                            }
                        ?>

                        <canvas id="GraficaValidaciones"></canvas>
                        <script>
                            const data = {
                            labels: [  <?php echo $array_etiquetas; ?>],
                            datasets: [
                                {
                                label: 'Datos',
                                data: [ <?php echo $array_valores; ?>],
                                backgroundColor: 'rgb(207, 169, 246)',
                                },
                            ]
                            };

                            const config = {
                                type: 'bar',
                                data: data,
                                options: {
                                    responsive: true,
                                    plugins: {
                                    legend: {
                                        position: 'top',
                                    },
                                    title: {
                                        display: true,
                                        text: 'Chart.js Floating Bar Chart'
                                    }
                                    }
                                }
                            };

                            const GraficaValidaciones = new Chart(
                                document.getElementById('GraficaValidaciones'),
                                config
                            );
                        </script>
                    </div>
                </div>
            </div>
		</div>

	</div>



</div>

