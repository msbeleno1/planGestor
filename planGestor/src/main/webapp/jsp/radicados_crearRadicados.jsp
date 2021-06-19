<%@ include file="../templates/header.jsp" %>
<%@ include file="../templates/links/linksToDataTable.jsp" %>
<%@ include file="../templates/menu.jsp" %>

<!--CONTENEDOR PRINCIPAL-->
<section class="container-fluid mr-auto ml-auto mt-auto mb-auto pt-2">

    <!-- MIGAJAS DE PAN -->
    <nav class="p-0 m-0" aria-label="breadcrumb">
        <ol class="breadcrumb bg-white p-0 mt-0 justify-content-end">
          <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="home.jsp">/ Inicio</a></li>
          <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="radicados.jsp"> Radicados</a></li>
          <li class="breadcrumb-item active" aria-current="page"> Crear radicados</li>
        </ol>
    </nav>
    <!-- FIN DE LAS MIGAJAS DE PAN -->
    
    <h2>Radicación de solicitudes</h2>
	
	<div id="contenedor-1" class="d-block mt-3">
           <!-- FORMULARIO Y CUERPO DE LA PRIMERA PESTAÑA -->
           <form action="" method="POST" id="formBuscarClienteRad" name="formBuscarClienteRad" class="needs-validation" novalidate>
        		<div class="row">
                   <div class="form-group col-md-6">
                       <label for="txtDocumentoBuscar">Documento de cliente</label>
                       <input type="text" class="form-control" id="txtDocumentoBuscar" name="txtDocumentoBuscar" minlength="8" maxlength="20" pattern="^[0-9]{8,20}$" autocomplete="off" autocapitalize="characters" required>
                       <div class="invalid-feedback text-justify">El campo debe tener mínimo 8 caracteres y solo puede contener números.</div>
                   </div>
                  	<div class="form-group col-md-6">
                        <label for="cboTipoBuscar">Tipo de documento</label>
                        <select class="custom-select cboDoc" name="cboTipoBuscar" id="cboTipoBuscar" required>
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
 		<form id="formRadicadoCrear" name="formRadicadoCrear" action="" method="POST" class="needs-validation" novalidate>
           	<div class="row">
             	<div class="form-group col-md-6">
	                  <label>Nombre de cliente</label>
	                  <input type="text" id="txtNombreCliente" name="txtNombreCliente" class="form-control" disabled>
	                  <input type="hidden" id="txtDocumentoClienteHidden" name="txtDocumentoClienteHidden">
	                  <input type="hidden" id="txtTipoDocClienteHidden" name="txtTipoDocClienteHidden">
	             </div>
	             <div class="form-group col-md-6">
	                 <label for="txtDocumentoCliente">Documento de cliente</label>
	                 <input type="text" class="form-control" id="txtDocumentoCliente" name="txtDocumentoCliente" disabled>
	             </div>                                    
         	</div>
           <div class="row">
               <div class="form-group col-md-6">
                   <label for="txtTipoRadicado">Tipo de solicitud</label>
                   <select class="custom-select cboTipoR" name="txtTipoRadicado" id="txtTipoRadicado" required>
                   </select>
                   <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
               </div>
               <div class="form-group col-md-6">
                   <label for="txtClasificacionRadicado">Clasificación</label>
                   <select class="custom-select" name="txtClasificacionRadicado" id="txtClasificacionRadicado" required>
                      	<option value="" selected>Seleccione...</option>
                   </select>
                   <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
               </div>
           </div>

           <div class="row"> 
               <div class="form-group col-md-12">
                   <label for="txtPlacaRadicado">Placa</label>
                   <select class="custom-select" name="txtPlacaRadicado" id="txtPlacaRadicado">
                      	<option value="" selected>Seleccione...</option>
                   </select>
               </div>
           </div>
           <div class="row">
                <div class="form-group col-md-12">
                    <label for="txtDescripcionRadicado">Descripción de la solicitud</label>
                    <textarea class="w-100" name="txtDescripcionRadicado" id="txtDescripcionRadicado" placeholder="Dé una breve descripción de la solicitud realizada por el clienyte" form="formCrearRadicado" rows="6" spellcheck="checked" minlength="15" maxlength="250" required></textarea>
                    <div class="invalid-feedback text-justify">El campo "Descripción de la solicitud" no puede estar vacío</div>
                </div>
            </div>
            <div class="d-flex justify-content-end">
            	<button type="button" id="btn-reload" class="btn btn-secondary text-light">Adjuntar archivos</button>
            	<button type="submit" class="btn btn-red text-light btn-submit">Radicar</button>
            </div>
       </form>
       <hr class="my-4">
     
	    <!-- TABLA DE RADICADOS ABIERTOS POR CLIENTE -->
	    <table id="table-radicados-cliente" aria-describedby="En esta tabla se mostrarán los radicados que están abierto para el cliente" class="table table-bordered table-hover mt-3" style="width: 100%">
	       <thead class="thead-dark">
	           <tr>
	           	<th scope="col" class="text-center text-nowrap align-middle">Radicado</th>
	           	<th scope="col" class="text-center text-nowrap align-middle">Fecha Rad.</th>
	           	<th scope="col" class="text-center text-nowrap align-middle">Tipo</th>
	           	<th scope="col" class="text-center text-nowrap align-middle">Clasificación</th>
	           	<th scope="col" class="text-center text-nowrap align-middle">Placa</th>
	           </tr>
	       </thead>
	       <tbody>
	       </tbody>
		</table>
		<!-- FIN DE TABLA DE RADICADOS ABIERTOS POR CLIENTE -->
     </div>
     
     

    <!-- MODAL PARA ADJUNTAR ARCHIVOS -->
    <div class="modal fade" data-keyboard="false" data-backdrop="static" id="modalAdjuntarArchivos" tabindex="-1" aria-labelledby="titleAdjuntarModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="titleAdjuntarModal">Adjuntar archivos a la solicitud</h5>
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="" method="POST" id="formAdjuntarArchivos" name="formAdjuntarArchivos" class="needs-validation" novalidate>
                    <div class="modal-body">
                        <div class="custom-file">
                            <label for="txtAdjuntarArchivos" class="custom-file-label">Seleccione un archivo</label>
                            <input name="txtAdjuntarArchivos" id="txtAdjuntarArchivos" type="file" class="custom-file-input" accept="text/csv" required>
                            <div class="invalid-feedback text-justify">No hay ha seleccionado algún archivo.</div>
                        </div>
                    </div>

                    <!-- FOOTER DEL MODAL -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-red text-light btn-submit"><em class="fas fa-check mr-2"></em>Adjuntar</button>
                    </div>
                    <!-- FIN DEL FOOTER DEL MODAL -->

                </form>
            </div>
        </div>
    </div>
    <!-- FIN DEL MODAL PARA ADJUNTAR ARCHIVOS -->
    
</section>
  
<%@ include file="../templates/modales.jsp" %>
<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/scripts/scriptsToForm.jsp" %>
<%@ include file="../templates/scripts/scriptsToDataTable.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>