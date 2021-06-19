package controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import modelo.DAO.clienteDAO;
import modelo.DAO.tipoDocumentoDAO;
import modelo.DAO.vehiculoDAO;
import modelo.VO.cargoVO;
import modelo.VO.clienteVO;
import modelo.VO.tipoDocumentoVO;
import modelo.VO.vehiculoVO;
import util.algoritmoSHA256;
import util.funcionesParaFichero;

/**
 * Servlet implementation class vehiculosServlet
 */
@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = { "/vehiculosServlet" })
public class vehiculosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private vehiculoDAO vehDAO;
	private clienteDAO clientDAO;
    private algoritmoSHA256 encriptador;

    @Override
	public void init() throws ServletException {
    	super.init();
    	vehDAO = new vehiculoDAO();
    	clientDAO = new clienteDAO();
		encriptador = new algoritmoSHA256();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
	    response.setContentType("application/json;charset=UTF-8");
	    response.setHeader("Pragma", "No-cache");
	    response.setHeader("Cache-Control", "no-store");
	    
	    String opcion = request.getParameter("opcion");
	    
	    JsonObject jsonResponse = new JsonObject();
	    
	    if(opcion.equals("buscar")) {
	    	String[] documento = new String[] {request.getParameter("txtDocumentoBuscar")};
	    	
	    	if(funcionesParaFichero.validarCliente(documento, "documento")) {
	    		int idTipoDoc = Integer.parseInt(request.getParameter("cboTipoBuscar"));
	    		clienteVO cliente = clientDAO.buscarCliente(Integer.parseInt(documento[0]), idTipoDoc);
	    		
	    		if(cliente.getNombre() != null) {
	    			JsonObject data = new JsonObject();
	    			data.addProperty("Documento", cliente.getDocumento());
		    		data.addProperty("Nombre", cliente.getNombre()+" "+cliente.getApellido());
		    		data.addProperty("Tipo", cliente.getTipoDocumento());
	    			jsonResponse.addProperty("informacion", "exito");
		    		jsonResponse.addProperty("datos", data.toString());
	    		}
	    		else {
	    			jsonResponse.addProperty("informacion", "error");
		    		jsonResponse.addProperty("datos", "No existe un cliente en el sistema con ese número de identificación.");
	    		}
	    	}
	    	else {
	    		jsonResponse.addProperty("informacion", "error");
	    		jsonResponse.addProperty("datos", "El campo debe tener mínimo 8 caracteres y solo puede contener números.");
	    	}
	    }
	    else if(opcion.equals("crear") || opcion.equals("editar")) {
	    	String[] datosVehiculo = new String[] {request.getParameter("txtPlaca"),
	    									request.getParameter("txtChasis"),
	    									request.getParameter("txtMotor"),
	    									request.getParameter("txtFabricante"),
	    									request.getParameter("txtLinea"),
	    									request.getParameter("txtModelo"),
	    									request.getParameter("txtDocumentoTemp"),
	    									request.getParameter("cboTipoModalVehiculo")};
	    	
	    	if(funcionesParaFichero.validarVehiculo(datosVehiculo, "todo")) {
	    		vehiculoVO vehiculo = new vehiculoVO();
	    		vehiculo.setPlaca(datosVehiculo[0]);
	    		vehiculo.setChasis(datosVehiculo[1]);
	    		vehiculo.setMotor(datosVehiculo[2]);
	    		vehiculo.setFabricante(datosVehiculo[3]);
	    		vehiculo.setLinea(datosVehiculo[4]);
	    		vehiculo.setModelo(datosVehiculo[5]);
	    		vehiculo.setPropietario(Integer.parseInt(datosVehiculo[6]));
	    		int tipoDocumento = Integer.parseInt(datosVehiculo[7]);
	    		String resultado = null;
	    		
	    		if(opcion.equals("crear")) {
	    			resultado = vehDAO.crearVehiculo(vehiculo, tipoDocumento);
		    		
		    		if(resultado.equalsIgnoreCase("CREADO")) {
		    			jsonResponse.addProperty("datos", "La placa <strong>"+vehiculo.getPlaca().toUpperCase()+"</strong> fue creada correctamente");
		    			jsonResponse.addProperty("informacion", "exito");
		    		}
		    		else {
		    			jsonResponse.addProperty("datos", "La placa <strong>"+vehiculo.getPlaca().toUpperCase()+"</strong> no pudo ser creada");
		    			jsonResponse.addProperty("informacion", "error");
		    		}
	    		}
	    		else {
	    			resultado = vehDAO.actualizarVehiculo(vehiculo, tipoDocumento);
		    		
		    		if(resultado.equalsIgnoreCase("ACTUALIZADO")) {
		    			jsonResponse.addProperty("datos", "La placa <strong>"+vehiculo.getPlaca().toUpperCase()+"</strong> fue actualizada correctamente");
		    			jsonResponse.addProperty("informacion", "exito");
		    		}
		    		else {
		    			jsonResponse.addProperty("datos", "La placa <strong>"+vehiculo.getPlaca().toUpperCase()+"</strong> no pudo ser actualizada");
		    			jsonResponse.addProperty("informacion", "error");
		    		}
	    		}
	    	}
	    	else {
	    		jsonResponse.addProperty("datos", "Hubo problemas al tratar los datos de la placa <strong>"+datosVehiculo[0].toUpperCase()+"</strong>.");
    			jsonResponse.addProperty("informacion", "error");
	    	}
	    	
	    }
	    else if(opcion.equals("masiva")){
	    	// OBTENEMOS LOS DATOS ENVIADOS
	        Part filePart = request.getPart("file"); // OBTENEMOS EL ARCHIVO ENVIADO DESDE EL FORMULARIO SEGÚN EL DATAFORM
	        InputStream fileContent = filePart.getInputStream(); // OBTENEMOS EL CONJUNTO DE BYTES QUE COMPONEN EL CSV
	        
	        
	        // CONVERTIMOS EL ARCHIVO DE DATOS A UN LISTA DE DATOS SEGÚN LOS DATOS INGRESADOS
	        List<String[]> filasCsv = funcionesParaFichero.leerCsv(fileContent);
	        if(funcionesParaFichero.verificarFichero(filasCsv, "vehiculo")) {
	        	JsonArray datos = new JsonArray();
	        	for(String[] columna : filasCsv) {
	        		vehiculoVO vehiculo = new vehiculoVO();
	        		JsonObject obj = new JsonObject();
	        		
	        		vehiculo.setPlaca(columna[0]);
	        		vehiculo.setChasis(columna[1]);
	        		vehiculo.setMotor(columna[2]);
	        		vehiculo.setFabricante(columna[3]);
	        		vehiculo.setLinea(columna[4]);
	        		vehiculo.setModelo(columna[5]);
	        		vehiculo.setPropietario(Integer.parseInt(columna[6]));
	        		int tipoDocumento = Integer.parseInt(columna[7]);
	        		
	        		obj.addProperty("Placa", vehiculo.getPlaca());
	        		obj.addProperty("Fabricante", vehiculo.getFabricante());
	        		String propietario = "Sin especificar";
	        		
	        		List<clienteVO> listaClientes = clientDAO.verTodosClientes();
	        		for(clienteVO cliente : listaClientes)
	        			if(cliente.getDocumento() == vehiculo.getPropietario())
	        				propietario = cliente.getNombre()+" "+cliente.getApellido();

	        		obj.addProperty("Propietario", propietario);
	        		String resultado = vehDAO.crearVehiculo(vehiculo, tipoDocumento);
	        		obj.addProperty("Observaciones", resultado);
	        		datos.add(obj);
	        	}
	        	jsonResponse.addProperty("informacion", "exito");
	    		jsonResponse.addProperty("datos",datos.toString());
	        }
	        else {
	        	jsonResponse.addProperty("informacion", "error");
	    		jsonResponse.addProperty("datos","null");
	        }
	    }
	    else if(opcion.equals("crear")) {
	    	String[] datosVehiculo = new String[] {request.getParameter("txtPlaca"),
	    									request.getParameter("txtChasis"),
	    									request.getParameter("txtMotor"),
	    									request.getParameter("txtFabricante"),
	    									request.getParameter("txtLinea"),
	    									request.getParameter("txtModelo"),
	    									request.getParameter("txtDocumentoTemp"),
	    									request.getParameter("cboTipoModalVehiculo")};
	    	
	    	if(funcionesParaFichero.validarVehiculo(datosVehiculo, "todo")) {
	    		vehiculoVO vehiculo = new vehiculoVO();
	    		vehiculo.setPlaca(datosVehiculo[0]);
	    		vehiculo.setChasis(datosVehiculo[1]);
	    		vehiculo.setMotor(datosVehiculo[2]);
	    		vehiculo.setFabricante(datosVehiculo[3]);
	    		vehiculo.setLinea(datosVehiculo[4]);
	    		vehiculo.setModelo(datosVehiculo[5]);
	    		vehiculo.setPropietario(Integer.parseInt(datosVehiculo[6]));
	    		int tipoDocumento = Integer.parseInt(datosVehiculo[7]);
	    		
	    		String resultado = vehDAO.crearVehiculo(vehiculo, tipoDocumento);
	    		
	    		if(resultado.equalsIgnoreCase("CREADO")) {
	    			jsonResponse.addProperty("datos", vehiculo.getPlaca().toUpperCase());
	    			jsonResponse.addProperty("informacion", "exito");
	    		}
	    		else {
	    			jsonResponse.addProperty("datos", "La placa <strong>"+vehiculo.getPlaca().toUpperCase()+"</strong> no pudo ser creada");
	    			jsonResponse.addProperty("informacion", "error");
	    		}
	    	}
	    	else {
	    		jsonResponse.addProperty("datos", "La placa <strong>"+datosVehiculo[0].toUpperCase()+"</strong> no pudo ser creada");
    			jsonResponse.addProperty("informacion", "error");
	    	}
	    	
	    }
	    jsonResponse.addProperty("dataTable", refrescarTabla().toString());
	    jsonResponse.addProperty("select", cargarTiposDocumento().toString());
    	out.print(jsonResponse);
	    out.flush();
	}
    
    private JsonArray refrescarTabla() {
		
		List<vehiculoVO> listaVehiculos = vehDAO.verTodosVehiculos();
		JsonArray miJson = new JsonArray(listaVehiculos.size());
		for(vehiculoVO vehiculo : listaVehiculos) {
			JsonObject obj = new JsonObject();
			obj.addProperty("Placa", vehiculo.getPlaca());
			obj.addProperty("Marca", vehiculo.getLinea()+" "+vehiculo.getModelo());
			obj.addProperty("Chasis", vehiculo.getChasis());
			obj.addProperty("Motor", vehiculo.getMotor());
			obj.addProperty("Fabricante", vehiculo.getFabricante());
			obj.addProperty("Linea", vehiculo.getLinea());
			obj.addProperty("Modelo", vehiculo.getModelo());
			List<clienteVO> clientes = clientDAO.verTodosClientes();
			for(clienteVO cliente : clientes) {
				if(cliente.getId() == vehiculo.getPropietario()) {
					obj.addProperty("DocumentoC", cliente.getDocumento());
					obj.addProperty("NombreC", cliente.getNombre() + " "+ cliente.getApellido());
					obj.addProperty("Tipo", cliente.getTipoDocumento());
					break;
				}
			}
			miJson.add(obj);
		}
		return miJson;
	}
	
    private JsonArray cargarTiposDocumento() {
    	tipoDocumentoDAO tipoDAO = new tipoDocumentoDAO();
		List<tipoDocumentoVO> listaTipos = tipoDAO.verTodosTipos();
		JsonArray miJsonArr = new JsonArray(listaTipos.size());
		for(tipoDocumentoVO tipo : listaTipos) {
			JsonObject obj = new JsonObject();
			obj.addProperty("Id", tipo.getId());
			obj.addProperty("Siglas", tipo.getSigla());
			miJsonArr.add(obj);
		}
		return miJsonArr;
	}
    
}
