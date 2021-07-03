$(document).ready(function(){
    let rol = localStorage.getItem("rol");
    
    if(rol != null){
        let nombre = "nombre="+localStorage.getItem("nombre");
        $.ajax({
            type: "GET",
            url: "validaLogin",
            data: nombre,
            datatype: "text",
            success: function( response ){
                if(response.informacion === "exito"){
                    localStorage.removeItem("rol");
                    localStorage.removeItem("nombre");
                }
            }
		});
    }
});