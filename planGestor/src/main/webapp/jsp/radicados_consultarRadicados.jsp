<%@ include file="../templates/header.jsp" %>
<%@ include file="../templates/menu.jsp" %>

<!--CONTENEDOR PRINCIPAL-->
<section class="container-fluid mr-auto ml-auto mt-auto mb-auto pt-2">

    <!-- MIGAJAS DE PAN -->
    <nav class="p-0 m-0" aria-label="breadcrumb">
        <ol class="breadcrumb bg-white p-0 mt-0 justify-content-end">
          <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="home.jsp">/ Inicio</a></li>
          <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="radicados.jsp"> Radicados</a></li>
          <li class="breadcrumb-item active" aria-current="page"> Consultar radicados</li>
        </ol>
    </nav>
    <!-- FIN DE LAS MIGAJAS DE PAN -->

    
    <div class="p-0 m-0">
        <!-- TITULO -->
        <h2 class="mb-4">Consultar solicitudes</h2>
        <!-- FIN DEL TITULO -->

        <!-- FORMULARIO DE CONSULTA -->
        <form id="formConsultarRadicado" name="formConsultarRadicado" method="POST" action="" class="needs-validation" novalidate>
            <div class="d-flex justify-content-around flex-wrap">
                <div class="form-group d-inline-flex">
                    <label for="txtValorBuscar" class="text-nowrap m-0 p-0 aling-text-center w-129px mr-2">Valor a buscar</label>
                    <input type="text" class="form-control" id="txtValorBuscar" name="txtValorBuscar" minlength="5" maxlength="20" placeholder="Ingrese el valor a buscar" required>
                    <div class="invalid-feedback text-justify">El campo no puede estar vacío</div>
                </div>
                <div class="form-group d-inline-flex">
                    <label for="cboTipoBuscar" class="text-nowrap m-0 p-0 aling-text-center w-129px mr-2">Buscar por</label>
                    <select id="cboTipoBuscar" name="cboTipoBuscar" class="custom-select" required>
                      <option value="" selected>Seleccione...</option>
                      <option value="doc">Identificación</option>
                      <option value="rad">Radicado</option>
                      <option value="nom">Nombre</option>
                    </select>
                    <div class="invalid-feedback">Debe selecionar una opción</div>
                </div>
                <div class="form-group d-inline-flex div-cboTipoDocumento">
                    <label for="cboTipoDocumento" class="text-nowrap m-0 p-0 aling-text-center w-129px mr-2">Tipo de documento</label>
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
            </div>
            <div class="d-flex justify-content-around flex-wrap">
                <div class="form-group d-inline-flex">
                    <label for="txtFechaDesde" class="text-nowrap m-0 p-0 aling-text-center w-129px mr-2">Desde</label>
                    <input type="date" class="form-control" id="txtValorBuscar" name="txtValorBuscar">
                    <div class="invalid-feedback text-justify">La fecha seleccionada está fuera del rango permitido</div>
                </div>
                <div class="form-group d-inline-flex">
                    <label for="txtFechaHasta" class="text-nowrap m-0 p-0 aling-text-center w-129px mr-2">Hasta</label>
                    <input type="date" class="form-control" id="txtFechaHasta" name="txtFechaHasta">
                    <div class="invalid-feedback text-justify">La fecha seleccionada está fuera del rango permitido</div>
                </div>
                <div class="form-group d-inline-flex">
                    <label for="cboTipoRadicado" class="text-nowrap m-0 p-0 aling-text-center w-129px mr-2">Buscar por</label>
                    <select id="cboTipoRadicado" name="cboTipoRadicado" class="custom-select">
                      <option value="" selected>Seleccione...</option>
                      <option value="open">Abierto</option>
                      <option value="close">Cerrado</option>
                      <option value="assign">Asignado</option>
                      <option value="answer">Con respuesta</option>
                    </select>
                </div>
            </div>
            <div class="d-flex justify-content-around mt-4">
                <button type="reset" class="btn btn-secondary"><em class="fas fa-backspace mr-2"></em>Cancelar</button>
                <button type="submit" class="btn btn-red btn-submit"><em class="fas fa-search mr-2"></em>Buscar</button>
            </div>                    
        </form>
        <!-- FIN DEL FORMULARIO DE CONSULTA -->
        <hr>

        <!-- TABLA DE RESULTADOS DE BUSQUEDA -->
        <div class="table-responsive table-consultar">
            <table id="tbUsuarioRadicados" aria-describedby="Tabla de radicados abiertos, asignados por asesor" class="table table-striped table-hover table-bordered" style="width:100%">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Radicado</th>
                        <th scope="col">Fecha registro</th>
                        <th scope="col">Nombre de cliente</th>
                        <th scope="col">Tipo de solicitud</th>
                        <th scope="col">Clasificación</th>
                        <th scope="col">Placa</th>
                        <th scope="col">Remitente</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a class="text-decoration-none" href="#modalInformacionRadicado" data-toggle="modal" data-target="#modalInformacionRadicado">...</a></td>
                        <td>31298</td>
                        <td>21/04/2021</td>
                        <td>Andres Lopez</td>
                        <td>Reclamo</td>
                        <td>Fallas en la transmisión</td>
                        <td>XHV450</td>
                        <td>Michael Beleño</td>
                    </tr>
                    <tr>
                        <td><a class="text-decoration-none" href="#modalInformacionRadicado" data-toggle="modal" data-target="#modalInformacionRadicado">...</a></td>
                        <td>31298</td>
                        <td>21/04/2021</td>
                        <td>Andres Lopez</td>
                        <td>Reclamo</td>
                        <td>Fallas en la transmisión</td>
                        <td>XHV450</td>
                        <td>Michael Beleño</td>
                    </tr>
                    <tr>
                        <td><a class="text-decoration-none" href="#modalInformacionRadicado" data-toggle="modal" data-target="#modalInformacionRadicado">...</a></td>
                        <td>31298</td>
                        <td>21/04/2021</td>
                        <td>Andres Lopez</td>
                        <td>Reclamo</td>
                        <td>Fallas en la transmisión</td>
                        <td>XHV450</td>
                        <td>Michael Beleño</td>
                    </tr>
                    <tr>
                        <td><a class="text-decoration-none" href="#modalInformacionRadicado" data-toggle="modal" data-target="#modalInformacionRadicado">...</a></td>
                        <td>31298</td>
                        <td>21/04/2021</td>
                        <td>Andres Lopez</td>
                        <td>Reclamo</td>
                        <td>Fallas en la transmisión</td>
                        <td>XHV450</td>
                        <td>Michael Beleño</td>
                    </tr>
                    <tr>
                        <td><a class="text-decoration-none" href="#modalInformacionRadicado" data-toggle="modal" data-target="#modalInformacionRadicado">...</a></td>
                        <td>31298</td>
                        <td>21/04/2021</td>
                        <td>Andres Lopez</td>
                        <td>Reclamo</td>
                        <td>Fallas en la transmisión</td>
                        <td>XHV450</td>
                        <td>Michael Beleño</td>
                    </tr>
                    <tr>
                        <td><a class="text-decoration-none" href="#modalInformacionRadicado" data-toggle="modal" data-target="#modalInformacionRadicado">...</a></td>
                        <td>31298</td>
                        <td>21/04/2021</td>
                        <td>Andres Lopez</td>
                        <td>Reclamo</td>
                        <td>Fallas en la transmisión</td>
                        <td>XHV450</td>
                        <td>Michael Beleño</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- FIN DE LA TABLA DE RESULTADOS DE BUSQUEDA -->

        <!-- MODAL DE INFORMACIÓN -->
        <div class="modal fade" data-keyboard="false" data-backdrop="static" id="modalInformacionRadicado" tabindex="-1" aria-labelledby="TitleModalInformacionRadicado" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-xl">
                <div class="modal-content">
                    <div class="modal-header d-flex justify-content-between">
                                                        
                        <!-- TABS DE NAVEGACION -->
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link text-danger active" id="gestion-tab" data-toggle="tab" href="#gestion" role="tab" aria-controls="gestion" aria-selected="true">Gestion</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link text-danger" id="profile-tab" data-toggle="tab" href="#archivos" role="tab" aria-controls="archivos" aria-selected="false">Archivos</a>
                            </li>
                        </ul>
                        <!-- FIN DE LOS TABS DE NAVEGACION -->

                        <h5 class="modal-title mr-auto ml-auto" id="TitleModalInformacionRadicado">Radicado 31298</h5>

                        <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        

                        <!-- CONTENIDO DE LOS TABS -->
                        <div class="tab-content" id="myTabContent">

                            <!-- CONTENIDO DEL PRIMER TAB -->
                            <div class="tab-pane fade show active" id="gestion" role="tabpanel" aria-labelledby="gestion-tab">
                                <textarea class="w-100 my-3 p-2 text-justify" id="" name="" rows="6" spellcheck="checked" placeholder="Aquí va la descripción con la que fue radicada la solicitud" readonly></textarea>
                                
                                <!-- TABLA DE LA GESTION -->
                                <div class="table-responsive">
                                    <table id="" name="" aria-describedby="Tabla donde se mostrará la gestión y escalamientos de un radicado en especifico" class="table table-striped table-hover table-bordered" style="width:100%">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col" class="text-center align-middle text-nowrap">Fecha</th>
                                                <th scope="col" class="text-center align-middle text-nowrap">Estado</th>
                                                <th scope="col" class="text-center align-middle text-nowrap">Remitente</th>
                                                <th scope="col" class="text-center align-middle text-nowrap">Receptor</th>
                                                <th scope="col" class="text-center align-middle text-nowrap">Observaciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                                <td class="text-center align-middle text-nowrap">Asignado</td>
                                                <td class="text-center align-middle text-nowrap">Automatico</td>
                                                <td class="text-center align-middle text-nowrap">Mario Garcia</td>
                                                <td class="text-justify">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Saepe atque labore quas inventore totam sit perferendis, alias, dolorem, suscipit facilis corrupti. Illo officia amet est eum quidem voluptatibus non animi.</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                                <td class="text-center align-middle text-nowrap">Escalado</td>
                                                <td class="text-center align-middle text-nowrap">Mario Garcia</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-justify">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Saepe atque labore quas inventore totam sit perferendis, alias, dolorem, suscipit facilis corrupti. Illo officia amet est eum quidem voluptatibus non animi.</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap">27/04/2021</td>
                                                <td class="text-center align-middle text-nowrap">Con respuesta</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">Mario Garcia</td>
                                                <td class="text-justify">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Saepe atque labore quas inventore totam sit perferendis, alias, dolorem, suscipit facilis corrupti. Illo officia amet est eum quidem voluptatibus non animi.</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- FIN DE LA TABLA DE LA GESTION -->

                            </div>
                            <!-- FIN DEL CONTENIDO DEL PRIMER TAB -->

                            <!-- CONTENIDO DEL SEGUNDO TAB -->
                            <div class="tab-pane fade" id="archivos" role="tabpanel" aria-labelledby="archivos-tab">
                                
                                <!-- TABLA DE LOS ARCHIVOS ADJUNTOS DE ESE RADICADO -->
                                <div class="table-responsive my-3">
                                    <table id="" name="" aria-describedby="Tabla donde se mostrarán los archivos adjuntos de un radicado" class="table table-striped table-hover table-bordered" style="width:100%">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col" class="text-center align-middle"></th>
                                                <th scope="col" class="text-center align-middle text-nowrap">Nombre del archivo</th>
                                                <th scope="col" class="text-center align-middle text-nowrap">Asesor</th>
                                                <th scope="col" class="text-center align-middle text-nowrap">Fecha de carga</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap"><a class="text-decoration-none" href="#">...</a></td>
                                                <td class="text-center align-middle text-nowrap">solicitud_aclaracion_cobro.msg</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap"><a class="text-decoration-none" href="#">...</a></td>
                                                <td class="text-center align-middle text-nowrap">RV:solicitud_aclaracion_cobro.msg</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap"><a class="text-decoration-none" href="#">...</a></td>
                                                <td class="text-center align-middle text-nowrap">RE:solicitud_aclaracion_cobro.msg</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap"><a class="text-decoration-none" href="#">...</a></td>
                                                <td class="text-center align-middle text-nowrap">solicitud_aclaracion_cobro.msg</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap"><a class="text-decoration-none" href="#">...</a></td>
                                                <td class="text-center align-middle text-nowrap">RV:solicitud_aclaracion_cobro.msg</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap"><a class="text-decoration-none" href="#">...</a></td>
                                                <td class="text-center align-middle text-nowrap">RE:solicitud_aclaracion_cobro.msg</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap"><a class="text-decoration-none" href="#">...</a></td>
                                                <td class="text-center align-middle text-nowrap">solicitud_aclaracion_cobro.msg</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap"><a class="text-decoration-none" href="#">...</a></td>
                                                <td class="text-center align-middle text-nowrap">RV:solicitud_aclaracion_cobro.msg</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center align-middle text-nowrap"><a class="text-decoration-none" href="#">...</a></td>
                                                <td class="text-center align-middle text-nowrap">RE:solicitud_aclaracion_cobro.msg</td>
                                                <td class="text-center align-middle text-nowrap">Michael Beleño</td>
                                                <td class="text-center align-middle text-nowrap">23/04/2021</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- FIN DE LA TABLA DE LOS ARCHIVOS ADJUNTOS DE ESE RADICADO -->

                            </div>
                            <!-- FIN DEL CONTENIDO DEL SEGUNDO TAB -->
                        </div> 
                        <!-- FIN DEL CONTENIDO DE LOS TABS -->

                    </div>
                </div>
            </div>
        </div>
        <!-- FIN DE MODAL DE INFORMACIÓN -->
    </div>
</section>
  
<%@ include file="../templates/scripts/scriptsToForm.jsp" %>
<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>