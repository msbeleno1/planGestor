function ajaxForms(form){
    if($(form).attr("id") === "formLogin"){
        let dataForm = $( form ).serialize();
        
        $.ajax({
          type: "POST",
          url: "validaLogin",
          data: dataForm,
          success: function( data ) {
              if(data.Rol === "Ninguno"){
              		habilitarBotones(form);
	              	$(form).find("#msg-error").removeClass("d-none"); // MOSTRAMOS EL MENSAJE DE ERROR
	            	$(form).find(".btn-submit").html('ENVIAR'); // CAMBIAMOS EL CONTENIDO DEL BOTON SUBMIT
              }
              else{
              		window.location.replace("jsp/home.jsp");
              }
            },
            datatype: "text"
        });
    }
    else if($(form).attr("id") === "formRegistroMasivo"){
        var fd = new FormData();
        var files = $(form).find("input[type='file'")[0].files;
        fd.append('file',files[0]);
        fd.append('opcion','masiva');


        $.ajax({
        	type: 'POST',
            url: "../usuariosServlet",
            data: fd,
            contentType: false,
            processData: false,
            success: function(response){
            	habilitarBotones(form);
            	$(form).find(".btn-submit").html('Registrar'); // CAMBIAMOS EL CONTENIDO DEL BOTON SUBMIT
            	
            	if(response.informacion == "error"){
	            	if($(".file-error").hasClass("d-none")){
                            $(".file-error").removeClass("d-none");
                    }
                    $(".file-error").html("El archivo ingresado no cumple con la estructura de datos solicitada");
            	}
            	else{
            		$(form).find(".custom-file-label").html("Seleccione un archivo");
			        $(form).trigger("reset");
            		$(form).parents('.modal').modal('hide');
					
					// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL DATATABLE PARA LLENAR LA TABLA
					const data = JSON.parse(response.datos);
					
					// AGREGAMOS LOS ENCABEZADOS A LA TABLA
					$('#table-masiva').find("#encabezados").html(`	<th scope="col" class="text-center">Identificacion</th>
                                									<th scope="col" class="text-center">Nombre</th>
                                									<th scope="col" class="text-center">Observaciones</th>`);
                                									
			        $('#table-masiva').DataTable( {
			            language: {
			                url: "../js/External/dataTables/espanol.json"
			            },
			            "bPaginate": false, // OCULTA LA PAGINACION DE LA TABLA
			            "searching": false, // OCULTA EL CUADRO DE BUSQUEDA
			            "ordering": false, // OCULTA LA OPCIÓN DE ORDENAMIENTO DE LAS CABECERAS DE LA TABLA
			            "info": false, // OCULTA LA INFORMACIÓN DE LA PAGINACION DE LOS REGISTROS ("Mostrando x registros de x tantos")
						
			            // CARGAMOS LOS DATOS POR MEDIO DE LA RESPUESTA DE AJAX
				        "data": data,
				        "columns":[
				            {"data":"Identificacion"},
				            {"data":"Nombre"},
				            {"data":"Observaciones"},
				        ]
	        		} );

		        	$('#modalSuccessMasiva').modal('show');
            	}
	        },
	     });
    }
    else if($(form).attr("id") === "formRegistroIndividual"){

        let dataForm = $(form).serialize()+"&opcion=crear";

        $.ajax({
            type:'POST',
            url: "../usuariosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form);
                $(form).trigger("reset");
            	$(form).find(".btn-submit").html('Registrar');
                $(form).parents('.modal').modal('hide');
            	
            	if(response.informacion == "error"){
                    $("#lblError").html("El usuario <strong>"+response.datos+"</strong> ya se encuentra registrado en el sistema");
                    $('#modalError').modal('show');
                }
                else{
                    $("#lblSuccess").html("El usuario <strong>"+response.datos+"</strong> fue creado con éxito");
                    $('#modalSuccess').modal('show');
                }
            },
        });
    }
    else if($(form).attr("id") === "formEdicion"){
    	let dataForm = $(form).serialize()+"&opcion=editar";
    	
    	$.ajax({
	    	type:'POST',
            url: "../usuariosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form);
                $(form).trigger("reset");
            	$(form).find(".btn-submit").html('Editar');
                $(form).parents('.modal').modal('hide');
            	
            	if(response.informacion == "error"){
                    $("#lblError").html("Los datos del usuario <strong>"+response.datos+"</strong> no pueden ser actualizados por duplicidad de datos");
                    $('#modalError').modal('show');
                }
                else{
                    $("#lblSuccess").html("Los datos del usuario <strong>"+response.datos+"</strong> fueron actualizada");
                    $('#modalSuccess').modal('show');
                }
            },
    	});
    }
    else if($(form).attr("id") === "formReset"){
    	let dataForm = $(form).serialize()+"&opcion=reset";
    	
    	$.ajax({
	    	type:'POST',
            url: "../usuariosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form);
                $(form).trigger("reset");
            	$(form).find(".btn-submit").html('SÍ');
                $(form).parents('.modal').modal('hide');
            	
            	if(response.informacion == "error"){
                    $("#lblError").html(response.datos);
                    $('#modalError').modal('show');
                }
                else{
                    $("#lblSuccess").html("Clave restablecida. La nueva clave es <strong>"+response.datos+"</strong>");
                    $('#modalSuccess').modal('show');
                }
            },
    	});
    }
    else if($(form).attr("id") === "formPropietario"){
    	let dataForm = $(form).serialize()+"&opcion=propietario";
    	
    	$.ajax({
	    	type:'POST',
            url: "../vehiculosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form);
            	$(form).find(".btn-submit").html('Buscar');
                
                if(response.informacion == "error"){
                    $(form).find("#msg-error").removeClass("d-none");
                }
                else{
                	if($("#msg-error").hasClass("d-none")){
                		 $("#msg-error").addClass("d-none");
                	}
                   	$(form).parents('.modal').modal('hide');
                   	
                   	// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL DATATABLE PARA LLENAR LA TABLA
					const data = JSON.parse(response.datos);
                   	
                   	// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
					$("#txtDocumentoPropietario").val(data.Documento);
					$("#txtNombrePropietario").val((data.Nombre).toUpperCase());
                   	
                    $('#vehiculoModal').modal('show');
                }
            	
            	console.log(response.datos);
            	
            	
            },
    	});
    }
}

function habilitarBotones(form){

	// DESAHBILITAMOS EL BOTON SUBMIT DEL FORMULARIO
    $(form).find(".btn-submit").prop( "disabled", false );

    // VALIDAMOS SI EL FORMULARIO ESTA DENTRO DE UN MODAL
    if($(form).parents('.modal-content') != undefined){
        // EN CASO DE QUE EL FORMULARIO SEA DE UN MODAL, DESHABILITAMOS TODOS LOS BOTONES DE CERRAR
        $(form).parents('.modal-content').find(".btn-close").prop( "disabled", false );

        if($(form).parents('.modal-content').find(".nav-tabs") != undefined){
            $(form).parents('.modal-content').find(".nav-item").prop( "disabled", false );
        }
    }
    else{
        // EN CASO CONTRARIO SOLO DESHABILITAMOS LOS BOTONES DE CERRAR QUE ESTÁN DENTRO DEL FORMULARIO FORMULARIO
        $(form).find(".btn-close").prop( "disabled", false );
    }
}