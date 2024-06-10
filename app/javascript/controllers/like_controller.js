import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["likeIcon"]

  connect() {
    console.log("Like icon controller connected!")
    this.likeCount = parseInt(document.getElementById("like-count").textContent)
  }

  async submit(event) {
    event.preventDefault()
    console.log("Like icon clicked!")

    // Récupérer l'URL et les données du formulaire
    const form = event.currentTarget.closest("form")
    const url = form.action
    const formData = new FormData(form)

    try {
      // Envoyer la requête AJAX
      const response = await fetch(url, {
        method: 'POST',
        body: formData
      })

      // Traiter la réponse
      if (response.ok) {
        console.log("Like submitted successfully!")
        // Mettre à jour le nombre de likes
        this.likeCount += 1
        document.getElementById("like-count").textContent = this.likeCount
      } else {
        console.error("Failed to submit like.")
      }
    } catch (error) {
      console.error("Error submitting like:", error)
    }
  }
}
