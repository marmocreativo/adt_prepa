<script type="text/javascript">
// Evento URL Amigable
$('.UrlAmigableOrigen').on('keyup', function(){ escribir_url($('.UrlAmigableOrigen')) });
$('.UrlAmigableResultado').on('blur', function(){ escribir_url($('.UrlAmigableResultado')) });
function  escribir_url(origen){
  var url = origen.val();
  var tabla = $('.UrlAmigableOrigen').attr('data-tabla');
  var objeto = $('.UrlAmigableOrigen').attr('data-objeto');
  var id = $('.UrlAmigableOrigen').attr('data-id');

  jQuery.ajax({
    method: "GET",
    url: "<?php echo base_url('ajax/url_amigable'); ?>",
    data: {
      tabla : tabla,
      url : url,
      objeto : objeto,
      id : id
    },
    dataType: "text",
    success : function(respuesta)
     {
      var respuesta = respuesta;
      $('.UrlAmigableResultado').val(respuesta);
    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert(xhr.status);
      alert(thrownError);
    }
  });
};

// REORDENAR
function activar_reordenar(){
  if ( $( ".ui-sortable" ).length ) {

    $('.ui-sortable').sortable({
      scroll: true,
       helper: function(event, ui){
        var $clone =  $(ui).clone();
        $clone .css('position','absolute');
        return $clone.get(0);
        },
      start: function(){
        $(this).data("startingScrollTop",$(this).parent().scrollTop());
       },
        update: function (event, ui) {
        var objetos = $(this).sortable('serialize');
        var columna =  $(this).attr('data-columna');
        var tabla =  $(this).attr('data-tabla');
        if(columna!=null&&tabla!=null){
        // Llamada ajax
        var request = $.ajax({
            data: {
              objetos : objetos,
              tabla : tabla,
              columna : columna
            },
            type: 'GET',
            url: '<?php echo base_url('ajax/reordenar'); ?>',
            dataType: "html",
            success : function(respuesta)
             {
              var respuesta = respuesta;
            },
            error: function (xhr, ajaxOptions, thrownError) {
              alert(xhr.status);
              alert(thrownError);
            }
        });
      }

      }
    });
  }
}
activar_reordenar();

  // Enviar formularios con Enter
  $(function() {
    $('.enviar_enter').each(function() {
        $(this).find('input').keypress(function(e) {
          // Enter pressed?
          if(e.which == 10 || e.which == 13) {
              this.form.submit();
          }
        });
    });
  });

  // Formulario input file Multiples
  function checkFiles(files) {
      if(files.length>10) {
        alert("Solo puedes subir 10 imágenes a la ves");
        files.slice(0,10);
        return false;
        }
  }

  // Datepicker
  if ( $( ".datepicker" ).length ) {
    $('.datepicker').datepicker({
      format: 'dd-mm-yyyy',
      language: 'es',
      weekStart: 0
    });
  }
  // Alertas Sweet note
  $('.borrar_entrada').click(function (){
    Swal.fire({
      title: '¿Estas seguro?',
      text: "Esta acción no se puede deshacer.",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, estoy seguro!',
      cancelButtonText: 'Mejor no.',
    }).then((result) => {
      if (result.value) {
        var enlace = $(this).data('enlace');
        window.location=enlace;
      } else if (
        // Read more about handling dismissals
        result.dismiss === Swal.DismissReason.cancel
      ) {
        Swal.fire(
          'Cancelado',
          'Información segura :)',
          'success'
        )
      }
    });
  });
  // Summer Note
    
    if ( $( ".TextEditor" ).length ) {
      $('.TextEditor').summernote({
        minHeight: 400,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true,                  // set focus to editable area after initializing summernote
        followingToolbar: false,
        toolbar: [
          // [groupName, [list of button]]
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['fontsize', ['fontsize']],
          ['para', ['style','ul', 'ol', 'paragraph']],
          ['insert', ['link','picture']],
          ['Code', ['codeview']]
        ]
      });
    }

    if ( $( ".TextEditorSmall" ).length ) {
      $('.TextEditorSmall').summernote({
        minHeight: 400,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true,                  // set focus to editable area after initializing summernote
        followingToolbar: false,
        toolbar: [
          // [groupName, [list of button]]
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['fontsize', ['fontsize']],
          ['para', ['style','ul', 'ol', 'paragraph']],
          ['insert', ['link','picture']],
          ['Code', ['codeview']]
        ]
      });
    }
    

    // TinyMCE
    /*
    if ( $( ".TextEditor" ).length ) {

      var llave_local = 'tAj3ykawOTzO195azIrI35wD9VLKy+bpie4QC4WG2QqxvekaVmdYEhQJG7OKfJZ0kNIlakdDkRxxApR92ehDmfXgp3zc7GTI+pH6x9gk888=';
      var llave_produccion = 't4wuHfipnzW1aVnnNTpuctC2aoEKp/QJIec2cr9cE+RYKVrO3ohY/McUYIIURgPW3KBV51F4pJvYLNzy+Mbf5Mm8fkNBBSTUakLgitYQPbg=';

    tinymce.init({
        selector: '.TextEditor',
        height: 500,
        relative_urls : false,
        remove_script_host : false,
        convert_urls : true,
        plugins: 'advlist autolink bootstrap link image lists charmap print preview help table code ',
         toolbar: [
         'undo redo | bootstrap',
         'cut copy paste | styleselect | alignleft aligncenter alignright alignjustify | bold italic | link  | code'],
         contextmenu: "link image imagetools table spellchecker | bootstrap",
         image_advtab: true ,
         bootstrapConfig: {
               url:'<?php echo base_url('assets/plugins/tinymce-bootstrap-plugin'); ?>/plugin/',
               elements: { // only the following elements will be added to the toolbar
                  btn: true,
                  icon: true,
                  table: true,
                  template: true,
                  alert: true,
                  card: true,
                  snippet: true
              },
               iconFont: 'fontawesome5',
               imagesPath: '../../contenido/img/upload/',
               key: llave_produccion
           }
      });
    }

    if ( $( ".TextEditorSmall" ).length ) {

    tinymce.init({
        selector: '.TextEditorSmall',
        height: 300,
        relative_urls : false,
        remove_script_host : false,
        convert_urls : true,
        plugins: 'advlist autolink link image lists charmap print preview help table code',
        menubar: false,
         toolbar: [
         'cut copy paste | styleselect | alignleft aligncenter alignright alignjustify | bold italic | link  | code'],
         contextmenu: "",
      });
    }
  */

  // Color Picker
  if ( $( ".ColorPicker" ).length ) {
    $('.ColorPicker').colorpicker();
  }
  // Icon Picker
  if ( $( ".IconPicker" ).length ) {
    $('.IconPicker').iconpicker({
      templates: {
          popover: '<div class="iconpicker-popover popover show"><div class="arrow"></div>' +
              '<div class="popover-title"></div><div class="popover-content"></div></div>'
      }
    });
  }

// Formulario Fecha
if ( $( ".direccion-paises" ).length ) {
  cargar_paises();
}

$( ".direccion-paises").change(function(){
  cargar_estados();
});

$( ".direccion-estados").change(function(){
  cargar_municipios();
});

function cargar_paises(){
  jQuery.ajax({
    method: "GET",
    url: "<?php echo base_url('ajax/lista_paises'); ?>",
    dataType: "html",
    success : function(respuesta)
     {
      var respuesta = respuesta;
      $('.direccion-paises').html(respuesta);
      var pais = $( ".direccion-paises" ).attr('data-pais-seleccionado');
      $(".direccion-paises").val(pais);
      cargar_estados();
    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert(xhr.status);
      alert(thrownError);
    }
  });


}

function cargar_estados(){
  var id_pais = $( ".direccion-paises option:selected" ).attr('data-id-pais');
  jQuery.ajax({
    method: "GET",
    url: "<?php echo base_url('ajax/lista_estados'); ?>",
    data: {
      id_pais : id_pais
    },
    dataType: "html",
    success : function(respuesta)
     {
      var respuesta = respuesta;
      $('.direccion-estados').html(respuesta);
      var estado = $( ".direccion-estados" ).attr('data-estado-seleccionado');
       $(".direccion-estados").val(estado);
       cargar_municipios();
    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert(xhr.status);
      alert(thrownError);
    }
  });

}

function cargar_municipios(){
  var id_estado = $( ".direccion-estados option:selected" ).attr('data-id-estado');
  jQuery.ajax({
    method: "GET",
    url: "<?php echo base_url('ajax/lista_municipios'); ?>",
    data: {
      id_estado : id_estado
    },
    dataType: "html",
    success : function(respuesta)
     {
      var respuesta = respuesta;
      $('.direccion-municipios').html(respuesta);
      var municipio = $( ".direccion-municipios" ).attr('data-municipio-seleccionado');
      $(".direccion-municipios").val(municipio);
    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert(xhr.status);
      alert(thrownError);
    }
  });

}


// Dropzone

  if ( $( "#Dropzone_multimedia" ).length ) {
    Dropzone.autoDiscover = false;
    if (document.getElementById('Dropzone_multimedia')) {
      var id = $('#Dropzone_multimedia').attr('data-id');
      var tipo = $('#Dropzone_multimedia').attr('data-tipo');
      var tipo_objeto = $('#Dropzone_multimedia').attr('data-tipo-objeto');

      var url = '<?php echo base_url('admin/multimedia/cargar_'); ?>'+tipo;

      var DropZoneMultimedia = new Dropzone("#Dropzone_multimedia", {
        dictDefaultMessage: 'Click o arrastra y suelta para subir archivos',
        url: url,
        params: {
          'id':id,
          'tipo_objeto':tipo_objeto
        },
        addRemoveLinks: true,
        init: function() {
          this.on("success", function(file, responseText) {
            if(id!=''){
              cargar_galeria();
            }else{
              cargar_multimedia();
            }
            this.removeFile(file);

          });
        }
      });
    }

  }
  // Bootstrap select
  if ( $( ".lista_autocompletar" ).length ) {
    $('.lista_autocompletar').each(function() {
      var objeto = $(this).attr('data-objeto');
      var tipo = $(this).attr('data-tipo');
      var select = $(this);
      $(select).selectpicker();
    });
  }

  // PANELES COLAPSABLES
  if ( $( "#seleccionar_duracion_proyecto" ).length ) {
    $('#seleccionar_duracion_proyecto').on('change', function(e){
      var duracion = $(this).val();
      switch (duracion) {
        case 'permanente':
        $('#formulario_duracion_proyecto').addClass('collapse');
          break;
        case 'temporal':
        $('#formulario_duracion_proyecto').removeClass('collapse');
          break;

      }
    });
  }


</script>
