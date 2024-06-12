import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {

  static targets = ["retirer", "ajouter"];

  delete(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "DELETE",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
    })
  }

  create(event) {
    event.preventDefault()
    console.log("create");

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
    })
  }
}
