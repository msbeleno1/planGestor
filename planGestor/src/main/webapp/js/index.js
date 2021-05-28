$(document).ready(function(){

    // LE AGREGAMOS UNA FUNCIÓN DE ESCROLL AL DOCUMENTO (INDEX.HTML)
    $(window).scroll(function(){

        // SI EL NAV YA SE HA DESPLAZADO 100PX DE LA PARTE SUPERIOR DEL DOCUMENTO...
        if($("#nav-index").offset().top > 100){

            // QUITAMOS EL FONDO TRANSPARENTE
            $("#nav-index").removeClass("bg-transparent");

            // COLOCAMOS EL FONDO BLANCO
            $("#nav-index").addClass("bg-white");
        }

        // EN CASO CONTRARIO
        else{
            // QUITAMOS EL FONDO BLANCO
            $("#nav-index").removeClass("bg-white");

            // AGREGAMOS EL FONDO TRANSPARENTE
            $("#nav-index").addClass("bg-transparent");
        }
    });
});