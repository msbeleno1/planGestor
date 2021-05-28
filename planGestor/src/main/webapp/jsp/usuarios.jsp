<%@ include file="../templates/header.jsp" %>
<%@ include file="../templates/links/linksToDataTable.jsp" %>
<%@ include file="../templates/menu.jsp" %>

<!--CONTENEDOR PRINCIPAL-->
        <section class="container-fluid mr-auto ml-auto mt-auto mb-auto pt-2">

            <!-- MIGAJAS DE PAN -->
            <nav class="p-0 m-0" aria-label="breadcrumb">
                <ol class="breadcrumb bg-white p-0 mt-0 justify-content-end">
                    <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="#">/ Inicio</a></li>
                    <li class="breadcrumb-item active" aria-current="page"> Usuarios</li>
                </ol>
            </nav>
            <!-- FIN DE LAS MIGAJAS DE PAN -->

            <!-- TITULO -->
            <h2 class="mb-4">Consultar usuarios</h2>
            <!-- FIN DEL TITULO -->

            <div class="row">
            	<div class="col-lg-12">
            		<!--TABLA DE USUARIOS-->
	                <table id="tablaUsuarios" class="table table-hover table-bordered display nowrap" aria-describedby="Tabla de usuarios">
	
	                    <!-- ENCABEZADOS DE LA TABLA -->
	                    <thead class="thead-dark">
	                      <tr>
	                        <th scope="col" class="text-center text-nowrap align-middle">Documento</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Nombre</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Estado</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Usuario</th>
	                        <th scope="col" class="text-center text-nowrap align-middle">Fecha Ult. Login</th>
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
                <button type="button" class="btn btn-red mr-2 my-1 text-light" data-toggle="modal" data-target="#registroUsuarioModal"><em class="fas fa-plus text-light"></em>  Crear usuario</button>
                <button type="button" class="btn btn-red ml-2 my-1 text-light"><em class="fas fa-download text-light"></em>  Descargar información</button>
            </div>
            <!--FIN DE GRUPO DE BOTONES-->
			
			<!--Inicio Modal registro-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static" id="registroUsuarioModal">
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
			
			                <h5 class="modal-title mr-auto ml-auto" id="TitleModalRegistro">Registro de Usuarios</h5>
			
			                <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <!-- Fin del Modal Header -->                        
			                
			            <!-- CONTENIDO DE LAS PESTAÑAS -->
			            <div class="tab-content" id="nav-tabContent">
			                <div class="tab-pane fade show active" id="nav-individual" role="tabpanel" aria-labelledby="nav-individual-tab">
			                        
			                    <!-- FORMULARIO Y CUERPO DE LA PRIMERA PESTAÑA -->
			                    <form action="" method="POST" id="formRegistroIndividual" name="formRegistroIndividual" class="needs-validation" novalidate>
			                        <div class="modal-body">
			                            <div class="row">
			                                <div class="form-group col-md-6">
			                                    <label for="txtDocumentoRegistro">Documento de identidad</label>
			                                    <input type="text" class="form-control" id="txtDocumentoRegistro" name="txtDocumentoRegistro" minlength="8" maxlength="20" pattern="^[0-9]{8,20}$" autocomplete="off" autocapitalize="characters" required>
			                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 8 caracteres y solo puede contener números.</div>
			                                </div>
			                                <div class="form-group col-md-6">
			                                    <label for="txtCargoRegistro">Cargo</label>
			                                    <select class="custom-select" name="cboCargoRegistro" id="cboCargoRegistro" required>
			                                        <option value="" selected>Seleccione...</option>
			                                        <option value="ASESOR">Asesor</option>
			                                        <option value="SUPERVISOR">Supervisor</option>
			                                        <option value="ADMINISTRADOR">Administrador</option>
			                                    </select>
			                                    <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
			                                </div>                                    
			                            </div>
			                            <div class="row">
			                                <div class="form-group col-md-6">
			                                    <label for="txtNombresRegistro">Nombres</label>
			                                    <input type="text" class="form-control" id="txtNombresRegistro" name="txtNombresRegistro" minlength="5" maxlength="15" pattern="^[A-Za-z ]{5,15}$" autocomplete="off" autocapitalize="characters" required>
			                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 5 caracteres y solo puede contener letras.</div>
			                                </div>
			                                <div class="form-group col-md-6">
			                                    <label for="txtApellidosRegistro">Apellidos</label>
			                                    <input type="text" class="form-control" id="txtApellidosRegistro" name="txtApellidosRegistro" minlength="10" maxlength="25" pattern="^[A-Za-z ]{10,25}$" autocomplete="off" autocapitalize="characters" required>
			                                    <div class="invalid-feedback text-justify">El campo debe tener mínimo 10 caracteres y solo puede contener letras.</div>
			                                </div>
			                            </div>
			
			                            <div class="row">
			                                <div class="form-group col-md-6">
			                                    <label for="txtClaveRegistro1">Contraseña</label>
			                                    <div class="input-group groupPassword">
			                                        <input type="password" class="form-control" id="txtClaveRegistro1" name="txtClaveRegistro1" minlength="8" maxlength="16" pattern="^(?=.*\d)(?=.*[\u0021-\u002f\u003a-\u0040\u005e-\u005f])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$" autocomplete="off" required></input>
			                                        <div class="input-group-prepend bg-white border-left-0">
			                                            <div class="input-group-text bg-white border-left-0">
			                                                <a href="#" class="text-dark bg-white border-left-0"><em class="fas fa-eye-slash"></em></a>
			                                            </div>
			                                        </div>
			                                        <div class="invalid-feedback text-justify">La contraseña debe tener entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula, al menos una mayúscula y al menos un símbolo.</div>
			                                    </div>
			                                </div>
			                                <div class="form-group col-md-6">
			                                    <label for="txtClaveRegistro2">Confirmar Contraseña</label>
			                                    <div class="input-group groupPassword">
			                                        <input type="password" class="form-control" id="txtClaveRegistro2" name="txtClaveRegistro2" minlength="8" maxlength="16" pattern="^()$" autocomplete="off" required></input>
			                                        <div class="input-group-prepend bg-white border-left-0">
			                                            <div class="input-group-text bg-white border-left-0">
			                                                <a href="#" class="text-dark bg-white border-left-0"><em class="fas fa-eye-slash"></em></a>
			                                            </div>
			                                        </div>
			                                        <div class="invalid-feedback text-justify">Las contraseñas ingresadas no coinciden</div>
			                                    </div>
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
			                        </div>
			
			                        <!-- FOOTER DEL MODAL -->
			                        <div class="modal-footer">
			                            <input type="button" class="btn btn-secondary btn-close" data-dismiss="modal" value="Cerrar">
			                            <input type="submit" class="btn btn-red text-light btn-submit" value="Registrar">
			                        </div>
			                        <!-- FIN DEL FOOTER DEL MODAL -->
			
			                    </form>
			                    <!-- FIN FORMULARIO PARA LA PRIMERA PESTAÑA -->
			                </div>
			                    
			                    
			                <!-- CUERPO DEL MODAL PARA LA SEGUNDA PESTAÑA -->
			                <div class="tab-pane fade" id="nav-masivo" role="tabpanel" aria-labelledby="nav-masivo-tab">
			                    <form action="" method="POST" id="formRegistroMasivo" name="formRegistroMasivo" enctype="multipart/form-data" class="needs-validation" novalidate>
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
			            <form action="" method="POST" id="formEdicion" name="formEdicion" class="needs-validation" novalidate>
			                <div class="modal-body">
			                    <div class="row">
			                        <div class="form-group col-md-6">
			                            <label for="txtDocumentoEdicion">Documento de identidad</label>
			                            <input type="text" class="form-control" id="txtDocumentoEdicion" name="txtDocumentoEdicion" minlength="8" maxlength="20" pattern="^[0-9]{8,20}$" autocomplete="off" autocapitalize="characters" readonly required>
			                            <div class="invalid-feedback text-justify">El campo debe tener mínimo 8 caracteres y solo puede contener números.</div>
			                        </div>
			                        <div class="form-group col-md-6">
			                            <label for="txtCargoEdicion">Cargo</label>
			                            <select class="custom-select" name="txtCargoEdicion" id="txtCargoEdicion" required>
			                                <option value="" selected>Seleccione...</option>
			                                <option value="ASESOR">Asesor</option>
			                                <option value="SUPERVISOR">Supervisor</option>
			                                <option value="ADMINISTRADOR">Administrador</option>
			                            </select>
			                            <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
			                        </div>                                    
			                    </div>
			                    <div class="row">
			                        <div class="form-group col-md-6">
			                            <label for="txtNombresEdicion">Nombres</label>
			                            <input type="text" class="form-control" id="txtNombresEdicion" name="txtNombresEdicion" minlength="5" maxlength="15" pattern="^[A-Za-z ]{5,15}$" autocomplete="off" autocapitalize="characters" required>
			                            <div class="invalid-feedback text-justify">El campo debe tener mínimo 5 caracteres y solo puede contener letras.</div>
			                        </div>
			                        <div class="form-group col-md-6">
			                            <label for="txtApellidosEdicion">Apellidos</label>
			                            <input type="text" class="form-control" id="txtApellidosEdicion" name="txtApellidosEdicion" minlength="10" maxlength="25" pattern="^[A-Za-z ]{10,25}$" autocomplete="off" autocapitalize="characters" required>
			                            <div class="invalid-feedback text-justify">El campo debe tener mínimo 10 caracteres y solo puede contener letras.</div>
			                        </div>
			                    </div>
			
			                    <div class="row">
			                        <div class="form-group col-md-6">
			                            <label for="txtUsuarioEdicion">Usuario</label>
			                            <input type="text" class="form-control" id="txtUsuarioEdicion" name="txtUsuarioEdicion" disabled></input>
			                        </div>
			                        <div class="form-group col-md-6">
			                            <label for="txtClaveEdicion">Estado</label>
			                            <select class="custom-select" name="cboEstadoEdicion" id="txtEstadoEdicion" required>
			                                <option value="" selected>Seleccione...</option>
			                                <option value="ALTA">Alta</option>
			                                <option value="BAJA">Baja</option>
			                                <option value="BLOQUEADO">Bloqueado</option>
			                            </select>
			                            <div class="invalid-feedback text-justify">Debe escoger una de las opciones disponibles.</div>
			                        </div>
			                    </div>
			
			                    <div class="row">
			                        <div class="form-group col-md-6">
			                            <label for="txtTelefonoEdicion">Telefono</label>
			                            <input type="text" class="form-control" id="txtTelefonoEdicion" name="txtTelefonoEdicion" minlength="5" maxlength="15" pattern="^[0-9]{5,15}$" autocomplete="off" autocapitalize="characters" required>
			                            <div class="invalid-feedback text-justify">El campo debe tener mínimo 5 caracteres y solo puede contener números.</div>
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
			                </div>
			                <!-- FINAL FORMULARIO Y CUERPO DEL MODAL -->
			
			                <!-- FOOTER DEL MODAL -->
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">Cerrar</button>
			                    <button type="submit" class="btn btn-red text-light btn-submit">Editar</button>
			                </div>
			                <!-- FIN DEL FOOTER DEL MODAL -->
			            </form>
			        </div>
			    </div>
			</div>
			<!-- FIN DEL MODAL PARA EDITAR UN USUARIO -->
			
			<!-- MODAL PARA PREGUNTAR SI DESEA RESTABLECER LA CLAVE EL USUARIO -->
			<div class="modal fade" id="modalResetUsuario" data-keyboard="false" data-backdrop="static" tabindex="-1" aria-labelledby="#titleModalReset" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="titleModalReset">Restablecer contraseña</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            
			            <!-- FORMULARIO Y CUERPO DEL MODAL -->
			            <form action="" method="POST" id="formReset" name="formReset" class="needs-validation" novalidate>
			                <div class="modal-body d-flex flex-column align-items-center w-100">
			                    <em class="fas fa-question-circle text-warning" style="font-size: 10rem;"></em>
			                    <span class="lead text-center">Está seguro que desea restablecer la contraseña del usuario <strong id="lblUsuarioReset">NICKNAME</strong>?</span>
			                    <input type="hidden" class="form-control" id="txtDocumentoHidenDelet" name="txtDocumentoHidenDelet" required>
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
			<!-- FIN DEL MODAL PARA PREGUNTAR SI DESEA RESTABLECER LA CLAVE EL USUARIO -->
        </section>

<%@ include file="../templates/modales.jsp" %>
<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/scripts/scriptsToForm.jsp" %>
<%@ include file="../templates/scripts/scriptsToDataTable.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>