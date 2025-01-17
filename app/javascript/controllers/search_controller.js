import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['form']

  submit(event) {
    event.preventDefault()
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 200)
  }
}
