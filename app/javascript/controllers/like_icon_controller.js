import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["likeIcon"];

  click() {
    const memeId = this.data.get("memeId");
    fetch(`/memes/${memeId}/likes`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({}) // Tu peux passer des données supplémentaires ici si nécessaire
    })
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .then(data => {
      // Faire quelque chose après avoir liké le mème si nécessaire
    })
    .catch(error => {
      console.error("There was an error liking the meme:", error);
    });
  }
}
