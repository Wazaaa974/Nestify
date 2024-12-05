import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="budget"
export default class extends Controller {
  destroy() {
    this.element.submit()
  }
}
