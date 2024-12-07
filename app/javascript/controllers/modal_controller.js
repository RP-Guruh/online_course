import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "modal" ]

  connect() {
    this.modalTarget.classList.add('modal-open')
    this.modalTarget.classList.add('show')
    this.modalTarget.style.display = 'block'
    this.modalTarget.removeAttribute('aria-hidden')
    this.modalTarget.setAttribute('aria-modal', true)
    this.modalTarget.setAttribute('role', 'dialog')
  }

  close() {
      this.modalTarget.remove()
  }
}