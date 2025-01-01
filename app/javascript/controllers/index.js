// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)


if(window.matchMedia("(min-width:1025px)").matches){


$(document).ready(function () {
  var $carouselInnerChambre = $('#carousel-inner-chambre');
  var $carouselItemsChambre = $('.carousel-item');
  var cardWidthChambre = $carouselItemsChambre.width();
  var scrollPositionChambre = 0;

  // Clone les premiers et derniers éléments pour créer une boucle
  $carouselInnerChambre.append($carouselItemsChambre.clone());
  $carouselInnerChambre.prepend($carouselItemsChambre.clone());

  // Ajuste la position initiale pour éviter un saut au début
  var initialOffsetChambre = $carouselItemsChambre.length * cardWidthChambre;
  $carouselInnerChambre.scrollLeft(initialOffsetChambre);
  scrollPositionChambre = initialOffsetChambre;

  // Bouton "next"
  $('#carousel-control-next-chambre').on('click', function () {
    scrollPositionChambre += cardWidthChambre;
    $carouselInnerChambre.animate({ scrollLeft: scrollPositionChambre }, 600, function () {
      // Réinitialise si on dépasse la fin des clones
      if (scrollPositionChambre >= (initialOffsetChambre + $carouselItemsChambre.length * cardWidthChambre)) {
        scrollPositionChambre = initialOffsetChambre;
        $carouselInnerChambre.scrollLeft(scrollPositionChambre);
      }
    });
  });

  // Bouton "prev"
  $('#carousel-control-prev-chambre').on('click', function () {
    scrollPositionChambre -= cardWidthChambre;
    $carouselInnerChambre.animate({ scrollLeft: scrollPositionChambre }, 600, function () {
      // Réinitialise si on dépasse le début des clones
      if (scrollPositionChambre <= 0) {
        scrollPositionChambre = initialOffsetChambre + ($carouselItemsChambre.length - 1) * cardWidthChambre;
        $carouselInnerChambre.scrollLeft(scrollPositionChambre);
      }
    });
  });
});

 // SALON //

$(document).ready(function () {
  var $carouselInnerSalon = $('#carousel-inner-salon');
  var $carouselItemsSalon = $('.carousel-item');
  var cardWidthSalon = $carouselItemsSalon.width();
  var scrollPositionSalon = 0;

  // Clone les premiers et derniers éléments pour créer une boucle
  $carouselInnerSalon.append($carouselItemsSalon.clone());
  $carouselInnerSalon.prepend($carouselItemsSalon.clone());

  // Ajuste la position initiale pour éviter un saut au début
  var initialOffsetSalon = $carouselItemsSalon.length * cardWidthSalon;
  $carouselInnerSalon.scrollLeft(initialOffsetSalon);
  scrollPositionSalon = initialOffsetSalon;

  // Bouton "next"
  $('#carousel-control-next-salon').on('click', function () {
    scrollPositionSalon += cardWidthSalon;
    $carouselInnerSalon.animate({ scrollLeft: scrollPositionSalon }, 600, function () {
      // Réinitialise si on dépasse la fin des clones
      if (scrollPositionSalon >= (initialOffsetSalon + $carouselItemsSalon.length * cardWidthSalon)) {
        scrollPositionSalon = initialOffsetSalon;
        $carouselInnerSalon.scrollLeft(scrollPositionSalon);
      }
    });
  });

  // Bouton "prev"
  $('#carousel-control-prev-salon').on('click', function () {
    scrollPositionSalon -= cardWidthSalon;
    $carouselInnerSalon.animate({ scrollLeft: scrollPositionSalon }, 600, function () {
      // Réinitialise si on dépasse le début des clones
      if (scrollPositionSalon <= 0) {
        scrollPositionSalon = initialOffsetSalon + ($carouselItemsSalon.length - 1) * cardWidthSalon;
        $carouselInnerSalon.scrollLeft(scrollPositionSalon);
      }
    });
  });
});

// Salle de bain //

$(document).ready(function () {
  var $carouselInnerSdb = $('#carousel-inner-sdb');
  var $carouselItemsSdb = $('.carousel-item');
  var cardWidthSdb = $carouselItemsSdb.width();
  var scrollPositionSdb = 0;

  // Clone les premiers et derniers éléments pour créer une boucle
  $carouselInnerSdb.append($carouselItemsSdb.clone());
  $carouselInnerSdb.prepend($carouselItemsSdb.clone());

  // Ajuste la position initiale pour éviter un saut au début
  var initialOffsetSdb = $carouselItemsSdb.length * cardWidthSdb;
  $carouselInnerSdb.scrollLeft(initialOffsetSdb);
  scrollPositionSdb = initialOffsetSdb;

  // Bouton "next"
  $('#carousel-control-next-sdb').on('click', function () {
    scrollPositionSdb += cardWidthSdb;
    $carouselInnerSdb.animate({ scrollLeft: scrollPositionSdb }, 600, function () {
      // Réinitialise si on dépasse la fin des clones
      if (scrollPositionSdb >= (initialOffsetSdb + $carouselItemsSdb.length * cardWidthSdb)) {
        scrollPositionSdb = initialOffsetSdb;
        $carouselInnerSdb.scrollLeft(scrollPositionSdb);
      }
    });
  });

  // Bouton "prev"
  $('#carousel-control-prev-sdb').on('click', function () {
    scrollPositionSdb -= cardWidthSdb;
    $carouselInnerSdb.animate({ scrollLeft: scrollPositionSdb }, 600, function () {
      // Réinitialise si on dépasse le début des clones
      if (scrollPositionSdb <= 0) {
        scrollPositionSdb = initialOffsetSdb + ($carouselItemsSdb.length - 1) * cardWidthSdb;
        $carouselInnerSdb.scrollLeft(scrollPositionSdb);
      }
    });
  });
});


// Cuisine //

$(document).ready(function () {
  var $carouselInnerCuisine = $('#carousel-inner-cuisine');
  var $carouselItemsCuisine = $('.carousel-item');
  var cardWidthCuisine = $carouselItemsCuisine.width();
  var scrollPositionCuisine = 0;

  // Clone les premiers et derniers éléments pour créer une boucle
  $carouselInnerCuisine.append($carouselItemsCuisine.clone());
  $carouselInnerCuisine.prepend($carouselItemsCuisine.clone());

  // Ajuste la position initiale pour éviter un saut au début
  var initialOffsetCuisine = $carouselItemsCuisine.length * cardWidthCuisine;
  $carouselInnerCuisine.scrollLeft(initialOffsetCuisine);
  scrollPositionCuisine = initialOffsetCuisine;

  // Bouton "next"
  $('#carousel-control-next-cuisine').on('click', function () {
    scrollPositionCuisine += cardWidthCuisine;
    $carouselInnerCuisine.animate({ scrollLeft: scrollPositionCuisine }, 600, function () {
      // Réinitialise si on dépasse la fin des clones
      if (scrollPositionCuisine >= (initialOffsetCuisine + $carouselItemsCuisine.length * cardWidthCuisine)) {
        scrollPositionCuisine = initialOffsetCuisine;
        $carouselInnerCuisine.scrollLeft(scrollPositionCuisine);
      }
    });
  });

  // Bouton "prev"
  $('#carousel-control-prev-cuisine').on('click', function () {
    scrollPositionCuisine -= cardWidthCuisine;
    $carouselInnerCuisine.animate({ scrollLeft: scrollPositionCuisine }, 600, function () {
      // Réinitialise si on dépasse le début des clones
      if (scrollPositionCuisine <= 0) {
        scrollPositionCuisine = initialOffsetCuisine + ($carouselItemsCuisine.length - 1) * cardWidthCuisine;
        $carouselInnerCuisine.scrollLeft(scrollPositionCuisine);
      }
    });
  });
});



}
