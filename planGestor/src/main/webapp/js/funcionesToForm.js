$(document).ready(function() {

    // FUNCION PARA MOSTRAR LA CONTRASEÑA DEL MODAL DE LOGIN
    $(".groupPassword a").click(function(event) { // AGREGAMOS UN EVENTO CLICK AL BOTON DE MOSTRAR CONTRASEÑA (ICONO DEL OJO)
        event.preventDefault(); // SE CANCELARA EL EVENTO (SI SE PUEDE), SIN DETENER EL FUNCIONAMIENTO DEL EVENTO YA EN EJECUCION
        if($('.groupPassword input').attr("type") == "text"){ // SI EL ATRIBUTO TYPE DEL BOTON ES "text":
            $('.groupPassword input').attr('type', 'password'); // SE CAMBIO EL TYPE A "password"
            $('.groupPassword em').addClass( "fa-eye-slash" ); // SE AGREGA LA CLASE "fa-eye-slash"(OJO CERRADO) PARA QUE EL ICONO CAMBIE
            $('.groupPassword em').removeClass( "fa-eye" ); // SE ELIMINA LA CLASE "fa-eye"(OJO ABIERTO) PARA QUE QUEDE SOLO EL ICONO DEL OJO CERRADO
        }else if($('.groupPassword input').attr("type") == "password"){ // SI EL ATRIBUTO TYPE DEL BOTON ES "password":
            $('.groupPassword input').attr('type', 'text'); // SE CAMBIO EL TYPE A "text"
            $('.groupPassword em').removeClass( "fa-eye-slash" ); // SE ELIMINA LA CLASE "fa-eye-slash"(OJO CERRADO) PARA QUE QUEDE SOLO EL ICONO DEL OJO ABIERTO
            $('.groupPassword em').addClass( "fa-eye" ); // SE AGREGA LA CLASE "fa-eye"(OJO ABIERTO) PARA QUE EL ICONO CAMBIE
        }
    });
    
    
    
    // EVENTO QUE SE EJECUTA CUANDO UN MODAL ES ABIERTO
    $('.modal').on('show.bs.modal', function (event) {
        // OBTENEMOS LOS FORMULARIOS QUE YA ESTEN VALIDADOS Y LES REMOVEMOS LA CLASE WAS-VALIDATED
        $(".was-validated").each(function(){
            $(this).removeClass('was-validated');
        });
        
        // EN CASO DE QUE EL FORMULARIO TENGA UN MENSAJE DE ERROR DIFERENTE A LOS DE BOOSTRAP
        // SI EL MENSAJE DE ERROR ESTÁ VISIBLE, LO HACEMOS INVISIBLE
        if($("#msg-error").hasClass("d-none") === false){
            $("#msg-error").addClass("d-none");
        }
    })

    // FUNCION PARA RESETEAR LOS FORMULARIOS AL CARGAR LA PAGINA
    $('form').each(function(){
        $(this).trigger("reset");
        if($(this).find("input[type='date']") != undefined){
        	$("input[type='date']").attr('max', fechaHoy());
        	$("input[type='date']").attr('min', '2000-01-01');
        }
    });
      
	// EL EVENTO DE SUBMIT DE TODOS DEL FORMULARIO
    $('form').submit(function(event) { // AGREGAMOS UN EVENTO AL PRESIONAR EL BOTON TIPO SUBMIT DEL FORMULARIO PADRE
        event.preventDefault(); // SE CANCELARA EL EVENTO (SI SE PUEDE), SIN DETENER EL FUNCIONAMIENTO DEL EVENTO YA EN EJECUCION
        event.stopPropagation(); // EVITA LA PROPAGACION DEL EVENTO ACTUAL A SU CONTENEDOR PADRE
        if (this.checkValidity() === true) { // VALIDAMOS EL FORMULARIO DONDE PRESIONAMOS EL BOTON TIPO SUBMIT

            // CONTROLAMOS LA ACCESIBILIDAD DE LOS BOTONES MIENTRAS TODO CARGA
            deshabilitarBotones(this);

            // MOSTRAMOS EL MENSAJE DE CARGANDO GRACIAS A LA CLASE SPINNER DE BOOSTRAP 4.6
            $(this).find(".btn-submit").html('<span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span> Cargando...');
            ajaxForms(this);
        }
        $(this).addClass('was-validated'); // AGREGAMOS LA CLASE WAS-VALIDATED A LA ETIQUETA FORM (DE ESTA FORMA SABREMOS QUE FORMULARIOS HAN SIDO VALIDADOS)
    });

    // FUNCION PARA VALIDAR QUITAR LOS MENSAJES DE ERROR DE LOS FORMULARIOS MODALES
    $('.btn-close').click(function(){  

        // DEJAMOS COMO "NO VISIBLE" EL CAMPO DE CONTRASEÑA EN CASO DE HABERSE DEJADO COMO "VISIBLE"
        if($('.groupPassword input').attr("type") == "text"){
            $('.groupPassword input').attr('type', 'password');
            $('.groupPassword em').addClass( "fa-eye-slash" );
            $('.groupPassword em').removeClass( "fa-eye" );
        }

        // LIMPIAMOS LOS CAMPOS DEL FORMULARIO QUE ACABMOS DE CERRAR
        if($(this).parents('form').attr("id") === undefined){
            // ESTA OPCION ES EN CASO DE SELECCIONAR EL ICONO DE X QUE APARECEN EN LOS MODALES
            // PRIMERO BUSCAMOS SU PADRE MODAL CONTENT, LUEGO BUSCAMOS EL FORMULARIO HIJO DE MODAL CONTENT PARA RESETEARLO
            $(this).parents(".modal-content").find("form").trigger("reset");
        }
        else{
            // BUSCAMOS EL PADRE O FORMULARIO DEL BOTON PARA RESETEARLO
            $(this).parents('form').trigger("reset");
        }

        // EN CASO DE QUE EL FORMULARIO TENGA UN MENSAJE DE ERROR DIFERENTE A LOS DE BOOSTRAP
        // SI EL MENSAJE DE ERROR ESTÁ VISIBLE, LO HACEMOS INVISIBLE
        if($("#msg-error").hasClass("d-none") === false){
            $("#msg-error").addClass("d-none");
        }

        // EN CASO DE UN FORMULARIO QUE PERMITE ADJUNTAR ARCHIVOS, EN CASO DE ESTAR MOSTRANDO EL MENSAJE DE ERROR, LO HACEMOS INVISIBLE
        if($(".file-error").hasClass("d-none") === false){
            $(".file-error").addClass("d-none");
        }

        // MENSAJE POR DEFECTO DE LOS INPUT TIPO FILE
        $(".custom-file-label").html("Seleccione un archivo");
        $("input[type='file']").value = '';
    });
    
    // EVENTO PARA ACTUALIZAR LOS TABLES DESPUES DE CERRAR LOS FORMULARIOS INFORMATIVOS
    $('.btn-close-info').click(function(){
    	window.location.reload();
    });

    // FUNCION PARA DESHABILITAR EL COPY & PASTE DE LOS INPUT TIPO PASSWORD
    $("input[type='password']").bind('cut copy paste', function (e) {
        e.preventDefault();
    });
   
    // FUNCION PARA DESHABILITAR EL CLICK DERECHO DEL MOUSE PARA EVITAR COPY & PASTE
    $("input[type='password']").on("contextmenu",function(e){
        return false;
    });

    // FUNCION PARA VALIDAR LOS INPUT FILE
    $("input[type='file']").each(function(e){
        $(this).change(function(){
            if($(this).attr("accept") === "text/csv"){
            	
            	// QUITAMOS CUALQUIER ERROR VISIBLE CADA VEZ QUE SE INGRESE UN NUEVO ARCHIVO
            	if($(".file-error").hasClass("d-none") === false){
                    $(".file-error").addClass("d-none");
                }

                // DEFINIMOS UNA VARIBLE DE TAMAÑO MAXIMO PARA EL ARCHIVO (MEDIDA EN BYTES)
                let maxSize = 3000000;
                let txtSize = maxSize / 1000000; // 3MB

                // OBTENEMOS EL NOMBRE DEL ARCHIVO Y EL PESO
                let fileName = this.files[0].name;
	            let fileSize = this.files[0].size;

                console.log(fileName);
                console.log(fileSize);

                if(fileSize > maxSize){
                    // MOSTRAMOS EL MENSAJE DE ERROR AL SUSPERAR EL VALOR DE LA VARIABLE DE TAMAÑO MAXIMO
                    if($(".file-error").hasClass("d-none")){
                        $(".file-error").removeClass("d-none");
                    }
                    $(".file-error").html("El tamaño del archivo no debe ser superior a "+txtSize+"MB.");
                    this.value = '';
                    this.files.name = '';
                }
                else{
                    // OBTENEMOS LA EXTENSIÓN DEL ARCHIVO
                    var ext = fileName.split('.').pop();
                    
                    // CONVERTIMOS EN MINUSCULA LA EXTENSIÓN POR SI ACASO ESTÁ EN MAYUSCULA
                    ext = ext.toLowerCase();
                    console.log(ext);
                    
                    // VALIDAMOS QUE SI CUMPLA CON LA EXTENSIÓN SOLICITADA
                    if(ext != 'csv'){
                        this.value = '';
                        this.files.name = '';
                    }
                    else{
                        // QUITAMOS ALGUN MENSAJE DE ERROR EN CASO DE HABERLO
                        if($(".file-error").hasClass("d-none") === false){
                            $(".file-error").addClass("d-none");
                        }

                        // COLOCAMOS EL NOMBRE DEL ARCHIVO AL INPUT
                        $(".custom-file-label").html(fileName);
                    }
                }
            }
        });
        
    });
    
    
    // FUNCION PARA EL INPUT DE DOCUMENTO DEL FORMULARIO DE EDICION DE VEHICULOS Y CREACION DE FACTURAS
    $("#btnBuscarPropietario").click(function(e){
    	e.preventDefault();
    	deshabilitarBotones($(this).parents('form'));
    	busqueda($(this).parents('form'));
    });
    
    // FUNCION PARA EL INPUT DE DOCUMENTO DEL FORMULARIO DE EDICION DE VEHICULOS
	$("#btnEditarPropietario").click(function(e){
		e.preventDefault();
		if($("#documentoGroup").hasClass("d-none")){
			$("#documentoGroup").removeClass("d-none");
		 	$('#btnEditarPropietario em').removeClass( "fa-edit" );
            $('#btnEditarPropietario em').addClass( "fa-minus" );
            $(this).parents('form').find('.btn-submit').attr('disabled',true);
		}
		else{
			$("#documentoGroup").addClass("d-none");
		 	$('#txtDocumentoPropietario').val($("#txtDocumentoTemp").val());
		 	$('#btnEditarPropietario em').removeClass( "fa-minus" );
            $('#btnEditarPropietario em').addClass( "fa-edit" );
            $(this).parents('form').find('.btn-submit').attr('disabled',false);
            if($("#error-buscar").hasClass("d-none") === false){
            	$("#error-buscar").addClass("d-none");
        	}
		}
	});
	
	
	// FUNCION PARA EL INPUT DE CONCEPTO DE FACTURA
	$("#txtConceptosFactura").keyup(function(){
		let valor = $("#txtConceptosHidden").val();
        $("#txtConceptosFactura").val(valor);
    });
    
    $("#txtBaseFactura").keyup(function(){
    	let valor = $("#txtBaseFacturaHidden").val();
        $("#txtBaseFactura").val(valor);
    });

});

// FUNCION PARA DESHABILITAR LOS BOTONES MIENTRAS CARGA LA INFORMACIÓN
function deshabilitarBotones(form){

    // DESAHBILITAMOS EL BOTON SUBMIT DEL FORMULARIO
    $(form).find(".btn-submit").prop( "disabled", true );

    // VALIDAMOS SI EL FORMULARIO ESTA DENTRO DE UN MODAL
    if($(form).parents('.modal-content') != undefined){
        // EN CASO DE QUE EL FORMULARIO SEA DE UN MODAL, DESHABILITAMOS TODOS LOS BOTONES DE CERRAR
        $(form).parents('.modal-content').find(".btn-close").prop( "disabled", true );

        if($(form).parents('.modal-content').find(".nav-tabs") != undefined){
            $(form).parents('.modal-content').find(".nav-item").prop( "disabled", true );
        }
    }
    else{
        // EN CASO CONTRARIO SOLO DESHABILITAMOS LOS BOTONES DE CERRAR QUE ESTÁN DENTRO DEL FORMULARIO FORMULARIO
        $(form).find(".btn-close").prop( "disabled", true );
    }
}


// FUNCION PARA CALCULAR LA FECHA DE HOY EN FORMATO YYYY-MM-DD
function fechaHoy(){
    let hoy = Date();
    const fecha = new Date(hoy);
    let dia = fecha.getDate();
    let mes = fecha.getMonth()+1;
    
    if(dia < 10){
        dia = '0'+dia;
    }
    if(mes < 10){
        mes = '0'+mes;
    }
    
    return fecha.getFullYear()+"-"+mes+"-"+dia;
}