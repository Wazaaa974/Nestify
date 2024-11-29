import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="package-form"
export default class extends Controller {
  static targets = ["firstQuestion", "secondQuestion", "thirdQuestion"]
  displaySecondQuestion() {
    this.firstQuestionTarget.classList.add("d-none")
    this.secondQuestionTarget.classList.remove("d-none")
  }
  displayThirdQuestion() {
    this.secondQuestionTarget.classList.add("d-none")
    this.thirdQuestionTarget.classList.remove("d-none")
  }

  }
