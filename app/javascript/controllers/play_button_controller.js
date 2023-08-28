import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play-button"
export default class extends Controller {
  static targets = ["audio"]

  connect() {
  console.log("Testing")
  console.log(this.audioTarget)
  }

  play() {
    this.audioTarget.play()
    }
  }
