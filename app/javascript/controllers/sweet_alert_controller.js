import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sweet-alert"
export default class extends Controller {
  static values = {
    notice: String,
    alert: String,
    proposal: String,
    bird: String,
  }
  connect() {
    window.addEventListener("turbo:load", () => {
      if (this.noticeValue.length > 0) {
        window.Swal.fire({
          title: this.noticeValue,
          icon: "info",
          timer: 2000,
          timerProgressBar: true,
        });
        this.noticeValue = ""
      }
      if (this.alertValue.length > 0) {
        window.Swal.fire({
          title: this.alertValue,
          icon: "warning",
          timer: 2000,
          timerProgressBar: true,
        });
        this.alertValue = ""
      }
      if (this.proposalValue.length > 0) {
        window.Swal.fire({
          title: this.proposalValue,
          // timer: 2000,
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
    )
  }
}
