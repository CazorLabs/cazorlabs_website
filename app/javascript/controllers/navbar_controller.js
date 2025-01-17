// app/javascript/controllers/navbar_controller.js
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['menu']

  toggleMenu(event) {
    this.menuTarget.classList.toggle('is-open')

    // Toggle aria-expanded
    const button = event.currentTarget
    const isOpen = this.menuTarget.classList.contains('is-open')
    button.setAttribute('aria-expanded', isOpen)
  }
}
