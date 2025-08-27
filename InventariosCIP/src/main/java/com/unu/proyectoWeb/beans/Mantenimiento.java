package com.unu.proyectoWeb.beans;

public class Mantenimiento {
	private int idmovimiento;
	private String fechaMant;
	private String tipoMant;
	private Double costo;
	private String responsable;
	private String idbienes;
	private String idproveedores;
	
	public Mantenimiento() {
		super();
	}


	public Mantenimiento(int idmovimiento, String fechaMant, String tipoMant, Double costo, String responsable,
			String idbienes, String idproveedores) {
		super();
		this.idmovimiento = idmovimiento;
		this.fechaMant = fechaMant;
		this.tipoMant = tipoMant;
		this.costo = costo;
		this.responsable = responsable;
		this.idbienes = idbienes;
		this.idproveedores = idproveedores;
	}


	public int getIdmovimiento() {
		return idmovimiento;
	}


	public void setIdmovimiento(int idmovimiento) {
		this.idmovimiento = idmovimiento;
	}


	public String getFechaMant() {
		return fechaMant;
	}


	public void setFechaMant(String fechaMant) {
		this.fechaMant = fechaMant;
	}


	public String getTipoMant() {
		return tipoMant;
	}


	public void setTipoMant(String tipoMant) {
		this.tipoMant = tipoMant;
	}


	public Double getCosto() {
		return costo;
	}


	public void setCosto(Double costo) {
		this.costo = costo;
	}


	public String getResponsable() {
		return responsable;
	}


	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}


	public String getIdbienes() {
		return idbienes;
	}


	public void setIdbienes(String idbienes) {
		this.idbienes = idbienes;
	}


	public String getIdproveedores() {
		return idproveedores;
	}


	public void setIdproveedores(String idproveedores) {
		this.idproveedores = idproveedores;
	}
	
	
}
