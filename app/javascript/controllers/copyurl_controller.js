import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "link"]

  async copyurl() {
    const input = this.inputTarget;
    input.select();

    try {
      await navigator.clipboard.writeText(input.value);

      const popover = new bootstrap.Popover(this.linkTarget, {
        container: 'body',
        content: 'Copié !'
      });
      popover.show();

      setTimeout(() => {
        popover.hide();
      }, 2000);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  }
}
