package com.codecompilance.spring.controller;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import org.apache.log4j.Logger;

public class DBConnect {
	private static final Logger logger = Logger.getLogger(HomeController.class);
    public static Connection connect(){
        Connection conn = null;
        
        try{
        	Properties prop = new Properties();
        	InputStream inputStream;
			String propFileName = "dbconnection.properties";
 
			inputStream = logger.getClass().getClassLoader().getResourceAsStream(propFileName);
 
			if (inputStream != null) {
				prop.load(inputStream);
			}
			
	        String drivers = prop.getProperty("jdbc.drivers");
	        System.out.println("drivers !!!!"+drivers);
	        String connectionURL = prop.getProperty("jdbc.url");
	        String username = prop.getProperty("jdbc.username");
	        String password = prop.getProperty("jdbc.password");
	        
			Class.forName(drivers);
			conn = DriverManager.getConnection(connectionURL,username,password);
            if(conn==null){
               System.out.println("Connection cannot be established");
            }
            // con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return conn;
    }
}