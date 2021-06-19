$(document).ready(function(){
	let data,dataTable;
	let dataForm = "opcion=actualizar";
	
	if($("table").attr("id") === "tablaUsuarios"){
		
		// PETICION AJAX PARA ACTUALIZAR LA TABLA DE USUARIOS
		$.ajax({
			type: "POST",
	        url: "../usuariosServlet",
			data:dataForm,
			success: function( response ){
			
				// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL SELECT DE CARGO
				data = JSON.parse(response.select);
				data.forEach(element => $(".cbo").append('<option value='+element.Nombre.toUpperCase()+'>'+element.Nombre+'</option>'));

				// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL DATATABLE PARA LLENAR LA TABLA
				data = JSON.parse(response.dataTable);
				
				dataTable = $("#tablaUsuarios").DataTable( {
			        language: {
			            url: "../js/External/dataTables/espanol.json"
			        },
					responsive: true,
					// CARGAMOS LOS DATOS POR MEDIO DE LA RESPUESTA DE AJAX
					"data": data,
					"columns":[
			            {"data":"Documento"},
			            {"data":"Nombre"},
						{"data":"Estado"},
			            {"data":"Usuario"},
						{"data":"Login"},
			            {"defaultContent":	`<button type="button" class="editar btn btn-danger m-1" data-toggle="modal" data-target="#EditarUsuarioModal"><em class="fas fa-pen"></em></button>
											<button type="button" class="restablecer btn btn-secondary" data-toggle="modal" data-target="#modalResetUsuario"><em class="fas fa-sync"></em></button>`},
			        ]        
				} );
			},
		});
		
		// EVENTO CLICK DEL BOTON EDITAR DE LA TABLA DE USUARIOS
		$("#tablaUsuarios tbody").on("click",".editar",function(){
			
			// OBTENEMOS LA INFORMACIÓN DE LA FILA
			let dataRow = dataTable.row($(this).parents()).data();
			
			// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
			$("#txtDocumentoEdicion").val(dataRow.Documento);
			$('#txtCargoEdicion option[value='+ dataRow.Cargo +']').attr("selected",true);
			$("#txtNombresEdicion").val(dataRow.Nombres);
			$("#txtApellidosEdicion").val(dataRow.Apellidos);
			$("#txtUsuarioEdicion").val(dataRow.Usuario);
			$('#txtEstadoEdicion option[value='+ dataRow.Estado +']').attr("selected",true);
			$("#txtTelefonoEdicion").val(dataRow.Telefono);
			$("#txtCorreoEdicion").val((dataRow.Correo).toLowerCase());
			
		});
		
		// EVENTO CLICK DEL BOTON RESTABLECER DE LA TABLA DE USUARIOS
		$("#tablaUsuarios tbody").on("click",".restablecer",function(){
			
			// OBTENEMOS LA INFORMACIÓN DE LA FILA
			let dataRow = dataTable.row($(this).parents()).data();
			
			// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
			$("#txtDocumentoHidenDelet").val(dataRow.Documento);
			
			$("#lblUsuarioReset").html(dataRow.Nombre);
			
		});
	}
	else if($("table").attr("id") === "tablaVehiculos"){
		
		// PETICION AJAX PARA ACTUALIZAR LA TABLA DE VEHICULOS
		$.ajax({
			type: "POST",
	        url: "../vehiculosServlet",
			data:dataForm,
			success: function( response ){
			
				//PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL SELECT DE TIPO DE DOCUMENTO
				data = JSON.parse(response.select);
				data.forEach(element => $(".cbo").append('<option value='+element.Id+'>'+element.Siglas+'</option>'));

				
				// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL DATATABLE PARA LLENAR LA TABLA
				data = JSON.parse(response.dataTable);
				
				dataTable = $("#tablaVehiculos").DataTable( {
			        language: {
			            url: "../js/External/dataTables/espanol.json"
			        },
					responsive: true,
					// CARGAMOS LOS DATOS POR MEDIO DE LA RESPUESTA DE AJAX
					"data": data,
					"columns":[
			            {"data":"Placa"},
			            {"data":"Fabricante"},
						{"data":"Marca"},
			            {"data":"NombreC"},
			            {"defaultContent":	`<button type="button" class="editar btn btn-danger" data-toggle="modal" data-target="#vehiculoModal"><em class="fas fa-pen"></em></button>`},
			        ]        
				} );
			},
		});
		
		// EVENTO CLICK DEL BOTON EDITAR DE LA TABLA DE VEHICULOS
		$("#tablaVehiculos tbody").on("click",".editar",function(){
			
			$("#vehiculoModal").find(".btn-submit").html("Guardar");
			$("#txtPlaca").attr("readonly",true);
			
			// OBTENEMOS LA INFORMACIÓN DE LA FILA
			let dataRow = dataTable.row($(this).parents()).data();
			
			// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
			$("#txtPlaca").val(dataRow.Placa);
			$("#txtChasis").val(dataRow.Chasis);
			$("#txtMotor").val(dataRow.Motor);
			$("#txtFabricante").val(dataRow.Fabricante);
			$("#txtLinea").val(dataRow.Linea);
			$("#txtModelo").val(dataRow.Modelo);
			$("#txtNombrePropietario").val((dataRow.NombreC).toUpperCase());
			$("#txtDocumentoTemp").val(dataRow.DocumentoC);
			$("#txtDocumentoPropietario").val(dataRow.DocumentoC);
			$("#opcion").val("editar");
			$('#cboTipoModalVehiculo option[value='+dataRow.Tipo+']').attr("selected",true);
			
		});
		
		$(".btn-close").click(function(){
			$("#documentoGroup").addClass("d-none");
		 	$('#txtDocumentoPropietario').val($("#txtDocumentoTemp").val());
		 	$('#btnEditarPropietario em').removeClass( "fa-minus" );
            $('#btnEditarPropietario em').addClass( "fa-edit" );
		});
	}
	else if($("table").attr("id") === "tablaClientes"){
	
		// PETICION AJAX PARA ACTUALIZAR LA TABLA DE CLIENTES
		$.ajax({
			type: "POST",
	        url: "../clientesServlet",
			data:dataForm,
			success: function( response ){
			
				//PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL SELECT DE TIPO DE DOCUMENTO
				data = JSON.parse(response.select);
				data.forEach(element => $(".cbo").append('<option value='+element.Id+'>'+element.Siglas+'</option>'));

				
				// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL DATATABLE PARA LLENAR LA TABLA
				data = JSON.parse(response.dataTable);
				
				dataTable = $("#tablaClientes").DataTable( {
			        language: {
			            url: "../js/External/dataTables/espanol.json"
			        },
					responsive: true,
					// CARGAMOS LOS DATOS POR MEDIO DE LA RESPUESTA DE AJAX
					"data": data,
					"columns":[
			            {"data":"Documento"},
			            {"data":"TipoDocumento"},
						{"data":"NombreCompleto"},
			            {"data":"Correo"},
			            {"defaultContent":	`<button type="button" class="editar btn btn-danger" data-toggle="modal" data-target="#EditarUsuarioModal"><em class="fas fa-pen"></em></button>`},
			        ]        
				} );
			},
		});
		
		// EVENTO CLICK DEL BOTON EDITAR DE LA TABLA DE VEHICULOS
		$("#tablaClientes tbody").on("click",".editar",function(){
			
			// OBTENEMOS LA INFORMACIÓN DE LA FILA
			let dataRow = dataTable.row($(this).parents()).data();
			
			// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
			$("#txtDocumentoEdicion").val(dataRow.Documento);
			$('#txtTipoEdicion option[value='+dataRow.Id+']').attr("selected",true);
			$("#txtNombresEdicion").val(dataRow.Nombres);
			$("#txtApellidosEdicion").val(dataRow.Apellidos);
			$("#txtTelefonoEdicion").val(dataRow.Telefono);
			$("#txtCorreoEdicion").val(dataRow.Correo);
			$("#txtDireccionEdicion").val(dataRow.Direccion);
			$("#txtTipoHidden").val(dataRow.Id);
			
		});
	}
	else if($("table").attr("id") === "tablaFacturas"){
		// PETICION AJAX PARA ACTUALIZAR LA TABLA DE FACTURAS
		$.ajax({
			type: "POST",
	        url: "../facturasServlet",
			data:dataForm,
			success: function( response ){

				
				// PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL DATATABLE PARA LLENAR LA TABLA
				data = JSON.parse(response.dataTable);
				
				dataTable = $("#tablaFacturas").DataTable( {
			        language: {
			            url: "../js/External/dataTables/espanol.json"
			        },
					responsive: true,
					// CARGAMOS LOS DATOS POR MEDIO DE LA RESPUESTA DE AJAX
					"data": data,
					"columns":[
			            {"data":"Numero"},
			            {"data":"Emision"},
						{"data":"Tipo"},
			            {"data":"Cliente"},
			            {"defaultContent":	`<button type="button" class="consultar btn btn-danger" data-toggle="modal" data-target="#consultaFacturaModal"><em class="fas fa-search"></em></button>`},
			        ]        
				} );
			},
		});
		
		// EVENTO CLICK DEL BOTON CONSULTAR DE LA TABLA DE FACTURAS
		$("#tablaFacturas tbody").on("click",".consultar",function(){
			
			// OBTENEMOS LA INFORMACIÓN DE LA FILA
			let dataRow = dataTable.row($(this).parents()).data();
			console.log(dataRow);
			
			// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
			$("#txtNumeroFactura").val(dataRow.Numero);
			$("#txtEmisionFactura").val(dataRow.Emision);
			$("#txtTipoFactura").val(dataRow.Tipo);
			$("#txtClienteFactura").val(dataRow.Cliente);
			$("#txtBaseFactura").val(dataRow.TotalSinIva);
			$("#txtTotalFactura").val(dataRow.TotalConIva);
			console.log("\n CONCEPTOS");
			console.log(dataRow.Conceptos);
			
			let conceptos = JSON.parse(dataRow.Conceptos);
			
			$("#table-conceptos-consulta").DataTable( {
			        language: {
			            url: "../js/External/dataTables/espanol.json"
			        },
					responsive: true,
					destroy: true,
					"bPaginate": false,
		            "info": false,
		            "searching": false,

					"data": conceptos,
					"columns":[
			            {"data":"Descripcion"},
			            {"data":"ValSinIva"},
						{"data":"Descuento"},
			            {"data":"Placa"},
			        ]        
			});
			
		});
	}
	else if($("table").attr("id") === "table-conceptos-crear"){
		// PETICION AJAX PARA ACTUALIZAR LOS SELECT DE TIPO DE DOCUMENTO
		$.ajax({
			type: "POST",
	        url: "../facturasServlet",
			data:dataForm,
			success: function( response ){
			
				//PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL SELECT DE TIPO DE DOCUMENTO
				data = JSON.parse(response.select);
				data.forEach(element => $(".cbo").append('<option value='+element.Id+'>'+element.Siglas+'</option>'));
			},
		});
		
		// DESPUES DE CERRAR EL MODAL DEL CONCEPTO
		$('#ConceptoModal').on('hidden.bs.modal', function(){
			cargarTabla();
		});
		
		$('#EliminarConceptoModal').on('hidden.bs.modal', function(){
			cargarTabla();
		});
		
		// EVENTO CLICK DEL BOTON ELIMINAR DE LA TABLA DE CONCEPTOS
		$("#table-conceptos-crear tbody").on("click",".eliminar",function(){
			
			// OBTENEMOS LA INFORMACIÓN DE LA FILA
			let dataRow = dataTable.row($(this).parents()).data();
			
			// CARGAMOS LA INFORMACIÓN AL FORMULARIO DE EDICIÓN
			$("#txtDescripcionHiden").val(dataRow.Descripcion);
			$("#lblconceptoDelete").html(dataRow.Descripcion);
			
			
		});
		
		function cargarTabla() {
		  	let data = localStorage.getItem("conceptos");
		  	
		  	if(data != null){
		  		data = JSON.parse(localStorage.getItem("conceptos"));
		  		$("#txtConceptosHidden").val(data.length);
		  		$("#txtConceptosFactura").val(data.length);
		  		
		  		let result = 0;
				
				for (var i = 0; i < data.length; i++) {
					result += parseInt(data[i].ValorSinIva);
				  	result -= parseInt(data[i].Descuento);
				}
				$("#txtBaseFactura").val(result);
				$("#txtBaseFacturaHidden").val(result);
		  		
		  		dataTable = $("#table-conceptos-crear").DataTable( {
			        language: {
			            url: "../js/External/dataTables/espanol.json"
			        },
					responsive: true,
					destroy: true,
					"bPaginate": false,
		            "info": false,
		            "searching": false,

					"data": data,
					"columns":[
			            {"data":"Descripcion"},
			            {"data":"ValorSinIva"},
						{"data":"Descuento"},
			            {"data":"Placa"},
			            {"defaultContent":	`<button type="button" class="eliminar btn btn-danger rounded-circle" data-toggle="modal" data-target="#EliminarConceptoModal"><em class="fas fa-minus"></em></button>`},
			        ]   
				} );
		  	}
		}
	}
	else if($("table").attr("id") === "table-radicados-cliente"){
		
		// PETICION AJAX PARA ACTUALIZAR LOS SELECT
		let tiposR;
		$.ajax({
			type: "POST",
	        url: "../radicadosServlet",
			data:dataForm,
			success: function( response ){
			
				//PARSEAMOS EL JSON QUE CONTIENE LOS DATOS DEL SELECT DE TIPO DE DOCUMENTO
				data = JSON.parse(response.tiposDoc);
				data.forEach(element => $(".cboDoc").append('<option value='+element.Id+'>'+element.Siglas+'</option>'));
				
				tiposR = JSON.parse(response.tiposRadicado);
				tiposR[0].forEach(element => $("#txtTipoRadicado").append('<option value='+element.IdTipoR+'>'+element.TipoR+'</option>'));
				tiposR[1][0].forEach(element => $("#txtClasificacionRadicado").append('<option value='+element.IdClasificacion+'>'+element.Clasificacion+'</option>'));
			},
		});
		
		$("#txtTipoRadicado").change(function(){
			let id = parseInt($("#txtTipoRadicado  option:selected").val())-1;
			$("#txtClasificacionRadicado").empty();
			$("#txtClasificacionRadicado").append('<option value="" selected>Seleccione...</option>');
			tiposR[1][id].forEach(element => $("#txtClasificacionRadicado").append('<option value='+element.IdClasificacion+'>'+element.Clasificacion+'</option>'));
		});
	}
});