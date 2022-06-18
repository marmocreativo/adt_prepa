
	<div class="row justify-content-center">
		<div class="col-12 col-sm-6 col-md-4 col-lg-4 p-4">
			<form class="text-center" action="<?php echo base_url('login/iniciar_sesion');?>" method="post">
				<input type="hidden" name="UrlRedirect" value="<?php echo verificar_variable('GET','url_redirect',''); ?>">
				<img src="<?php echo base_url('assets/img/logo_menu.png'); ?>" alt="" class="img-fluid">
				<h3 class="mb-4 text-center">Inicia Sesión</h3>
				<div class="form-group">
					<label for="UsuarioCorreo"> Correo</label>
					<input type="email" class="form-control" id="UsuarioCorreo" name="UsuarioCorreo" placeholder="Tu correo electrónico">
				</div>
				<div class="form-group">
					<label for="UsuarioPass"> Contraseña</label>
					<input type="password" class="form-control" id="UsuarioPass" name="UsuarioPass" placeholder="Contraseña">
				</div>
				<button type="submit" class="btn btn-success btn-round btn-block shadow-sm">Iniciar Sesión</button>
				<div class="row mt-4">
					<div class="col-12 col-sm-6">
						<a class="btn btn-block btn-link" href="<?php echo base_url('login/recuperar_pass');?>"> <span class="fa fa-question-circle"></span> Olvidé mi contraseña</a>
					</div>
				</div>
			</form>
		</div>
	</div>
