package modelo.DAO;

import java.sql.*;
import java.util.*;

import modelo.VO.cargoVO;
import util.DBConnection;

public class cargoDAO {
	
	// METODO PARA BUSCAR TODOS LOS CARGOS DE LA TABLA CARGOS
	public List<cargoVO> verTodosCargos(){
		
		Connection connection = null;
		PreparedStatement ps = null;
		List<cargoVO> listaCargos = new ArrayList<>();
		String sql = "SELECT * FROM cargo";
		ResultSet result = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			result = ps.executeQuery();
			
			while(result.next()) {
				cargoVO cargo = new cargoVO();
				cargo.setId(result.getInt("id_cargo"));
				cargo.setCargo(result.getString("nombre_cargo"));
				listaCargos.add(cargo);
			}
			
		} catch (SQLException e) {
			System.err.println("SQL al consultar dice: "+e.toString());
			listaCargos = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaCargos;
	}
}
