package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.VO.tipoDocumentoVO;
import util.DBConnection;

public class tipoDocumentoDAO {
	
	// METODO PARA VER TODOS LOS TIPOS DE DOCUMENTO
	public List<tipoDocumentoVO> verTodosTipos(){
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		String sql = "SELECT * FROM tipo_documento";
		List<tipoDocumentoVO> listaTipos = new ArrayList();
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			result = ps.executeQuery();
			
			while(result.next()){
				tipoDocumentoVO tipo = new tipoDocumentoVO();
				tipo.setId(result.getInt("id_tipo_documento"));
				tipo.setNombre(result.getString("nombre_tipo_documento"));
				tipo.setSigla(result.getString("siglas_tipo_documento"));
				listaTipos.add(tipo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			listaTipos = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(result != null) result.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return listaTipos;
	}
}
