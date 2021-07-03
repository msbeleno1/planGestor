<%@ include file="../templates/header.jsp" %>
<%@ include file="../templates/menu.jsp" %>

<!--CONTENEDOR PRINCIPAL-->
<section class="container-fluid mr-auto ml-auto mt-auto mb-auto pt-2">

    <!-- MIGAJAS DE PAN -->
    <nav class="p-0 m-0" aria-label="breadcrumb">
        <ol class="breadcrumb bg-white p-0 mt-0 justify-content-end">
          <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="home.jsp">/ Inicio</a></li>
          <li class="breadcrumb-item"><a class="text-decoration-none text-danger" href="radicados.jsp"> Radicados</a></li>
          <li class="breadcrumb-item active" aria-current="page"> Gestionar radicados</li>
        </ol>
    </nav>
    <!-- FIN DE LAS MIGAJAS DE PAN -->

    <h3 class="mb-4">Gestión de solicitudes propias</h3>
    <div class="d-flex justify-content-between p-0 my-2">
        <div class="form-group d-inline-flex m-0">
            <label for="example_length">Mostrar </label>
            <select name="example_length" aria-controls="example" class="mx-2 custom-select custom-select-sm form-control form-control-sm">
                <option value="10">10</option>
                <option value="25">25</option>
                <option value="50">50</option>
                <option value="100">100</option>
            </select>
            <label for="example_length"> registros</label>
        </div>
        <div class="form-group d-inline-flex m-0">
            <label for="txtSearch">Buscar:</label>
            <input type="search" id="txtSearch" name="txtSearch" class="ml-2 form-control form-control-sm" placeholder="" aria-controls="example">
        </div>
    </div>
    <div class="table-responsive table-gestionar">
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
                    <td><a href="#">...</a></td>
                    <td>Tiger Nixon</td>
                    <td>System Architect</td>
                    <td>Edinburgh</td>
                    <td>61</td>
                    <td>2011/04/25</td>
                    <td>$320,800</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Garrett Winters</td>
                    <td>Accountant</td>
                    <td>Tokyo</td>
                    <td>63</td>
                    <td>2011/07/25</td>
                    <td>$170,750</td>
                    <td>Julian Perez</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Ashton Cox</td>
                    <td>Junior Technical Author</td>
                    <td>San Francisco</td>
                    <td>66</td>
                    <td>2009/01/12</td>
                    <td>$86,000</td>
                    <td>Pedro Linares</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Cedric Kelly</td>
                    <td>Senior Javascript Developer</td>
                    <td>Edinburgh</td>
                    <td>22</td>
                    <td>2012/03/29</td>
                    <td>$433,060</td>
                    <td>Angel Betancur</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Airi Satou</td>
                    <td>Accountant</td>
                    <td>Tokyo</td>
                    <td>33</td>
                    <td>2008/11/28</td>
                    <td>$162,700</td>
                    <td>Luis Gerardo</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Brielle Williamson</td>
                    <td>Integration Specialist</td>
                    <td>New York</td>
                    <td>61</td>
                    <td>2012/12/02</td>
                    <td>$372,000</td>
                    <td>Thom Jhonson</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Herrod Chandler</td>
                    <td>Sales Assistant</td>
                    <td>San Francisco</td>
                    <td>59</td>
                    <td>2012/08/06</td>
                    <td>$137,500</td>
                    <td>Federico Valverde</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Rhona Davidson</td>
                    <td>Integration Specialist</td>
                    <td>Tokyo</td>
                    <td>55</td>
                    <td>2010/10/14</td>
                    <td>$327,900</td>
                    <td>Pepe Ramirez</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Colleen Hurst</td>
                    <td>Javascript Developer</td>
                    <td>San Francisco</td>
                    <td>39</td>
                    <td>2009/09/15</td>
                    <td>$205,500</td>
                    <td>Adrian Lopez</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Sonya Frost</td>
                    <td>Software Engineer</td>
                    <td>Edinburgh</td>
                    <td>23</td>
                    <td>2008/12/13</td>
                    <td>$103,600</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Jena Gaines</td>
                    <td>Office Manager</td>
                    <td>London</td>
                    <td>30</td>
                    <td>2008/12/19</td>
                    <td>$90,560</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Quinn Flynn</td>
                    <td>Support Lead</td>
                    <td>Edinburgh</td>
                    <td>22</td>
                    <td>2013/03/03</td>
                    <td>$342,000</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Charde Marshall</td>
                    <td>Regional Director</td>
                    <td>San Francisco</td>
                    <td>36</td>
                    <td>2008/10/16</td>
                    <td>$470,600</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Haley Kennedy</td>
                    <td>Senior Marketing Designer</td>
                    <td>London</td>
                    <td>43</td>
                    <td>2012/12/18</td>
                    <td>$313,500</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Tatyana Fitzpatrick</td>
                    <td>Regional Director</td>
                    <td>London</td>
                    <td>19</td>
                    <td>2010/03/17</td>
                    <td>$385,750</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Michael Silva</td>
                    <td>Marketing Designer</td>
                    <td>London</td>
                    <td>66</td>
                    <td>2012/11/27</td>
                    <td>$198,500</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Paul Byrd</td>
                    <td>Chief Financial Officer (CFO)</td>
                    <td>New York</td>
                    <td>64</td>
                    <td>2010/06/09</td>
                    <td>$725,000</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Gloria Little</td>
                    <td>Systems Administrator</td>
                    <td>New York</td>
                    <td>59</td>
                    <td>2009/04/10</td>
                    <td>$237,500</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Bradley Greer</td>
                    <td>Software Engineer</td>
                    <td>London</td>
                    <td>41</td>
                    <td>2012/10/13</td>
                    <td>$132,000</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Dai Rios</td>
                    <td>Personnel Lead</td>
                    <td>Edinburgh</td>
                    <td>35</td>
                    <td>2012/09/26</td>
                    <td>$217,500</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Jenette Caldwell</td>
                    <td>Development Lead</td>
                    <td>New York</td>
                    <td>30</td>
                    <td>2011/09/03</td>
                    <td>$345,000</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Yuri Berry</td>
                    <td>Chief Marketing Officer (CMO)</td>
                    <td>New York</td>
                    <td>40</td>
                    <td>2009/06/25</td>
                    <td>$675,000</td>
                    <td>Pepito</td>
                </tr>
                <tr>
                    <td><a href="#">...</a></td>
                    <td>Caesar Vance</td>
                    <td>Pre-Sales Support</td>
                    <td>New York</td>
                    <td>21</td>
                    <td>2011/12/12</td>
                    <td>$106,450</td>
                    <td>Pepito</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="d-flex justify-content-between">
        <spam class="dataTables_info" id="example_info" role="status" aria-live="polite">Mostrando <strong>1</strong> a <strong>10</strong> de 57 registros</spam>
        <ul class="pagination">
            <li class="paginate_button page-item previous disabled" id="example_previous">
                <a href="#" aria-controls="example" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
            </li>
            <li class="paginate_button page-item bg-red">
                <a href="#" aria-controls="example" data-dt-idx="1" tabindex="0" class="page-link">1</a>
            </li>
            <li class="paginate_button page-item ">
                <a href="#" aria-controls="example" data-dt-idx="2" tabindex="0" class="page-link">2</a>
            </li>
            <li class="paginate_button page-item ">
                <a href="#" aria-controls="example" data-dt-idx="3" tabindex="0" class="page-link">3</a>
            </li>
            <li class="paginate_button page-item ">
                <a href="#" aria-controls="example" data-dt-idx="4" tabindex="0" class="page-link">4</a>
            </li>
            <li class="paginate_button page-item ">
                <a href="#" aria-controls="example" data-dt-idx="5" tabindex="0" class="page-link">5</a>
            </li>
            <li class="paginate_button page-item ">
                <a href="#" aria-controls="example" data-dt-idx="6" tabindex="0" class="page-link">6</a>
            </li>
            <li class="paginate_button page-item next" id="example_next">
                <a href="#" aria-controls="example" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
            </li>
        </ul>
    </div>

</section>
  

<%@ include file="../templates/footer.jsp" %>
<%@ include file="../templates/cierreHtml.jsp" %>