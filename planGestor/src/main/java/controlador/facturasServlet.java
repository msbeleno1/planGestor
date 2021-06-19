package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import modelo.DAO.clienteDAO;
import modelo.DAO.conceptoDAO;
import modelo.DAO.facturaDAO;
import modelo.DAO.tipoDocumentoDAO;
import modelo.DAO.vehiculoDAO;
import modelo.VO.clienteVO;
import modelo.VO.conceptoVO;
import modelo.VO.facturaVO;
import modelo.VO.tipoDocumentoVO;
import modelo.VO.vehiculoVO;
import util.funcionesParaFichero;

/**
 * Servlet implementation class facturasServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/facturasServlet" })
public class facturasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private clienteDAO clientDAO;
	private conceptoDAO conceptDAO;
	private facturaDAO factDAO;
	
	public void init() throws ServletException {
		clientDAO = new clienteDAO();
		conceptDAO = new conceptoDAO();
		factDAO = new facturaDAO();
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
		    		jsonResponse.addProperty("placas",cargarPlacas(cliente.getId()).toString());
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
	    else if(opcion.equals("crear")) {
	    	String[] datosFactura = new String[]{
	    			request.getParameter("numeroFactura"),
	    			request.getParameter("tipoFactura"),
	    			request.getParameter("base"),
	    			request.getParameter("total"),
	    	};
	    	
	    	String[] datosCliente = new String[] {
	    			request.getParameter("documentoCliente")
	    	};
	    	
	    	if(funcionesParaFichero.validarCliente(datosCliente, "documento") && funcionesParaFichero.validarFactura(datosFactura, "todo")) {
	    		String conceptos = request.getParameter("conceptos");
	    		int tipoDocumento = Integer.parseInt(request.getParameter("tipoDocumento"));
		    	String fechaEmision = request.getParameter("fechaEmision");
	    		
	    		JsonArray jsonArray = JsonParser.parseString(conceptos).getAsJsonArray();
	    		List<conceptoVO> listaConcepto = new ArrayList<>();
	    		boolean isValide = true;
	    		
	    		facturaVO factura = new facturaVO();
	    		factura.setNumero(Integer.parseInt(datosFactura[0]));
	    		factura.setFechaEmision(fechaEmision);
	    		factura.setTipoFactura(datosFactura[1]);
	    		factura.setTotalSinIva(Double.parseDouble(datosFactura[2]));
	    		factura.setTotalConIva(Double.parseDouble(datosFactura[3]));
	    		clienteVO cliente = clientDAO.buscarCliente(Integer.parseInt(datosCliente[0]), tipoDocumento);
	    		factura.setIdCliente(cliente.getId());
	    		
	    		String resultado = factDAO.crearFactura(factura);
	    		
	    		if(resultado.equalsIgnoreCase("CREADA")) {
	    			for(JsonElement element : jsonArray) {
		    			if(!isValide) isValide = true;
		    			JsonObject miObject = element.getAsJsonObject();
		    			conceptoVO concepto = new conceptoVO();
		    			
		    			concepto.setDescripcion(miObject.get("Descripcion").getAsString());
		    			concepto.setDescuento(miObject.get("Descuento").getAsDouble());
		    			concepto.setNumeroFactura(factura.getNumero());
		    			concepto.setPlaca(miObject.get("Placa").getAsString());
		    			concepto.setValorSinIva(miObject.get("ValorSinIva").getAsDouble());
		    			
		    			if(listaConcepto != null) {
		    				for(conceptoVO conceptoVo : listaConcepto) {
		    					if(conceptoVo.getDescripcion().equalsIgnoreCase(concepto.getDescripcion()) && conceptoVo.getNumeroFactura() == concepto.getNumeroFactura() && conceptoVo.getPlaca().equals(concepto.getPlaca())) {
		    						isValide = false;
		    						break;
		    					}
		    				}
		    			}
		    			
		    			if(isValide)
		    				listaConcepto.add(concepto);
		    			else
		    				break;
		    		}
		    		if(isValide) {
		    			boolean result = false;
		    			for(conceptoVO concepto : listaConcepto) {
		    				result = conceptDAO.agregarConcepto(concepto);
		    				if(!result) {
		    					conceptDAO.eliminarConceptosAndFactura(factura.getNumero());
		    					jsonResponse.addProperty("informacion", "error");
		    					jsonResponse.addProperty("datos", "Hubo problemas al agregar los conceptos. Por favor intente nuevamente");
		    					break;
		    				}
		    			}
		    			
		    			if(result) {
		    				jsonResponse.addProperty("informacion", "exito");
	    					jsonResponse.addProperty("datos", "La factura <strong>"+factura.getNumero()+"</strong> fue creada con éxito");
		    			}
		    		}
		    		else {
		    			conceptDAO.eliminarConceptosAndFactura(factura.getNumero());
		    			jsonResponse.addProperty("informacion", "error");
						jsonResponse.addProperty("datos", "Hay conceptos repetidos para la misma factura");
		    		}
	    		}
	    		else {
	    			jsonResponse.addProperty("informacion", "error");
					jsonResponse.addProperty("datos", "Ya existe una factura con ese número");
	    		}	    		
	    	}
	    	else {
	    		jsonResponse.addProperty("informacion", "error");
	    		jsonResponse.addProperty("datos", "Los datos ingresados no cumplen con un formato valido");
	    	}
	    }
		
		jsonResponse.addProperty("select", cargarTiposDocumento().toString());
		jsonResponse.addProperty("dataTable", refrescarTablaFacturas().toString());
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
	
	private JsonArray refrescarTablaFacturas() {
		
		List<facturaVO> listaFacturas = factDAO.verTodosFacturas();
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
	}
	
	private JsonArray conceptosPorFactura(int numeroFactura) {
		List<conceptoVO> listaConceptos = conceptDAO.verTodosConceptos();
		JsonArray jsonArray= new JsonArray(listaConceptos.size());
		
		for(conceptoVO concepto : listaConceptos) {
			
			if(concepto.getNumeroFactura() == numeroFactura) {
				JsonObject obj = new JsonObject();
				obj.addProperty("Descripcion", concepto.getDescripcion());
				obj.addProperty("ValSinIva", concepto.getValorSinIva());
				obj.addProperty("Descuento", concepto.getDescuento());
				obj.addProperty("Placa", concepto.getPlaca());
				jsonArray.add(obj);
			}
		}
		
		return jsonArray;
	}

}
