package controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import modelo.DAO.usuarioDAO;
import util.algoritmoSHA256;

/**
 * Servlet implementation class vehiculosServlet
 */
@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = { "/vehiculosServlet" })
public class vehiculosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private usuarioDAO userDAO;
    private algoritmoSHA256 encriptador;

    @Override
	public void init() throws ServletException {
    	super.init();
		userDAO = new usuarioDAO();
		encriptador = new algoritmoSHA256();
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
	    
	    if(opcion.equals("buscar")) {
	    	
	    }
	    
    	out.print(jsonResponse);
	    out.flush();
	}

}
