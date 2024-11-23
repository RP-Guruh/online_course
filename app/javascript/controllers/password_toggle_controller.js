import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password-toggle"
export default class extends Controller {
  connect() {
  }

  static targets = ["password", "toggle", "icon"]

  toggle() {
    // Ubah tipe input password (password ke text dan sebaliknya)
    const type = this.passwordTarget.type === "password" ? "text" : "password"
    this.passwordTarget.type = type

    // Ubah ikon
    const icon = this.iconTarget.classList.contains("ri-eye-close-line") ? "ri-eye-line" : "ri-eye-close-line"
    this.iconTarget.classList.replace(this.iconTarget.classList[0], icon)

  }
}
