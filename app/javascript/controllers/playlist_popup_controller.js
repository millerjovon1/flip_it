import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="playlist-popup"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    // console.log("WEEEEEE")
    // console.log(this.formTarget)
  }
  appear() {
    this.formTarget.classList.toggle("d-none");
  }
}
