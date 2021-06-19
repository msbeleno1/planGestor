package modelo.VO;

public class tipoRadicadoVO {
	private int id;
	private String nombre;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre.toUpperCase();
	}
	
	@Override
	public String toString() {
		return "tipoRadicadoVO [id=" + id + ", nombre=" + nombre + "]";
	}
}
