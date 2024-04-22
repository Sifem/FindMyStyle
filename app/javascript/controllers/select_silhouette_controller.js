import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-silhouette"
export default class extends Controller {
  static targets = ["silhouetteCard", "inputId"]
  connect() {
    console.log("working");

  }

  select(event) {
    // const cards = this.element.querySelectorAll('.card');
    // cards.forEach(card => {
    //   card.classList.remove("active")
    // });
    this.silhouetteCardTargets.forEach(card => {
        card.classList.remove("active")
      });
    console.log("clicked");
    console.log(event.currentTarget.dataset.id);
    event.currentTarget.classList.toggle("active")
    this.inputIdTarget.value = event.currentTarget.dataset.id
    console.log(this.inputIdTarget.value)
  }
}
