import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { recipes: Array }

  connect() {
    this.index = 0
    this.updateLink()
    this.timer = setInterval(() => this.updateLink(), 6000)
  }

  disconnect() {
    clearInterval(this.timer)
  }

  updateLink() {
    if (this.recipesValue.length === 0) {
      this.element.textContent = "(no saved recipes)"
      this.element.removeAttribute("href")
      return
    }

    const [title, path] = this.recipesValue[this.index]

    this.element.textContent = title
    this.element.href = path

    this.index = (this.index + 1) % this.recipesValue.length
  }

  updateLink() {
  if (this.recipesValue.length === 0) {
    this.element.textContent = "(no saved recipes)"
    this.element.removeAttribute("href")
    return
  }

  // fade out
  this.element.style.opacity = 0

  setTimeout(() => {
    const [title, path] = this.recipesValue[this.index]

    // update link
    this.element.textContent = title
    this.element.href = path

    // fade in
    this.element.style.opacity = 0.7

    // next index
    this.index = (this.index + 1) % this.recipesValue.length
  }, 300) // must be slightly less than CSS transition
  }

}
