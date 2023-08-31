import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play-slider"
export default class extends Controller {
  static targets = ["audio","input", "duration", "playButton" ]

  connect() {
    console.log(this.audioTarget)
    this.inputTarget.max = this.audioTarget.duration
    this.durationTarget.innerHTML = this.audioTarget.duration


  }

  update() {
    const time = Math.round(this.audioTarget.currentTime)
    this.inputTarget.value = time
    const length = Math.round(this.audioTarget.duration)
    const timeMinutes = Math.floor(this.audioTarget.currentTime / 60);
    const timeSeconds = time % 60;
    const lengthMinutes = Math.floor(this.audioTarget.duration / 60);
    const lengthSeconds = length % 60;

    this.durationTarget.innerText = `${timeMinutes}:${timeSeconds}/ ${lengthMinutes}:${lengthSeconds}`;


  }

  timeupdate () {
    // const progress = (this.audioTarget.currentTime / this.audioTarget.duration) * 100;
    // this.playSliderTarget.value = progress;
    this.audioTarget.currentTime = this.inputTarget.value
  };

  }
