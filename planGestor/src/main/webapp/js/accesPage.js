$(document).ready(function(){
    let rol = localStorage.getItem("rol");

    if(rol != null){
		if(rol.toLowerCase() === "asesor"){
	        if($(".nav-adm").hasClass("d-none") === false){
	            $(".nav-adm").addClass("d-none");
	            $(".nav-adm").removeClass("d-block");
	        }
	        if($(".nav-sup").hasClass("d-none") === false){
	            $(".nav-sup").addClass("d-none");
	            $(".nav-sup").removeClass("d-block");
	        }
		}
	    else if(rol.toLowerCase() === "supervisor"){
	        if($(".nav-adm").hasClass("d-none") === false){
	            $(".nav-adm").addClass("d-none");
	            $(".nav-adm").removeClass("d-block");
	        }
	        if($(".nav-sup").hasClass("d-none")){
	            $(".nav-sup").removeClass("d-none");
	            $(".nav-sup").addClass("d-block");
	        }
	    }
	    else if(rol.toLowerCase() === "administrador"){
	        if($(".nav-adm").hasClass("d-none")){
	            $(".nav-adm").removeClass("d-none");
	            $(".nav-adm").addClass("d-block");
	        }
	        if($(".nav-sup").hasClass("d-none")){
	            $(".nav-sup").removeClass("d-none");
	            $(".nav-sup").addClass("d-block");
	        }
	    }
	}
    else{
        window.location.replace("../index.html");
    }

    $("#btnLogout").click(function(event){
        event.preventDefault();
        let nombre = "nombre="+localStorage.getItem("nombre");
        if(rol != null){
            $.ajax({
                type: "GET",
                url: "../validaLogin",
                data: nombre,
                datatype: "text",
                success: function( response ){
                    if(response.informacion === "exito"){
                        localStorage.removeItem("rol");
                        localStorage.removeItem("nombre");
                        window.location.replace("../index.html");
                    }
                }
        	});
        }
    });
});