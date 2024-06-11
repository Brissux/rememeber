import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["text", "textSize", "textColor", "preview"];

  connect() {
    this.updatePreview(); // Optionnel: Mettre à jour la prévisualisation au chargement de la page
  }

  updatePreview() {
    const text = this.textTarget.value;
    const size = this.textSizeTarget.value;
    const color = this.textColorTarget.value;

    this.previewTarget.innerHTML = `<span style="font-size: ${size}px; color: ${color};">${text}</span>`;
  }
}
