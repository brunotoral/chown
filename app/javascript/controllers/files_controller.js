import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['fileItem']

  display(evt) {
    const fileName = evt.target.files[0].name

    this.fileItemTarget.textContent = fileName
  }
}
