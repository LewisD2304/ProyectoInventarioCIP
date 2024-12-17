package com.unu.proyectoWeb.beans;

public class Responsable {
	private int idresponsable;
	private String nombreResponsable;
	private String cargo;
	private String telefono;
	private String correo;
	private String estado; 
	private String idarea;
	
	
	
	public Responsable() {
		super();
	}



	public Responsable(int idresponsable, String nombreResponsable, String cargo, String telefono, String correo,
			String estado, String idarea) {
		super();
		this.idresponsable = idresponsable;
		this.nombreResponsable = nombreResponsable;
		this.cargo = cargo;
		this.telefono = telefono;
		this.correo = correo;
		this.estado = estado;
		this.idarea = idarea;
	}



	public int getIdresponsable() {
		return idresponsable;
	}



	public void setIdresponsable(int idresponsable) {
		this.idresponsable = idresponsable;
	}



	public String getNombreResponsable() {
		return nombreResponsable;
	}



	public void setNombreResponsable(String nombreResponsable) {
		this.nombreResponsable = nombreResponsable;
	}



	public String getCargo() {
		return cargo;
	}



	public void setCargo(String cargo) {
		this.cargo = cargo;
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



	public String getEstado() {
		return estado;
	}



	public void setEstado(String estado) {
		this.estado = estado;
	}



	public String getIdarea() {
		return idarea;
	}



	public void setIdarea(String idarea) {
		this.idarea = idarea;
	}
	
	
	
}
