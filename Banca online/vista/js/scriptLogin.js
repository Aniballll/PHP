window.addEventListener("load",()=> {
           validarVacio();
  });
//validar campos vacios
function validarVacio() {
    let form = document.querySelectorAll(".login");

    Array.from(form).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
        })
    })
}
