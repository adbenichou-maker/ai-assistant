import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    this.originalHtml = this.buttonTarget ? this.buttonTarget.innerHTML : ""
    // restore after Turbo finishes the roundtrip
    this.element.addEventListener("turbo:submit-end", () => this.restore())
    // also restore if Turbo navigation or errors happen
    document.addEventListener("turbo:before-render", () => this.restore())
  }

  submit(event) {
    // show spinner & disable to prevent double submit
    if (!this.buttonTarget) return
    this.buttonTarget.innerHTML = `<span class="spinner" aria-hidden="true"></span>`
    this.buttonTarget.disabled = true
  }

  restore() {
    if (!this.buttonTarget) return
    this.buttonTarget.disabled = false
    this.buttonTarget.innerHTML = this.originalHtml
  }
}
