import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-transition"
export default class extends Controller {
  static targets = ["transition"]
  connect() {
  }
  select(event){
    console.log(event.currentTarget.dataset.transitionId);
    this.transitionTargets.forEach((transition) => {
      console.log(transition.dataset.transitionId)
      if (transition.dataset.transitionId === event.currentTarget.dataset.transitionId) {
        transition.classList.remove("d-none")

      }else{
        transition.classList.add("d-none")
      }
    } )
  }
}

