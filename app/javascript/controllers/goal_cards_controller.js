import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="goal-cards"
export default class extends Controller {
  connect() {
    console.log("We trying");

      const container = document.querySelector('.goals');
      const wrappers = document.querySelectorAll('.wrapper');

      container.addEventListener('scroll', () => {
        // console.log('I scrolled');
        let centerPosition = container.scrollLeft + container.offsetWidth / 2;
        wrappers.forEach(wrapper => {
          let wrapperCenter = wrapper.offsetLeft + wrapper.offsetWidth / 2;
          if (Math.abs(wrapperCenter - centerPosition) < wrapper.offsetWidth) {
            wrapper.classList.add("active");
          } else {
            wrapper.classList.remove("active");
          }
        });
      })
  }
 }
