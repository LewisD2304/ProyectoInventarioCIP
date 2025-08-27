package com.unu.proyectoWeb.beans;

public class Comprobantepago {
	private int idcomprobantePago;
	private String idmediopago;
	private String idtipoComprobante;
	private String numero;
	private String NumeroMedioPago;

	public Comprobantepago() {
		super();
	}

	public Comprobantepago(int idcomprobantePago, String idmediopago, String idtipoComprobante, String numero,
			String numeroMedioPago) {
		super();
		this.idcomprobantePago = idcomprobantePago;
		this.idmediopago = idmediopago;
		this.idtipoComprobante = idtipoComprobante;
		this.numero = numero;
		NumeroMedioPago = numeroMedioPago;
	}

	public String getNumeroMedioPago() {
		return NumeroMedioPago;
	}

	public void setNumeroMedioPago(String numeroMedioPago) {
		NumeroMedioPago = numeroMedioPago;
	}

	public int getIdcomprobantePago() {
		return idcomprobantePago;
	}

	public void setIdcomprobantePago(int idcomprobantePago) {
		this.idcomprobantePago = idcomprobantePago;
	}

	public String getIdmediopago() {
		return idmediopago;
	}

	public void setIdmediopago(String idmediopago) {
		this.idmediopago = idmediopago;
	}

	public String getIdtipoComprobante() {
		return idtipoComprobante;
	}

	public void setIdtipoComprobante(String idtipoComprobante) {
		this.idtipoComprobante = idtipoComprobante;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

}
