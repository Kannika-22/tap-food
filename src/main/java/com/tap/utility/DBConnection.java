package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	// Database Credentials
	private static final String URL = "jdbc:mysql://localhost:3306/tap-food";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";

	// Database Connection Object
	private static Connection con;

	// Method to Establish Database Connection
	public static Connection getConnection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return con;
	}
}