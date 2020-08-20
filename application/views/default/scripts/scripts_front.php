<script type="text/javascript">
  window.onload = function() {
      $(".load-screen").animate({opacity:0},500,function(){$(".load-screen").css('display','none'); });
      $("body").css('overflow','auto');

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

// lightbox
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});

  if ( $( ".grid" ).length ) {
    $('.grid').masonry({
      // options
      itemSelector: '.grid-item',
      columnWidth: 200
    });
  }

  // Owl carousel
  if ( $( ".carrusel_imagenes" ).length ) {
    $('.calcular_ancho').each(function() {
      var ancho = $(this).width();
      var alto = $(this).height();

      var nuevo_alto = 400;
      var nuevo_ancho = (nuevo_alto*ancho)/alto;
      $(this).parent().css('display', 'block')
      $(this).parent().width(nuevo_ancho);
      $(this).parent().height(nuevo_alto);

    });
    $( ".nuevo-carousel" ).addClass('owl-carousel');
    $('.owl-carousel').owlCarousel({
      items:4,
      autoWidth:true,
      loop:true,
      margin:10,
      autoplay:true,
      autoplayTimeout:3000,
      autoplayHoverPause:true
    });
  }

  // Parallax
  if ( $( ".parallax-principal" ).length ) {
    var scenes = [];
    var scenesSelector = document.querySelectorAll('.parallax-principal');
    for(i=0; i<scenesSelector.length; i++){
      scenes[i] = new Parallax(scenesSelector[i]);
    }
  }





</script>
