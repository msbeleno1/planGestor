package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import modelo.DAO.clasificacionDAO;
import modelo.DAO.clienteDAO;
import modelo.DAO.radicadoDAO;
import modelo.DAO.tipoDocumentoDAO;
import modelo.DAO.tipoRadicadoDAO;
import modelo.DAO.vehiculoDAO;
import modelo.VO.clasificacionVO;
import modelo.VO.clienteVO;
import modelo.VO.tipoDocumentoVO;
import modelo.VO.tipoRadicadoVO;
import modelo.VO.vehiculoVO;
import util.funcionesParaFichero;

/**
 * Servlet implementation class radicadosServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/radicadosServlet" })
public class radicadosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private clienteDAO clientDAO;
	private radicadoDAO radicadDAO;

	@Override
	public void init() throws ServletException {
		clientDAO = new clienteDAO();
		radicadDAO = new radicadoDAO();
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
	    response.setContentType("application/json;charset=UTF-8");
	    response.setHeader("Pragma", "No-cache");
	    response.setHeader("Cache-Control", "no-store");
	    
	    String opcion = request.getParameter("opcion");
	    
	    JsonObject jsonResponse = new JsonObject();
	    
	    if(opcion.equalsIgnoreCase("buscarCliente")) {
	    	String[] documento = new String[] {request.getParameter("txtDocumentoBuscar")};
	    	
	    	if(funcionesParaFichero.validarCliente(documento, "documento")) {
	    		int idTipoDoc = Integer.parseInt(request.getParameter("cboTipoBuscar"));
	    		clienteVO cliente = clientDAO.buscarCliente(Integer.parseInt(documento[0]), idTipoDoc);
	    		tipoDocumentoDAO tipoDocDAO = new tipoDocumentoDAO();
	    		List<tipoDocumentoVO> listaTiposDoc = tipoDocDAO.verTodosTipos();
	    		
	    		
	    		if(cliente.getNombre() != null) {
	    			JsonObject data = new JsonObject();
	    			data.addProperty("Documento", cliente.getDocumento());
		    		data.addProperty("Nombre", cliente.getNombre()+" "+cliente.getApellido());
		    		data.addProperty("Tipo", cliente.getTipoDocumento());
		    		
		    		for(tipoDocumentoVO tipoDoc : listaTiposDoc)
		    			if(tipoDoc.getId() == cliente.getTipoDocumento())
		    				data.addProperty("SiglasDoc", tipoDoc.getSigla()+" - "+cliente.getNombre()+" "+cliente.getApellido());
		    		
	    			jsonResponse.addProperty("informacion", "exito");
		    		jsonResponse.addProperty("datos", data.toString());
		    		jsonResponse.addProperty("placas",cargarPlacas(cliente.getId()).toString());
	    		}
	    		else {
	    			jsonResponse.addProperty("informacion", "error");
		    		jsonResponse.addProperty("datos", "No existe un cliente en el sistema con ese número de identificación.");
	    		}
	    	}
	    }
	    
	    jsonResponse.addProperty("tiposDoc", cargarTiposDocumento().toString());
	    jsonResponse.addProperty("tiposRadicado", cargarClasificacion_TiposR().toString());
    	out.print(jsonResponse);
	    out.flush();
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
	
	private JsonArray cargarPlacas(int id) {
    	vehiculoDAO vehDAO = new vehiculoDAO();
		List<vehiculoVO> listaVehiculos = vehDAO.verTodosVehiculos();
		JsonArray miJsonArr = new JsonArray(listaVehiculos.size());
		for(vehiculoVO vehiculo : listaVehiculos) {
			JsonObject obj = new JsonObject();
			if(vehiculo.getPropietario() == id) {
				obj.addProperty("Placa", vehiculo.getPlaca());
				miJsonArr.add(obj);
			}
		}
		return miJsonArr;
	}
	
	private JsonArray cargarClasificacion_TiposR() {
		JsonArray miJsonArr = new JsonArray();
		
		// OBTENEMOS TODAS LAS CLASIFICACIONES
    	clasificacionDAO clasifDAO = new clasificacionDAO();
		List<clasificacionVO> listaClasificacion = clasifDAO.verTodasClasificaciones();
		
		// OBTENEMOS TODOS LOS TIPOS DE SOLICITUD
		tipoRadicadoDAO tipoRadDAO = new tipoRadicadoDAO();
		List<tipoRadicadoVO> listaTipoR = tipoRadDAO.verTodosTipos();
		
		JsonArray jsonArrayTiposR = new JsonArray();
		JsonArray jsonArrayClasificacionR = new JsonArray();
		
		for(tipoRadicadoVO tipoR : listaTipoR) {
			// CREAMOS UN ARRAY CON LOS TIPOS DE RADICADO
			JsonObject objTipoR = new JsonObject();
			objTipoR.addProperty("TipoR", tipoR.getNombre());
			objTipoR.addProperty("IdTipoR", tipoR.getId());
			jsonArrayTiposR.add(objTipoR);
			JsonArray jsonArrayFiltrado = new JsonArray();
			
			for(clasificacionVO clasificacion : listaClasificacion) {
				
				if(clasificacion.getIdTipoRadicado() == tipoR.getId()) {
					// CREAMOS UN ARRAY CON LAS CLASIFICACIONES DE LOS DIFERENTES TIPOS DE RADICADOS
					JsonObject obj = new JsonObject();
					obj.addProperty("Clasificacion", clasificacion.getNombre());
					obj.addProperty("IdClasificacion", clasificacion.getIdClasificacion());
					jsonArrayFiltrado.add(obj);
				}
			}
			jsonArrayClasificacionR.add(jsonArrayFiltrado);
		}
		miJsonArr.add(jsonArrayTiposR);
		miJsonArr.add(jsonArrayClasificacionR);
		return miJsonArr;
	}
	
	
	/*private JsonArray refrescarTablaRadicados() {
		
		List<radicadoVO> listaFacturas = factDAO.verTodosFacturas();
		JsonArray miJson = new JsonArray(listaFacturas.size());
		for(facturaVO factura : listaFacturas) {
			JsonObject obj = new JsonObject();
			
			
			obj.addProperty("Numero", factura.getNumero());
			obj.addProperty("Emision", factura.getFechaEmision());
			obj.addProperty("Tipo", factura.getTipoFactura());
			obj.addProperty("TotalConIva", factura.getTotalConIva());
			obj.addProperty("TotalSinIva", factura.getTotalSinIva());
			obj.addProperty("Conceptos", conceptosPorFactura(factura.getNumero()).toString());
			
			List<clienteVO> clientes = clientDAO.verTodosClientes();
			for(clienteVO cliente : clientes) {
				if(cliente.getId() == factura.getIdCliente()) {
					obj.addProperty("Cliente", cliente.getNombre() + " "+ cliente.getApellido());
					break;
				}
			}
			miJson.add(obj);
		}
		return miJson;
	}*/
}
