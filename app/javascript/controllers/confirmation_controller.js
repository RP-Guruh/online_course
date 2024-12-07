import { Controller } from '@hotwired/stimulus';
import Swal from 'sweetalert2';
import { Turbo } from "@hotwired/turbo-rails";

export default class extends Controller {
  static targets = ["modalForm"];

  static values = {
    message: String,
    confirmButtonText: String,
    titleAfterConfirm: String,
    textAfterConfirm: String,
    url: String
  };

  confirm(event) {
    event.preventDefault(); // Mencegah aksi default dari tombol

    const form = this.element.closest('form');
  
      Swal.fire({
        title: "Are you sure?",
        text: this.messageValue,
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, " + this.confirmButtonTextValue + " it!"
      }).then((result) => {
        if (result.isConfirmed) {
          // Mengirim form dengan Fetch API
          this.submitForm(form);
        }
      });
    
  }

  submitForm(form) {
    // Mengirim data form menggunakan Fetch API
    fetch(form.action, {
      method: form.method,
      body: new FormData(form),
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        'Accept': 'application/json'
      }
    })
    .then(response => {
      if (!response.ok) {
        return response.json().then(data => {
          let errorMessages = ""; // Menampung semua pesan kesalahan
          if (data.hasOwnProperty('error')) {
            errorMessages += `<ul><li>${data.error}</li></ul><br>`;
          }
          else {
            for (const field in data) {
              if (data.hasOwnProperty(field)) {             
                // Menggabungkan pesan untuk setiap field
                errorMessages += `<strong>${field}:</strong><br>`; // Menambahkan nama field
                errorMessages += `<ul>`;
                data[field].forEach(message => {
                  errorMessages += `<li>${message}</li>`; // Menambahkan pesan ke list
                });
                errorMessages += `</ul><br>`;
              }
            }  
          }
        
          // Menampilkan pesan error jika respons tidak OK
          Swal.fire({
            title: "Error!",
            html: errorMessages, // Menggabungkan semua pesan error
            icon: "error"
          });
          throw new Error('Form submission failed');
        });
      }
      // Menampilkan pesan sukses setelah pengiriman form berhasil
      Swal.fire({
        title: this.titleAfterConfirmValue,
        text: this.textAfterConfirmValue,
        icon: "success"
      }).then(() => {
        Turbo.visit(this.urlValue);
      });
    })
    .catch(error => {
      console.error('Error:', error);
    });
  }

  deleteForm(event) {
    event.preventDefault(); // Mencegah pengiriman form otomatis
    Swal.fire({
      title: "Are you sure?",
      text: this.messageValue,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, " + this.confirmButtonTextValue + " it!",
    }).then((willDelete) => {
      if (willDelete) {
        Swal.fire({
          title: this.titleAfterConfirmValue,
          text: this.textAfterConfirmValue,
          icon: "success",
        }).then(() => {
          this.element.closest("form").submit();
        });
      }
    });
  }

  close() {
    this.modalFormTarget.classList.add("hidden");
  }
}