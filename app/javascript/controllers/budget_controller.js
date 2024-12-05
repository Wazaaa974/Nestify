import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="budget"
export default class extends Controller {
  static values = {
    bird: String,
  }

  destroy() {
    window.Swal.fire({
      title: "Génial, ton nid va être chouette !",
      timer: 3000,
      timerProgressBar: true,
      imageUrl: this.birdValue,
      imageWidth: 200,
      imageHeight: 140,
      imageAlt: "Custom image",
      showConfirmButton: false,
      willClose: () => {
        this.element.submit();
      }
    });
  }
}
