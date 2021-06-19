package modelo.VO;

public class clasificacionVO {
	
	private int idClasificacion;
	private String nombre;
	private int idTipoRadicado;
	
	public int getIdClasificacion() {
		return idClasificacion;
	}
	public void setIdClasificacion(int idClasificacion) {
		this.idClasificacion = idClasificacion;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre.toUpperCase();
	}
	
	public int getIdTipoRadicado() {
		return idTipoRadicado;
	}
	public void setIdTipoRadicado(int idTipoRadicado) {
		this.idTipoRadicado = idTipoRadicado;
	}
	
	
	@Override
	public String toString() {
		return "clasificacionVO [idClasificacion=" + idClasificacion + ", nombre=" + nombre + ", idTipoRadicado="
				+ idTipoRadicado + "]";
	}
	
	
}
