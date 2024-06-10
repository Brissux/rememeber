import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "tags"]

  connect() {
    this.inputTarget.addEventListener("keydown", this.handleKeyDown.bind(this))
  }

  handleKeyDown(event) {
    if (event.key === ",") {
      event.preventDefault()
      this.addTag(event.target.value.trim())
      event.target.value = ""
    }
  }

  addTag(name) {
    const tag = document.createElement("div")
    tag.classList.add("tag-container", "button-tag-input", "d-flex", "align-items-center", "gap-1")
    tag.innerHTML = `
      <div class="d-flex align-items-center justify-content-center">
          <p class="m-0" style="width: auto; padding-right: 5px;">${name}</p>
          <input type="hidden" name="meme[meme_tags_attributes][][tag_attributes][name]" value="${name}">
          <button type="button" class="btn btn-close btn-sm" style="font-size: 0.8rem; margin-left: 2px;" data-action="click->tag-input#removeTag"></button>
      </div>
    `
    this.tagsTarget.appendChild(tag)
  }

  removeTag(event) {
    const tag = event.target.closest(".tag-container")
    tag.remove()
  }
}