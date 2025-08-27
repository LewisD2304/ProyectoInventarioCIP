package com.unu.proyectoWeb.beans;

public class Proveedores {
	private int idproveedores;
	private String nombreprov;
	private String clasificacion;
	private String ruc;
	private String direccion;
	private String telefono;
	private String correo;
	
	
	public Proveedores() {
		super();
	}


	public Proveedores(int idproveedores, String nombreprov, String clasificacion, String ruc, String direccion,
			String telefono, String correo) {
		super();
		this.idproveedores = idproveedores;
		this.nombreprov = nombreprov;
		this.clasificacion = clasificacion;
		this.ruc = ruc;
		this.direccion = direccion;
		this.telefono = telefono;
		this.correo = correo;
	}


	public int getIdproveedores() {
		return idproveedores;
	}


	public void setIdproveedores(int idproveedores) {
		this.idproveedores = idproveedores;
	}


	public String getNombreprov() {
		return nombreprov;
	}


	public void setNombreprov(String nombreprov) {
		this.nombreprov = nombreprov;
	}


	public String getClasificacion() {
		return clasificacion;
	}


	public void setClasificacion(String clasificacion) {
		this.clasificacion = clasificacion;
	}


	public String getRuc() {
		return ruc;
	}


	public void setRuc(String ruc) {
		this.ruc = ruc;
	}


	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public String getCorreo() {
		return correo;
	}


	public void setCorreo(String correo) {
		this.correo = correo;
	}
	
	
}
