import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['flash']

  dismiss(event){
    this.flashTarget.remove()
  }
}
