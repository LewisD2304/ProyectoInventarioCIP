package com.unu.proyectoWeb.beans;

public class Responsable {
	private int idresponsable;
	private String nombreResponsable;
	private String cargo;
	private String telefono;
	private String idarea;
	private int idareas;
	
	
	
	public Responsable() {
		super();
	}



	public Responsable(int idresponsable, String nombreResponsable, String cargo, String telefono, String correo,
			String estado, String idarea, int idareas) {
		super();
		this.idresponsable = idresponsable;
		this.nombreResponsable = nombreResponsable;
		this.cargo = cargo;
		this.telefono = telefono;
		this.idarea = idarea;
		this.idareas = idareas;
	}



	public int getIdareas() {
		return idareas;
	}



	public void setIdareas(int idareas) {
		this.idareas = idareas;
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



	public String getIdarea() {
		return idarea;
	}



	public void setIdarea(String idarea) {
		this.idarea = idarea;
	}
	
	
	
}
