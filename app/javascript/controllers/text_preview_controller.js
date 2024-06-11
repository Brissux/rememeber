import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["textInput", "preview"]

  updatePreview() {
    const text = this.textInputTarget.value
    Rails.ajax({
      url: "/path_to_your_preview_endpoint", // Mettez à jour avec le chemin de votre endpoint
      type: "GET",
      data: `text=${text}`,
      success: (data) => {
        this.previewTarget.src = data.image_url // Assurez-vous que l'endpoint renvoie l'URL de l'image modifiée
      }
    })
  }
}
