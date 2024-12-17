package com.unu.proyectoWeb.beans;

public class Categorias {

	private int idcategorias;
	private String nombreCategoria;
	
	
	
	public Categorias() {
		super();
	}



	public Categorias(int idcategorias, String nombreCategoria) {
		super();
		this.idcategorias = idcategorias;
		this.nombreCategoria = nombreCategoria;
	}



	public int getIdcategorias() {
		return idcategorias;
	}



	public void setIdcategorias(int idcategorias) {
		this.idcategorias = idcategorias;
	}



	public String getNombreCategoria() {
		return nombreCategoria;
	}



	public void setNombreCategoria(String nombreCategoria) {
		this.nombreCategoria = nombreCategoria;
	}
	

}
