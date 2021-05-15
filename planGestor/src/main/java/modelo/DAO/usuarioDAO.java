package modelo.DAO;

import java.sql.*;

import modelo.VO.usuarioVO;
import util.DBConnection;

public class usuarioDAO {
	
	//METODO PARA BUSCAR UN USUARIO EN LA TABLA
	public usuarioVO buscarUsuarioLogin(String usuario, String clave){
		
		Connection connection = null;
		PreparedStatement ps = null;
		usuarioVO user = new usuarioVO();
		String sql = "SELECT * FROM usuario INNER JOIN cargo ON usuario.id_cargo = cargo.id_cargo WHERE usuario_usuario = ? and clave_usuario = ?";
		ResultSet result = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			ps.setString(1, usuario.toUpperCase());
			ps.setString(2, clave.toUpperCase());
			result = ps.executeQuery();
			
			if(result.next()) {
				user.setId(result.getInt("documento_usuario"));
				user.setNombres(result.getString("nombres_usuario"));
				user.setApellidos(result.getString("apellidos_usuario"));
				user.setCorreo(result.getString("correo_usuario"));
				user.setEstado(result.getString("estado_usuario"));
				user.setUsuario(result.getString("usuario_usuario"));
				user.setClave(result.getString("clave_usuario"));
				user.setRol(result.getString("nombre_cargo"));
			}
		} catch (SQLException e) {
			System.err.println("SQL al consultar dice: "+e.toString());
			user = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}

}
