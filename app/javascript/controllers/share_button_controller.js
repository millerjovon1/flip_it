import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share-button"
export default class extends Controller {
  static targets = [ "link", "close" ]

  connect() {
  }


share() {
  this.linkTarget.classList.add('is-open');
  this.closeTarget.classList.remove('is-open');
}

}
