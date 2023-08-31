import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play-slider"
export default class extends Controller {
  static targets = ["audio","input", "duration", "playButton" ]

  async connect() {
    // console.log(this.audioTarget)
    setTimeout( () => {
      this.inputTarget.max = this.audioTarget.duration
      const length = Math.round(this.audioTarget.duration)
      const lengthMinutes = Math.floor(this.audioTarget.duration / 60);
      const lengthSeconds = length % 60;

      console.log(this.audioTarget.duration)
      this.durationTarget.innerHTML = `${lengthMinutes}:${lengthSeconds.toString().padStart(2, '0')}`;
    }, 500)



  }

  async update() {
    const time = await Math.round(this.audioTarget.currentTime)
    this.inputTarget.value = time
    const length = await Math.round(this.audioTarget.duration)
    const timeMinutes = Math.floor(this.audioTarget.currentTime / 60);
    const timeSeconds = time % 60;
    const lengthMinutes = Math.floor(this.audioTarget.duration / 60);
    const lengthSeconds = length % 60;

    this.durationTarget.innerText = `${timeMinutes}:${timeSeconds.toString().padStart(2, '0')} / ${lengthMinutes}:${lengthSeconds.toString().padStart(2, '0')}`;


  }

  timeupdate () {
    // const progress = (this.audioTarget.currentTime / this.audioTarget.duration) * 100;
    // this.playSliderTarget.value = progress;
    this.audioTarget.currentTime = this.inputTarget.value
  };

  }
