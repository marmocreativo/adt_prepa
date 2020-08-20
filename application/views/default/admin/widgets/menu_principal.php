<ul class="list-unstyled components">
  <?php $tipos_publicaciones = $this->GeneralModel->lista('tipos','',['TIPO_OBJETO'=>'usuarios'],'','',''); ?>
  <li>
      <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-key"></i> Usuarios</a>
      <ul class="collapse list-unstyled" id="homeSubmenu">
        <?php foreach($tipos_publicaciones as $tipo_publicacion){ ?>
          <li> <a href="<?php echo base_url('admin/usuarios?tipo='.$tipo_publicacion->TIPO_NOMBRE); ?>"><i class="fa fa-user"></i> <?php echo $tipo_publicacion->TIPO_NOMBRE_PLURAL; ?></a> </li>
          <?php } ?>
      </ul>
  </li>
  <li><a href="<?php echo base_url('admin/opciones'); ?>"><i class="fa fa-sliders-h"></i> Configuraciones</a></li>
  <li><a href="<?php echo base_url('admin/tipos?tipo=usuarios'); ?>"><i class="fa fa-sitemap"></i> Tipos</a></li>
  <li><a href="<?php echo base_url('admin/base_de_datos'); ?>"><i class="fa fa-database"></i> Base de datos</a></li>
</ul>
