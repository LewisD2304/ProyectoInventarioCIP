package com.unu.proyectoWeb.beans;

public class Bienes {
	private int idbienes;
	private int verificar;
	private String nombrebien;
	private String marca;
	private String modelo;
	private String nroSerie;
	private String fechaAdquisicion;
	private String valorCompra;
	private int estado;
	private String descripcion;
	private String codigoBien;
	private String idcategorias;
	private String idproveedores;
	private String idresponsable;
	private int idcategoriass;
	private int idproveedoress;
	private int idresponsables;
	private String nombreArea;
	private String idcomprobante;
	private int idcomprobantes;
	private String nombreMedioPago;
	private String numeroMedioPago;
	private String nombreTipoComprobante;
	private String numeroComprobante;

	public Bienes() {
		super();
	}

	public Bienes(int idbienes, int verificar, String nombrebien, String marca, String modelo, String nroSerie,
			String fechaAdquisicion, String valorCompra, int estado, String descripcion, String codigoBien,
			String idcategorias, String idproveedores, String idresponsable, int idcategoriass, int idproveedoress,
			int idresponsables, String nombreArea, String idcomprobante, int idcomprobantes, String nombreMedioPago,
			String numeroMedioPago, String nombreTipoComprobante, String numeroComprobante) {
		super();
		this.idbienes = idbienes;
		this.verificar = verificar;
		this.marca = marca;
		this.modelo = modelo;
		this.nroSerie = nroSerie;
		this.fechaAdquisicion = fechaAdquisicion;
		this.valorCompra = valorCompra;
		this.estado = estado;
		this.descripcion = descripcion;
		this.codigoBien = codigoBien;
		this.idcategorias = idcategorias;
		this.idproveedores = idproveedores;
		this.idresponsable = idresponsable;
		this.idcategoriass = idcategoriass;
		this.idproveedoress = idproveedoress;
		this.idresponsables = idresponsables;
		this.nombreArea = nombreArea;
		this.idcomprobante = idcomprobante;
		this.idcomprobantes = idcomprobantes;
		this.nombreMedioPago = nombreMedioPago;
		this.numeroMedioPago = numeroMedioPago;
		this.nombreTipoComprobante = nombreTipoComprobante;
		this.numeroComprobante = numeroComprobante;
	}

	public Bienes(int idbienes, int verificar, String nombrebien, String marca, String modelo, String nroSerie,
			String fechaAdquisicion, String valorCompra, int estado, String descripcion, String codigoBien,
			String idcategorias, String idproveedores, String idresponsable, String nombreArea) {
		super();
		this.idbienes = idbienes;
		this.verificar = verificar;
		this.nombrebien = nombrebien;
		this.marca = marca;
		this.modelo = modelo;
		this.nroSerie = nroSerie;
		this.fechaAdquisicion = fechaAdquisicion;
		this.valorCompra = valorCompra;
		this.estado = estado;
		this.descripcion = descripcion;
		this.codigoBien = codigoBien;
		this.idcategorias = idcategorias;
		this.idproveedores = idproveedores;
		this.idresponsable = idresponsable;
		this.nombreArea = nombreArea;
	}

	public Bienes(int idbienes, int verificar, String nombrebien, String marca, String modelo, String nroSerie,
			String fechaAdquisicion, String valorCompra, int estado, String descripcion, String codigoBien,
			String idcategorias, String idproveedores, String idresponsable, int idcategoriass, int idproveedoress,
			int idresponsables, String nombreArea) {
		super();
		this.idbienes = idbienes;
		this.verificar = verificar;
		this.nombrebien = nombrebien;
		this.marca = marca;
		this.modelo = modelo;
		this.nroSerie = nroSerie;
		this.fechaAdquisicion = fechaAdquisicion;
		this.valorCompra = valorCompra;
		this.estado = estado;
		this.descripcion = descripcion;
		this.codigoBien = codigoBien;
		this.idcategorias = idcategorias;
		this.idproveedores = idproveedores;
		this.idresponsable = idresponsable;
		this.idcategoriass = idcategoriass;
		this.idproveedoress = idproveedoress;
		this.idresponsables = idresponsables;
		this.nombreArea = nombreArea;
	}

	
	public int getVerificar() {
		return verificar;
	}

	public void setVerificar(int verificar) {
		this.verificar = verificar;
	}

	public String getNombreMedioPago() {
		return nombreMedioPago;
	}

	public void setNombreMedioPago(String nombreMedioPago) {
		this.nombreMedioPago = nombreMedioPago;
	}

	public String getNumeroMedioPago() {
		return numeroMedioPago;
	}

	public void setNumeroMedioPago(String numeroMedioPago) {
		this.numeroMedioPago = numeroMedioPago;
	}

	public String getNombreTipoComprobante() {
		return nombreTipoComprobante;
	}

	public void setNombreTipoComprobante(String nombreTipoComprobante) {
		this.nombreTipoComprobante = nombreTipoComprobante;
	}

	public String getNumeroComprobante() {
		return numeroComprobante;
	}

	public void setNumeroComprobante(String numeroComprobante) {
		this.numeroComprobante = numeroComprobante;
	}

	public String getIdcomprobante() {
		return idcomprobante;
	}

	public void setIdcomprobante(String idcomprobante) {
		this.idcomprobante = idcomprobante;
	}

	public int getIdcomprobantes() {
		return idcomprobantes;
	}

	public void setIdcomprobantes(int idcomprobantes) {
		this.idcomprobantes = idcomprobantes;
	}

	public int getIdcategoriass() {
		return idcategoriass;
	}

	public void setIdcategoriass(int idcategoriass) {
		this.idcategoriass = idcategoriass;
	}

	public int getIdproveedoress() {
		return idproveedoress;
	}

	public void setIdproveedoress(int idproveedoress) {
		this.idproveedoress = idproveedoress;
	}

	public int getIdresponsables() {
		return idresponsables;
	}

	public void setIdresponsables(int idresponsables) {
		this.idresponsables = idresponsables;
	}

	public String getNombreArea() {
		return nombreArea;
	}

	public void setNombreArea(String nombreArea) {
		this.nombreArea = nombreArea;
	}

	public String getCodigoBien() {
		return codigoBien;
	}

	public void setCodigoBien(String codigoBien) {
		this.codigoBien = codigoBien;
	}

	public int getIdbienes() {
		return idbienes;
	}

	public void setIdbienes(int idbienes) {
		this.idbienes = idbienes;
	}

	public String getNombrebien() {
		return nombrebien;
	}

	public void setNombrebien(String nombrebien) {
		this.nombrebien = nombrebien;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getNroSerie() {
		return nroSerie;
	}

	public void setNroSerie(String nroSerie) {
		this.nroSerie = nroSerie;
	}

	public String getFechaAdquisicion() {
		return fechaAdquisicion;
	}

	public void setFechaAdquisicion(String fechaAdquisicion) {
		this.fechaAdquisicion = fechaAdquisicion;
	}

	public String getValorCompra() {
		return valorCompra;
	}

	public void setValorCompra(String valorCompra) {
		this.valorCompra = valorCompra;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getIdcategorias() {
		return idcategorias;
	}

	public void setIdcategorias(String idcategorias) {
		this.idcategorias = idcategorias;
	}

	public String getIdproveedores() {
		return idproveedores;
	}

	public void setIdproveedores(String idproveedores) {
		this.idproveedores = idproveedores;
	}

	public String getIdresponsable() {
		return idresponsable;
	}

	public void setIdresponsable(String idresponsable) {
		this.idresponsable = idresponsable;
	}

}