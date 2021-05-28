package controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import modelo.DAO.usuarioDAO;
import modelo.VO.usuarioVO;
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
    
    

	@Override
	public void init() throws ServletException {
		super.init();
		userDAO = new usuarioDAO();
		encriptador = new algoritmoSHA256();
		usuarioVo = new usuarioVO();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("txtUsuario");
	    String password = request.getParameter("txtClave");
	    
	    PrintWriter out = response.getWriter();
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		
		JsonObject json = new JsonObject();
	    
	    if(!username.equals("") && !password.equals("")) {
	    	password = encriptador.getSHA256(password).toUpperCase();
	    	usuarioVo = userDAO.buscarUsuarioLogin(username, password);
	    	
	    	if(usuarioVo.getRol() != null) {
	    		json.addProperty("Rol", usuarioVo.getRol());
	    	}
	    	else {
	    		json.addProperty("Rol", "Ninguno");
	    	}
	    }
	    
	    out.print(json);
	    out.flush();
	}

}
