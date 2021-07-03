<!-- MODAL PARA INFORMAR QUE EL USUARIO SE CRE� CON EXITO -->
<div class="modal fade" id="modalSuccess" tabindex="-1" aria-labelledby="titleModalSuccess" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titleModalSuccess">Operaci�n exitosa</h5>
                <button type="button" class="close btn-close-info" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body d-flex flex-column align-items-center w-100">
                <em class="fas fa-check-circle text-success" style="font-size: 10rem;"></em>
                <span id="lblSuccess" class="text-center">El usuario <strong> NICKNAME </strong> fue creado con �xito</span>
            </div>
        </div>
    </div>
</div>
<!-- FIN DEL MODAL PARA INFORMAR QUE EL USUARIO SE CRE� CON EXITO -->

<!-- MODAL PARA INFORMAR QUE EL USUARIO NO SE PUDO CREAR -->
<div class="modal fade" id="modalError" tabindex="-1" aria-labelledby="titleModalError" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titleModalError">Error en la operaci�n</h5>
                <button type="button" class="close btn-close-info" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body d-flex flex-column align-items-center w-100">
                <em class="fas fa-exclamation-triangle text-danger" style="font-size: 10rem;"></em>
                <span id="lblError" class="text-center">El usuario <strong> NICKNAME </strong> ya se encuentra registrado en el sistema</span>
            </div>
        </div>
    </div>
</div>
<!-- MODAL PARA INFORMAR QUE EL USUARIO NO SE PUDO CREAR -->

 <!-- MODAL PARA INFORMAR QUE LOS USUARIOS MASIVOS, SE CREARON CON EXITO -->
<div class="modal fade" id="modalSuccessMasiva" tabindex="-1" aria-labelledby="titleModalSuccessMasiva" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titleModalSuccessMasiva">Operaci�n exitosa</h5>
                <button type="button" class="close btn-close-info" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div>
                    <p class="lead mb-2">El proces� finaliz� con los siguiente resultados:</p>
                </div>
                <table id="table-masiva" aria-describedby="En esta tabla se mostrar�n los resultados enviados por el servidor cuando se utiliza una funci�n masiva" class="table table-bordered table-hover" style="width: 100%">
                        <thead class="thead-dark">
                            <tr class="text-center text-nowrap align-middle" id="encabezados">
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- FIN DEL MODAL PARA INFORMAR QUE LOS USUARIOS MASIVOS, SE CREARON CON EXITO -->