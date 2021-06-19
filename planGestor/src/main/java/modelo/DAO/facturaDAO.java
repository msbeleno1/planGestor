package modelo.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.VO.clienteVO;
import modelo.VO.facturaVO;
import util.DBConnection;

public class facturaDAO {
	
	// METODO PARA BUSCAR TODOSLAS FACTURAS DE LA TABLA FACTURA
	public List<facturaVO> verTodosFacturas(){
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		String sql = "SELECT * FROM factura";
		List<facturaVO> listaFacturas = new ArrayList<>();
		
		try {
			connection = DBConnection.getConectionToDatabase();
			ps = connection.prepareStatement(sql);
			result = ps.executeQuery();
			
			while(result.next()) {
				facturaVO factura = new facturaVO();
				factura.setFechaEmision(result.getString("fecha_emision_factura"));
				factura.setIdCliente(result.getInt("id_cliente"));
				factura.setNumero(result.getInt("numero_factura"));
				factura.setTipoFactura(result.getString("tipo_factura"));
				factura.setTotalConIva(result.getDouble("total_con_iva_factura"));
				factura.setTotalSinIva(result.getDouble("total_sin_iva_factura"));
				listaFacturas.add(factura);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			listaFacturas = null;
		} finally {
			try {
				if(connection != null) connection.close();
				if(ps != null) ps.close();
				if(result != null) result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaFacturas;
	}
	
	
	// METODO PARA CREAR UNA FACTURA
	public String crearFactura(facturaVO factura) {
		Connection connection = null;
		CallableStatement cs = null;
		ResultSet result = null;
		String toReturn = null;
		
		try {
			connection = DBConnection.getConectionToDatabase();
			cs = connection.prepareCall("{CALL crearFactura(?,?,?,?,?,?)}");
			cs.setInt(1, factura.getNumero());
			cs.setString(2, factura.getFechaEmision());
			cs.setString(3, factura.getTipoFactura());
			cs.setDouble(4, factura.getTotalSinIva());
			cs.setDouble(5, factura.getTotalConIva());
			cs.setInt(6, factura.getIdCliente());
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
