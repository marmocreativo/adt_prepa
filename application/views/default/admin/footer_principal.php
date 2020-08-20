</div><!-- /Content -->
</div><!-- /Wraper -->
<button onclick="topFunction()" id="volver_arriba" class="btn btn-primary" title="volver arriba"> <i class="fa fa-chevron-up"></i> </button>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/parallax/3.1.0/parallax.min.js"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>jquery-ui/jquery-ui.bundle.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>dropzone/dist/dropzone.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>nested-sortable/jquery.mjs.nestedSortable.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>iconpicker/dist/js/fontawesome-iconpicker.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>sweetalert2/dist/sweetalert2.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>bootstrap-select/dist/js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/plugins/'); ?>owl.carousel/dist/owl.carousel.min.js"></script>
<?php $this->load->view('default'.$dispositivo.'/scripts/scripts_admin'); ?>
<?php $this->load->view('default'.$dispositivo.'/scripts/scripts_formularios'); ?>
<?php $this->load->view('default'.$dispositivo.'/scripts/scripts_front'); ?>

<script type="text/javascript">
	$(document).ready(function () {
			$('#sidebarCollapse').on('click', function () {
					$('#sidebar').toggleClass('active');
			});
	});
</script>
</body>
</html>
