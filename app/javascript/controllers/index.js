import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

if (window.matchMedia("(min-width:1025px)").matches) {

  // Fonction pour initialiser chaque carousel
  function initializeCarousel(carouselId, controlPrevId, controlNextId) {
    var $carouselInner = $(carouselId);
    var $carouselItems = $(carouselId + ' .carousel-item');
    var cardWidth = $carouselItems.width();
    var scrollPosition = 0;
    var isAnimating = false; // Variable pour empêcher les clics rapides

    // Clone les premiers et derniers éléments pour créer une boucle
    $carouselInner.append($carouselItems.clone());
    $carouselInner.prepend($carouselItems.clone());

    // Ajuste la position initiale pour éviter un saut au début
    var initialOffset = $carouselItems.length * cardWidth;
    $carouselInner.scrollLeft(initialOffset);
    scrollPosition = initialOffset;

    // Fonction pour effectuer l'animation de défilement
    function scrollToPosition(targetPosition) {
      isAnimating = true; // Bloque l'animation pendant qu'une animation est en cours
      $carouselInner.animate({ scrollLeft: targetPosition }, 600, function () {
        // Réinitialise si on dépasse la fin des clones
        if (targetPosition >= (initialOffset + $carouselItems.length * cardWidth)) {
          scrollPosition = initialOffset;
          $carouselInner.scrollLeft(scrollPosition);
        }
        // Réinitialise si on dépasse le début des clones
        if (targetPosition <= 0) {
          scrollPosition = initialOffset + ($carouselItems.length - 1) * cardWidth;
          $carouselInner.scrollLeft(scrollPosition);
        }
        isAnimating = false; // L'animation est terminée, on permet à un autre clic d'être pris en compte
      });
    }

    // Bouton "next"
    $(controlNextId).on('click', function () {
      if (!isAnimating) { // Vérifie si une animation est en cours avant de déclencher le clic
        scrollPosition += cardWidth;
        scrollToPosition(scrollPosition);
      }
    });

    // Bouton "prev"
    $(controlPrevId).on('click', function () {
      if (!isAnimating) { // Vérifie si une animation est en cours avant de déclencher le clic
        scrollPosition -= cardWidth;
        scrollToPosition(scrollPosition);
      }
    });
  }

  // Écoute l'événement turbo:load pour initialiser les carousels après chaque mise à jour de page
  document.addEventListener('turbo:load', function() {
    // Initialisation des carousels pour chaque section
    initializeCarousel('#carousel-inner-cuisine', '#carousel-control-prev-cuisine', '#carousel-control-next-cuisine');
    initializeCarousel('#carousel-inner-sdb', '#carousel-control-prev-sdb', '#carousel-control-next-sdb');
    initializeCarousel('#carousel-inner-salon', '#carousel-control-prev-salon', '#carousel-control-next-salon');
    initializeCarousel('#carousel-inner-chambre', '#carousel-control-prev-chambre', '#carousel-control-next-chambre');
  });

}
