import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"
// import {Swal} from "sweetalert2"

// Connects to data-controller="alert"
export default class extends Controller {

  connect() {

  }

  initSweetalert() {
    // event.preventDefault(); // Prevent the form to be submited after the submit button has been clicked

    Swal.fire({

    }).then((result) => {
      if (result.isConfirmed) {
        // User confirmed, take appropriate action here
        Swal.fire('Good job!', 'You clicked the button!', 'success');
      }
    });

  }
}
