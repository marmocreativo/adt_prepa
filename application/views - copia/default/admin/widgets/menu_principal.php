<ul class="list-unstyled components">
  <?php $tipos_publicaciones = $this->GeneralModel->lista('tipos','',['TIPO_OBJETO'=>'equipos'],'','',''); ?>
  <li>
      <a href="#homeSubmenuEquipos" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-users"></i> Equipos</a>
      <ul class="collapse list-unstyled" id="homeSubmenuEquipos">
        <?php foreach($tipos_publicaciones as $tipo_publicacion){ ?>
          <li> <a href="<?php echo base_url('admin/equipos?tipo='.$tipo_publicacion->TIPO_NOMBRE); ?>"><i class="fa fa-users"></i> <?php echo $tipo_publicacion->TIPO_NOMBRE_PLURAL; ?></a> </li>
          <?php } ?>
      </ul>
  </li>
  <?php $tipos_publicaciones = $this->GeneralModel->lista('tipos','',['TIPO_OBJETO'=>'proyectos'],'','',''); ?>
  <li>
      <a href="#homeSubmenuProyectos" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fas fa-project-diagram"></i> Proyectos</a>
      <ul class="collapse list-unstyled" id="homeSubmenuProyectos">
        <?php foreach($tipos_publicaciones as $tipo_publicacion){ ?>
          <li> <a href="<?php echo base_url('admin/proyectos?tipo='.$tipo_publicacion->TIPO_NOMBRE); ?>"><i class="fa fa-users"></i> <?php echo $tipo_publicacion->TIPO_NOMBRE_PLURAL; ?></a> </li>
          <?php } ?>
      </ul>
  </li>
  <?php $tipos_publicaciones = $this->GeneralModel->lista('tipos','',['TIPO_OBJETO'=>'tareas'],'','',''); ?>
  <li>
      <a href="#homeSubmenuTareas" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fas fa-tasks"></i> Tareas</a>
      <ul class="collapse list-unstyled" id="homeSubmenuTareas">
        <?php foreach($tipos_publicaciones as $tipo_publicacion){ ?>
          <li> <a href="<?php echo base_url('admin/tareas?tipo='.$tipo_publicacion->TIPO_NOMBRE); ?>"><i class="fa fa-check"></i> <?php echo $tipo_publicacion->TIPO_NOMBRE_PLURAL; ?></a> </li>
          <?php } ?>
      </ul>
  </li>
  <?php $tipos_publicaciones = $this->GeneralModel->lista('tipos','',['TIPO_OBJETO'=>'usuarios'],'','',''); ?>
  <li>
      <a href="#homeSubmenuUsuarios" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-key"></i> Usuarios</a>
      <ul class="collapse list-unstyled" id="homeSubmenuUsuarios">
        <?php foreach($tipos_publicaciones as $tipo_publicacion){ ?>
          <li> <a href="<?php echo base_url('admin/usuarios?tipo='.$tipo_publicacion->TIPO_NOMBRE); ?>"><i class="fa fa-user"></i> <?php echo $tipo_publicacion->TIPO_NOMBRE_PLURAL; ?></a> </li>
          <?php } ?>
      </ul>
  </li>
  <li><a href="<?php echo base_url('admin/opciones'); ?>"><i class="fa fa-sliders-h"></i> Configuraciones</a></li>
  <li><a href="<?php echo base_url('admin/tipos?tipo=usuarios'); ?>"><i class="fa fa-sitemap"></i> Tipos</a></li>
  <li><a href="<?php echo base_url('admin/base_de_datos'); ?>"><i class="fa fa-database"></i> Base de datos</a></li>
</ul>
