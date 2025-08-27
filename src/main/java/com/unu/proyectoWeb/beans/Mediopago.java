package com.unu.proyectoWeb.beans;

public class Mediopago {
	private int idMediopago;
	private String nombre;
	private String numerom;
	
	
	
	public Mediopago() {
		super();
	}



	public Mediopago(int mediopago, String nombre, String numerom) {
		super();
		idMediopago = mediopago;
		this.nombre = nombre;
		this.numerom = numerom;
	}



	public int getidMediopago() {
		return idMediopago;
	}



	public void setidMediopago(int mediopago) {
		idMediopago = mediopago;
	}



	public String getNombre() {
		return nombre;
	}



	public void setNombre(String nombre) {
		this.nombre = nombre;
	}



	public String getNumerom() {
		return numerom;
	}



	public void setNumerom(String numerom) {
		this.numerom = numerom;
	}
	
	
}
