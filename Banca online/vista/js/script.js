window.addEventListener("load",()=> {
    /* habilitar el chexkbox*/
    if(document.getElementById("casilla")!=null) {

        let marcada = document.getElementById('casilla');
        marcada.addEventListener("change", () => {
            let elem = document.getElementById("enviar");
            if (marcada.checked) {
                elem.removeAttribute("disabled");
                validarVacio();
            } else {
                elem.setAttribute("disabled", "disabled");
            }
        });
    }else{
        validarVacio();
    }
  });
//validar campos vacios
function validarVacio() {
    let form = document.querySelectorAll(".formulario");

    Array.from(form).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
        })
    })

}
