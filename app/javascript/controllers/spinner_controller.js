import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spinner"
export default class extends Controller {
  connect() {
    // When the controller is connected to the DOM,
    // it starts listening for the Turbo events on the document.
    // We bind `this` to ensure that `this.show` and `this.hide` refer
    // to the controller instance when they are called.
    this.show = this.show.bind(this)
    this.hide = this.hide.bind(this)
    document.addEventListener("turbo:submit-start", this.show)
    document.addEventListener("turbo:submit-end", this.hide)
  }

  disconnect() {
    // When the controller is removed from the DOM,
    // it's good practice to remove the event listeners.
    document.removeEventListener("turbo:submit-start", this.show)
    document.removeEventListener("turbo:submit-end", this.hide)
  }

  show() {
    // `this.element` refers to the DOM element with data-controller="spinner"
    // In our case, it's the overlay div itself.
    this.element.classList.remove("hidden")
  }

  hide() {
    this.element.classList.add("hidden")
  }
}