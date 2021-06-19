package modelo.VO;

public class vehiculoVO {
	
	private String placa;
	private String chasis;
	private String motor;
	private String Fabricante;
	private String linea;
	private String modelo;
	private int propietario;
	
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa.toUpperCase();
	}
	
	public String getChasis() {
		return chasis;
	}
	public void setChasis(String chasis) {
		this.chasis = chasis.toUpperCase();
	}
	
	public String getMotor() {
		return motor;
	}
	public void setMotor(String motor) {
		this.motor = motor.toUpperCase();
	}
	
	public String getFabricante() {
		return Fabricante;
	}
	public void setFabricante(String fabricante) {
		Fabricante = fabricante.toUpperCase();
	}
	public String getLinea() {
		return linea;
	}
	public void setLinea(String linea) {
		this.linea = linea.toUpperCase();
	}
	
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo.substring(0, 4);
	}
	
	public int getPropietario() {
		return propietario;
	}
	public void setPropietario(int propietario) {
		this.propietario = propietario;
	}

}
