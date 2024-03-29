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

document.addEventListener("DOMContentLoaded", function() {
    // Selecciona la div con la clase tarea-descripcion
    var tareaDescripcion = document.querySelector('.tarea-descripcion');
    if (tareaDescripcion) {   
      // Obtiene todos los enlaces dentro de la div
      var enlaces = tareaDescripcion.querySelectorAll('a');

      // Itera sobre cada enlace y agrega el atributo target="_blank" si el destino está fuera del dominio actual
      enlaces.forEach(function(enlace) {
        var destino = enlace.getAttribute('href');
        
        if (destino && !esEnlaceInterno(destino)) {
          enlace.setAttribute('target', '_blank');
        }
      });

      // Función para verificar si un enlace es interno
      function esEnlaceInterno(destino) {
        var dominioActual = window.location.hostname;
        return destino.indexOf(dominioActual) !== -1;
      }
    }
  });


  // Verifica si existe una div con la clase "contenedor-etiquetas"
  const contenedorEtiquetas = document.querySelector('.contenedor-etiquetas');

if (contenedorEtiquetas) {
  // Función para cargar la lista desde el localStorage
  function cargarLista() {
    // Intenta obtener la lista desde el localStorage
    const listaJSON = localStorage.getItem('tabs_tareas');

    // Si la lista existe, conviértela de JSON a un array
    if (listaJSON) {
      

      const listaARRAY = JSON.parse(listaJSON);
      for (const id of listaARRAY) {
        // Obtener el elemento por su ID
        const elemento = document.getElementById(id);

        // Verificar si el elemento existe antes de agregar la clase
        if (elemento) {
          console.log('Elemento encontrado '+elemento);
          // Agregar la clase 'collapse' al elemento
          elemento.classList.add('collapse');
          elemento.classList.remove('show');
        }
      }

      return listaARRAY;
    } else {
      // Si no existe, devuelve un array vacío
      return [];
    }
  }

  // Función para guardar la lista en el localStorage
  function guardarLista(lista) {
    // Convierte el array a JSON y guárdalo en el localStorage
    localStorage.setItem('tabs_tareas', JSON.stringify(lista));
  }

  // Cargar la lista al cargar el sitio
  const listaTareas = cargarLista();
  // Defino los botones 

    // Seleccionar todos los elementos con data-bs-toggle="collapse"
    const elementosConCollapse = document.querySelectorAll('[data-bs-toggle="collapse"]');

    // Agregar un evento de clic a cada elemento
    elementosConCollapse.forEach(elemento => {
      elemento.addEventListener('click', () => {
        // Obtener el valor del atributo href
        const hrefValor = elemento.getAttribute('href');
        
        // Verificar si hay un elemento con el ID correspondiente
        const elementoConId = document.getElementById(hrefValor.slice(1));

        if (elementoConId) {

        // Revisar si el valor ya existe en el array
        const indice = listaTareas.indexOf(hrefValor.slice(1));

        if (indice !== -1) {
          // Si el valor existe, quitarlo del array
          listaTareas.splice(indice, 1);
        } else {
          // Si el valor no existe, agregarlo al array
          listaTareas.push(hrefValor.slice(1));
        }
          guardarLista(listaTareas);
          cargarLista();
          
        } else {
          console.log(`No se encontró un elemento con ID ${hrefValor.slice(1)}`);
        }
      });
    });


  // Puedes manipular la listaTareas como desees en tu código

  // Ejemplo de cómo imprimir la lista en la consola
  console.log(listaTareas);
} else {
  console.log('No se encontró la div con clase "contenedor-etiquetas".');
}


</script>
