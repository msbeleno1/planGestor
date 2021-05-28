$(document).ready(function(){
	let data,dataTable;
	let dataForm = "opcion=actualizar";
	
	
	if($("table").attr("id") === "tablaUsuarios"){
		
		// EPTICION AJAX PARA ACTUALIZAR LA TABLA DE USUARIOS
		$.ajax({
			type: "POST",
	        url: "../usuariosServlet",
			data:dataForm,
			success: function( response ){
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
						{"data":"login"},
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
			$('#txtCargoEdicion option[value=""]').attr("selected",true); // RESETEAMOS EL SELECT
			$("#txtDocumentoEdicion").val(dataRow.Documento);
			$("#txtCargoEdicion option[value="+ dataRow.Cargo +"]").attr("selected",true);
			$("#txtNombresEdicion").val(dataRow.Nombres);
			$("#txtApellidosEdicion").val(dataRow.Apellidos);
			$("#txtUsuarioEdicion").val(dataRow.Usuario);
			$("#txtEstadoEdicion option[value="+ dataRow.Estado +"]").attr("selected",true);
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
});