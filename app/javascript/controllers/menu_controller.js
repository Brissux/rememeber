import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["recent", "popular", "memes"];

  filter(event) {
    event.preventDefault();
    const menuItem = [this.recentTarget, this.popularTarget];
    const selectedItem = event.currentTarget;
    const filterType = selectedItem.dataset.menuTarget;

    // Retirer la classe 'active' de tous les éléments du menu
    menuItem.forEach(item => {
      item.classList.remove("active");
    });

    // Ajouter la classe 'active' à l'élément cliqué
    selectedItem.classList.add("active");

    // Filtrer et afficher les éléments en fonction du type de filtre
    switch (filterType) {
      case "recent":
        this.sortItemsByRecent();
        break;
      case "popular":
        this.sortItemsByPopular();
        break;
      default:
        break;
    }
  }

  sortItemsByRecent() {
    // Exemple de tri par date ou autre critère de récence
    const sortedItems = Array.from(memes).sort((a, b) => {
      const dateA = new Date(a.dataset.updatedAt);
      const dateB = new Date(b.dataset.updatedAt);
      return dateB - dateA;
    });

    // Mettre à jour l'affichage avec les éléments triés
    this.element.innerHTML = '';
    sortedItems.forEach(item => {
      this.element.appendChild(item);
    });

    console.log("Tri par les plus récents");
  }

  sortItemsByPopular() {
    // Trier les éléments par nombre de "likes" en ordre décroissant
    console.log("Tri par les plus populaires");
  }
}
