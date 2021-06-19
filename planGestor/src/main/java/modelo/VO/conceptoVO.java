package modelo.VO;

public class conceptoVO {
	
	private int id;
	private String descripcion;
	private double valorSinIva;
	private double descuento;
	private int numeroFactura;
	private String placa;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion.toUpperCase();
	}
	
	public double getValorSinIva() {
		return valorSinIva;
	}
	public void setValorSinIva(double valorSinIva) {
		this.valorSinIva = valorSinIva;
	}
	
	public double getDescuento() {
		return descuento;
	}
	public void setDescuento(double descuento) {
		this.descuento = descuento;
	}
	
	public int getNumeroFactura() {
		return numeroFactura;
	}
	public void setNumeroFactura(int numeroFactura) {
		this.numeroFactura = numeroFactura;
	}
	
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa.toUpperCase();
	}
	
	@Override
	public String toString() {
		return "conceptoVO [id=" + id + ", descripcion=" + descripcion + ", valorSinIva=" + valorSinIva + ", descuento="
				+ descuento + ", numeroFactura=" + numeroFactura + ", placa=" + placa + "]";
	}
	
	
}
