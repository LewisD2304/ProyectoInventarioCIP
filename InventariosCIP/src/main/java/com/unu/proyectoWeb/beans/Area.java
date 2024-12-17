package com.unu.proyectoWeb.beans;

public class Area {
	private int idarea;
	private String nombreAreas;
	
	
	
	public Area() {
		super();
	}



	public Area(int idarea, String nombreAreas) {
		super();
		this.idarea = idarea;
		this.nombreAreas = nombreAreas;
	}



	public int getIdarea() {
		return idarea;
	}



	public void setIdarea(int idarea) {
		this.idarea = idarea;
	}



	public String getNombreAreas() {
		return nombreAreas;
	}



	public void setNombreAreas(String nombreAreas) {
		this.nombreAreas = nombreAreas;
	}
	

}
