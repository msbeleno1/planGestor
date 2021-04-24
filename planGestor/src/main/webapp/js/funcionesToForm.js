$(document).ready(function() {

    // FUNCION PARA MOSTRAR LA CONTRASEÑA DEL MODAL DE LOGIN
    $(".groupPasswordLogin a").on('click', function(event) { // AGREGAMOS UN EVENTO CLICK AL BOTON DE MOSTRAR CONTRASEÑA (ICONO DEL OJO)
        event.preventDefault(); // SE CANCELARA EL EVENTO (SI SE PUEDE), SIN DETENER EL FUNCIONAMIENTO DEL EVENTO YA EN EJECUCION
        if($('.groupPasswordLogin input').attr("type") == "text"){ // SI EL ATRIBUTO TYPE DEL BOTON ES "text":
            $('.groupPasswordLogin input').attr('type', 'password'); // SE CAMBIO EL TYPE A "password"
            $('.groupPasswordLogin em').addClass( "fa-eye-slash" ); // SE AGREGA LA CLASE "fa-eye-slash"(OJO CERRADO) PARA QUE EL ICONO CAMBIE
            $('.groupPasswordLogin em').removeClass( "fa-eye" ); // SE ELIMINA LA CLASE "fa-eye"(OJO ABIERTO) PARA QUE QUEDE SOLO EL ICONO DEL OJO CERRADO
        }else if($('.groupPasswordLogin input').attr("type") == "password"){ // SI EL ATRIBUTO TYPE DEL BOTON ES "password":
            $('.groupPasswordLogin input').attr('type', 'text'); // SE CAMBIO EL TYPE A "text"
            $('.groupPasswordLogin em').removeClass( "fa-eye-slash" ); // SE ELIMINA LA CLASE "fa-eye-slash"(OJO CERRADO) PARA QUE QUEDE SOLO EL ICONO DEL OJO ABIERTO
            $('.groupPasswordLogin em').addClass( "fa-eye" ); // SE AGREGA LA CLASE "fa-eye"(OJO ABIERTO) PARA QUE EL ICONO CAMBIE
        }
    });


    // FUNCION PARA VALIDAR LOS FORMULARIOS DE LOS MODALES DE LOGIN, CONTACTO Y MOSTRAR EL ERROR EN CADA CAMPO
    (function() {
        'use strict'; // ACTIVAMOS EL MODO ESTRICTO EN LA FUNCION PARA ACCEDER DE FORMA SEGURA A LA VENTANA DEL NAVEGADOR
          window.addEventListener('load', function() { // AGREGAMOS UN EVENTO TIPO LOAD A LA VENTANA DONDE SE EJECUTARÁ UNA FUNCION JS

            // Obtenemos todos los formularios a los que queremos aplicarle el estilo de validación de BootStrap
            var forms = document.getElementsByClassName('needs-validation');

            // Ciclo para validar cada form antes de enviar los datos
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) { // AGREGAMOS UN EVENTO AL PRESIONAR EL BOTON TIPO SUBMIT DE CUALQUIER FORMULARIO
                    if (form.checkValidity() === false) { // VALIDAMOS EL FORMULARIO DONDE PRESIONAMOS EL BOTON TIPO SUBMIT
                    event.preventDefault(); // SE CANCELARA EL EVENTO (SI SE PUEDE), SIN DETENER EL FUNCIONAMIENTO DEL EVENTO YA EN EJECUCION
                    event.stopPropagation(); // EVITA LA PROPAGACION DEL EVENTO ACTUAL A SU CONTENEDOR PADRE
                    }
                    else{ // EN CASO DE QUE LOS CAMPOS HAYAN SIDO BIEN DILIGENCIADOS
                        formulariosLanding(form);
                    }
                    form.classList.add('was-validated'); // AGREGAMOS LA CLASE WAS-VALIDATED A LA ETIQUETA FORM (DE ESTA FORMA SE MOSTRARAN LOS ERRORES EN SUS RESPECTIVOS CAMPOS)
                }, false);
            });
        }, false);
    })();


    // FUNCION PARA VALIDAR QUITAR LOS MENSAJES DE ERROR DE LOS FORMULARIOS MODALES
    (function() {
        'use strict';
        window.addEventListener('load', function() {

            // Obtenemos todos los botones que tiene la clase "btn-close" (Están en los modales)
            var btnCloseModals = document.getElementsByClassName('btn-close');

            // Creamos un arreglo donde recorremos cada botón de esos
            var btnArray = Array.prototype.filter.call(btnCloseModals, function(btn){

                btn.addEventListener('click', function(event){ // A cada botón le agregamos un evento cuando reciba un clic

                    var forms = document.getElementsByClassName('was-validated'); // Obtenemos todos los formularios que están validados y que los datos son erroneos
                    if(forms.length > 0){ // Si hay al menos un formulario que ya se valido y tuvo errores en lo campos
                        location.reload(); // La pagina se recargará para eliminar los mensajes de error de los campos
                    }
                }, false);                
            });
        }, false);
    })();
});