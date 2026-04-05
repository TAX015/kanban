import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dialog"]

  open() {
    this.dialogTarget.classList.remove("hidden")
  }

  close() {
    this.dialogTarget.classList.add("hidden")
  }

  closeBackground(event) {
    // Check if the click event target is the dialog itself (the backdrop)
    if (event.target === this.dialogTarget) {
      this.close()
    }
  }
}