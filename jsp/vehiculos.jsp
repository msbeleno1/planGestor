<%@ include file="../templates/header.jsp" %>
<%@ include file="../templates/links/linksToDataTable.jsp" %>
<%@ include file="../templates/menu.jsp" %>

<!--CONTENEDOR PRINCIPAL-->
        <section class="container-fluid mr-auto ml-auto mt-auto mb-2 pt-2">

            <!-- MIGAJAS DE PAN -->
            <nav class="p-0 m-0" aria-label="breadcrumb">
                <ol class="breadcrumb bg-white p-0 mt-0 justify-content-end">
                    <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="home.jsp">/ Inicio</a></li>
                    <li class="breadcrumb-item active" aria-current="page"> Vehículos</li>
                </ol>
            </nav>
            <!-- FIN DE LAS MIGAJAS DE PAN -->

            <!-- TITULO -->
            <h2 class="mb-4">Gestión de vehículos</h2>
            <!-- FIN DEL TITULO -->

            <div class="row">
            	<div class="col-lg-12">
            		<!--TABLA DE USUARIOS-->
	                <table id="tablaVehiculos" class="table table-hover table-bordered display nowrap" aria-describedby="Tabla de vehiculos" style="width: 100%">
	
	                    <!-- ENCABEZADOS DE LA TABLA -->
	                    <thead class="thead-dark">
	                      <tr>
	                        <th scope="col" class="text-center text-nowrap align-middle">Placa</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Fabricante</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Marca</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Propietario</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Acciones</th>
	                      </tr>
	                    </thead>
	                    <!-- FIN DE LOS ENCABEZADOS DE LA TABLA -->
	
	                    <!-- CONTENIDO DE LA TABLA -->
	                    <tbody>
	                    </tbody>
	                    <!-- FIN DEL CONTENIDO DE LA TABLA -->
	
	                </table>
	            </div>
	            <!--FIN DE TABLA DE USUARIOS-->
            	</div>
                
            <hr/>

            <!--GRUPO DE BOTONES)-->
            <div class="d-flex justify-content-center mt-2">
                <button type="button" class="btn btn-red mr-2 my-1 text-light" data-toggle="modal" data-target="#registroVehiculoModal"><em class="fas fa-plus text-light"></em>  Crear vehículo</button>
                <button type="button" class="btn btn-red ml-2 my-1 text-light"><em class="fas fa-download text-light"></em>  Descargar información</button>
            </div>
            <!--FIN DE GRUPO DE BOTONES-->
			
			<!--MODAL DE REGISTRO DE VEHICULOS-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static" id="registroVehiculoModal">
			    <div class="modal-dialog">
			        <div class="modal-content">
			               
			            <!-- Modal Header -->
			            <div class="modal-header d-flex justify-content-between">
			                                                    
			                <!-- TABS DE NAVEGACION (PESTAÑAS) -->
			                <div class="nav nav-tabs" id="nav-tab" role="tablist">
			                    <a class="nav-item nav-link text-danger active" id="nav-individual-tab" data-toggle="tab" href="#nav-individual" role="tab" aria-controls="nav-individual" aria-selected="true">Individual</a>
			                    <a class="nav-item nav-link text-danger" id="nav-masivo-tab" data-toggle="tab" href="#nav-masivo" role="tab" aria-controls="nav-masivo" aria-selected="false">Masivo</a>
			                </div>
			                <!-- FIN DE LOS TABS DE NAVEGACION -->
			
			                <h5 class="modal-title mr-auto ml-auto" id="TitleModalVehiculo">Creación de vehículo</h5>
			
			                <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <!-- Fin del Modal Header -->                        
			                
			            <!-- CONTENIDO DE LAS PESTAÑAS -->
			            <div class="tab-content" id="nav-tabContent">
			                <div class="tab-pane fade show active" id="nav-individual" role="tabpanel" aria-labelledby="nav-individual-tab">
			                        
			                    <!-- FORMULARIO Y CUERPO DE LA PRIMERA PESTAÑA -->
			                    <form action="" method="POST" id="formPropietario" name="formPropietario" class="needs-validation" novalidate>
					                <div class="modal-body">
					                    <div class="row">
					                        <div class="form-group col-md-6">
					                            <label for="txtDocumentoBuscar">Documento de identidad</label>
					                            <input type="text" class="form-control" id="txtDocumentoBuscar" name="txtDocumentoBuscar" minlength="8" maxlength="20" pattern="^[0-9]{8,20}$" autocomplete="off" autocapitalize="characters" required>
					                            <div class="invalid-feedback text-justify">El campo debe tener mínimo 8 caracteres y solo puede contener números.</div>
					                        </div>
					                        <div class="form-group col-md-6">
			                                    <label for="txtCargoRegistro">Tipo de documento</label>
			                                    <select class="custom-select cbo" name="cboTipoBuscar" id="cboTipoBuscar" required>
			                                       	<option value="" selected>Seleccione...</option>
			                                    </select>
			                                    <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
			                                </div>                                    
					                    </div>
					                    <div class="row">
					                    	<p class="w-100 text-danger text-center d-none" id="msg-error">No existe un cliente en el sistema con ese número y tipo de identificación</p>
					                    </div>
					                </div>
					                <!-- FINAL FORMULARIO Y CUERPO DEL MODAL -->
					                
					                <!-- FOOTER DEL MODAL -->
					                <div class="modal-footer">
					                    <button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">Cerrar</button>
					                    <button type="submit" class="btn btn-red text-light btn-submit">Buscar</button>
					                </div>
					                <!-- FIN DEL FOOTER DEL MODAL -->
					            </form>
			                    <!-- FIN FORMULARIO PARA LA PRIMERA PESTAÑA -->
			                </div>
			                    
			                    
			                <!-- CUERPO DEL MODAL PARA LA SEGUNDA PESTAÑA -->
			                <div class="tab-pane fade" id="nav-masivo" role="tabpanel" aria-labelledby="nav-masivo-tab">
			                    <form action="" method="POST" id="formVehiculoMasivo" name="formVehiculoMasivo" enctype="multipart/form-data" class="needs-validation" novalidate>
			                        <div class="modal-body">
			                            <div class="custom-file">
			                                <label for="txtArchivoRegistro" class="custom-file-label">Seleccione un archivo</label>
			                                <input name="txtArchivoRegistro" id="txtArchivoRegistro" type="file" class="custom-file-input" accept="text/csv" required>
			                                <div class="invalid-feedback text-justify">No hay ha seleccionado algún archivo.</div>
			                                <div class="file-error text-justify text-danger d-none">El archivo ingresado no es valido.</div>
			                            </div>
			                        </div>
			
			                        <!-- FOOTER DEL MODAL -->
			                        <div class="modal-footer">
			                            <button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">Cerrar</button>
			                            <button type="submit" class="btn btn-red text-light btn-submit">Crear</button>
			                        </div>
			                        <!-- FIN DEL FOOTER DEL MODAL -->
			
			                    </form>
			                </div>
			                <!-- FIN DEL CUERPO DEL MODAL PARA LA SEGUNDA PESTAÑA -->
			
			            </div>
			            <!-- FIN DEL CONTENIDO DE LAS PESTAÑAS -->
			        </div>
			    </div>
			</div>
			<!--FIN MODAL DE REGISTRO DE VEHICULOS-->
			
			<!-- MODAL PARA CREAR UN VEHICULO -->
			<div class="modal fade" data-keyboard="false" data-backdrop="static" id="vehiculoModal">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content">
			
			            <!-- ENCABEZADO DEL MODAL -->
			            <div class="modal-header">
			                <h4 class="modal-title">Información de vehículo</h4>
			                <button type="button" class="close btn-close" data-dismiss="modal">&times;</button>
			            </div>
			            <!-- FIN DEL ENCABEZADO DEL MODAL -->
			
			            <!-- FORMULARIO Y CUERPO DEL MODAL -->
			            <form action="" method="POST" id="formVehiculoIndividual" name="formVehiculoIndividual" class="needs-validation" novalidate>
	                        <div class="modal-body">
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label for="txtPlaca">Placa de vehiculo</label>
	                                    <input type="text" class="form-control" id="txtPlaca" name="txtPlaca" minlength="6" maxlength="15" pattern="^[0-9A-Za-z]{6,15}$" autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 4 caracteres. Solo admite números y letras.</div>
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label for="txtChasis">Número de Chasis</label>
	                                    <input type="text" class="form-control" id="txtChasis" name="txtChasis" minlength="6" maxlength="30" pattern="^[0-9A-Za-z]{6,30}$" autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 15 caracteres. Solo admite números y letras.</div>
	                                </div>                                   
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label for="txtMotor">Número de Motor</label>
	                                    <input type="text" class="form-control" id="txtMotor" name="txtMotor" minlength="6" maxlength="30" pattern="^[0-9A-Za-z]{6,30}$" autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 15 caracteres. Solo admite números y letras.</div>
	                                </div>  
	                                <div class="form-group col-md-6">
	                                    <label for="txtFabricante">Fabricante</label>
	                                    <input type="text" class="form-control" id="txtFabricante" name="txtFabricante" minlength="3" maxlength="30" pattern="^[A-Za-z]{3,30}$" autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 3 caracteres y solo admite letras.</div>
	                                </div> 
	                            </div>
	
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label for="txtLinea">Linea</label>
	                                    <input type="text" class="form-control" id="txtLinea" name="txtLinea" minlength="3" maxlength="30" pattern="^[A-Za-z0-9 ]{3,30}$" autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 3 caracteres y solo admite letras.</div>
	                                </div>  
	                                <div class="form-group col-md-6">
	                                    <label for="txtModelo">Modelo</label>
	                                    <input type="text" class="form-control" id="txtModelo" name="txtModelo" minlength="4" maxlength="4" pattern="^(199|200|201|202)\d{1}$" autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 4 caracteres y solo admite números.</div>
	                                </div> 
	                            </div>
	
	                            <div class="row">
	                                <div class="form-group col-md-12">
	                                    <label for="txtNombrePropietario">Nombre del Propietario</label>
	                                    <div class="input-group">
	                                    	<input type="text" class="form-control" id="txtNombrePropietario" name="txtNombrePropietario" disabled>
		                                    <div class="input-group-prepend bg-white border-left-0">
	                                            <div class="input-group-text bg-white border-left-0">
	                                                <a id="btnEditarPropietario" href="#" class="text-dark bg-white border-left-0"><em class="fas fa-edit"></em></a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div id="documentoGroup" class="row d-none">
	                               	<div class="form-group col-md-6">
	                                    <label for="txtNombrePropietario">Documento del Propietario</label>
	                                    <div class="input-group">
	                                    	<input type="hidden" class="form-control" id="txtDocumentoTemp" name="txtDocumentoTemp" readonly>
	                                    	<input type="hidden" class="form-control" id="opcion" name="opcion" readonly>
	                                    	<input type="text" class="form-control" id="txtDocumentoPropietario" name="txtDocumentoPropietario" minlength="8" maxlength="20" pattern="^[0-9]{8,20}$" autocomplete="off" autocapitalize="characters" required>
		                                    <div class="input-group-prepend bg-white border-left-0">
	                                            <div class="input-group-text bg-white border-left-0">
	                                                <a id="btnBuscarPropietario" href="#" class="text-dark bg-white border-left-0"><em class="fas fa-search"></em></a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label for="cboTipoModalVehiculo">Tipo de documento</label>
	                                    <select class="custom-select cbo" name="cboTipoModalVehiculo" id="cboTipoModalVehiculo" required>
	                                    </select>
									</div>
                              </div>
                              <div class="row">
                              	<p id="error-buscar" class="w-100 text-center text-danger d-none">No existe un cliente en el sistema con ese número y tipo de identificación</p>
                              </div>
	                        </div>
	
	                        <!-- FOOTER DEL MODAL -->
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">Cerrar</button>
			                    <button type="submit" class="btn btn-red text-light btn-submit">Crear</button>
	                        </div>
	                        <!-- FIN DEL FOOTER DEL MODAL -->
			
	                    </form>
			        </div>
			    </div>
			</div>
			<!-- FIN MODAL PARA CREAR UN VEHICULO -->
			
			
        </section>

<%@ include file="../templates/modales.jsp" %>
<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/scripts/scriptsToForm.jsp" %>
<%@ include file="../templates/scripts/scriptsToDataTable.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>