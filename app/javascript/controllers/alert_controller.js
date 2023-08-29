import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"
// import {Swal} from "sweetalert2"

// Connects to data-controller="alert"
export default class extends Controller {

  connect() {
  }

  initSweetalert(event) {
    event.preventDefault(event); // Prevent the form to be submited after the submit button has been clicked

    Swal.fire({
      title: 'Good job!',
      text: 'You uploaded the song!',
      icon: 'success',
      confirmButtonText: 'FLIP IT!'
  })
    .then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        window.location.href = '/songs';
      } else if (result.isDenied) {
        Swal.fire('Changes are not saved', '', 'info')
      }
    })
  }



}
