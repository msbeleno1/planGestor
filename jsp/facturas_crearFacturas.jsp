<%@ include file="../templates/header.jsp" %>
<%@ include file="../templates/links/linksToDataTable.jsp" %>
<%@ include file="../templates/menu.jsp" %>

<!--CONTENEDOR PRINCIPAL-->
        <section class="container-fluid mr-auto ml-auto mt-auto mb-2 pt-2">

            <!-- MIGAJAS DE PAN -->
            <nav class="p-0 m-0" aria-label="breadcrumb">
                <ol class="breadcrumb bg-white p-0 mt-0 justify-content-end">
                    <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="home.jsp">/ Inicio</a></li>
                    <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="facturas.jsp"> Facturas</a></li>
                    <li class="breadcrumb-item active" aria-current="page"> Crear facturas</li>
                </ol>
            </nav>
            <!-- FIN DE LAS MIGAJAS DE PAN -->

            <!-- TITULO -->
            <h2 class="mb-4">Crear facturas</h2>
            <!-- FIN DEL TITULO -->
            
            <div id="contenedor-1" class="d-block mt-3">
                <!-- FORMULARIO Y CUERPO DE LA PRIMERA PESTAÑA -->
                <form action="" method="POST" id="formBuscarClienteFact" name="formBuscarClienteFact" class="needs-validation" novalidate>
               		<div class="row">
	                      <div class="form-group col-md-6">
	                          <label for="txtDocumentoBuscar">Documento de cliente</label>
	                          <input type="text" class="form-control" id="txtDocumentoBuscar" name="txtDocumentoBuscar" minlength="8" maxlength="20" pattern="^[0-9]{8,20}$" autocomplete="off" autocapitalize="characters" required>
	                          <div class="invalid-feedback text-justify">El campo debe tener mínimo 8 caracteres y solo puede contener números.</div>
	                      </div>
                      	<div class="form-group col-md-6">
                            <label for="cboTipoBuscar">Tipo de documento</label>
                            <select class="custom-select cbo" name="cboTipoBuscar" id="cboTipoBuscar" required>
                               	<option value="" selected>Seleccione...</option>
                            </select>
                            <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
                        </div>                                    
                  </div>
                  <div class="row">
                  	<p class="w-100 text-danger text-center d-none" id="msg-error">No existe un cliente en el sistema con ese número y tipo de identificación</p>
                  </div>
               
	               <!-- FOOTER DEL FORMULARIO -->
	               <div class="d-flex justify-content-end">
	                   <button type="submit" class="btn btn-red text-light btn-submit m-1">Buscar</button>
	               </div>
	               <!-- FIN DEL FOOTER DEL FORMULARIO -->
	           </form>
                  </div>
            	<div id="contenedor-2" class="d-none my-3">
            		<form id="formFacturaCrear" name="formFacturaCrear" action="" method="POST" class="needs-validation" novalidate>
                      	<div class="row">
	                       	<div class="form-group col-md-6">
		                           <label for="txtNumeroFactura">Número de factura</label>
		                           <input type="text" class="form-control" id="txtNumeroFactura" name="txtNumeroFactura" minlength="5" maxlength="20" pattern="^[0-9]{5,20}$" autocomplete="off" autocapitalize="characters" required>
		                       	<div class="invalid-feedback text-justify">El campo debe tener mínimo 5 caracteres y solo puede contener números.</div>
	                       </div>
	                       <div class="form-group col-md-6">
	                           <label for="txtEmisionFactura">Fecha de emisión</label>
	                           <input type="date" class="form-control" id="txtEmisionFactura" name="txtEmisionFactura" min="2000-01-01" max="" autocomplete="off" autocapitalize="characters" required>
	                           <div class="invalid-feedback text-justify">El campo debe tener una fecha en formato valido.</div>
	                       </div>                                    
                    	</div>
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label for="txtTipoFactura">Tipo de factura</label>
                              <select class="custom-select" name="txtTipoFactura" id="txtTipoFactura" required>
                                 	<option value="" selected>Seleccione...</option>
                                 	<option value="Venta">Venta</option>
                                 	<option value="Servicio">Servicio</option>
                              </select>
                              <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
                          </div>
                      </div>

                      <div class="row"> 
                          <div class="form-group col-md-6">
                              <label for="txtBaseFactura">Total sin IVA</label>
                              <input type="text" class="form-control" id="txtBaseFactura" name="txtBaseFactura" minlength="5" maxlength="20" pattern="^[0-9]{5,20}$" value="0" autocomplete="off" readonly required>
                          </div>
                          <div class="form-group col-md-6">
                              <label for="txtTotalFactura">Total con IVA</label>
                              <input type="text" class="form-control" id="txtTotalFactura" name="txtTotalFactura" minlength="5" maxlength="20" pattern="^[0-9]{5,20}$" autocomplete="off" autocapitalize="characters" required>
                          	<div class="invalid-feedback text-justify">El campo debe tener mínimo 5 caracteres y solo puede contener números.</div>
                          </div>
                      </div>
                      <div class="row">
                           <div class="form-group col-md-12">
                               <label for="txtClienteFactura">Nombre del cliente</label>
                               <div class="input-group">
                               	<input type="text" class="form-control" id="txtClienteFactura" name="txtClienteFactura" disabled>
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
                            <label for="txtNombrePropietario">Documento del cliente</label>
                            <div class="input-group">
                     	 	<input type="hidden" class="form-control" id="txtDocumentoTemp" name="txtDocumentoTemp" readonly>
                         	<input type="text" class="form-control" id="txtDocumentoPropietario" name="txtDocumentoPropietario" minlength="8" maxlength="20" pattern="^[0-9]{8,20}$" autocomplete="off" autocapitalize="characters" required>
                            <div class="input-group-prepend bg-white border-left-0">
	                            <div class="input-group-text bg-white border-left-0">
	                                <a id="btnBuscarPropietario" href="#" class="text-dark bg-white border-left-0"><em class="fas fa-search"></em></a>
	                            </div>
                            </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="cboTipoDocumento">Tipo de documento</label>
                            <select class="custom-select cbo" name="cboTipoDocumento" id="cboTipoDocumento" required>
                            </select>
                        </div>
                       </div>
                       <div class="row">
                       		<p id="error-buscar" class="w-100 text-center text-danger d-none">No existe un cliente en el sistema con ese número y tipo de identificación</p>
                       </div>
                       <div class="row">
                       		<div class="form-group col-md-12">
                                  <label for="txtConceptosFactura">Cantidad de conceptos</label>
                                  <div class="input-group">
                                  	<input type="hidden" class="form-control" id="txtConceptosHidden" name="txtConceptosHidden" value="0" readonly>
                                      <input type="text" class="form-control" id="txtConceptosFactura" name="txtConceptosFactura" value="0" pattern="^[1-9]{1,20}$" required>
                                      <div class="input-group-prepend m-0 p-0 bg-transparent border-left-0">
                                          <div class="input-group-text m-0 p-0 bg-transparent border-left-0">
                                              <a href="#" class="text-light btn btn-red border-left-0" data-toggle="modal" data-target="#ConceptoModal"><em class="fas fa-plus"></em></a>
                                          </div>
                                      </div>
                                      <div class="invalid-feedback text-justify">Debe asociar al menos un concepto a la factura.</div>
                                  </div>
                              </div>
                       </div>
                       <div class="d-flex justify-content-end">
                       	<button type="submit" class="btn btn-red text-light btn-submit">Crear</button>
                       </div>
                  </form>
                  <hr class="my-4">
                <!-- TABLA DE CONCEPTOS AGREGADOS A LA FACTURA -->
                   <table id="table-conceptos-crear" aria-describedby="En esta tabla se mostrarán los conceptos que el usuario vaya asociando a la factura" class="table table-bordered table-hover mt-3" style="width: 100%">
                    <thead class="thead-dark">
                        <tr>
                        	<th scope="col" class="text-center text-nowrap align-middle">Descripción</th>
                        	<th scope="col" class="text-center text-nowrap align-middle">Valor sin IVA</th>
                        	<th scope="col" class="text-center text-nowrap align-middle">Descuento</th>
                        	<th scope="col" class="text-center text-nowrap align-middle">Placa</th>
                        	<th scope="col" class="text-center text-nowrap align-middle">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
	            </table>
	            <!-- FIN DE TABLA DE CONCEPTOS AGREGADOS A LA FACTURA -->
            </div>
            
            <!-- MODAL PARA CREAR UN VEHICULO -->
			<div class="modal fade" data-keyboard="false" data-backdrop="static" id="ConceptoModal">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content">
			        
			        	<!-- ENCABEZADO DEL MODAL -->
			            <div class="modal-header">
			                <h4 class="modal-title">Agregar concepto</h4>
			                <button type="button" class="close btn-close" data-dismiss="modal">&times;</button>
			            </div>
			            <!-- FIN DEL ENCABEZADO DEL MODAL -->
			            
			        	<!-- FORMULARIO PARA AGREGAR UN CONCEPTO -->
			            <form action="" method="POST" id="formConcepto" name="formConcepto" class="needs-validation" novalidate>
	                        <div class="modal-body">
	                            <div class="row">
	                                <div class="form-group col-md-12">
	                                    <label for="txtDescripcion">Descripción</label>
	                                    <input type="text" class="form-control" id="txtDescripcion" name="txtDescripcion" minlength="10" maxlength="150" pattern='^(?!^\s)(?=.*\s.+)(?![a-zA-Z]\s)(?!.*\s[a-zA-Z]\s)(?!.*\s[a-zA-Z]$).[a-zA-Z0-9\s]{10,150}$' autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 10 caracteres. Solo admite números y letras.</div>
	                                </div>                                 
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
		                                <label for="txtConceptoSinIva">Valor sin IVA</label>
		                                <input type="text" class="form-control" id="txtConceptoSinIva" name="txtConceptoSinIva" minlength="4" maxlength="20" pattern="^[0-9]{4,20}$" autocomplete="off" autocapitalize="characters" required>
		                            	<div class="invalid-feedback text-justify">El campo debe tener mínimo 4 caracteres y solo puede contener números.</div>
		                            </div> 
	                                <div class="form-group col-md-6">
		                                <label for="txtDescuentoConcepto">Descuento</label>
		                                <input type="text" class="form-control" id="txtDescuentoConcepto" name="txtDescuentoConcepto" minlength="4" maxlength="20" pattern="^[0-9]{4,20}$" autocomplete="off" autocapitalize="characters" required>
		                            	<div class="invalid-feedback text-justify">El campo debe tener mínimo 4 caracteres y solo puede contener números.</div>
		                            </div> 
	                            </div>
	                            <div class="row">
	                               	<div class="form-group col-md-12">
	                                    <label for="txtPlacaConcepto">Placa</label>
	                                    <select class="custom-select" name="txtPlacaConcepto" id="txtPlacaConcepto" required>
	                                    	<option value="" selected>Seleccione...</option>
	                                    </select>
									</div>
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
            
            <!-- MODAL PARA ELIMINAR EL CONCEPTO -->
			<div class="modal fade" id="EliminarConceptoModal" data-keyboard="false" data-backdrop="static" tabindex="-1" aria-labelledby="#titleModalDelete" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="titleModalDelete">Eliminar concepto</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            
			            <!-- FORMULARIO Y CUERPO DEL MODAL -->
			            <form action="" method="POST" id="formEliminarConcepto" name="formEliminarConcepto" class="needs-validation" novalidate>
			                <div class="modal-body d-flex flex-column align-items-center w-100">
			                    <em class="fas fa-question-circle text-warning" style="font-size: 10rem;"></em>
			                    <span class="lead text-center">Está seguro que desea eliminar el concepto <strong id="lblconceptoDelete">LA DESCRIPCION</strong>?</span>
			                    <input type="hidden" class="form-control" id="txtDescripcionHiden" name="txtDescripcionHiden" required>
			                </div>
			                <!-- FINAL FORMULARIO Y CUERPO DEL MODAL -->
			
			                <!-- FOOTER DEL MODAL -->
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">NO</button>
			                    <button type="submit" class="btn btn-red text-light btn-submit">SÍ</button>
			                </div>
			                <!-- FIN DEL FOOTER DEL MODAL -->
			            </form>
			        </div>
			    </div>
			</div>
			<!-- FIN DEL MODAL PARA ELIMINAR EL CONCEPTO -->
        </section>

<%@ include file="../templates/modales.jsp" %>
<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/scripts/scriptsToForm.jsp" %>
<%@ include file="../templates/scripts/scriptsToDataTable.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>