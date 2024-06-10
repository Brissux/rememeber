import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-upload"
export default class extends Controller {
  static targets = [ "output", "input" ]

  readURL() {
    var input = this.inputTarget
    var output = this.outputTarget

    if (input.files && input.files[0]) {
      var file = input.files[0];
      var reader = new FileReader();

      reader.onload = function () {
        if (file.type.startsWith("video/")) {
          output.style.display = "block";
          output.src = reader.result;
          output.play();
        } else if (file.type.startsWith("image/")) {
          output.style.display = "block";
          output.src = reader.result;
        }
      }

      reader.readAsDataURL(file);
    }
  }

  addDnone() {
  }
}
