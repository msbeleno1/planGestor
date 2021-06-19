package modelo.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.VO.vehiculoVO;
import util.DBConnection;

public class vehiculoDAO {
	// METODO PARA BUSCAR TODOS LOS CLIENTES DE LA TABLA CLIENTE
		public List<vehiculoVO> verTodosVehiculos(){
			Connection connection = null;
			PreparedStatement ps = null;
			ResultSet result = null;
			String sql = "SELECT * FROM vehiculo";
			List<vehiculoVO> listaVehiculos = new ArrayList<>();
			
			try {
				connection = DBConnection.getConectionToDatabase();
				ps = connection.prepareStatement(sql);
				result = ps.executeQuery();
				
				while(result.next()) {
					vehiculoVO vehiculo = new vehiculoVO();
					vehiculo.setPlaca(result.getString("placa_vehiculo"));
					vehiculo.setMotor(result.getString("numero_motor_vehiculo"));
					vehiculo.setChasis(result.getString("numero_chasis_vehiculo"));
					vehiculo.setFabricante(result.getString("fabricante_vehiculo"));
					vehiculo.setLinea(result.getString("linea_vehiculo"));
					vehiculo.setModelo(result.getString("modelo_vehiculo"));
					vehiculo.setPropietario(result.getInt("id_cliente"));
					listaVehiculos.add(vehiculo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				listaVehiculos = null;
			} finally {
				try {
					if(connection != null) connection.close();
					if(ps != null) ps.close();
					if(result != null) result.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return listaVehiculos;
		}
		
		public String crearVehiculo(vehiculoVO vehiculo, int tipoDocumento) {
			Connection connection = null;
			CallableStatement cs = null;
			ResultSet result = null;
			String toReturn = null;
			
			try {
				connection = DBConnection.getConectionToDatabase();
				cs = connection.prepareCall("{CALL crearVehiculo(?,?,?,?,?,?,?,?)}");
				cs.setString(1, vehiculo.getPlaca());
				cs.setString(2, vehiculo.getMotor());
				cs.setString(3, vehiculo.getChasis());
				cs.setString(4, vehiculo.getFabricante());
				cs.setString(5, vehiculo.getLinea());
				cs.setString(6, vehiculo.getModelo());
				cs.setInt(7, vehiculo.getPropietario());
				cs.setInt(8, tipoDocumento);
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
		
		public String actualizarVehiculo(vehiculoVO vehiculo, int tipoDocumento) {
			Connection connection = null;
			CallableStatement cs = null;
			ResultSet result = null;
			String toReturn = null;
			
			try {
				connection = DBConnection.getConectionToDatabase();
				cs = connection.prepareCall("{CALL actualizarVehiculo(?,?,?,?,?,?,?,?)}");
				cs.setString(1, vehiculo.getPlaca());
				cs.setString(2, vehiculo.getMotor());
				cs.setString(3, vehiculo.getChasis());
				cs.setString(4, vehiculo.getFabricante());
				cs.setString(5, vehiculo.getLinea());
				cs.setString(6, vehiculo.getModelo());
				cs.setInt(7, vehiculo.getPropietario());
				cs.setInt(8, tipoDocumento);
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
