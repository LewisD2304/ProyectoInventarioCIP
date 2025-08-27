package com.unu.proyectoWeb.beans;

public class Tipocomprobante {
	private int idTipocomprobante;
	private String nombre;
	
	
	public Tipocomprobante() {
		super();
	}


	public Tipocomprobante(int idTipocomprobante, String nombre) {
		super();
		this.idTipocomprobante = idTipocomprobante;
		this.nombre = nombre;
	}


	public int getIdTipocomprobante() {
		return idTipocomprobante;
	}


	public void setIdTipocomprobante(int idTipocomprobante) {
		this.idTipocomprobante = idTipocomprobante;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
}
