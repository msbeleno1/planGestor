package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.VO.tipoRadicadoVO;
import util.DBConnection;

public class tipoRadicadoDAO {
	

	// METODO PARA BUSCAR TODOS LOS TIPO DE RADICADOS DE LA TABLA TIPOSRADICADOS
	public List<tipoRadicadoVO> verTodosTipos(){
		
		Connection connection = null;
		PreparedStatement ps = null;
		List<tipoRadicadoVO> listaTipos = new ArrayList<>();
		String sql = "SELECT * FROM tipo_radicado";
		ResultSet result = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			result = ps.executeQuery();
			
			while(result.next()) {
				tipoRadicadoVO tipo = new tipoRadicadoVO();
				tipo.setId(result.getInt("id_tipo_radicado"));
				tipo.setNombre(result.getString("nombre_tipo_radicado"));
				listaTipos.add(tipo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			listaTipos = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaTipos;
	}
}
