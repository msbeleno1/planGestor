package modelo.VO;

public class cargoVO {
	private int id;
	private String cargo;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCargo() {
		return cargo;
	}
	
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	@Override
	public String toString() {
		return "id=" + id + ", cargo=" + cargo;
	}
	
	
}
