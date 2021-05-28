<%@ include file="../templates/header.jsp" %>
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

    <!-- TABS DE NAVEGACION -->
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link text-danger active" id="radicado-tab" data-toggle="tab" href="#radicado" role="tab" aria-controls="radicado" aria-selected="true">Radicado</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link text-danger" id="masiva-tab" data-toggle="tab" href="#masiva" role="tab" aria-controls="masiva" aria-selected="false">Masiva</a>
        </li>
    </ul>
    <!-- FIN DE LOS TABS DE NAVEGACION -->
    
    <h2>Radicación de solicitudes</h2>

    <div class="tab-content" id="nav-tabContent">
        <!-- CONTENIDO DEL PRIMER TAB -->
        <div class="tab-pane fade show active" id="radicado" role="tabpanel" aria-labelledby="radicado-tab">
            
            <div class="row p-0 mb-0 mt-3">
                <!-- FORMULARIO DE CREACION -->
                <div class="col-sm-7 mb-3">
                    
                    <form id="formBuscarCrear" name="formBuscarCrear" method="POST" action="" class="needs-validation" novalidate>
                        <div class="form-group w-50">
                            <label for="cboTipoDocumento">Tipo de documento</label>
                            <select id="cboTipoDocumento" name="cboTipoDocumento" class="custom-select" required>
                            <option value="" selected>Seleccione...</option>
                            <option value="cc">Cédula</option>
                            <option value="nit">NIT</option>
                            <option value="ti">Tarjeta de identidad</option>
                            <option value="pas">Pasaporte</option>
                            <option value="ci">Cédula de extranjería</option>
                            </select>
                            <div class="invalid-feedback">Debe selecionar un tipo de documento</div>
                        </div>
                        <div class="form-group w-50">
                        <label for="txtDocumentoRadicado">Número de documento</label>
                        <input type="number" class="form-control" id="txtDocumento" name="txtDocumento" minlength="5" maxlength="20" placeholder="Ingrese el número de documento" required>
                        <div class="invalid-feedback text-justify">Debe ingresar un número de documento</div>
                        </div>
                        <button type="submit" class="btn btn-red btn-submit"><em class="fas fa-search mr-2"></em>Buscar</button>
                    </form>
                    <hr class="my-3 w-75 float-left" >
                    <form id="formCrearRadicado" name="formCrearRadicado" method="POST" action="" class="needs-validation" novalidate>
                        <div class="form-group w-75 mb-4">
                            <label for="txtClienteRadicado">Cliente</label>
                            <input type="text" class="form-control" id="txtCliente" name="txtCliente" readonly>
                        </div>
                        <div class="form-group w-75 mb-4">
                            <label for="txtDescripcionRadicado">Descripción de la solicitud</label>
                            <textarea class="w-100" name="txtDescripcionRadicado" id="txtDescripcionRadicado" placeholder="Dé una breve descripción de la solicitud realizada por el clienyte" form="formCrearRadicado" rows="6" spellcheck="checked" minlength="15" maxlength="250" required disabled></textarea>
                            <div class="invalid-feedback text-justify">El campo "Descripción de la solicitud" no puede estar vacío</div>
                        </div>
                        <div class="w-75 d-flex justify-content-around">
                            <button type="button" class="btn btn-secondary text-nowrap" data-toggle="modal" data-target="#modalAdjuntarArchivos" disabled><em class="fas fa-file-archive mr-2"></em>Adjuntar</button>
                            <button type="submit" class="btn btn-red text-nowrap btn-submit" disabled><em class="fas fa-check mr-2"></em>Radicar</button>
                        </div>
                    </form>
                </div>
                <!-- FIN DEL FORMULARIO DE CREACION -->
                
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

                <!-- MODAL PARA INFORMAR QUE EL ARCHIVO SE ADJUNTÓ CON EXITO -->
                <div class="modal fade" id="modalSuccess" tabindex="-1" aria-labelledby="titleModalSuccess" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="titleModalSuccess">Operación exitosa</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body d-flex flex-column align-items-center w-100">
                                <em class="fas fa-check-circle text-success" style="font-size: 10rem;"></em>
                                <span>El archivo fue adjuntado con exito</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- TABLA DE RADICADOS ABIERTOS -->
                
                <div class="col-sm-5">
                    <table aria-describedat="En esta tabla se mostrarán los radicados abiertos de el cliente a quien le estén radicando" class="table table-bordered table-hover dt-responsive">
                        <caption class="lead">Tabla de radicados abiertos por cliente</caption>
                        <thead>
                            <tr>
                                <th scope="col">Radicado</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Clasificación</th>
                                <th scope="col">Obervaciones</th>
                                <th scope="col">Fecha radicación</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>31245</td>
                                <td>Reclamo</td>
                                <td>Fallas en la transmisión</td>
                                <td>Cliente especifica que desde el 23 de Abril del presente año...</td>
                                <td>23/04/2021</td>
                            </tr>
                            <tr>
                                <td>31446</td>
                                <td>Petición</td>
                                <td>Cambio de plan</td>
                                <td>Cliente solicita cambio de plan a uno más barato debido a que...</td>
                                <td>30/04/2021</td>
                            </tr>
                            <tr>
                                <td>31789</td>
                                <td>Queja</td>
                                <td>Mala atención teléfonica</td>
                                <td>Cliente indica que el día martes, fue atendido vía telefonica por...</td>
                                <td>03/05/2021</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- FIN DEL CONTENIDO DEL PRIMER TAB -->

        <!-- CONTENIDO DEL SEGUNDO TAB -->
        <div class="tab-pane fade" id="masiva" role="tabpanel" aria-labelledby="masiva-tab">
            <form action="" method="POST" id="formRadicadosMasiva" name="formRadicadosMasiva" class="needs-validation" novalidate>
                <div class="custom-file mb-3">
                    <label for="txtAdjuntarCsv" class="custom-file-label">Seleccione un archivo:</label>
                    <input name="txtAdjuntarCsv" id="txtAdjuntarCsv" type="file" class="custom-file-input" accept="text/csv" required>
                    <div class="invalid-feedback text-justify">No hay ha seleccionado algún archivo.</div>
                </div>

                <button type="submit" class="btn btn-red text-light btn-submit mt-3"><em class="fas fa-check mr-2"></em>Adjuntar</button>

            </form>
        </div> 
        <!-- FIN DEL CONTENIDO DEL SEGUNDO TAB -->
    </div>
</section>
  
<%@ include file="../templates/scripts/scriptsToForm.jsp" %>
<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>