function ajaxForms(form){

	// PAGINA DE INICIO DE SESION
	
    if($(form).attr("id") === "formLogin"){
        let dataForm = $( form ).serialize();
        habilitarBotones(form, true);
        $.ajax({
          type: "POST",
          url: "validaLogin",
          data: dataForm,
          success: function( data ) {
          		habilitarBotones(form, false);
              if(data.informacion === "error"){
              		
	              	$(form).find("#msg-error").removeClass("d-none");
	              	$(form).find("#msg-error").html(data.error); // MOSTRAMOS EL MENSAJE DE ERROR
	            	$(form).find(".btn-submit").html('ENVIAR'); // CAMBIAMOS EL CONTENIDO DEL BOTON SUBMIT
              }
              else{	
              		localStorage.setItem("nombre", data.Nombre);
              		localStorage.setItem("rol", data.Rol);
              		window.location.replace("jsp/home.jsp");
              }
            },
            datatype: "text"
        });
    }
    
    
    // FORMULARIOS DE CLIENTES
    
    else if($(form).attr("id") === "formRegistroMasivo"){
        var fd = new FormData();
        var files = $(form).find("input[type='file'")[0].files;
        fd.append('file',files[0]);
        fd.append('opcion','masiva');
		habilitarBotones(form, true);

        $.ajax({
        	type: 'POST',
            url: "../usuariosServlet",
            data: fd,
            contentType: false,
            processData: false,
            success: function(response){
            	habilitarBotones(form, false);;
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
					let data = JSON.parse(response.datos);
					
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
		habilitarBotones(form, false);
        $.ajax({
            type:'POST',
            url: "../usuariosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form, false);
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
    	habilitarBotones(form, true);
    	$.ajax({
	    	type:'POST',
            url: "../usuariosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form, false);
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
    	habilitarBotones(form, true);
    	
    	$.ajax({
	    	type:'POST',
            url: "../usuariosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form, false);
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
    
    
    // FORMULARIO DE VEHICULOS
    
    else if($(form).attr("id") === "formPropietario"){
    	let dataForm = $(form).serialize()+"&opcion=buscar";
    	if($("#msg-error").hasClass("d-none") === false){
			$("#msg-error").addClass("d-none");
			$("#msg-error").removeClass("d-block");
    	}
    	habilitarBotones(form, true);
    	
    	$.ajax({
	    	type:'POST',
            url: "../vehiculosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form, false);
            	$(form).find(".btn-submit").html('Buscar');
                
                if(response.informacion == "error"){
                	if($("#msg-error").hasClass("d-none")){
                		$("#msg-error").removeClass("d-none");
            		  	$("#msg-error").addClass("d-block");
                	}
                }
                else{
                	$(form).trigger("reset");
                	$(form).removeClass('was-validated');
                   	$(form).parents('.modal').modal('hide');
                   	
                   	// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL DATATABLE PARA LLENAR LA TABLA
					let data = JSON.parse(response.datos);
                   	
                   	// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
                   	$("#txtPlaca").attr("readonly",false);
					$("#txtDocumentoTemp").val(data.Documento);
					$("#opcion").val("crear");
					$("#txtDocumentoPropietario").val(data.Documento);
					$("#txtNombrePropietario").val((data.Nombre).toUpperCase());
					$('#cboTipoModalVehiculo option[value='+data.Tipo+']').attr("selected",true);
					$('#vehiculoModal').find('.btn-submit').html('Crear');
                   	
                    $('#vehiculoModal').modal('show');
                }            	
            },
    	});
    }
    else if($(form).attr("id") === "formVehiculoMasivo"){
    	var fd = new FormData();
        var files = $(form).find("input[type='file'")[0].files;
        fd.append('file',files[0]);
        fd.append('opcion','masiva');
        if($(".file-error").hasClass("d-none") === false){
            $(".file-error").addClass("d-none");
        }
		habilitarBotones(form, true);

        $.ajax({
        	type: 'POST',
            url: "../vehiculosServlet",
            data: fd,
            contentType: false,
            processData: false,
            success: function(response){
            	habilitarBotones(form, false);
            	$(form).find(".btn-submit").html('Crear'); // CAMBIAMOS EL CONTENIDO DEL BOTON SUBMIT
            	
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
					let data = JSON.parse(response.datos);
					
					// AGREGAMOS LOS ENCABEZADOS A LA TABLA
					$('#table-masiva').find("#encabezados").html(`	<th scope="col" class="text-center">Placa</th>
                                									<th scope="col" class="text-center">Fabricante</th>
                                									<th scope="col" class="text-center">Propietario</th>
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
				            {"data":"Placa"},
				            {"data":"Fabricante"},
				            {"data":"Propietario"},
				            {"data":"Observaciones"},
				        ]
	        		} );

		        	$('#modalSuccessMasiva').modal('show');
            	}
	        },
	     });
    }
    else if($(form).attr("id") === "formVehiculoIndividual"){
    	let dataForm = $(form).serialize();
        if($("#error-buscar").hasClass("d-none") === false){
            $("#error-buscar").addClass("d-none");
        }
		habilitarBotones(form, true);

        $.ajax({
        	type: 'POST',
            url: "../vehiculosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ){
            	habilitarBotones(form, false);
            	$(form).find(".btn-submit").html('Crear'); // CAMBIAMOS EL CONTENIDO DEL BOTON SUBMIT
                $(form).trigger("reset");
            	$(form).removeClass('was-validated');
               	$(form).parents('.modal').modal('hide');
            	
            	if(response.informacion == "error"){
                    $("#documentoGroup").addClass("d-none");
                    $("#lblError").html(response.datos);
                    $('#modalError').modal('show');
            	}
            	else{
            		$("#lblSuccess").html(response.datos);
                    $('#modalSuccess').modal('show');
            	}
	        },
	     });
    }
    
    
    // FORMULARIOS DE CLIENTES
    
    else if($(form).attr("id") === "formClienteMasivo"){
    	var fd = new FormData();
        var files = $(form).find("input[type='file'")[0].files;
        fd.append('file',files[0]);
        fd.append('opcion','masiva');
        if($(".file-error").hasClass("d-none") === false){
            $(".file-error").addClass("d-none");
        }
		habilitarBotones(form, true);

        $.ajax({
        	type: 'POST',
            url: "../clientesServlet",
            data: fd,
            contentType: false,
            processData: false,
            success: function(response){
            	habilitarBotones(form, false);
            	$(form).find(".btn-submit").html('Crear'); // CAMBIAMOS EL CONTENIDO DEL BOTON SUBMIT
            	
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
					let data = JSON.parse(response.datos);
					
					// AGREGAMOS LOS ENCABEZADOS A LA TABLA
					$('#table-masiva').find("#encabezados").html(`	<th scope="col" class="text-center">Documento</th>
                                									<th scope="col" class="text-center">Tipo documento</th>
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
				            {"data":"Documento"},
				            {"data":"TipoDocumento"},
				            {"data":"Nombre"},
				            {"data":"Observaciones"},
				        ]
	        		} );

		        	$('#modalSuccessMasiva').modal('show');
            	}
	        },
	     });
    }
    else if($(form).attr("id") === "formClienteIndividual"){
    	let dataForm = $(form).serialize()+"&opcion=crear";
		habilitarBotones(form, true);
		
        $.ajax({
        	type: 'POST',
            url: "../clientesServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ){
            	habilitarBotones(form, false);
            	$(form).find(".btn-submit").html('Crear'); // CAMBIAMOS EL CONTENIDO DEL BOTON SUBMIT
                $(form).trigger("reset");
            	$(form).removeClass('was-validated');
               	$(form).parents('.modal').modal('hide');
            	
            	if(response.informacion == "error"){
                    $("#lblError").html(response.datos);
                    $('#modalError').modal('show');
                }
                else{
                    $("#lblSuccess").html(response.datos);
                    $('#modalSuccess').modal('show');
                }
	        },
	     });
    }
    else if($(form).attr("id") === "formClienteEdicion"){
    	let dataForm = $(form).serialize()+"&opcion=editar";
		habilitarBotones(form, true);
        $.ajax({
        	type: 'POST',
            url: "../clientesServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ){
            	habilitarBotones(form, false);
            	$(form).find(".btn-submit").html('Crear'); // CAMBIAMOS EL CONTENIDO DEL BOTON SUBMIT
                $(form).trigger("reset");
            	$(form).removeClass('was-validated');
               	$(form).parents('.modal').modal('hide');
            	
            	if(response.informacion == "error"){
                    $("#lblError").html(response.datos);
                    $('#modalError').modal('show');
                }
                else{
                    $("#lblSuccess").html(response.datos);
                    $('#modalSuccess').modal('show');
                }
	        },
	     });
    }
    
    
    // PARA LOS FORMULARIOS DE FACTURAS
    else if($(form).attr("id") === "formBuscarClienteFact"){
    	let dataForm = $(form).serialize()+"&opcion=buscar";
    	if($("#msg-error").hasClass("d-none") === false){
			$("#msg-error").addClass("d-none");
			$("#msg-error").removeClass("d-block");
    	}
    	habilitarBotones(form, true);
    	
    	$.ajax({
	    	type:'POST',
            url: "../facturasServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form, false);
            	$(form).find(".btn-submit").html('Buscar');
                
                if(response.informacion == "error"){
                	if($("#msg-error").hasClass("d-none")){
                		$("#msg-error").removeClass("d-none");
            		  	$("#msg-error").addClass("d-block");
                	}
                }
                else{
                	$(form).trigger("reset");
                	$(form).removeClass('was-validated');
                	$(form).parents("#contenedor-1").removeClass("d-block");
                   	$(form).parents("#contenedor-1").addClass("d-none");
                   	
                   	// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL DATATABLE PARA LLENAR LA TABLA
					let data = JSON.parse(response.datos);
                   	
                   	// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
					$("#txtDocumentoTemp").val(data.Documento);
					$("#txtDocumentoPropietario").val(data.Documento);
					$("#txtClienteFactura").val((data.Nombre).toUpperCase());
					$('#cboTipoDocumento option[value='+data.Tipo+']').attr("selected",true);
                   	
                    $("#contenedor-2").removeClass('d-none');
                    $("#contenedor-2").addClass('d-block');
                    
                    //PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL SELECT DE TIPO DE DOCUMENTO
					data = JSON.parse(response.placas);
					data.forEach(element => $("#txtPlacaConcepto").append('<option value='+element.Placa+'>'+element.Placa+'</option>'));
                }            	
            },
    	});
    }
    else if($(form).attr("id") === "formConcepto"){
    	
    	let miArray = localStorage.getItem("conceptos");
    	
    	let objeto = {
    	"Descripcion":$("#txtDescripcion").val(),
    	"ValorSinIva":$("#txtConceptoSinIva").val(),
    	"Descuento":$("#txtDescuentoConcepto").val(),
    	"Placa":$("#txtPlacaConcepto option:selected").val()
    	};
	    if(miArray === null){
	        miArray = [objeto];
	    }
	    else{
	    	miArray = JSON.parse(localStorage.getItem("conceptos"));
	        let size = miArray.length;
	        miArray[size] = objeto;
	    }
	    $(form).parents('.modal').modal('hide');
	    localStorage.setItem("conceptos", JSON.stringify(miArray));
	    
    	$(form).find(".btn-submit").html('Crear');
    	$(form).trigger("reset");
    	$(form).removeClass('was-validated');
    }
    
    else if($(form).attr("id") === "formEliminarConcepto"){
    	let miArray = JSON.parse(localStorage.getItem("conceptos"));
		
		for (var i = 0; i < miArray.length; i++) {
		  if (miArray[i].Descripcion == $("#txtDescripcionHiden").val()) {
		    miArray.splice(i, 1);
		    break;
		  }
		}
		localStorage.removeItem('conceptos');
		localStorage.setItem('conceptos', JSON.stringify(miArray));
    	$(form).find(".btn-submit").html('SI');
    	$(form).trigger("reset");
    	$(form).removeClass('was-validated');
       	$(form).parents('.modal').modal('hide');
    }
    
    else if($(form).attr("id") === "formFacturaCrear"){
    	let conceptos = localStorage.getItem("conceptos");
    	
    	let dataForm = {
    	"numeroFactura":$("#txtNumeroFactura").val(),
    	"fechaEmision":$("#txtEmisionFactura").val(),
    	"tipoFactura":$("#txtTipoFactura").val(),
    	"base":$("#txtBaseFactura").val(),
    	"total":$("#txtTotalFactura").val(),
    	"documentoCliente":$("#txtDocumentoTemp").val(),
    	"tipoDocumento":$("#cboTipoDocumento option:selected").val(),
    	"opcion":"crear",
    	"conceptos": conceptos
    	};
    	
    	localStorage.removeItem('conceptos');
    	habilitarBotones(form, true);
    	
    	$.ajax({
	    	type:'POST',
            url: "../facturasServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ){
            	habilitarBotones(form, false);
            	$(form).find(".btn-submit").html('Crear');
                $(form).trigger("reset");
            	$(form).removeClass('was-validated');
               	$(form).parents('.modal').modal('hide');
            	
            	if(response.informacion == "error"){
                    $("#lblError").html(response.datos);
                    $('#modalError').modal('show');
                }
                else{
                    $("#lblSuccess").html(response.datos);
                    $('#modalSuccess').modal('show');
                }
            }
        })
    }
    
    
    // PARA LOS FORMULARIOS DE RADICADO
    else if($(form).attr("id") === "formBuscarClienteRad"){
    	let dataForm = $(form).serialize()+"&opcion=buscarCliente";
    	if($("#msg-error").hasClass("d-none") === false){
			$("#msg-error").addClass("d-none");
			$("#msg-error").removeClass("d-block");
    	}
    	habilitarBotones(form, true);
    	
    	$.ajax({
	    	type:'POST',
            url: "../radicadosServlet",
            data: dataForm,
            datatype: "text",
            success: function( response ) {
                habilitarBotones(form, false);
            	$(form).find(".btn-submit").html('Buscar');
                
                if(response.informacion == "error"){
                	if($("#msg-error").hasClass("d-none")){
                		$("#msg-error").removeClass("d-none");
            		  	$("#msg-error").addClass("d-block");
                	}
                }
                else{
                	$(form).trigger("reset");
                	$(form).removeClass('was-validated');
                	$(form).parents("#contenedor-1").removeClass("d-block");
                   	$(form).parents("#contenedor-1").addClass("d-none");
                   	
                   	// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL DATATABLE PARA LLENAR LA TABLA
					let data = JSON.parse(response.datos);
                   	
                   	// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
					$("#txtNombreCliente").val(data.Nombre);
					$("#txtDocumentoClienteHidden").val(data.Documento);
					$("#txtTipoDocClienteHidden").val(data.Tipo);
					$("#txtDocumentoCliente").val(data.SiglasDoc);
                   	
                    $("#contenedor-2").removeClass('d-none');
                    $("#contenedor-2").addClass('d-block');
                    
                    //PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL SELECT DE TIPO DE DOCUMENTO
					data = JSON.parse(response.placas);
					data.forEach(element => $("#txtPlacaRadicado").append('<option value='+element.Placa+'>'+element.Placa+'</option>'));
                }            	
            },
    	});
    }
}

function busqueda(form){
	if($(form).attr("id") === "formVehiculoIndividual"){
		let dataForm = "txtDocumentoBuscar="+$("#txtDocumentoPropietario").val()+"&cboTipoBuscar="+$("#cboTipoModalVehiculo option:selected").val()+"&opcion=buscar";
    	$("#error-buscar").removeClass("d-none");
		
		if($("#error-buscar").hasClass("text-danger")){ 
			$("#error-buscar").addClass("text-secondary");
			$("#error-buscar").removeClass("text-danger");
		}
		$("#error-buscar").html(`<div class="w-100 d-flex align-items-center justify-content-center" disabled>
								  	<strong>Cargando...</strong>
								  	<div class="spinner-border ml-1 spinner-border-sm" role="status" aria-hidden="true"></div>
								</div>`);
		habilitarBotones(form, true);
		
		$.ajax({
			type:'POST',
            url: "../vehiculosServlet",
            data: dataForm,
            datatype: "text",
            success: function(response){
            	habilitarBotones(form, false);
            	if(response.informacion == "error"){
            		$("#error-buscar").removeClass("text-secondary");
            		$("#error-buscar").addClass("text-danger");
            		$("#error-buscar").html(response.datos);
            	}
            	else{
            		if($("#error-buscar").hasClass("d-none") === false){
						$("#error-buscar").addClass("d-none");
			    	}
            		// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL CLIENTE BUSCADO
					let data = JSON.parse(response.datos);
                   	
                   	// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
					$("#txtDocumentoPropietario").val(data.Documento);
					$("#txtDocumentoTemp").val(data.Documento);
					$("#txtNombrePropietario").val((data.Nombre).toUpperCase());
					
					// ESCONDEMOS LA OPCION DE BUSCAR POR DOCUMENTO
					$("#documentoGroup").addClass("d-none");
					$('#btnEditarPropietario em').removeClass( "fa-minus" );
            		$('#btnEditarPropietario em').addClass( "fa-edit" );
            		$('form').find('.btn-submit').attr('disabled',false);
            	}
            }
		});
	}
	else if($(form).attr("id") === "formFacturaCrear"){
		let dataForm = "txtDocumentoBuscar="+$("#txtDocumentoPropietario").val()+"&cboTipoBuscar="+$("#cboTipoDocumento option:selected").val()+"&opcion=buscar";
    	$("#error-buscar").removeClass("d-none");
		
		if($("#error-buscar").hasClass("text-danger")){ 
			$("#error-buscar").addClass("text-secondary");
			$("#error-buscar").removeClass("text-danger");
		}
		$("#error-buscar").html(`<div class="w-100 d-flex align-items-center justify-content-center" disabled>
								  	<strong>Cargando...</strong>
								  	<div class="spinner-border ml-1 spinner-border-sm" role="status" aria-hidden="true"></div>
								</div>`);
		habilitarBotones(form, true);
		
		$.ajax({
			type:'POST',
            url: "../facturasServlet",
            data: dataForm,
            datatype: "text",
            success: function(response){
            	habilitarBotones(form, false);
            	if(response.informacion == "error"){
            		$("#error-buscar").removeClass("text-secondary");
            		$("#error-buscar").addClass("text-danger");
            		$("#error-buscar").html(response.datos);
            	}
            	else{
            		if($("#error-buscar").hasClass("d-none") === false){
						$("#error-buscar").addClass("d-none");
			    	}
			    	
            		// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL CLIENTE BUSCADO
					let data = JSON.parse(response.datos);
                   	
                   	// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
					$("#txtDocumentoPropietario").val(data.Documento);
					$("#txtDocumentoTemp").val(data.Documento);
					$("#txtClienteFactura").val((data.Nombre).toUpperCase());
					
					// ESCONDEMOS LA OPCION DE BUSCAR POR DOCUMENTO
					$("#documentoGroup").addClass("d-none");
					$('#btnEditarPropietario em').removeClass( "fa-minus" );
            		$('#btnEditarPropietario em').addClass( "fa-edit" );
            		$('form').find('.btn-submit').attr('disabled',false);
            		
            		//PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL SELECT DE TIPO DE DOCUMENTO
					data = JSON.parse(response.placas);
					data.forEach(element => $("#txtPlacaConcepto").append('<option value='+element.Placa+'>'+element.Placa+'</option>'));
            	}
            }
		});
	}
}

// FUNCION PARA HABILITAR BOTONES
function habilitarBotones(form, opcion){

    // VALIDAMOS SI EL FORMULARIO ESTA DENTRO DE UN MODAL
    if($(form).parents('.modal').attr("id") != undefined){
    
        // EN CASO DE QUE EL FORMULARIO SEA DE UN MODAL, DESHABILITAMOS TODOS LOS CONTROLES DEL MODAL
        $(form).parents('.modal').find("*").attr( "disabled", opcion );
    }
    else{
        // EN CASO CONTRARIO SOLO DESHABILITAMOS LOS BOTONES DE CERRAR QUE ESTÁN DENTRO DEL FORMULARIO FORMULARIO
        $(form).find("*").attr( "disabled", opcion );
    }
}