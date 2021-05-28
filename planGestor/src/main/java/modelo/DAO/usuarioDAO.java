package modelo.DAO;

import java.sql.*;
import java.time.LocalDate;
import java.util.*;

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
				user.setDocumento(result.getInt("documento_usuario"));
				user.setNombres(result.getString("nombres_usuario"));
				user.setApellidos(result.getString("apellidos_usuario"));
				user.setCorreo(result.getString("correo_usuario"));
				user.setTelefono(result.getString("telefono_usuario"));
				user.setEstado(result.getString("estado_usuario"));
				user.setFechaModificacion(result.getString("fecha_modificacion_usuario"));
				user.setFechaLogin(result.getString("fecha_ultimo_login_usuario"));
				user.setUsuario(result.getString("usuario_usuario"));
				user.setClave(result.getString("clave_usuario"));
				user.setRol(result.getString("nombre_cargo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
	
	// METODO PARA BUSCAR TODOS LOS USUARIOS DE LA TABLA USUARIOS
	public List<usuarioVO> verTodosUsuarios(){
		
		Connection connection = null;
		PreparedStatement ps = null;
		List<usuarioVO> listaUsuarios = new ArrayList<>();
		String sql = "SELECT * FROM usuario JOIN cargo ON usuario.id_cargo = cargo.id_cargo";
		ResultSet result = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			result = ps.executeQuery();
			
			while(result.next()) {
				usuarioVO user = new usuarioVO();
				user.setDocumento(result.getInt("documento_usuario"));
				user.setNombres(result.getString("nombres_usuario"));
				user.setApellidos(result.getString("apellidos_usuario"));
				user.setCorreo(result.getString("correo_usuario"));
				user.setTelefono(result.getString("telefono_usuario"));
				user.setEstado(result.getString("estado_usuario"));
				user.setFechaModificacion(result.getString("fecha_modificacion_usuario"));
				user.setFechaLogin(result.getString("fecha_ultimo_login_usuario"));
				user.setUsuario(result.getString("usuario_usuario"));
				user.setClave(result.getString("clave_usuario"));
				user.setRol(result.getString("nombre_cargo"));
				listaUsuarios.add(user);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			listaUsuarios = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaUsuarios;
	}
	
	// METODO PARA CREAR USUARIOS
	public String crearUsuario(usuarioVO usuario, int cargo) {
		
		String toReturn = null;
		Connection connection = null;
		CallableStatement cs = null;
		ResultSet result = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			cs = connection.prepareCall("{call crearUsuario(?,?,?,?,?,?,?,?,?,?,?)}");
			cs.setInt(1, usuario.getDocumento());
			cs.setString(2, usuario.getNombres());
			cs.setString(3, usuario.getApellidos());
			cs.setString(4, usuario.getCorreo());
			cs.setString(5, usuario.getTelefono());
			cs.setString(6, usuario.getEstado());
			cs.setString(7, LocalDate.now().toString());
			cs.setString(8, LocalDate.now().toString());
			cs.setString(9, usuario.getUsuario());
			cs.setString(10, usuario.getClave());
			cs.setInt(11, cargo);

			result = cs.executeQuery();
			
			if(result.next()) {
				toReturn = result.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(connection != null) connection.close();
				if(cs != null) cs.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return toReturn;
	}
	
	// METODO PARA CREAR USUARIOS
	public String actualizarUsuario(usuarioVO usuario, int cargo) {
		
		String toReturn = null;
		Connection connection = null;
		CallableStatement cs = null;
		ResultSet result = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			cs = connection.prepareCall("{CALL actualizarUsuario(?,?,?,?,?,?,?,?)}");
			cs.setInt(1, usuario.getDocumento());
			cs.setString(2, usuario.getNombres());
			cs.setString(3, usuario.getApellidos());
			cs.setString(4, usuario.getCorreo());
			cs.setString(5, usuario.getTelefono());
			cs.setString(6, usuario.getEstado());
			cs.setString(7, LocalDate.now().toString());
			cs.setInt(8, cargo);

			result = cs.executeQuery();
			
			if(result.next()) {
				toReturn = result.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(connection != null) connection.close();
				if(cs != null) cs.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return toReturn;
	}
	
	// METODO PARA BUSCAR TODOS LOS USUARIOS DE LA TABLA USUARIOS
	public boolean cambiarClave(String clave, int documento){
		
		Connection connection = null;
		PreparedStatement ps = null;
		String sql = "UPDATE usuario SET clave_usuario=? WHERE documento_usuario=?";
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			ps.setString(1, clave);
			ps.setInt(2, documento);
			ps.execute();
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
