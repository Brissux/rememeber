import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["empty", "full", "likeForm", "unlikeForm"]
  static values = {
    id: Number
  }

  like(event) {
    event.preventDefault()
    const url = this.likeFormTarget.action
    console.log(this.idValue)

    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json" },
        // body: new FormData(this.likeFormTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }

  unlike(event) {
    event.preventDefault()
    const url = this.unlikeFormTarget.action

    // fetch(url, {
    //   method: "DELETE",
    //   headers: { "Accept": "application/json" },
    //   // body: new FormData(this.unlikeFormTarget)
    // })
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data)
    //   })
  }
}
