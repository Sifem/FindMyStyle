import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-silhouette"
export default class extends Controller {
  connect() {
    console.log("working")
  }

  select(event) {
    console.log("clicked")
    console.log(event.currentTarget.dataset.id)
  }

  submit(event) {
    event.preventDefault()
    console.log("ya")
    console.log(event.currentTarget.href)
    const url = `${event.currentTarget.href}`
    const params = {
      id: 117
    };

   fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(params)
    })
  }
}
