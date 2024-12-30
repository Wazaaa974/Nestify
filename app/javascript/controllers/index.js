// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

$(document).ready(function () {
  var $carouselInner = $('.carousel-inner');
  var $carouselItems = $('.carousel-item');
  var cardWidth = $carouselItems.width();
  var scrollPosition = 0;

  // Clone les premiers et derniers éléments pour créer une boucle
  $carouselInner.append($carouselItems.clone());
  $carouselInner.prepend($carouselItems.clone());

  // Ajuste la position initiale pour éviter un saut au début
  var initialOffset = $carouselItems.length * cardWidth;
  $carouselInner.scrollLeft(initialOffset);
  scrollPosition = initialOffset;

  // Bouton "next"
  $('.carousel-control-next').on('click', function () {
    scrollPosition += cardWidth;
    $carouselInner.animate({ scrollLeft: scrollPosition }, 600, function () {
      // Réinitialise si on dépasse la fin des clones
      if (scrollPosition >= (initialOffset + $carouselItems.length * cardWidth)) {
        scrollPosition = initialOffset;
        $carouselInner.scrollLeft(scrollPosition);
      }
    });
  });

  // Bouton "prev"
  $('.carousel-control-prev').on('click', function () {
    scrollPosition -= cardWidth;
    $carouselInner.animate({ scrollLeft: scrollPosition }, 600, function () {
      // Réinitialise si on dépasse le début des clones
      if (scrollPosition <= 0) {
        scrollPosition = initialOffset + ($carouselItems.length - 1) * cardWidth;
        $carouselInner.scrollLeft(scrollPosition);
      }
    });
  });
});

