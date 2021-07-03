package util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ControlLogeo {
	private String path = "C:\\Users\\User\\eclipse-workspace\\proyecto\\src\\main\\webapp\\docs\\logeo.txt";
	private File archivo = new File(path);
	private List<String> listaLog;
	private int indice;
	
	public ControlLogeo() {
		this.listaLog = new ArrayList<String>();
		this.indice = -1;
	}
	
	public void validar_existencia() {
		System.out.println(archivo.getAbsolutePath());
		if (!archivo.exists()) {
		    System.out.println("OJO: ¡¡No existe el archivo de configuración!!");
		}
		else {
			System.out.println("Sí, aquí está el archivo");
		}
	}
	
	@Override
	public String toString() {
		return "ControlLogeo [listaLog=" + listaLog + "]";
	}
	
	public void insertarLog(String frase) {
		FileWriter escritura;
		try {
			escritura = new FileWriter(path, true);
			escritura.write(frase+"\n");
			escritura.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public boolean buscarLog(String frase) {
		this.actualizarLista();
		boolean logeado = false;
		for(String linea : this.listaLog) {
			if(frase.equalsIgnoreCase(linea)) {
				logeado = true;
				this.indice = this.listaLog.indexOf(linea);
			}
		}
		return logeado;
	} 
	
	public void eliminarLog(String frase) {
		if(this.buscarLog(frase)) {
			try {
				BufferedWriter bw = new BufferedWriter(new FileWriter(archivo));
				bw.write("");
				bw.close();
				this.listaLog.remove(this.indice);
				for(String linea : this.listaLog) {
					this.insertarLog(linea);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	} 
	
	private void actualizarLista() {
		try {
			this.listaLog = new ArrayList<String>();;
			String linea;
			BufferedReader br = new BufferedReader(new FileReader(archivo));
			while((linea = br.readLine()) != null) {
				this.listaLog.add(linea);
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	} 
}
