import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "output", "input", "label" ]

  readURL() {
    const input = this.inputTarget
    const output = this.outputTarget

    console.log('readURL called', input, output)

    if (input.files && input.files[0]) {
      const file = input.files[0];
      const reader = new FileReader();

      reader.onload = function (e) {
        console.log('File loaded', e.target.result)
        output.style.display = "block";
        if (file.type.startsWith("video/")) {
          output.innerHTML = `<video controls><source src="${e.target.result}" type="${file.type}">Your browser does not support the video tag.</video>`;
        } else if (file.type.startsWith("image/")) {
          output.innerHTML = `<img src="${e.target.result}" alt="Image preview" style="max-width: 100%;" width="346.5">`;
        } else {
          output.innerHTML = `<p>Type de fichier non pris en charge. Veuillez télécharger une image ou une vidéo.</p>`;
        }
      }

      reader.readAsDataURL(file);

      this.addDnone();
    }
  }

addDnone() {
  this.labelTarget.style.display = "none";
}
}
