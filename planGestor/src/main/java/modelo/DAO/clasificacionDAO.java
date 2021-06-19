package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.VO.clasificacionVO;
import util.DBConnection;

public class clasificacionDAO {
	
	// METODO PARA BUSCAR TODOS LOS CARGOS DE LA TABLA CARGOS
	public List<clasificacionVO> verTodasClasificaciones(){
		
		Connection connection = null;
		PreparedStatement ps = null;
		List<clasificacionVO> listaClasificacion = new ArrayList<>();
		String sql = "SELECT * FROM clasificacion";
		ResultSet result = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			result = ps.executeQuery();
			
			while(result.next()) {
				clasificacionVO clasificacion = new clasificacionVO();
				clasificacion.setIdClasificacion(result.getInt("id_clasificacion"));
				clasificacion.setNombre(result.getString("nombre_clasificacion"));
				clasificacion.setIdTipoRadicado(result.getInt("id_tipo_radicado"));
				listaClasificacion.add(clasificacion);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			listaClasificacion = null;
			} finally {
				try {
					if(connection != null) connection.close();
					if(ps != null) ps.close();
					if(result != null) result.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return listaClasificacion;
		}
}
