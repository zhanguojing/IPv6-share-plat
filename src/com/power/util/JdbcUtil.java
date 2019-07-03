package com.power.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.commons.dbcp.BasicDataSource;

public class JdbcUtil {
	
	//private static String URL = "jdbc:mysql://49.209.80.36:3306/solarenergy?autoReconnect=true&useUnicode=true&characterEncoding=UTF8";
	private static String URL = "jdbc:mysql://49.209.80.36:3306/solarenerge?autoReconnect=true&useUnicode=true&characterEncoding=UTF8";
	private static String USERNAME = "wxy";// wxy
	private static String PASSWORD = "wxysql";// wxysql
	private String classDriver = "com.mysql.jdbc.Driver";
	public static Connection con = null;
	public static PreparedStatement ps = null;

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		return con;
	}
	

	public void Test1() {
		// 创建DBCP连接池对象
		BasicDataSource ds = new BasicDataSource();

		// 设置连接参数来进行连接
		ds.setUrl("jdbc:mysql://localhost:3306/solarenerge?&useUnicode=true&characterEncoding=UTF8");
		ds.setUsername("wxy");
		ds.setPassword("wxysql");
		ds.setDriverClassName(classDriver);

		// 然后可以设置连接池的一些属性啦~
		ds.setInitialSize(5);

		// 设置最大的等待时长,毫秒为单位
		ds.setMaxActive(10);
		ds.setMaxIdle(6000);
		ds.setMaxWait(6000);
		ds.setDefaultAutoCommit(true);
		ds.setDefaultReadOnly(false);
		ds.setTestOnBorrow(true);
		ds.setValidationQuery("select 1");
		// 从连接池中获取对象
		for (int i = 0; i < 8; i++) {
			Connection conn = null;
			try {
				conn = ds.getConnection();
				System.out.println(conn.hashCode());

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
}
