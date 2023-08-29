import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play-button"
export default class extends Controller {
  static targets = ["audio", "playButton", "pauseButton"]

  connect() {
  console.log("Testing")
  }
  play() {
    this.audioTarget.play();
    this.playButtonTarget.classList.toggle("d-none");
    this.pauseButtonTarget.classList.remove("d-none");
  }

  pause() {
    this.audioTarget.pause();
    this.pauseButtonTarget.classList.toggle("d-none");
    this.playButtonTarget.classList.toggle("d-none");
  }
}
