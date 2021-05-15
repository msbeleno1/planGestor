package token;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class base64 {
	
	//METODO PARA DECODIFICAR EL STRING DE BASE 64
	public String decode(String s) throws UnsupportedEncodingException {
		
		String respuesta = "error";
		try {
			respuesta = new String(Base64.getDecoder().decode(s.getBytes("UTF8")),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return respuesta;
	}
	
	
	// METODO PARA CODIFICAR UN STRING EN BASE 64
	public String encode(String s) {
		
		String respuesta = "error";
		try {
			respuesta = new String(Base64.getEncoder().encode(s.getBytes("UTF8")),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return respuesta;
	}

}
