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





</script>
