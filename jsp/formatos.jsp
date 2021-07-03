<%@ include file="../templates/header.jsp" %>
<%@ include file="../templates/menu.jsp" %>

<!--CONTENEDOR PRINCIPAL-->
<section class="container-fluid mr-auto ml-auto mt-auto mb-auto pt-2">

    <!-- MIGAJAS DE PAN -->
    <nav class="p-0 m-0" aria-label="breadcrumb">
        <ol class="breadcrumb bg-white p-0 mt-0 justify-content-end">
          <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="home.jsp">/ Inicio</a></li>
          <li class="breadcrumb-item active" aria-current="page"> Formatos</li>
        </ol>
    </nav>
    <!-- FIN DE LAS MIGAJAS DE PAN -->

    <!-- CARTAS DE OPCIONES -->
    <div class="row justify-content-between">
        <div class="col-sm-6">
            <a class="card text-decoration-none mr-auto ml-auto" style="width: 18rem;" href="#">
                <em class="fas fa-search card-img-top text-center mt-1" style="font-size: 10rem;"></em>
                <div class="card-body">
                    <h5 class="card-title text-center">Consultar formato</h5>
                    <p class="card-text text-justify">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
            </a>
        </div>
        <div class="col-sm-6">
            <a class="card text-decoration-none mr-auto ml-auto" style="width: 18rem;" href="#">
                <em class="fas fa-tasks card-img-top text-center mt-1" style="font-size: 10rem;"></em>
                <div class="card-body">
                    <h5 class="card-title text-center">Administrar tipo de formato</h5>
                    <p class="card-text text-justify">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
            </a>
        </div>
    </div>
    <!-- FIN DE LAS CARTAS DE OPCIONES -->

    <div class="container mt-4">
        <p class="lead text-justify">Breve explicacion acerca de la opción de formato....Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eum ullam rerum, cumque recusandae reprehenderit dolor vitae est aliquam hic. Ipsam, officia laborum! Odio earum ducimus assumenda tenetur. Quibusdam, impedit laudantium!</p>
    </div>

</section>
  

<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>