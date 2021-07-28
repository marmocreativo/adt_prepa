<div class="estadisticas_generales mb-3">
	<h2>Estadísticas Generales PROBANDO</h2>
	<div class="row">
		<div class="col-12 col-md-8 line">
			<div class="estadistica_progreso row align-item-center g-0">
        <div class="col-12 col-md-3">
          <div class="etiqueta">
            Status de proyectos
          </div>
        </div>
    
        <div class="col-12 col-md-8">
          <div class="progreso">
            <div class="progress">
              <div class="progress-bar bg-s-atiempo" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">15%</div>
              <div class="progress-bar bg-s-revision" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30%</div>
              <div class="progress-bar bg-s-retraso" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div>
            </div>
          </div>
        </div>
				
			</div>
			<div class="estadistica_progreso row aling-item-center g-0">

        <div class="col-12 col-md-3">
          <div class="etiqueta">
            Proyectos terminados
          </div>
        </div>

				<div class="col-12 col-md-8">
          <div class="progreso">
            <div class="progress">
              <div class="progress-bar bg-p-baja" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100">35%</div>
              <div class="progress-bar bg-s-terminado" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">50 Activos</div>
            </div>
          </div>
        </div>
				
			</div>
			<div class="estadistica_progreso row aling-item-center g-0">
        <div class="col-12 col-md-3">
          <div class="etiqueta">
            Prioridad de proyectos
          </div>
        </div>
				
        <div class="col-12 col-md-8">
          <div class="progreso">
            <div class="progress">
              <div class="progress-bar bg-p-baja" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
              <div class="progress-bar bg-p-media" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
              <div class="progress-bar bg-p-alta" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
              <div class="progress-bar bg-p-urgente" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
          </div>
        </div>
				
			</div>
		</div>
		<div class="col-12 col-md-4 mt-3">
			<p><i class="fas fa-circle bg-icon-s-revision"></i> Proyectos están en revisión</p>
			<p><i class="fas fa-circle bg-icon-p-urgente"></i> Hay mas del 50% de proyectos urgentes</p>
			<p><i class="fas fa-circle bg-icon-s-atiempo"></i> Proyectos terminan esta semana</p>
		</div>
	</div>
</div>

<div class="lista_proyectos">
	<div class="d-flex row  aling-item-center">
    <div class="col-12 col-md-4">
      <div class="titulo">
				<h2>Mis proyectos</h2>
		</div>
    </div>
		<div class="col-12 col-md-7">
      <div class="formulario">
        <form class="row" action="<?php echo base_url('proyectos/busqueda'); ?>" method="get">
          <div class="col">
            <input type="text" class="form-control" name="Busqueda" value="<?php echo verificar_variable('GET','Busqueda','Buscar'); ?>">
          </div>
          <div class="col">
            <button type="submit" class="btn btn-secondary"> Aplicar </button>
          </div>
        </form>
      </div>
    </div>
		
	</div>
	<div class="slide encabezado_lista_proyectos  mt-4">
		<div class="col proyecto_nombre">
			Nombre
		</div>
		<div class="col-1 proyecto_status">
			Status
		</div>
		<div class="col-1 proyecto_prioridad">
			Prioridad
		</div>
		<div class="col-1 proyecto_fecha_inicio">
			Fecha Inicio
		</div>
		<div class="col-1 proyecto_fecha_final">
			Fecha Entrega
		</div>
		<div class="col-1 proyecto_enlace_editables">
			Editables
		</div>
		<div class="col-1 proyecto_enlace_entregable">
			Entregables
		</div>
	</div>
	<!-- Lista de proyectos -->
	<div class="slide proyecto  align-items-center ">
		
    <div class="col proyecto_nombre">
			Nombre
		</div>
		<div class="col-1 proyecto_status bg-s-atiempo">
			A tiempo
		</div>
		<div class="col-1 proyecto_prioridad bg-p-urgente">
			Urgente
		</div>
		<div class="col-1 proyecto_fecha_inicio">
			04-07-2021
		</div>
		<div class="col-1 proyecto_fecha_final">
			04-08-2021
		</div>
		<div class="col-1 proyecto_enlace_editables">
			<a href="#"><i class="fab fa-google-drive"></i></a>
		</div>
		<div class="col-1 proyecto_enlace_entregable">
			<a href="#"><i class="fas fa-link"></i></a>
		</div>
    
	</div>
	<!-- /lista de proyectos -->

</div>
