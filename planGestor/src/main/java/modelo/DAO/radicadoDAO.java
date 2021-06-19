package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.VO.radicadoVO;
import util.DBConnection;

public class radicadoDAO {
	
	// METODO PARA BUSCAR TODOS LOS CARGOS DE LA TABLA CARGOS
	public List<radicadoVO> verTodosRadicados(){
		
		Connection connection = null;
		PreparedStatement ps = null;
		List<radicadoVO> listaRadicados = new ArrayList<>();
		String sql = "SELECT * FROM radicado";
		ResultSet result = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			result = ps.executeQuery();
			
			while(result.next()) {
				radicadoVO radicado = new radicadoVO();
				radicado.setNumeroRadicado(result.getString("numero_radicado"));
				radicado.setFechaEmision(result.getString("fecha_registro_radicado"));
				radicado.setDescripcion(result.getString("descripcion_radicado"));
				radicado.setEstado(result.getString("estado_radicado"));
				radicado.setIdClasificacion(result.getInt("id_clasificacion"));
				radicado.setPlaca(result.getString("placa_vehiculo"));
				radicado.setDocumentoUsuario(result.getInt("documento_usuario"));
				radicado.setIdCliente(result.getInt("id_cliente"));
				listaRadicados.add(radicado);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			listaRadicados = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaRadicados;
	}
	
	// METODO PARA BUSCAR TODOS LOS CARGOS DE LA TABLA CARGOS
	public List<radicadoVO> verRadicadosCliente(int idCliente){
		
		Connection connection = null;
		PreparedStatement ps = null;
		List<radicadoVO> listaRadicados = new ArrayList<>();
		String sql = "SELECT * FROM radicado id_cliente = ?";
		ResultSet result = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			ps.setInt(1, idCliente);
			result = ps.executeQuery();
			
			while(result.next()) {
				radicadoVO radicado = new radicadoVO();
				radicado.setNumeroRadicado(result.getString("numero_radicado"));
				radicado.setFechaEmision(result.getString("fecha_registro_radicado"));
				radicado.setDescripcion(result.getString("descripcion_radicado"));
				radicado.setEstado(result.getString("estado_radicado"));
				radicado.setIdClasificacion(result.getInt("id_clasificacion"));
				radicado.setPlaca(result.getString("placa_vehiculo"));
				radicado.setDocumentoUsuario(result.getInt("documento_usuario"));
				radicado.setIdCliente(result.getInt("id_cliente"));
				listaRadicados.add(radicado);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			listaRadicados = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaRadicados;
	}
}
