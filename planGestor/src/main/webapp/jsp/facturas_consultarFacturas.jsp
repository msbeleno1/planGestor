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
                    <li class="breadcrumb-item active" aria-current="page"> Consultar facturas</li>
                </ol>
            </nav>
            <!-- FIN DE LAS MIGAJAS DE PAN -->

            <!-- TITULO -->
            <h2 class="mb-4">Consultar facturas</h2>
            <!-- FIN DEL TITULO -->

            <div class="row">
            	<div class="col-lg-12">
            		<!--TABLA DE USUARIOS-->
	                <table id="tablaFacturas" class="table table-hover table-bordered display nowrap" aria-describedby="Tabla de facturas" style="width: 100%">
	
	                    <!-- ENCABEZADOS DE LA TABLA -->
	                    <thead class="thead-dark">
	                      <tr>
	                        <th scope="col" class="text-center text-nowrap align-middle">Numero de factura</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Fecha emisión</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Tipo de factura</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Cliente</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Consultar</th>
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
                <button type="button" class="btn btn-red ml-2 my-1 text-light"><em class="fas fa-download text-light"></em>  Descargar información</button>
            </div>
            <!--FIN DE GRUPO DE BOTONES-->
			
			
			<!--Inicio Modal CONSULTA-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static" id="consultaFacturaModal">
			    <div class="modal-dialog modal-xl">
			        <div class="modal-content">
			               
			            <!-- Modal Header -->
			            <div class="modal-header d-flex justify-content-between">
			                                                    
			                <!-- TABS DE NAVEGACION (PESTAÑAS) -->
			                <div class="nav nav-tabs" id="nav-tab" role="tablist">
			                    <a class="nav-item nav-link text-danger active" id="nav-factura-tab" data-toggle="tab" href="#nav-factura" role="tab" aria-controls="nav-factura" aria-selected="true">Factura</a>
			                    <a class="nav-item nav-link text-danger" id="nav-concepto-tab" data-toggle="tab" href="#nav-concepto" role="tab" aria-controls="nav-concepto" aria-selected="false">Concepto</a>
			                </div>
			                <!-- FIN DE LOS TABS DE NAVEGACION -->
			
			                <h5 class="modal-title mr-auto ml-auto" id="TitleModal">Información de factura</h5>
			
			                <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <!-- Fin del Modal Header -->                        
			                
			            <!-- CONTENIDO DE LAS PESTAÑAS -->
			            <div class="tab-content" id="nav-tabContent">
			                <div class="tab-pane fade show active" id="nav-factura" role="tabpanel" aria-labelledby="nav-factura-tab">
			                        
			                    <!-- FORMULARIO Y CUERPO DE LA PRIMERA PESTAÑA -->
			                    <form action="" method="POST" id="formFacturaConsulta" name="formFacturaConsulta">
			                        <div class="modal-body">
			                            <div class="row">
			                                <div class="form-group col-md-6">
			                                    <label for="txtNumeroFactura">Número de factura</label>
			                                    <input type="text" class="form-control" id="txtNumeroFactura" name="txtNumeroFactura" readonly>
			                                </div>
			                                <div class="form-group col-md-6">
			                                    <label for="txtEmisionFactura">Fecha de emisión</label>
			                                    <input type="date" class="form-control" id="txtEmisionFactura" name="txtEmisionFactura" readonly>
			                                </div>                                    
			                            </div>
			                            <div class="row">
			                                <div class="form-group col-md-6">
			                                    <label for="txtTipoFactura">Tipo de factura</label>
			                                    <input type="text" class="form-control" id="txtTipoFactura" name="txtTipoFactura" readonly>
			                                </div>
			                                <div class="form-group col-md-6">
			                                    <label for="txtClienteFactura">Cliente</label>
			                                    <input type="text" class="form-control" id="txtClienteFactura" name="txtClienteFactura" readonly>
			                                </div>
			                            </div>
			
			                            <div class="row"> 
			                                <div class="form-group col-md-6">
			                                    <label for="txtBaseFactura">Total sin IVA</label>
			                                    <input type="text" class="form-control" id="txtBaseFactura" name="txtBaseFactura" readonly>
			                                </div>
			                                <div class="form-group col-md-6">
			                                    <label for="txtTotalFactura">Total con IVA</label>
			                                    <input type="text" class="form-control" id="txtTotalFactura" name="txtTotalFactura" readonly>
			                                </div>
			                            </div>
			                        </div>
			
			                    </form>
			                    <!-- FIN FORMULARIO PARA LA PRIMERA PESTAÑA -->
			                </div>
			                    
			                    
			                <!-- CUERPO DEL MODAL PARA LA SEGUNDA PESTAÑA -->
			                <div class="tab-pane fade" id="nav-concepto" role="tabpanel" aria-labelledby="nav-concepto-tab">
			                    <form action="" method="POST" id="formClienteMasivo" name="formClienteMasivo" enctype="multipart/form-data" class="needs-validation" novalidate>
			                        <div class="modal-body">
			                            <table id="table-conceptos-consulta" aria-describedby="En esta tabla se mostrarán los conceptos asociados a la factura seleccionada" class="table table-bordered table-hover" style="width: 100%">
						                        <thead class="thead-dark">
						                            <tr>
						                            	<th scope="col" class="text-center text-nowrap align-middle">Descripción</th>
						                            	<th scope="col" class="text-center text-nowrap align-middle">Valor sin IVA</th>
						                            	<th scope="col" class="text-center text-nowrap align-middle">Descuento</th>
						                            	<th scope="col" class="text-center text-nowrap align-middle">Placa</th>
						                            </tr>
						                        </thead>
						                        <tbody>
						                        </tbody>
						                </table>
			                        </div>			
			                    </form>
			                </div>
			                <!-- FIN DEL CUERPO DEL MODAL PARA LA SEGUNDA PESTAÑA -->
			
			            </div>
			            <!-- FIN DEL CONTENIDO DE LAS PESTAÑAS -->
			        </div>
			    </div>
			</div>
			<!--FIN MODAL DE REGISTRO-->
			
        </section>

<%@ include file="../templates/modales.jsp" %>
<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/scripts/scriptsToDataTable.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>