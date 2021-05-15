package token;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.util.Formatter;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class HmacFirma {
	
	private final String HMAC_SHA512 = "HmacSHA512";

	private String toHexString(byte[] bytes) {
	    try (Formatter formatter = new Formatter()) {
				for (byte b : bytes) {
				    formatter.format("%02x", b);
				}
				return formatter.toString();
			}
	}

	public String calculateHMAC(String data, String key)
	    throws SignatureException, NoSuchAlgorithmException, InvalidKeyException
	{
	    SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(), HMAC_SHA512);
	    Mac mac = Mac.getInstance(HMAC_SHA512);
	    mac.init(secretKeySpec);
	    return toHexString(mac.doFinal(data.getBytes()));
	}

}
