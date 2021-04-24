package planGestor.modeloDAO;

import java.math.BigInteger;
import java.security.MessageDigest;

public class encriptaClave {
	
	//METODO PARA PARSEAR UN CONJUNTO DE CARACTERES MEDIANTE EL ALGORITMO SHA-256
	public String getSHA256(String password) {
		
        String toReturn = null;
        
        //System.out.println("-------CONTRASEÑA: "+passwordText+"---- \n \n");
        
        try {
        	//OBJETO QUE NOS PERMITE UTILIZAR FUNCIONES ALGORITMICAS PARA EL RESUMEN (ENCRIPTADO) DE CONTRASEÑAS
        	MessageDigest md = MessageDigest.getInstance("SHA-256");
        	
        	// REINICIAMOS EL RESUMEN REALIZADO ANTERIORMENTE POR ESE OBJETO
            md.reset();
            
            // ACTUALIZAMOS EL RESUMEN CONVIRTIENDO A HEXADECIMAL CADA UNO DE LOS CARACTERES DE LA PASSWORD Y ALMACENANDOLOS EN  BYTES
            md.update(password.getBytes("UTF-8"));
            
            // COMPLETA EL CALCULO HASH MEDIANTE LA REALIZACION DE OPERACIONES FINALES COMO EL RELLENO
            byte [] digestBytes = md.digest();
            
            //CONVIERTE EL CONJUNTO DE BYTES EN UN NUMERO ENTERO MUY GRANDE (BIGINTEGER)
            BigInteger bInteger = new BigInteger(1, digestBytes); //EL 1 ESPECIFICA QUE SE REQUIERE UN NÚMERO ENTERO POSITIVO
            //System.out.println("The value BigInteger is: \n"+bInteger+"\n"); //PRUEBA**********
            
            // DEVUELVE UN STRING CON FORMATO ENTERO HEXADECIMAL DE 64 BITS
            // LA X AL FINAL NOS DICE QUE SERÁ UN ENTERO HEXADECIMAL
            //EL 64 REPRESENTA EL TAMAÑO EN BYTES DEL VALOR A DEVOLVER
            //EL 0 REPRESENTA EL INDICE DEL ARGUMENTO DESDE DONDE REALIZARA EL FORMATEO
            toReturn = String.format("%064x", bInteger).toUpperCase();
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        //ALMACENAMOS EL RESULTADO EN UN CONJUNTO DE BYTES PARA DEVOLVER
        return toReturn;
    }
}
