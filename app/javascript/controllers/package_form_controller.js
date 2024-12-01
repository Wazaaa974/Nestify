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
  /* displayRoute() {

    this.thirdQuestionTarget.classList.add("d-none")
    this.routeTarget.classList.remove("d-none")
  } */

  // }

  // const minSlider = document.getElementById('min-slider');
  // const maxSlider = document.getElementById('max-slider');
  // const minValue = document.getElementById('min-value');
  // const maxValue = document.getElementById('max-value');

  // minSlider.addEventListener('input', updateValues);
  // maxSlider.addEventListener('input', updateValues);

  // function updateValues() {
  //     const min = parseInt(minSlider.value);
  //     const max = parseInt(maxSlider.value);

  //     if (min > max) {
  //         if (this === minSlider) {
  //             maxSlider.value = min;
  //         } else {
  //             minSlider.value = max;
  //         }
  //     }

  //     minValue.textContent = minSlider.value;
  //     maxValue.textContent = maxSlider.value;
  // }

  window.onload = function(){
    slideOne();
    slideTwo();
  }

  let sliderOne = document.getElementById("slider-1");
  let sliderTwo = document.getElementById("slider-2");
  let displayValOne = document.getElementById ("range1");
  let displayValTwo = document.getElementById ("range2");
  let minGap = 0;

  function slideOne(){
  if(parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap){
  sliderOne.value = parseInt(sliderTwo.value) - minGap;
    }
  }

  function slideTwo(){
  if(parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap){
  sliderTwo.value = parseInt(sliderOne.value) + minGap;
    }
  }
