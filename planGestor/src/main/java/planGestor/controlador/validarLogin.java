package planGestor.controlador;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import planGestor.controlador.token.jsonToken;
import planGestor.modeloDAO.*;
import planGestor.modeloVO.*;
import java.util.*;

/**
 * Servlet implementation class validarLogin
 */
@WebServlet(name="/validarLogin", urlPatterns={"/validarLogin"}, asyncSupported=true)
public class validarLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private usuarioDAO userDAO;
    private encriptaClave encriptador;
    private usuarioVO usuario;
    private jsonToken miToken;
    

		@Override
		public void init() throws ServletException {
			super.init();
			try {
				this.encriptador = new encriptaClave();
				this.userDAO = new usuarioDAO();
				this.usuario = new usuarioVO();
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
    String username = request.getParameter("txtUsuario").toUpperCase();
    String password = request.getParameter("txtClave");
    
    List<String> list = new ArrayList<String>();
    
    if(!username.equals(null) && !password.equals(null)) {
    	password = encriptador.getSHA256(password).toUpperCase();
    	usuario = userDAO.buscarUsuarioLogin(username, password);
    	miToken = new jsonToken(usuario);
    	String token = miToken.getToken();
    	
    	list.add(usuario.getUsuario());
    	list.add(usuario.getRol());
    	list.add(token);    	
    }
    else
    	list.add(null);
    
    
    String json = new Gson().toJson(list);
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);

    
    
	}

}
