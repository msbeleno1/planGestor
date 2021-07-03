package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import modelo.DAO.usuarioDAO;
import modelo.VO.usuarioVO;
import util.ControlLogeo;
import util.algoritmoSHA256;

/**
 * Servlet implementation class validaLogin
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/validaLogin" })
public class validaLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private usuarioDAO userDAO;
    private algoritmoSHA256 encriptador;
    private usuarioVO usuarioVo;
    private ControlLogeo log;
    
    

	@Override
	public void init() throws ServletException {
		super.init();
		userDAO = new usuarioDAO();
		encriptador = new algoritmoSHA256();
		usuarioVo = new usuarioVO();
		log = new ControlLogeo();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("txtUsuario");
	    String password = request.getParameter("txtClave");
	    
	    PrintWriter out = response.getWriter();
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		
		JsonObject json = new JsonObject();
		log.validar_existencia();
	    
	    if(!username.equals(null) && !password.equals(null)) {
	    	if(!log.buscarLog(username.toLowerCase())) {
	    		password = encriptador.getSHA256(password).toUpperCase();
		    	usuarioVo = userDAO.buscarUsuarioLogin(username, password);
		    	
		    	if(usuarioVo.getRol() != null) {
		    		log.insertarLog(username.toLowerCase());
		    		json.addProperty("informacion", "exito");
		    		json.addProperty("Rol", usuarioVo.getRol());
		    		json.addProperty("Nombre", usuarioVo.getNombres()+" "+usuarioVo.getApellidos());
		    	}
		    	else {
		    		json.addProperty("informacion", "error");
		    		json.addProperty("datos", "El usuario y/o la contraseña son incorrectos");
		    	}
	    	}
	    	else {
	    		json.addProperty("informacion", "error");
	    		json.addProperty("error", "El usuario ya se encuentra realizando un proceso");
	    	}
	    }
	    
	    out.print(json);
	    out.flush();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
	    JsonObject json = new JsonObject();
	    
	    String name = req.getParameter("nombre");
	    String username = "";
	    
	    if(!name.equals(null)) {
	    	List<usuarioVO> listsUsuarios = userDAO.verTodosUsuarios();
	    	for (usuarioVO usuario : listsUsuarios) {
				if((usuario.getNombres()+" "+usuario.getApellidos()).equalsIgnoreCase(name)) {
					username = usuario.getUsuario();
					log.eliminarLog(username.toLowerCase());
				}
			}
	    	json.addProperty("informacion", "exito");
	    	out.print(json);
		    out.flush();
	    }
	}

	
}
