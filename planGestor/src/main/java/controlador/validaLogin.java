package controlador;

import java.io.IOException;
/*import java.util.*;*/

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.DAO.usuarioDAO;
import modelo.VO.usuarioVO;
/*import token.tokenJWT;*/

/**
 * Servlet implementation class validaLogin
 */
@WebServlet("/validaLogin")
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
		
		String username = request.getParameter("txtUsuario").toUpperCase();
	    String password = request.getParameter("txtClave");
	    
	    /*List<String> list = new ArrayList<>();*/
	    
	    if(!username.equals("") && !password.equals("")) {
	    	password = encriptador.getSHA256(password).toUpperCase();
	    	usuarioVo = userDAO.buscarUsuarioLogin(username, password);
	    	
	    	if(usuarioVo != null) {
	    		response.sendRedirect("https://localhost:8090/nuevo/html/home.html");
	    	}
	    	else {
	    		response.getWriter().write("NULL");
	    	}
	    }
	    
	    /*if(!username.equals("") && !password.equals("")) {
	    	password = encriptador.getSHA256(password).toUpperCase();
	    	usuarioVo = userDAO.buscarUsuarioLogin(username, password);
	    	
	    	
	    	tokenJWT miToken = new tokenJWT(usuarioVo);
	    	String token = miToken.getToken();
	    	
	    	list.add(usuarioVo.getUsuario());
	    	list.add(usuarioVo.getRol());
	    	list.add(token);    	
	    }
	    else
	    	list.add(null);
	    
	    
	    try {
	    	String json = new Gson().toJson(list);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}*/
	}

}
