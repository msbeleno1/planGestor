<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
</head>

<body class="d-flex h-100">

    <!-- MENU LATERAL OCULTABLE -->
    <header class="d-sticky mx-0 px-0 sticky-top d-inline-block">
        <aside class="h-100 contenedor-main-menu d-inline-block"> 
            <nav class="main-menu bg-dark py-2" aria-labelledby="menu lateral">
                <ul class="m-0 p-0">
                    <li class="d-block m-0 p-0">
                        <a class="d-table text-decoration-none btn-menu" href="home.jsp">
                            <em class="fa fa-home icono text-center d-table-cell align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Inicio
                            </span>
                        </a>
                    </li>
                    <li class="d-block m-0 p-0">
                        <a class="d-table text-decoration-none btn-sub" id="btn-radicados" href="#">
                            <em class="fa fa-laptop icono d-table-cell text-center align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Radicados
                            </span>
                        </a>
                        <ul id="submenu-1" class="d-none pl-5 list-unstyled mb-3  sub">
                            <hr class="m-1 bg-light">
                            <li class="text-light w-100"><a class="w-100 text-decoration-none" href="radicados_crearRadicados.jsp"><em class="fas fa-plus mr-1"></em>  Crear radicado</a></li>
                            <li class="text-light w-100"><a class="w-100 text-decoration-none" href="radicados_consultarRadicados.jsp"><em class="fas fa-search mr-1"></em>  Consultar radicado</a></li>
                            <li class="text-light w-100"><a class="w-100 text-decoration-none" href="radicados_gestionarRadicados.jsp"><em class="fas fa-edit mr-1"></em>  Gestionar radicado</a></li>
                        </ul>
                    </li>
                    <li class="d-block m-0 p-0">
                        <a class="d-table text-decoration-none btn-menu" href="#">
                        <em class="fa fa-folder-open icono d-table-cell text-center align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Plantillas
                            </span>
                        </a>
                        
                    </li>
                    <li class="d-block m-0 p-0">
                        <a class="d-table text-decoration-none btn-sub" id="btn-cartas" href="#">
                        <em class="fa fa-file-word icono d-table-cell text-center align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Cartas
                            </span>
                        </a>
                        <ul id="submenu-2" class="d-none pl-5 list-unstyled mb-3 sub">
                            <hr class="m-1 bg-light">
                            <li class="text-light w-100"><a class="w-100 text-decoration-none" href="#"><em class="fas fa-search mr-1"></em>  Consultar Carta</a></li>
                            <li class="text-light w-100"><a class="w-100 text-decoration-none" href="#"><em class="fas fa-tasks mr-1"></em>  Tipo de carta</a></li>
                        </ul>
                    </li>
                    <li class="d-block m-0 p-0">
                        <a class="d-table text-decoration-none btn-sub" id="btn-formatos" href="#">
                            <em class="fa fa-file-excel icono d-table-cell text-center align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Formatos
                            </span>
                        </a>
                        <ul id="submenu-3" class="d-none pl-5 list-unstyled mb-3 sub">
                            <hr class="m-1 bg-light">
                            <li class="text-light w-100"><a class="w-100 text-decoration-none" href="#"><em class="fas fa-search mr-1"></em>  Consultar Formulario</a></li>
                            <li class="text-light w-100"><a class="w-100 text-decoration-none" href="#"><em class="fas fa-tasks mr-1"></em>  Tipo de formulario</a></li>
                        </ul>
                    </li>
                    <li class="d-block m-0 p-0">
                        <a class="d-table text-decoration-none btn-menu" href="#">
                            <em class="fa fa-bar-chart-o icono d-table-cell text-center align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                            Informes
                            </span>
                        </a>
                    </li>
                    <li class="d-block m-0 p-0">
                    <a class="d-table text-decoration-none btn-menu" href="usuarios.jsp">
                        <em class="fas fa-users-cog icono d-table-cell text-center align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Usuarios
                            </span>
                        </a>
                    </li>
                    <li class="d-block m-0 p-0">
                        <a class="d-table text-decoration-none btn-menu" href="#">
                            <em class="fa fa-users icono d-table-cell text-center align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Clientes
                            </span>
                        </a>
                    </li>
                    <li class="d-block m-0 p-0">
                        <a class="d-table text-decoration-none btn-menu" href="#">
                            <em class="fa fa-car icono d-table-cell text-center align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Vehículos
                            </span>
                        </a>
                    </li>
                    <li class="d-block m-0 p-0">
                        <a class="d-table text-decoration-none btn-sub" id="btn-facturas" href="#">
                            <em class="fa fa-file-invoice-dollar icono d-table-cell text-center align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Facturas
                            </span>
                        </a>
                        <ul id="submenu-4" class="d-none pl-5 list-unstyled mb-3 sub">
                            <hr class="m-1 bg-light">
                            <li class="text-light w-100"><a class="w-100 text-decoration-none" href="#"><em class="fas fa-plus mr-1"></em>  Crear factura</a></li>
                            <li class="text-light w-100"><a class="w-100 text-decoration-none" href="#"><em class="fas fa-search mr-1"></em>  Consultar factura</a></li>
                        </ul>
                    </li>
                    <li class="d-block m-0 p-0 docs">
                        <a class="d-table text-decoration-none btn-menu" href="#">
                            <em class="fa fa-info icono text-center d-table-cell align-middle"></em>
                            <span class="nav-text d-table-cell align-middle">
                                Documentation
                            </span>
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>        
    </header>
    <!-- FIN DEL MENU LATERAL OCULTABLE -->

    <main class="d-flex h-100 w-100 flex-column">
        <!-- MENU PRINCIPAL HORIZONTAL -->
        <section class="d-sticky position-sticky sticky-top">
            <nav class="navbar navbar-dark bg-dark py-0 px-4" aria-labelledby="menu principal">
                <button class="bg-dark border-0 h-100 justify-content-start" type="button" id="btn-menu">
                    <span class="navbar-toggler-icon icono"></span>
                </button>
                <a class="navbar-brand mr-auto ml-auto" href="home.jsp">
                    <img src="../img/logo.svg" width="70" height="30" class="my-0 mr-auto ml-auto" alt="planGestor-Logo">
                </a>
                <div class="btn-group dropleft">
                    <a class="btn dropdown p-0" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
                        <em class="fas fa-user-circle text-light icono"></em>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <h5 class="dropdown-header w-100 text-center" id="lblNombre">MI NOMBRE</h5>
                        <div class="d-flex w-100 justify-content-center">
                            <small class="pl-0 pr-1">ROL : </small>
                            <small class="p-0" id="lblRol">Supervisor</small>
                        </div>
                        <div class="dropdown-divider w-100"></div>
                        <a class="dropdown-item w-100 text-justify" href="#"><em class="fas fa-cog"></em> Ver datos</a>
                        <a class="dropdown-item w-100 text-justify" href="../index.html"><em class="fas fa-sign-out-alt"></em> Cerrar sesión</a>
                    </div>
                </div>
            </nav>
        </section>
        <!-- FIN DEL MENU PRINCIPAL HORIZONTAL -->