
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <i class="fa fa-user-check"></i>
    </button>
    <?php if(verificar_sesion($this->data['op']['tiempo_inactividad_sesion'])){ ?>
      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="<?php echo base_url('usuarios/actualizar');?>"> <i class="far fa-id-card"></i> Mi Perfil</a>
        <?php if($_SESSION['usuario']['tipo_usuario']=='administrador'){ ?>
        <a class="dropdown-item" href="<?php echo base_url('admin'); ?>"> <i class="fa fa-lock"></i> Administradores</a>
        <?php } ?>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="<?php echo base_url('login/cerrar_sesion');?>"> <i class="fa fa-sign-out-alt"></i> Cerrar Sesión</a>
      </div>
    <?php }else{ ?>
      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
        <a class="dropdown-item" href="<?php echo base_url('login?url_redirect='.base_url(uri_string().'?'.$_SERVER['QUERY_STRING']));?>"> <i class="fa fa-user"></i> Iniciar sesión</a>
        <a class="dropdown-item" href="<?php echo base_url('usuarios/crear');?>"> <i class="fas fa-pencil-alt"></i> Registrarme</a>
      </div>
    <?php } ?>
  </div>
