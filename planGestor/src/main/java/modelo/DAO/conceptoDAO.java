package modelo.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.VO.conceptoVO;
import modelo.VO.facturaVO;
import util.DBConnection;

public class conceptoDAO {
	
	// METODO PARA BUSCAR TODOS LOS CONCEPTOS DE LA TABLA CONCEPTOS
	public List<conceptoVO> verTodosConceptos(){
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		String sql = "SELECT * FROM concepto";
		List<conceptoVO> listaConceptos = new ArrayList<>();
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			result = ps.executeQuery();
			
			while(result.next()) {
				conceptoVO concepto = new conceptoVO();
				concepto.setId(result.getInt("id_concepto"));
				concepto.setDescripcion(result.getString("descripcion_concepto"));
				concepto.setValorSinIva(result.getDouble("valor_sin_iva"));
				concepto.setDescuento(result.getDouble("descuento_concepto"));
				concepto.setNumeroFactura(result.getInt("numero_factura"));
				concepto.setPlaca(result.getString("placa_vehiculo"));
				listaConceptos.add(concepto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			listaConceptos = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaConceptos;
	}
	
	public boolean agregarConcepto(conceptoVO concepto) {
		Connection connection = null;
		PreparedStatement ps = null;
		boolean toReturn = false;
		String sql = "INSERT INTO concepto (descripcion_concepto, valor_sin_iva, descuento_concepto, numero_factura, placa_vehiculo) VALUES (?,?,?,?,?)";
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			ps.setString(1, concepto.getDescripcion());
			ps.setDouble(2, concepto.getValorSinIva());
			ps.setDouble(3, concepto.getDescuento());
			ps.setInt(4, concepto.getNumeroFactura());
			ps.setString(5, concepto.getPlaca());
			ps.executeUpdate();
			
			toReturn = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return toReturn;
	}
	
	// METODO PARA ELIMINAR LOS CONCEPTOS Y LA FACTURA EN CASO DE HABER ERRORES AL INGRESARLOS
	public String eliminarConceptosAndFactura(int numero_factura) {
		Connection connection = null;
		CallableStatement cs = null;
		ResultSet result = null;
		String toReturn = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			cs = connection.prepareCall("{CALL eliminarConceptos(?)}");
			cs.setInt(1, numero_factura);
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
}
