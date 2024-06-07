import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "input" ]

  connect() {
    this.inputTarget.addEventListener('change', this.handleFileUpload);
  }

  handleFileUpload(event) {
    if (event.target.files.length > 0) {
      alert('Une photo a été téléchargée');
    }
  }
}
