package modelo.VO;

public class usuarioVO {
	
	private int documento;
	private String nombres;
	private String apellidos;
	private String correo;
	private String telefono;
	private String estado;
	private String fechaModificacion;
	private String fechaLogin;
	private String usuario;
	private String clave;
	private String rol;
	
	//----------------------------GET Y SET ID----------------------
	/**
	 * @return the documento
	 */
	public int getDocumento() {
		return this.documento;
	}
	/**
	 * @param id the documento to set
	 */
	public void setDocumento(int documento) {
		this.documento = documento;
	}
	
	//--------------------------GET Y SET NOMBRES---------------------
	/**
	 * @return the nombres
	 */
	public String getNombres() {
		return nombres;
	}
	/**
	 * @param nombres the nombres to set
	 */
	public void setNombres(String nombres) {
		this.nombres = nombres.toUpperCase();
	}
	
	//---------------------------GET Y SET APELLIDOS--------------------
	/**
	 * @return the apellidos
	 */
	public String getApellidos() {
		return apellidos;
	}
	/**
	 * @param apellidos the apellidos to set
	 */
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos.toUpperCase();
	}
	
	//--------------------------GET Y SET EDAD----------------------------
	/**
	 * @return the telefono
	 */
	public String getTelefono() {
		return telefono;
	}
	/**
	 * @param edad the telefono to set
	 */
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	//-------------------------GET Y SET CORREO-----------------------------
	/**
	 * @return the correo
	 */
	public String getCorreo() {
		return correo;
	}
	/**
	 * @param correo the correo to set
	 */
	public void setCorreo(String correo) {
		this.correo = correo.toUpperCase();
	}
	
	//------------------------GET Y SET USUARIO----------------------------------
	/**
	 * @return the usuario
	 */
	public String getUsuario() {
		return usuario;
	}
	/**
	 * @param usuario the usuario to set
	 */
	public void setUsuario(String usuario) {
		this.usuario = usuario.toUpperCase();
	}
	
	//------------------------GET Y SET CLAVE------------------------------------
	/**
	 * @return the clave
	 */
	public String getClave() {
		return clave;
	}
	/**
	 * @param clave the clave to set
	 */
	public void setClave(String clave) {
		this.clave = clave.toUpperCase();
	}


	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol.toUpperCase();
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado.toUpperCase();
	}
	public String getFechaModificacion() {
		return fechaModificacion;
	}
	public void setFechaModificacion(String fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}
	public String getFechaLogin() {
		return fechaLogin;
	}
	public void setFechaLogin(String fechaLogin) {
		this.fechaLogin = fechaLogin;
	}
	
	@Override
	public String toString() {
		return "usuarioVO [documento=" + documento + ", nombres=" + nombres + ", apellidos=" + apellidos + ", correo="
				+ correo + ", telefono=" + telefono + ", estado=" + estado + ", fechaModificacion=" + fechaModificacion
				+ ", fechaLogin=" + fechaLogin + ", usuario=" + usuario + ", clave=" + clave + ", rol=" + rol + "]";
	}
}
