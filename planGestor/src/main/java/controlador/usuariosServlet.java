package controlador;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import modelo.DAO.cargoDAO;
import modelo.DAO.usuarioDAO;
import modelo.VO.cargoVO;
import modelo.VO.usuarioVO;
import util.algoritmoSHA256;
import util.funcionesParaFichero;

/**
 * Servlet implementation class usuariosServlet
 */
@MultipartConfig
@WebServlet(asyncSupported = true, description = "Controller from usuarios.jsp view", urlPatterns = { "/usuariosServlet" })
public class usuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private usuarioDAO userDAO;
    private algoritmoSHA256 encriptador;
    private cargoDAO cargoDao;

    @Override
	public void init() throws ServletException {
    	super.init();
		userDAO = new usuarioDAO();
		encriptador = new algoritmoSHA256();
		cargoDao = new cargoDAO();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    
	    String opcion = request.getParameter("opcion");
        
	    JsonObject jsonResponse = new JsonObject();
	    
	    if(opcion.equals("crear")) {
	    	String[] datosUsuario = new String[] {request.getParameter("txtDocumentoRegistro"),
	    			request.getParameter("cboCargoRegistro"),
	    			request.getParameter("txtNombresRegistro"),
	    			request.getParameter("txtApellidosRegistro"),
	    			request.getParameter("txtClaveRegistro1"),
	    			request.getParameter("txtTelefonoRegistro"),
	    			request.getParameter("txtCorreoRegistro")};
	    	
	    	if(funcionesParaFichero.validarUsuario(datosUsuario) && crearNombreUsuario(request.getParameter("txtNombresRegistro"), request.getParameter("txtApellidosRegistro")) != null) {
	    		usuarioVO usuario = new usuarioVO();        		
        		
        		usuario.setDocumento(Integer.parseInt(datosUsuario[0]));
        		usuario.setRol(datosUsuario[1]);
        		usuario.setNombres(datosUsuario[2]);
        		usuario.setApellidos(datosUsuario[3]);
        		usuario.setClave(encriptador.getSHA256(datosUsuario[4]));
        		usuario.setTelefono(datosUsuario[5]);
        		usuario.setCorreo(datosUsuario[6]);
        		usuario.setEstado("Alta");
        		usuario.setFechaLogin(LocalDate.now().toString());
        		usuario.setFechaModificacion(LocalDate.now().toString());
        		
        		String nickname = crearNombreUsuario(usuario.getNombres(), usuario.getApellidos());
        		usuario.setUsuario(nickname);
    			int id = obtenerIdCargo(usuario.getRol());
    			String resultado = userDAO.crearUsuario(usuario, id);
    			
    			if(resultado.equalsIgnoreCase("YA EXISTE")) {
    				jsonResponse.addProperty("datos",usuario.getNombres()+" "+usuario.getApellidos());
        			jsonResponse.addProperty("informacion", "error");
    			}
    			else {
        			jsonResponse.addProperty("informacion", "exito");
            		jsonResponse.addProperty("datos",usuario.getUsuario());
    			}
	    	}
	    	else {
	    		jsonResponse.addProperty("informacion", "error");
	    		jsonResponse.addProperty("datos",request.getParameter("txtNombresRegistro")+" "+request.getParameter("txtApellidosRegistro"));
	    	}
	    	
	    }
	    else if(opcion.equals("masiva")) {
	    	// OBTENEMOS LOS DATOS ENVIADOS
	        Part filePart = request.getPart("file"); // OBTENEMOS EL ARCHIVO ENVIADO DESDE EL FORMULARIO SEGÚN EL DATAFORM
	        //String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // OBTENEMOS EL NOMBRE DEL ARCHIVO
	        InputStream fileContent = filePart.getInputStream(); // OBTENEMOS EL CONJUNTO DE BYTES QUE COMPONEN EL CSV
	        
	        
	        // CONVERTIMOS EL ARCHIVO DE DATOS A UN LISTA DE DATOS SEGÚN LOS DATOS INGRESADOS
	        List<String[]> filasCsv = funcionesParaFichero.leerCsv(fileContent);
	        if(funcionesParaFichero.verificarFichero(filasCsv, "usuario")) {
	        	JsonArray miJson = new JsonArray();
	        	for(String[] columna : filasCsv) {
	        		usuarioVO usuario = new usuarioVO();
	        		JsonObject obj = new JsonObject();
	        		
	        		usuario.setDocumento(Integer.parseInt(columna[0]));
	        		usuario.setNombres(columna[2]);
	        		usuario.setApellidos(columna[3]);
	        		usuario.setClave(encriptador.getSHA256(columna[4]));
	        		usuario.setTelefono(columna[5]);
	        		usuario.setCorreo(columna[6]);
	        		usuario.setEstado("Alta");
	        		usuario.setFechaLogin(LocalDate.now().toString());
	        		usuario.setFechaModificacion(LocalDate.now().toString());
	        		
	        		obj.addProperty("Identificacion", usuario.getDocumento());
	        		obj.addProperty("Nombre", usuario.getNombres()+" "+usuario.getApellidos());
	        		
	        		String nickname = crearNombreUsuario(usuario.getNombres(), usuario.getApellidos());
	        		if(nickname != null) {
	        			usuario.setUsuario(nickname);
	        			int id = obtenerIdCargo(usuario.getRol());
	        			String resultado = userDAO.crearUsuario(usuario, id);
	        			obj.addProperty("Observaciones", resultado);
	        		}
	        		else {
	        			obj.addProperty("Observaciones", "Problemas al crear el nickname");
	        		}
	        		miJson.add(obj);
	        	}
	        	jsonResponse.addProperty("informacion", "exito");
	    		jsonResponse.addProperty("datos",miJson.toString());
	        }
	        else {
	        	jsonResponse.addProperty("informacion", "error");
	    		jsonResponse.addProperty("datos","null");
	        }
	    }
	    else if(opcion.equals("editar")) {
	    	
	    	String[] datosUsuario = new String[] {request.getParameter("txtDocumentoEdicion"),
	    			request.getParameter("txtCargoEdicion"),
	    			request.getParameter("txtNombresEdicion"),
	    			request.getParameter("txtApellidosEdicion"),
	    			"Ab1234567.",
	    			request.getParameter("txtTelefonoEdicion"),
	    			request.getParameter("txtCorreoEdicion")};
	    	
	    	if(funcionesParaFichero.validarUsuario(datosUsuario)) {
	    		usuarioVO usuario = new usuarioVO();     		
        		
        		usuario.setDocumento(Integer.parseInt(datosUsuario[0]));
        		usuario.setRol(datosUsuario[1]);
        		usuario.setNombres(datosUsuario[2]);
        		usuario.setApellidos(datosUsuario[3]);
        		usuario.setTelefono(datosUsuario[5]);
        		usuario.setCorreo(datosUsuario[6]);
        		usuario.setFechaModificacion(LocalDate.now().toString());
        		
        		String estado = request.getParameter("cboEstadoEdicion");

        		usuario.setEstado(estado);
    			int id = obtenerIdCargo(usuario.getRol());
    			System.out.println(id);
    			String resultado = userDAO.actualizarUsuario(usuario, id);
    			
    			if(resultado.equalsIgnoreCase("ACTUALIZADO"))
    				jsonResponse.addProperty("informacion", "exito");
    			else
    				jsonResponse.addProperty("informacion", "error");
    			
    			jsonResponse.addProperty("datos",usuario.getNombres()+" "+usuario.getApellidos());
	    	}
	    	else {
	    		jsonResponse.addProperty("informacion", "error");
	    		jsonResponse.addProperty("datos",request.getParameter("txtNombresEdicion")+" "+request.getParameter("txtApellidosEdicion"));
	    	}
	    }
	    else if(opcion.equals("reset")) {
	    	boolean resultado = false;
	    	String claveNueva = encriptador.getSHA256("Abc12345.");
	    	System.out.println(request.getParameter("txtDocumentoHidenDelet"));
	    	int documento = Integer.parseInt(request.getParameter("txtDocumentoHidenDelet"));
	    	resultado = userDAO.cambiarClave(claveNueva, documento);
	    	
	    	if(resultado) {
	    		jsonResponse.addProperty("informacion", "exito");
        		jsonResponse.addProperty("datos","Abc12345.");
	    	}
	    	else {
	    		jsonResponse.addProperty("datos","Hubo un error al restablecer la clave. Por favor intente nuevamente");
    			jsonResponse.addProperty("informacion", "error");
	    	}
	    }
	    
	    if(!opcion.equals("reset") && !opcion.equals("cambiar")) {
	    	// DATOS DE LOS USUARIOS ACTUALIZADA
		    jsonResponse.addProperty("dataTable",refrescarJson().toString());
		    jsonResponse.addProperty("select",cargarCargos().toString());
	    }
	    out.print(jsonResponse);
	    out.flush();
	}
	
	
    private JsonArray refrescarJson() {
		
		List<usuarioVO> listaUsuarios = userDAO.verTodosUsuarios();
		JsonArray miJson = new JsonArray(listaUsuarios.size());
		for(usuarioVO user : listaUsuarios) {
			JsonObject obj = new JsonObject();
			obj.addProperty("Documento", user.getDocumento());
			obj.addProperty("Nombre", user.getNombres()+" "+user.getApellidos());
			obj.addProperty("Nombres", user.getNombres());
			obj.addProperty("Apellidos", user.getApellidos());
			obj.addProperty("Telefono", user.getTelefono());
			obj.addProperty("Correo", user.getCorreo());
			obj.addProperty("Cargo", user.getRol());
			obj.addProperty("Usuario", user.getUsuario());
			obj.addProperty("Estado", user.getEstado());
			obj.addProperty("Login", user.getFechaLogin());
			miJson.add(obj);
		}
		return miJson;
	}
	
	private JsonArray cargarCargos() {
		List<cargoVO> listaCargos = cargoDao.verTodosCargos();
		JsonArray miJsonArr = new JsonArray(listaCargos.size());
		for(cargoVO cargo : listaCargos) {
			JsonObject obj = new JsonObject();
			obj.addProperty("Nombre", cargo.getCargo());
			miJsonArr.add(obj);
		}
		return miJsonArr;
	}
	
    private String crearNombreUsuario(String nombres, String apellidos) {
		
		String[] apellido;
		String[] nombre;
		
		if(apellidos.contains(" ")) {
			apellido = apellidos.split(" ");
		}
		else {
			apellido = new String[] {apellidos};
		}
		
		if(nombres.contains(" ")) {
			nombre = nombres.split(" ");
		}
		else {
			nombre = new String[] {nombres};
		}
		
		String nickname = nombre[0].substring(0, 1)+apellido[0];
		boolean valido = false;
		int contador = -1;
		
		List<usuarioVO> listaUsuarios = userDAO.verTodosUsuarios();
		while(!valido) {
			valido = true;
			contador++;
			for(usuarioVO usuario : listaUsuarios) {
				if(usuario.getUsuario().equalsIgnoreCase(nickname)) {
					if(nombre.length > 1 && apellido.length > 1) {
						if(contador == 0) {
							nickname = nombre[0].substring(0, 1)+nombre[1].substring(0, 1)+apellido[0];
						}
						else if(contador == 1) {
							nickname = nombre[0].substring(0, 1)+nombre[1].substring(0, 1)+apellido[0]+apellido[1].substring(0, 1);
						}
						else if(contador == 2) {
							nickname = nombre[0].substring(0, 1)+apellido[1];
						}
						else if(contador == 3) {
							nickname = nombre[0].substring(0, 1)+nombre[1].substring(0, 1)+apellido[1];
						}
						else if(contador >= 4) {
							nickname = nombre[0].substring(0, 1)+nombre[1].substring(0, 1)+apellido[1]+apellido[0].substring(0, 1);
						}
						else if(contador > 4) {
							nickname = null;
							break;
						}
					}
					else {
						if(contador == 0) {
							nickname = nombre[0].substring(0, 1)+apellido[0];
						}
						else if(contador == 1) {
							nickname = nombre[0].substring(0, 1)+apellido[1];
						}
						else if(contador == 2) {
							nickname = nombre[0].substring(0, 1)+apellido[1]+apellido[0].substring(0, 1);
						}
						else if(contador >= 3) {
							nickname = null;
							break;
						}
					}
					valido = false;
				}
			}
		}
		return nickname;
	}
	
	private int obtenerIdCargo(String miCargo) {
		int toReturn = -1;
		List<cargoVO> listaCargos = cargoDao.verTodosCargos();
		for(cargoVO cargo : listaCargos) {
			if(cargo.getCargo().equalsIgnoreCase(miCargo))
				toReturn = cargo.getId();
		}
		return toReturn;
	}
}
