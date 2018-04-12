package com.wy.tool;

import java.sql.*;

public class JDBConnection {
	private String dbDriver = "com.microsoft.jdbc.sqlserver.SQLServerDriver"; // 数据库的驱动

	private String url = "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_shopping"; // URL地址

	public Connection connection = null;

	public JDBConnection() {
		try {
			Class.forName(dbDriver).newInstance(); // 加载数据库驱动
			connection = DriverManager.getConnection(url, "sa", ""); // 加载数据库
		} catch (Exception ex) {
			System.out.println("数据库加载失败");
		}
	}
}
