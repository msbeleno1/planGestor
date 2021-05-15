package token;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import modelo.VO.usuarioVO;

public class tokenJWT {
	
	private Gson json;
	private String head, body, signature;
	private usuarioVO usuario;
	private base64 b64;
	private HmacFirma firma;
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
	public tokenJWT (usuarioVO usuVO) {
		this.usuario = usuVO;
		this.b64 = new base64();
		this.firma = new HmacFirma();
	}
	
	private void head() {
		this.json = new Gson();
		List<String> info = new ArrayList<String>();
		info.add("alg: HS256");
		info.add("typ: JWT");
		json.toJson(info);
		this.setHead(b64.encode(json.toString()));
		System.out.println("Mi head es "+ json.toString());
	}
	
	private void body() {
		this.json = new Gson();
		List<String> info = new ArrayList<String>();
		info.add("user" + getUsuario().getUsuario());
		info.add("rol" + getUsuario().getRol());
		json.toJson(info);
		this.setBody(b64.encode(json.toString()));
		System.out.println("Mi body es "+ json.toString());
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
		System.out.println("Mi token es "+ getHead() +"."+ getBody()+"."+ getSignature());
		return getHead() +"."+ getBody()+"."+ getSignature();
	}
	
	public boolean validateToken(String tokenExterno) {
		if(this.getToken().equals(tokenExterno))
			return true;
		else
			return false;
	}
}
