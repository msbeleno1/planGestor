package modelo.VO;

public class radicadoVO {
	
	private String numeroRadicado;
	private String fechaEmision;
	private String descripcion;
	private String estado; // "CERRADO","ESCALADO","CON REPUESTA","ASIGNADO","EN ESPERA"
	private int idClasificacion;
	private String placa;
	private int documentoUsuario;
	private int idCliente;
	
	public radicadoVO() {
		this.placa = "SIN PLACA";
	}

	public String getNumeroRadicado() {
		return numeroRadicado;
	}

	public void setNumeroRadicado(String numeroRadicado) {
		this.numeroRadicado = numeroRadicado.toUpperCase();
	}

	public String getFechaEmision() {
		return fechaEmision;
	}

	public void setFechaEmision(String fechaEmision) {
		this.fechaEmision = fechaEmision;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion.toUpperCase();
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado.toUpperCase();
	}


	public int getIdClasificacion() {
		return idClasificacion;
	}

	public void setIdClasificacion(int idClasificacion) {
		this.idClasificacion = idClasificacion;
	}

	public String getPlaca() {
		return placa.toUpperCase();
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public int getDocumentoUsuario() {
		return documentoUsuario;
	}

	public void setDocumentoUsuario(int documentoUsuario) {
		this.documentoUsuario = documentoUsuario;
	}

	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	@Override
	public String toString() {
		return "radicadoVO [numeroRadicado=" + numeroRadicado + ", fechaEmision=" + fechaEmision + ", descripcion="
				+ descripcion + ", estado=" + estado + ", idClasificacion=" + idClasificacion + ", placa=" + placa
				+ ", documentoUsuario=" + documentoUsuario + ", idCliente=" + idCliente + "]";
	}
}
