import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["form", "input"];

  connect() {
    // console.log("ok")
  }

  makePublic() {
    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
    })
  }
}
