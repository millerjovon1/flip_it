import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play-slider"
export default class extends Controller {
  static targets = ["audio","input" ]

  connect() {
    console.log(this.audioTarget)
    this.inputTarget.max = this.audioTarget.duration


  }


  timeupdate () {
    // const progress = (this.audioTarget.currentTime / this.audioTarget.duration) * 100;
    // this.playSliderTarget.value = progress;
    this.audioTarget.currentTime = this.inputTarget.value
  };

  }
