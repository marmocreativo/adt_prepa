<style>
  .fc-event {
    font-size: 9px; /* Tamaño de fuente para los eventos */
    padding: 5px 8px; /* Relleno interno del evento */
  }
</style>
<div class="mb-3">
	
	<div class="row justify-content-center">
		<div class="col-9">
        <div id='calendar'></div>

		</div>
		<div class="col-3">
            <div class="proyecto card card-body text-center mb-3">
                <h3><i class="fas fa-calendar"></i> Hoy tienes por entregar:</h3>
                <?php $entregas_hoy = $this->GeneralModel->lista_agrupada('roles_historial','',['ID_USUARIO'=>$_SESSION['usuario']['id'],'ESTADO'=>'en desarrollo','FECHA'=>date('Y-m-d')],'','ID_TAREA'); ?>
                <table class='table table-bordered'>
                    <tr>
                        <th>Proceso</th>
                        <th>Tarea</th>
                    </tr>
                
                <?php foreach($entregas_hoy as $entrega){ ?>
                    <?php $detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$entrega->ID_TAREA]); ?>
                    <tr>
                        <td><a href="<?php echo base_url('index.php/tareas/detalles?id='.$entrega->ID_TAREA); ?>" target='_blank'><?php echo $entrega->ETIQUETA; ?></a></td>
                        <td><a href="<?php echo base_url('index.php/tareas/detalles?id='.$entrega->ID_TAREA); ?>" target='_blank'><?php echo ellipsize($detalles_tarea['TAREA_TITULO'],20) ?></a></td>
                    </tr>
                <?php } ?>
                </table>
            </div>  
            <div class="proyecto card card-body text-center mb-3">
                <h3 class="text-danger"> <i class="fas fa-exclamation-triangle"></i> Tienes atrasado:</h3>
                <?php $entregas_hoy = $this->GeneralModel->lista_agrupada('roles_historial','',['ID_USUARIO'=>$_SESSION['usuario']['id'],'ESTADO'=>'en desarrollo','FECHA <'=>date('Y-m-d')],'','ID_TAREA'); ?>
                <table class='table table-bordered'>
                    <tr>
                        <th>Proceso</th>
                        <th>Tarea</th>
                    </tr>
                
                <?php foreach($entregas_hoy as $entrega){ ?>
                    <?php $detalles_tarea = $this->GeneralModel->detalles('tareas',['ID_TAREA'=>$entrega->ID_TAREA]); ?>
                    <tr>
                        <td> <a href="<?php echo base_url('index.php/tareas/detalles?id='.$entrega->ID_TAREA); ?>" target='_blank'> <?php echo $entrega->ETIQUETA; ?> </a></td>
                        <td><a href="<?php echo base_url('index.php/tareas/detalles?id='.$entrega->ID_TAREA); ?>" target='_blank'><?php echo ellipsize($detalles_tarea['TAREA_TITULO'],20) ?></a></td>
                    </tr>
                <?php } ?>
                </table>
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

      events: '<?php echo base_url('index.php/ajax/calendario_procesos'); ?>'
    });
        calendar.render();
      });

    </script>

