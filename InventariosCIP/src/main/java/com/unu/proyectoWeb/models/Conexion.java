package com.unu.proyectoWeb.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
		
	private String url="jdbc:mysql://localhost:3306/inventariocipcdu";
	private String usuario ="root";
	private String password = "123456";
	
	protected Connection conexion;
	
	
	public void abrirConexion() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(url,usuario,password);
			
			System.out.println("Conexión exitosa a la base de datos.");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void cerrarConexion() {
		try {
			if(conexion != null && !conexion.isClosed()) {
				conexion.close();
				System.out.println("Conexion Cerrada");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
}
