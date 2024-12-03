import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="sweet-alert"
export default class extends Controller {
  connect(event) {
    window.addEventListener("turbo:load", (event) => {
      console.log(event);
    }
    )
  }
}
