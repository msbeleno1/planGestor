package planGestor.controlador.token;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;

import org.json.simple.*;
import planGestor.modeloVO.*;

public class jsonToken {
	
	private JSONObject obj;
	private String head, body, signature;
	private usuarioVO usuario;
	private base64 b64;
	private HmacSignature firma;
	private final String keySecure = "9A926ADF2BA002916C5FF0E58170F4C94BA48D44C486C017CC1E8D19B32F0E23";
	
	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}
	
	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}
	
	
	public usuarioVO getUsuario() {
		return usuario;
	}

	public void setUsuario(usuarioVO usuario) {
		this.usuario = usuario;
	}

	
	//METODOS
	public jsonToken (usuarioVO usuVO) {
		this.usuario = usuVO;
		this.b64 = new base64();
		this.firma = new HmacSignature();
	}
	
	@SuppressWarnings("unchecked")
	private void head() {
		this.obj = new JSONObject();
		obj.put("alg", "HS256");
		obj.put("typ", "JWT");
		this.setHead(b64.encode(obj.toJSONString()));
	}
	
	@SuppressWarnings("unchecked")
	private void body() {
		this.obj = new JSONObject();
		obj.put("user", getUsuario().getUsuario());
		obj.put("rol", getUsuario().getRol());
		this.setBody(b64.encode(obj.toJSONString()));
	}
	
	private void signature() {
		String data = this.getHead()+"."+this.getBody();
		try {
			String hash = firma.calculateHMAC(data, keySecure);
			this.setSignature(hash);
		} catch (InvalidKeyException | SignatureException | NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
	
	public String getToken() {
		this.head();
		this.body();
		this.signature();
		return getHead() +"."+ getBody()+"."+ getSignature();
	}
	
	public boolean validateToken(String tokenExterno) {
		if(this.getToken().equals(tokenExterno))
			return true;
		else
			return false;
	}

}
