package modelo.DAO;

import java.util.ArrayList;
import java.util.List;

import modelo.VO.clienteVO;
import util.DBConnection;

import java.sql.*;

public class clienteDAO {
	
	// METODO PARA BUSCAR TODOS LOS CLIENTES DE LA TABLA CLIENTE
	public List<clienteVO> verTodosClientes(){
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		String sql = "SELECT * FROM cliente";
		List<clienteVO> listaClientes = new ArrayList<>();
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			result = ps.executeQuery();
			
			while(result.next()) {
				clienteVO cliente = new clienteVO();
				cliente.setId(result.getInt("id_cliente"));
				cliente.setDocumento(result.getInt("documento_cliente"));
				cliente.setTipoDocumento(result.getInt("id_tipo_documento"));
				cliente.setNombre(result.getString("nombres_cliente"));
				cliente.setApellido(result.getString("apellidos_cliente"));
				cliente.setDireccion(result.getString("direccion_cliente"));
				cliente.setCorreo(result.getString("correo_cliente"));
				cliente.setTelefono(result.getString("telefono_cliente"));
				listaClientes.add(cliente);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			listaClientes = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaClientes;
	}
	
	
	// METODO PARA BUSCAR UN SOLO CLIENTE
	public clienteVO buscarCliente(int documento, int tipoDocumento) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		String sql = "SELECT * FROM cliente WHERE documento_cliente=? AND id_tipo_documento=?";
		clienteVO cliente = new clienteVO();
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			ps.setInt(1, documento);
			ps.setInt(2, tipoDocumento);
			result = ps.executeQuery();
			
			while(result.next()) {
				cliente.setId(result.getInt("id_cliente"));
				cliente.setDocumento(result.getInt("documento_cliente"));
				cliente.setTipoDocumento(result.getInt("id_tipo_documento"));
				cliente.setNombre(result.getString("nombres_cliente"));
				cliente.setApellido(result.getString("apellidos_cliente"));
				cliente.setDireccion(result.getString("direccion_cliente"));
				cliente.setCorreo(result.getString("correo_cliente"));
				cliente.setTelefono(result.getString("telefono_cliente"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			cliente = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cliente;
	}
	
	// METODO PARA CREAR UN CLIENTE
	public String crearCliente(clienteVO cliente) {
		Connection connection = null;
		CallableStatement cs = null;
		ResultSet result = null;
		String toReturn = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			cs = connection.prepareCall("{CALL crearCliente(?,?,?,?,?,?,?)}");
			cs.setInt(1, cliente.getDocumento());
			cs.setInt(2, cliente.getTipoDocumento());
			cs.setString(3, cliente.getNombre());
			cs.setString(4, cliente.getApellido());
			cs.setString(5, cliente.getDireccion());
			cs.setString(6, cliente.getCorreo());
			cs.setString(7, cliente.getTelefono());
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
	
	// METODO PARA CREAR UN CLIENTE
	public String actualizarCliente(clienteVO cliente, int tipoAntiguo) {
		Connection connection = null;
		CallableStatement cs = null;
		ResultSet result = null;
		String toReturn = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			cs = connection.prepareCall("{CALL actualizarCliente(?,?,?,?,?,?,?,?)}");
			cs.setInt(1, cliente.getDocumento());
			cs.setInt(2, cliente.getTipoDocumento());
			cs.setString(3, cliente.getNombre());
			cs.setString(4, cliente.getApellido());
			cs.setString(5, cliente.getDireccion());
			cs.setString(6, cliente.getCorreo());
			cs.setString(7, cliente.getTelefono());
			cs.setInt(8, tipoAntiguo);
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
	
	//
}
