package controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Matcher;

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
import modelo.VO.cargoVO;
import modelo.VO.clienteVO;
import modelo.VO.tipoDocumentoVO;
import modelo.VO.usuarioVO;
import modelo.VO.vehiculoVO;
import util.funcionesParaFichero;



/**
 * Servlet implementation class clientesServlet
 */
@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = { "/clientesServlet" })
public class clientesServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	private clienteDAO clientDAO;
    private tipoDocumentoDAO tipoDAO;
    
    @Override
	public void init() throws ServletException {
		super.init();
		clientDAO = new clienteDAO();
		tipoDAO = new tipoDocumentoDAO();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    
		JsonObject jsonResponse = new JsonObject();
		
		String opcion = request.getParameter("opcion");
		
		if(opcion.equals("crear") || opcion.equals("editar")) {
			String resultado = "Sin respuesta";
			String[] datosCliente;
			if(opcion.equals("crear")) {
				datosCliente = new String[] {request.getParameter("txtDocumentoRegistro"),
						request.getParameter("txtTipoRegistro"),
						request.getParameter("txtNombresRegistro"),
						request.getParameter("txtApellidosRegistro"),
						request.getParameter("txtDireccionRegistro"),
						request.getParameter("txtCorreoRegistro"),
						request.getParameter("txtTelefonoRegistro")};
			}
			else {
				datosCliente = new String[] {request.getParameter("txtDocumentoEdicion"),
						request.getParameter("txtTipoEdicion"),
						request.getParameter("txtNombresEdicion"),
						request.getParameter("txtApellidosEdicion"),
						request.getParameter("txtDireccionEdicion"),
						request.getParameter("txtCorreoEdicion"),
						request.getParameter("txtTelefonoEdicion")};
			}
			
			
			if(funcionesParaFichero.validarCliente(datosCliente, "todo")) {
				clienteVO cliente = new clienteVO();
				
				cliente.setDocumento(Integer.parseInt(datosCliente[0]));
				cliente.setTipoDocumento(Integer.parseInt(datosCliente[1]));
				cliente.setNombre(datosCliente[2]);
				cliente.setApellido(datosCliente[3]);
				cliente.setDireccion(datosCliente[4]);
				cliente.setCorreo(datosCliente[5]);
				cliente.setTelefono(datosCliente[6]);
				
				if(opcion.equals("crear")) {
					resultado = clientDAO.crearCliente(cliente);
					
					if(resultado.equalsIgnoreCase("CREADO")) {
						jsonResponse.addProperty("informacion", "exito");
						jsonResponse.addProperty("datos", "El cliente <strong>"+cliente.getNombre()+" "+cliente.getApellido()+"</strong> fue creado correctamente");
					}
					else {
						jsonResponse.addProperty("informacion", "error");
						jsonResponse.addProperty("datos", "Ya existe un cliente con ese número y tipo de identificación");
					}
				}
				else {
					int tipoAntiguo = Integer.parseInt(request.getParameter("txtTipoHidden"));
					resultado = clientDAO.actualizarCliente(cliente, tipoAntiguo);
					
					if(resultado.equalsIgnoreCase("ACTUALIZADO")) {
						jsonResponse.addProperty("informacion", "exito");
						jsonResponse.addProperty("datos", "El cliente <strong>"+cliente.getNombre()+" "+cliente.getApellido()+"</strong> fue actualizado correctamente");
					}
					else {
						jsonResponse.addProperty("informacion", "error");
						jsonResponse.addProperty("datos", "Ya existe un cliente con ese número y tipo de identificación");
					}
				}
			}
			else {
				jsonResponse.addProperty("informacion", "error");
				jsonResponse.addProperty("datos", "Los datos ingresados para el cliente no cumplen el formato especificado");
			}
		}
		else if(opcion.equals("masiva")) {
			// OBTENEMOS LOS DATOS ENVIADOS
	        Part filePart = request.getPart("file");
	        InputStream fileContent = filePart.getInputStream();
	        
	        // CONVERTIMOS EL ARCHIVO DE DATOS A UN LISTA DE DATOS SEGÚN LOS DATOS INGRESADOS
	        List<String[]> filasCsv = funcionesParaFichero.leerCsv(fileContent);
	        if(funcionesParaFichero.verificarFichero(filasCsv, "cliente")) {
	        	JsonArray datos = new JsonArray();
	        	for(String[] columna : filasCsv) {
	        		clienteVO cliente = new clienteVO();
	        		JsonObject obj = new JsonObject();
	        		
	        		cliente.setDocumento(Integer.parseInt(columna[0]));
					cliente.setTipoDocumento(Integer.parseInt(columna[1]));
					cliente.setNombre(columna[2]);
					cliente.setApellido(columna[3]);
					cliente.setDireccion(columna[4]);
					cliente.setCorreo(columna[5]);
					cliente.setTelefono(columna[6]);
					
					String resultado = clientDAO.crearCliente(cliente);
	        		
	        		obj.addProperty("Documento", cliente.getDocumento());
	        		obj.addProperty("Nombre", cliente.getNombre()+" "+cliente.getApellido());
	        		obj.addProperty("Observaciones", resultado);
	        		
	        		List<tipoDocumentoVO> listaTipo = tipoDAO.verTodosTipos();
	        		for(tipoDocumentoVO tipo : listaTipo)
	        			if(cliente.getTipoDocumento() == tipo.getId())
	        				obj.addProperty("TipoDocumento", tipo.getSigla());


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
		
		jsonResponse.addProperty("dataTable", refrescarTabla().toString());
		jsonResponse.addProperty("select", cargarTipos().toString());
		
		out.print(jsonResponse);
	    out.flush();
	}
	
	
	private JsonArray refrescarTabla() {
		
		List<clienteVO> listaClientes = clientDAO.verTodosClientes();
		List<tipoDocumentoVO> listaTipos = tipoDAO.verTodosTipos();
		JsonArray miJson = new JsonArray(listaClientes.size());
		for(clienteVO cliente : listaClientes) {
			JsonObject obj = new JsonObject();
			obj.addProperty("Documento", cliente.getDocumento());
			obj.addProperty("Nombres", cliente.getNombre());
			obj.addProperty("Apellidos", cliente.getApellido());
			obj.addProperty("Direccion", cliente.getDireccion());
			obj.addProperty("Correo", cliente.getCorreo().toLowerCase());
			obj.addProperty("Telefono", cliente.getTelefono());
			obj.addProperty("Id", cliente.getTipoDocumento());
			obj.addProperty("NombreCompleto", cliente.getNombre()+" "+cliente.getApellido());
			
			for(tipoDocumentoVO tipo : listaTipos)
				if(tipo.getId() == cliente.getTipoDocumento()) {
					obj.addProperty("TipoDocumento",tipo.getSigla());
					break;
				}
			
			miJson.add(obj);
		}
		return miJson;
	}

	
	private JsonArray cargarTipos() {
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
