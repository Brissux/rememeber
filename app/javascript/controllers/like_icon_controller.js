import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["likeIcon"]

  connect() {
    console.log("Like icon controller connected!")
    this.likeCount = parseInt(this.likeCountTarget.textContent)
  }

  async click(event) {
    event.preventDefault()
    console.log("Like icon clicked!")

    // Récupérer l'URL et les données du formulaire
    const form = event.currentTarget.closest("form")
    const url = form.action
    const method = form.method

    // Récupérer l'état actuel du like
    const likeState = this.likeIconTarget.dataset.likeState

    try {
      // Envoyer la requête AJAX
      const response = await fetch(url, {
        method: method,
        headers: {
          "Accept": "text/plain"
        }
      })

      // Traiter la réponse
      if (response.ok) {
        console.log("Like submitted successfully!")
        // Mettre à jour l'état du like et l'icône
        if (likeState === 'unliked') {
          this.likeCount += 1
          this.likeIconTarget.dataset.likeState = 'liked'
          this.likeIconTarget.innerHTML = `<img src="unlike_icon.svg" height="33px">`
        } else if (likeState === 'liked') {
          this.likeCount -= 1
          this.likeIconTarget.dataset.likeState = 'unliked'
          this.likeIconTarget.innerHTML = `<img src="like_icon.svg" height="33px">`
        }
        this.likeCountTarget.textContent = this.likeCount
      } else {
        console.error("Failed to submit like.")
      }
    } catch (error) {
      console.error("Error submitting like:", error)
    }
  }
}
