package modelo.VO;

public class facturaVO {
	
	private int numero;
	private String fechaEmision;
	private String tipoFactura; // "SERVICIO", "VENTA"
	private double totalSinIva;
	private double totalConIva;
	private int idCliente;
	
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	
	public String getFechaEmision() {
		return fechaEmision;
	}
	public void setFechaEmision(String fechaEmision) {
		this.fechaEmision = fechaEmision;
	}
	
	public String getTipoFactura() {
		return tipoFactura;
	}
	public void setTipoFactura(String tipoFactura) {
		this.tipoFactura = tipoFactura.toUpperCase();
	}
	
	public double getTotalSinIva() {
		return totalSinIva;
	}
	public void setTotalSinIva(double totalSinIva) {
		this.totalSinIva = totalSinIva;
	}
	
	public double getTotalConIva() {
		return totalConIva;
	}
	public void setTotalConIva(double totalConIva) {
		this.totalConIva = totalConIva;
	}
	
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

}
