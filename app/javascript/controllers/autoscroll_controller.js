import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messages"]

  connect() {
    this.scrollToTopOfLastMessage()
  }

  scrollToTopOfLastMessage() {
    const container = this.messagesTarget
    const lastMessage = container.lastElementChild

    if (!lastMessage) return

    container.scrollTop = lastMessage.offsetTop
  }
}
