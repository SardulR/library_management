package com.ntt.dataflair;

import java.sql.Connection;
import java.sql.DriverManager;
public class MyConnection    
{
	/*
	 * This class is used to create a Mysql connection once so that everytime we need a Mysql connection
	 * we can call this method of MyConnection class which will return the Connection
	 * */
	Connection cn=null;
	public Connection doConnect()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");//Driver setting
			String s1="jdbc:mysql://localhost:3306/library"; //Path for connection
			String s2="root";	//user name
			String s3="sarvottammk14"; //password for database
			cn=DriverManager.getConnection(s1,s2,s3);//Connection set up
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//Returning connection
		
		return cn;
	}
}
