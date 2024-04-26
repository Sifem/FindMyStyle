// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="goal-cards"
// export default class extends Controller {
//   connect() {
//     this.container = this.element;
//     this.cards = this.container.querySelectorAll('.goal-card');
//     this.container.addEventListener('scroll', this.handleScroll.bind(this));
//   }
//  }

//  handleScroll() {
//   let containerWidth = this.container.offsetWidth;
//   let scrollLeft = this.container.scrollLeft;

//   this.cards.forEach((card) => {
//     let cardRect = card.getBoundingClientRect();
//     let cardWidth = cardRect.width;
//     let cardCenter = cardRect.left + cardWidth / 2;
//     let containerCenter = containerWidth / 2;
//     let distanceFromCenter = Math.abs(cardCenter - containerCenter - scrollLeft);

//     if (distanceFromCenter < containerWidth / 4) {
//       card.classList.add('center');
//     } else {
//       card.classList.remove('center');
//     }
//   });
// }
