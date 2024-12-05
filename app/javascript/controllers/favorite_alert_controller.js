import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite-alert"
export default class extends Controller {
  static values = {
    message: String,
    bird: String,
  }
  fire() {
    window.Swal.fire({
      title: this.messageValue,
      timer: 3000,
      timerProgressBar: true,
      imageUrl: this.birdValue,
      imageWidth: 200,
      imageHeight: 140,
      imageAlt: "Custom image",
      showConfirmButton: false,
    });
    this.proposalValue = ""
  }
}
