<%@ include file="../templates/header.jsp" %>
<%@ include file="../templates/links/linksToDataTable.jsp" %>
<%@ include file="../templates/menu.jsp" %>

<!--CONTENEDOR PRINCIPAL-->
        <section class="container-fluid mr-auto ml-auto mt-auto mb-2 pt-2">

            <!-- MIGAJAS DE PAN -->
            <nav class="p-0 m-0" aria-label="breadcrumb">
                <ol class="breadcrumb bg-white p-0 mt-0 justify-content-end">
                    <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="home.jsp">/ Inicio</a></li>
                    <li class="breadcrumb-item active" aria-current="page"> Clientes</li>
                </ol>
            </nav>
            <!-- FIN DE LAS MIGAJAS DE PAN -->

            <!-- TITULO -->
            <h2 class="mb-4">Gestión de clientes</h2>
            <!-- FIN DEL TITULO -->

            <div class="row">
            	<div class="col-lg-12">
            		<!--TABLA DE USUARIOS-->
	                <table id="tablaClientes" class="table table-hover table-bordered display nowrap" aria-describedby="Tabla de clientes" style="width: 100%">
	
	                    <!-- ENCABEZADOS DE LA TABLA -->
	                    <thead class="thead-dark">
	                      <tr>
	                        <th scope="col" class="text-center text-nowrap align-middle">Documento</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Tipo documento</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Nombre</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Correo</th>
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
                <button type="button" class="btn btn-red mr-2 my-1 text-light" data-toggle="modal" data-target="#registroClienteModal"><em class="fas fa-plus text-light"></em>  Crear cliente</button>
                <button type="button" class="btn btn-red ml-2 my-1 text-light"><em class="fas fa-download text-light"></em>  Descargar información</button>
            </div>
            <!--FIN DE GRUPO DE BOTONES-->
			
			
			<!--Inicio Modal registro-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static" id="registroClienteModal">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content">
			               
			            <!-- Modal Header -->
			            <div class="modal-header d-flex justify-content-between">
			                                                    
			                <!-- TABS DE NAVEGACION (PESTAÑAS) -->
			                <div class="nav nav-tabs" id="nav-tab" role="tablist">
			                    <a class="nav-item nav-link text-danger active" id="nav-individual-tab" data-toggle="tab" href="#nav-individual" role="tab" aria-controls="nav-individual" aria-selected="true">Individual</a>
			                    <a class="nav-item nav-link text-danger" id="nav-masivo-tab" data-toggle="tab" href="#nav-masivo" role="tab" aria-controls="nav-masivo" aria-selected="false">Masivo</a>
			                </div>
			                <!-- FIN DE LOS TABS DE NAVEGACION -->
			
			                <h5 class="modal-title mr-auto ml-auto" id="TitleModalRegistro">Registro de Clientes</h5>
			
			                <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <!-- Fin del Modal Header -->                        
			                
			            <!-- CONTENIDO DE LAS PESTAÑAS -->
			            <div class="tab-content" id="nav-tabContent">
			                <div class="tab-pane fade show active" id="nav-individual" role="tabpanel" aria-labelledby="nav-individual-tab">
			                        
			                    <!-- FORMULARIO Y CUERPO DE LA PRIMERA PESTAÑA -->
			                    <form action="" method="POST" id="formClienteIndividual" name="formClienteIndividual" class="needs-validation" novalidate>
			                        <div class="modal-body">
			                            <div class="row">
			                                <div class="form-group col-md-6">
			                                    <label for="txtDocumentoRegistro">Número de identificación</label>
			                                    <input type="text" class="form-control" id="txtDocumentoRegistro" name="txtDocumentoRegistro" minlength="8" maxlength="20" pattern="^[0-9]{8,20}$" autocomplete="off" autocapitalize="characters" required>
			                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 8 caracteres y solo puede contener números.</div>
			                                </div>
			                                <div class="form-group col-md-6">
			                                    <label for="txtTipoRegistro">Tipo de documento</label>
			                                    <select class="custom-select cbo" name="txtTipoRegistro" id="txtTipoRegistro" required>
			                                       	<option value="" selected>Seleccione...</option>
			                                    </select>
			                                    <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
			                                </div>                                    
			                            </div>
			                            <div class="row">
			                                <div class="form-group col-md-6">
			                                    <label for="txtNombresRegistro">Nombres</label>
			                                    <input type="text" class="form-control" id="txtNombresRegistro" name="txtNombresRegistro" minlength="5" maxlength="15" pattern="^(?!^\s)(?=.*\s.+)(?![a-zA-Z]\s)(?!.*\s[a-zA-Z]\s)(?!.*\s[a-zA-Z]$).[a-zA-Z\s]{5,15}$" autocomplete="off" autocapitalize="characters" required>
			                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 5 caracteres y solo puede contener letras.</div>
			                                </div>
			                                <div class="form-group col-md-6">
			                                    <label for="txtApellidosRegistro">Apellidos</label>
			                                    <input type="text" class="form-control" id="txtApellidosRegistro" name="txtApellidosRegistro" minlength="7" maxlength="25" pattern='^(?!^\s)(?=.*\s.+)(?![a-zA-Z]\s)(?!.*\s[a-zA-Z]\s)(?!.*\s[a-zA-Z]$).[a-zA-Z\s]{7,25}$' autocomplete="off" autocapitalize="characters" required>
			                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 10 caracteres y solo puede contener letras.</div>
			                                </div>
			                            </div>
			
			                            <div class="row"> 
			                                <div class="form-group col-md-6">
			                                    <label for="txtTelefonoRegistro">Telefono</label>
			                                    <input type="text" class="form-control" id="txtTelefonoRegistro" name="txtTelefonoRegistro" minlength="10" maxlength="15" pattern="^[0-9]{5,15}$" autocomplete="off" autocapitalize="characters" required>
			                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 10 caracteres y solo puede contener números.</div>
			                                </div>
			                                <div class="form-group col-md-6">
			                                    <label for="txtCorreoRegistro">Correo</label>
			                                    <div class="input-group">
			                                        <div class="input-group-prepend">
			                                            <div class="input-group-text">
			                                                <a href="#" class="text-dark"><em class="fas fa-at"></em></a>
			                                            </div>
			                                        </div>
			                                        <input type="email" name="txtCorreoRegistro" id="txtCorreoRegistro" class="form-control" placeholder="E-mail" minlength="8" maxlength="30" pattern="^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$" autocomplete="off" autocapitalize="characters" required>
			                                        <div class="invalid-feedback text-justify">El correo ingresado no es valido</div>
			                                    </div>
			                                </div>
			                            </div>
			                            <div class="row">
			                                <div class="form-group col-md-12">
			                                    <label for="txtDireccionRegistro">Dirección</label>
		                                     	<input type="text" class="form-control" id="txtDireccionRegistro" name="txtDireccionRegistro" minlength="8" maxlength="30"  autocomplete="off" required></input>
		                                        <div class="invalid-feedback text-justify">La dirección ingresada no coinciden</div>
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
			                    <!-- FIN FORMULARIO PARA LA PRIMERA PESTAÑA -->
			                </div>
			                    
			                    
			                <!-- CUERPO DEL MODAL PARA LA SEGUNDA PESTAÑA -->
			                <div class="tab-pane fade" id="nav-masivo" role="tabpanel" aria-labelledby="nav-masivo-tab">
			                    <form action="" method="POST" id="formClienteMasivo" name="formClienteMasivo" enctype="multipart/form-data" class="needs-validation" novalidate>
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
			                            <button type="submit" class="btn btn-red text-light btn-submit">Registrar</button>
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
			<!--FIN MODAL DE REGISTRO-->
			
			<!-- MODAL PARA EDITAR UN USUARIO -->
			<div class="modal fade" data-keyboard="false" data-backdrop="static" id="EditarUsuarioModal">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content">
			
			            <!-- ENCABEZADO DEL MODAL -->
			            <div class="modal-header">
			                <h4 class="modal-title">Edición de Usuarios</h4>
			                <button type="button" class="close btn-close" data-dismiss="modal">&times;</button>
			            </div>
			            <!-- FIN DEL ENCABEZADO DEL MODAL -->
			
			            <!-- FORMULARIO Y CUERPO DEL MODAL -->
			            <form action="" method="POST" id="formClienteEdicion" name="formClienteEdicion" class="needs-validation" novalidate>
	                        <div class="modal-body">
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label for="txtDocumentoEdicion">Número de identificación</label>
	                                    <input type="text" class="form-control" id="txtDocumentoEdicion" name="txtDocumentoEdicion" minlength="8" maxlength="20" pattern="^[0-9]{8,20}$" autocomplete="off" autocapitalize="characters" readonly required>
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label for="txtTipoEdicion">Tipo de documento</label>
	                                    <input type="hidden" class="form-control" id="txtTipoHidden" name="txtTipoHidden" readonly required>
	                                    <select class="custom-select cbo" name="txtTipoEdicion" id="txtTipoEdicion" required>
	                                       	<option value="" selected>Seleccione...</option>
	                                    </select>
	                                    <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
	                                </div>                                    
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label for="txtNombresEdicion">Nombres</label>
	                                    <input type="text" class="form-control" id="txtNombresEdicion" name="txtNombresEdicion" minlength="5" maxlength="15" pattern="^(?!^\s)(?![a-zA-Z]\s)(?!.*\s[a-zA-Z]\s)(?!.*\s[a-zA-Z]$).[a-zA-Z\s]{2,15}$" autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 5 caracteres y solo puede contener letras.</div>
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label for="txtApellidosEdicion">Apellidos</label>
	                                    <input type="text" class="form-control" id="txtApellidosEdicion" name="txtApellidosEdicion" minlength="7" maxlength="25" pattern="^(?!^\s)(?=.*\s.+)(?![a-zA-Z]\s)(?!.*\s[a-zA-Z]\s)(?!.*\s[a-zA-Z]$).[a-zA-Z\s]{7,25}$" autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 10 caracteres y solo puede contener letras.</div>
	                                </div>
	                            </div>
	
	                            <div class="row"> 
	                                <div class="form-group col-md-6">
	                                    <label for="txtTelefonoEdicion">Telefono</label>
	                                    <input type="text" class="form-control" id="txtTelefonoEdicion" name="txtTelefonoEdicion" minlength="10" maxlength="15" pattern="^[0-9]{5,15}$" autocomplete="off" autocapitalize="characters" required>
	                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 10 caracteres y solo puede contener números.</div>
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label for="txtCorreoEdicion">Correo</label>
	                                    <div class="input-group">
	                                        <div class="input-group-prepend">
	                                            <div class="input-group-text">
	                                                <a href="#" class="text-dark"><em class="fas fa-at"></em></a>
	                                            </div>
	                                        </div>
	                                        <input type="email" name="txtCorreoEdicion" id="txtCorreoEdicion" class="form-control" placeholder="E-mail" minlength="8" maxlength="30" pattern="^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$" autocomplete="off" autocapitalize="characters" required>
	                                        <div class="invalid-feedback text-justify">El correo ingresado no es valido</div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-12">
	                                    <label for="txtDireccionEdicion">Dirección</label>
                                     	<input type="text" class="form-control" id="txtDireccionEdicion" name="txtDireccionEdicion" minlength="8" maxlength="30"  autocomplete="off" required></input>
                                        <div class="invalid-feedback text-justify">La dirección ingresada no coinciden</div>
	                                </div>			                                
	                            </div>
	                        </div>
	
	                        <!-- FOOTER DEL MODAL -->
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">Cerrar</button>
	                            <button type="submit" class="btn btn-red text-light btn-submit">Guardar</button>
	                        </div>
	                        <!-- FIN DEL FOOTER DEL MODAL -->
	
	                    </form>
			        </div>
			    </div>
			</div>
			<!-- FIN DEL MODAL PARA EDITAR UN USUARIO -->			
			
        </section>

<%@ include file="../templates/modales.jsp" %>
<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/scripts/scriptsToForm.jsp" %>
<%@ include file="../templates/scripts/scriptsToDataTable.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>