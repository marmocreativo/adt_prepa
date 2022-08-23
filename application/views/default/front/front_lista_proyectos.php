<a href="<?php echo base_url('proyectos/crear?id_equipo='); ?>" class="btn btn-success btn-round btn-circulo-flotante"> <i class="fa fa-plus"></i> </a>
<div class="row mt-3">
		<div class="col-12 col-md-8">
			<?php $this->load->view('default'.$dispositivo.'/front/widgets/lista_proyectos', $proyectos); ?>
		</div>
		<div class="col-12 col-md-4">

		</div>
</div>
