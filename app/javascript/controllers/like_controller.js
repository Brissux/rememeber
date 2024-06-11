import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  like(event) {
    event.preventDefault()
    this.formTarget.submit()
  }
}
