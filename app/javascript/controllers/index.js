import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

// if (window.matchMedia("(min-width:1025px)").matches) {

//   // Fonction pour initialiser chaque carousel
//   function initializeCarousel(carouselId, controlPrevId, controlNextId) {
//     var $carouselInner = $(carouselId);
//     var $carouselItems = $(carouselId + ' .carousel-item');
//     var cardWidth = $carouselItems.width();
//     var totalItems = $carouselItems.length;
//     var scrollPosition = 0;
//     var isAnimating = false; // Variable pour empêcher les clics rapides

//     // Clone uniquement pour le carrousel (et pas pour le dashboard)
//     var $clones = $carouselItems.clone();
//     $clones.addClass('carousel-clone'); // Ajoute une classe aux clones

//     // Ajoute les clones à la fin et au début du carrousel pour la boucle infinie
//     $carouselInner.append($clones);
//     $carouselInner.prepend($clones);

//     // Fonction pour effectuer l'animation de défilement
//     function scrollToPosition(targetPosition) {
//       isAnimating = true; // Bloque l'animation pendant qu'une animation est en cours
//       $carouselInner.animate({ scrollLeft: targetPosition }, 600, function () {
//         // Si on atteint la fin du carrousel, on revient au début
//         if (targetPosition >= totalItems * cardWidth) {
//           scrollPosition = 0;
//           $carouselInner.scrollLeft(scrollPosition); // Réinitialisation pour revenir au début
//         }
//         // Si on atteint le début du carrousel, on revient à la fin
//         if (targetPosition < 0) {
//           scrollPosition = (totalItems - 1) * cardWidth; // Réinitialisation pour revenir à la fin
//           $carouselInner.scrollLeft(scrollPosition); // Réinitialisation pour revenir à la fin
//         }
//         isAnimating = false; // L'animation est terminée, on permet à un autre clic d'être pris en compte
//       });
//     }

//     // Bouton "next"
//     $(controlNextId).on('click', function () {
//       if (!isAnimating) { // Vérifie si une animation est en cours avant de déclencher le clic
//         scrollPosition += cardWidth;
//         scrollToPosition(scrollPosition);
//       }
//     });

//     // Bouton "prev"
//     $(controlPrevId).on('click', function () {
//       if (!isAnimating) { // Vérifie si une animation est en cours avant de déclencher le clic
//         scrollPosition -= cardWidth;
//         scrollToPosition(scrollPosition);
//       }
//     });
//   }

//   // Fonction pour ajouter un élément aux favoris (dashboard)
//   function addToFavorites(item) {
//     // Vérifie si l'élément est déjà dans les favoris (évite les doublons)
//     if ($('#dashboard .carousel-item').filter(function() {
//       return $(this).data('id') === $(item).data('id');
//     }).length === 0) {
//       // Si l'élément n'est pas déjà dans le dashboard, on l'ajoute
//       $('#dashboard').append($(item).clone()); // Ajoute une seule fois l'élément
//     }
//   }

//   // Exemple d'ajout au dashboard
//   $('.add-to-favorites').on('click', function() {
//     var item = $(this).closest('.carousel-item'); // Trouve l'élément du carrousel
//     addToFavorites(item); // Ajoute cet élément aux favoris
//   });

//   // Écoute l'événement turbo:load pour initialiser les carousels après chaque mise à jour de page
//   document.addEventListener('turbo:load', function() {
//     // Initialisation des carousels pour chaque section
//     initializeCarousel('#carousel-inner-cuisine', '#carousel-control-prev-cuisine', '#carousel-control-next-cuisine');
//     initializeCarousel('#carousel-inner-sdb', '#carousel-control-prev-sdb', '#carousel-control-next-sdb');
//     initializeCarousel('#carousel-inner-salon', '#carousel-control-prev-salon', '#carousel-control-next-salon');
//     initializeCarousel('#carousel-inner-chambre', '#carousel-control-prev-chambre', '#carousel-control-next-chambre');
//   });

// }
