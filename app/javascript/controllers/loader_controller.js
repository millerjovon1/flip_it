import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ["spinner"]

  connect() {

  }

  spin() {
    this.spinnerTarget.classList.add("active");
  }
}
