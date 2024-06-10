import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  copyurl() {
    const input = this.inputTarget;
    input.select();
    document.execCommand("copy");
  }
}

