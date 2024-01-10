<script type="text/javascript">
  window.onload = function() {
      $(".load-screen").animate({opacity:0},500,function(){$(".load-screen").css('display','none'); });
      $("body").css('overflow','auto');
      var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})
  };

  // Botón back to top
  //Get the button:

  mybutton = document.getElementById("volver_arriba");
    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};
    function scrollFunction() {
      if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
      } else {
        mybutton.style.display = "none";
      }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
      document.body.scrollTop = 0; // For Safari
      document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }

  $('.mostrar_menu').click(
    function(){
      console.log('click en botón de menú');
      $('.sidebar').toggleClass('sidebar_mostrar');
    }
  );

  

<?php if(isset($_SESSION['usuario'])){ ?>
  // Función que se ejecutará cada minuto
function relojSesion() {
  // Reloj de actividad
  var limite_tiempo = <?php echo $this->data['op']['tiempo_inactividad_sesion'] ?>;

  // Fecha de inicio
  var fechaInicio = new Date('<?php echo date('Y-m-d\TH:i:s',strtotime($_SESSION['usuario']['ultima_actividad'])); ?>'); // Reemplaza esta fecha con la que desees

  // Fecha y hora actual
  var fechaActual = new Date();

  // Calcula la diferencia en milisegundos
  var diferencia = fechaActual - fechaInicio;

  // Convierte la diferencia de milisegundos a minutos
  var minutosPasados = Math.round(diferencia / (1000 * 60));

  if(minutosPasados<limite_tiempo-10){
    console.log('Han pasado ' + minutosPasados + ' minutos');
  }else{
    Swal.fire({
        title: '¡Te quedan menos de 10 minutos!',
        text: "Guarda tu trabajo o recarga la página para obtener más tiempo de sesión",
        type: 'warning',
        showCancelButton: false,
        confirmButtonColor: '#3085d6',
        confirmButtonText: '¡Entendido!'
      }).then((result) => {
        if (result.value) {
          Swal.fire(
            'Confirmado',
            'No olvides guardar :)',
            'success'
          )
        }
      });
  }
  
}

// Establecer un intervalo de 1 minuto (60,000 milisegundos)
<?php if(isset($_SESSION['usuario']['ultima_actividad'])){ ?>
var intervalo = setInterval(relojSesion, 60000);
<?php } ?>

<?php } ?>

function buscarNotificacion(){
  jQuery.ajax({
    method: "GET",
    url: "<?php echo base_url('index.php/ajax/revisar_ultima_notificacion'); ?>",
    dataType: "html",
    success : function(respuesta)
    {
      if(respuesta!=''){
        Swal.fire({
        position: 'top-end',
        toast: true,
        title: '<strong>Notificación</strong>',
        html:respuesta,
        showCloseButton: false,
        showCancelButton: false,
        timer: 10000
      });
      }
      
    },
    error: function (xhr, ajaxOptions, thrownError) {
      console.log(xhr.status);
      console.log(thrownError);
    }
  });
}
//buscarNotificacion();
var intervalo = setInterval(buscarNotificacion, 10000);


// Obtén todos los enlaces de la página

var enlaces = document.querySelectorAll('.tarea-descripcion a');

if(enlaces !== null){
  //console.log('Reviso los enlaces de la tarea');
  // Obtén el dominio actual
  const dominioActual = window.location.hostname;

  // Itera a través de todos los enlaces
  enlaces.forEach((enlace) => {
    var enlaceDestino = enlace.href;
    //console.log(enlaceDestino);
    
    try {
      var urlDestino = new URL(enlaceDestino);
      var dominioDestino = urlDestino.hostname;

      // Verifica si el dominio de destino es diferente al dominio actual
      if (dominioDestino !== dominioActual) {
        // Agrega el atributo target="_blank" al enlace
        enlace.setAttribute('target', '_blank');
      }else{
        console.log('El dominio coincide');
      }
    } catch (error) {
      // Muestra una alerta si la URL es inválida
      console.log('URL inválida: ' + enlaceDestino);
    }
  } catch (error) {
    // Muestra una alerta si la URL es inválida
    console.log('URL inválida: ' + enlaceDestino);
  }
  
});

// Obtén la lista almacenada en localStorage al cargar la página
var listaAlmacenada = JSON.parse(localStorage.getItem("miListaLocal")) || [];

// Actualiza la lista en la página
function actualizarLista() {
  var listaHtml = listaAlmacenada.map(function(item) {
    return '<li>' + item + '</li>';
  }).join('');
  //$('#miLista').html(listaHtml);
 
}

function valorPresenteEnJSON(objeto, valor) {
  for (var clave in objeto) {
    if (objeto.hasOwnProperty(clave) && objeto[clave] === valor) {
      return true;
    }
  }
  return false;
}


// Manejador de clic para el botón
$('.boton_etiqueta').on('click', function() {
  console.log('boton colapsar');
  // Simplemente como ejemplo, puedes pedir al usuario que ingrese el valor
  var nuevoElemento = $(this).attr('href');
  console.log(nuevoElemento);
  
  // Agrega el nuevo elemento a la lista almacenada
  if(valorPresenteEnJSON(listaAlmacenada, nuevoElemento)){
    console.log('existe');
  }else{
    listaAlmacenada.push(nuevoElemento);
  }
  
  
  // Guarda la lista actualizada en localStorage
  localStorage.setItem("miListaLocal", JSON.stringify(listaAlmacenada));

  // Actualiza la lista en la página
  actualizarLista();
});

// Actualiza la lista al cargar la página
actualizarLista();
</script>
