import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["empty", "full", "likeForm", "unlikeForm", "card"]
  static values = {
    id: Number
  }

  like(event) {
    event.preventDefault()
    const url = this.likeFormTarget.action
    console.log(url)

    fetch(url, {
      method: "POST",
      headers: {"Accept": "text/plain"},
      body: new FormData(this.likeFormTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.cardTarget.outerHTML = data
      })
  }

  unlike(event) {
    event.preventDefault()
    const url = this.unlikeFormTarget.action
    console.log(url)

    fetch(url, {
      method: "DELETE",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.unlikeFormTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.cardTarget.outerHTML = data
      })
  }
}
