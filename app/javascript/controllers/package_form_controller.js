import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="package-form"
export default class extends Controller {
  static targets = ["firstQuestion", "secondQuestion", "thirdQuestion", "slider", "sliderChambre"]

  // Function to show the second question
  displaySecondQuestion() {
    this.firstQuestionTarget.classList.add("d-none");
    this.secondQuestionTarget.classList.remove("d-none");
  }

  // Function to show the third question
  displayThirdQuestion() {
    this.secondQuestionTarget.classList.add("d-none");
    this.thirdQuestionTarget.classList.remove("d-none");
  }

  // Function to display the slider when a checkbox is checked
  displaySlider(event) {
    const isChecked = event.target.checked;
    if (isChecked) {
      this.sliderTarget.classList.remove("d-none");
      this.initializeSliders(); // Initialize sliders when they become visible
    } else {
      this.sliderTarget.classList.add("d-none");
    }
  }

  // Initialize sliders
  initializeSliders() {
    // Reassign slider elements dynamically
    const sliderOne = document.getElementById("slider-1");
    const sliderTwo = document.getElementById("slider-2");
    const displayValOne = document.getElementById("range1");
    const displayValTwo = document.getElementById("range2");
    const sliderTrack = document.querySelector(".slider-track");
    const sliderMaxValue = sliderOne.max;
    const minGap = 300;

    function slideOne() {
      if (parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap) {
        sliderOne.value = parseInt(sliderTwo.value) - minGap;
      }
      displayValOne.textContent = sliderOne.value;
      fillColor();
    }

    function slideTwo() {
      if (parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap) {
        sliderTwo.value = parseInt(sliderOne.value) + minGap;
      }
      displayValTwo.textContent = sliderTwo.value;
      fillColor();
    }

    function fillColor() {
      const percent1 = (sliderOne.value / sliderMaxValue) * 100;
      const percent2 = (sliderTwo.value / sliderMaxValue) * 100;
      sliderTrack.style.background = `linear-gradient(to right, #D9D9D9 ${percent1}%, #92CAD7 ${percent1}%, #92CAD7 ${percent2}%, #D9D9D9 ${percent2}%)`;
    }

    // Attach event listeners to the sliders
    sliderOne.addEventListener("input", slideOne);
    sliderTwo.addEventListener("input", slideTwo);

    // Initialize slider values and colors
    slideOne();
    slideTwo();
  }
}

// Remove window.onload as Stimulus takes care of initializing behaviors
