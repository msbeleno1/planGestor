package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class funcionesParaFichero {
	
	public static List<String[]> leerCsv(InputStream inStream) {
		
		BufferedReader miBuffer; // Servirá de Buffer entre el archivo y Java
		List<String[]> lineas = new ArrayList<>(); // Donde se almacenarán todas las lineas que componen al archivo
		String[] partes; // Donde se almacenarán todas las partes que componen una linea
		
		try {
			miBuffer = new BufferedReader(new InputStreamReader(inStream, StandardCharsets.UTF_8));
			
			String linea = miBuffer.readLine(); // Variable temporal de cada linea
			
			while(linea != null) {
				linea = miBuffer.readLine();
				
				if(linea != null) {
					partes = linea.split(";");
					lineas.add(partes);
				}
			}
			
			miBuffer.close();
		} catch (IOException e) {
			lineas = null;			
		} 
		return lineas;
	}
	
	public static boolean verificarFichero(List<String[]> lineas, String uso) {
		boolean toReturn = true;
		
		// PRIMERO VALIDAMOS QUE LA LISTA NO ESTÉ VACIA
		if(lineas != null) {
			
			// SI ES USUARIO VALIDAMOS QUE HAYAN 7 COLUMNAS EN CADA LINEA Y QUE CADA CAMPO CUMPLA CON LO REQUERIDO
			if(uso.equalsIgnoreCase("usuario")) {
				for(String[] linea : lineas) {
					if(linea.length != 7 || !validarUsuario(linea)) {
						toReturn = false;
						break;
					}					
				}
			}
		}
		else
			toReturn = false;
		return toReturn;
	}
	
	public static void imprimir(String[] linea) {
		for(String item : linea) {
			System.out.print(" | "+item.toUpperCase());
		}
		System.out.println();
		System.out.println("------Columnas: "+linea.length+"------");
	}
	
	
	
	// FUNCIONES PARA VALIDACIONES DE DATOS --------------------------------------------------------------------------------
	
	public static boolean validarUsuario(String[] linea) {
		// REGEX PARA VALIDAR DATOS DEL USUARIO
		Pattern patDocumento = Pattern.compile("^[0-9]{8,20}$");
		Pattern patApellido = Pattern.compile("^[A-Za-z ]{5,15}$");
		Pattern patNombre = Pattern.compile("^[A-Za-z ]{10,15}$");
		Pattern patCorreo = Pattern.compile("^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
		Pattern patClave = Pattern.compile("^(?=.*\\d)(?=.*[\\u0021-\\u002f\\u003a-\\u0040\\u005e-\\u005f])(?=.*[A-Z])(?=.*[a-z])\\S{8,16}$"); // REGEX PARA VALIDAR SI CUMPLE LA CLAVE
		Pattern patTelefono = Pattern.compile("^[0-9]{5,15}$"); 
		Pattern patCargo = Pattern.compile("^[ASESOR|ADMINISTRADOR|SUPERVISOR]{6,13}$");
		
		// AGREGAMOS CADA COLUMNA DE LA LINEA A VALIDAR
		Matcher mat = patDocumento.matcher(linea[0]);
		mat = patCargo.matcher(linea[1].toUpperCase());
		mat = patNombre.matcher(linea[2]);
		mat = patApellido.matcher(linea[3]);
		mat = patClave.matcher(linea[4]);
		mat = patTelefono.matcher(linea[5]);
		mat = patCorreo.matcher(linea[6]);
		
		// VALIDAMOS SI TODAS CUMPLEN LOS REQUISITOS Y DEVOLVEMOS EL VALOR
	     return mat.matches();
	}
}
