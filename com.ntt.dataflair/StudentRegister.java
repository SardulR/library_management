package com.ntt.dataflair;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class StudentRegister {
	String username;
	String password;
	String name;
	
	
	/*
	 * This program shall help in registering the new student into the table student_login
	 * so that he can take books from library
	 * */
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean register()
	{
boolean ch=false;
		
		try
		{
			MyConnection ob=new MyConnection();
			Connection cn=ob.doConnect();
			
			//The process will enter the details for registering
			String qry="insert into student_login values(?,?,?)";
			PreparedStatement ps=cn.prepareStatement(qry);
			ps.setString(1,name);
			ps.setString(2, username);
			ps.setString(3,password);
			ps.executeUpdate();
			
			//on successful registration
			return true;
		}
		catch(Exception e)
		{
			//An exception can occur if the username is duplicate in a table which is not possible 
			//because the username field is made primary key
			e.printStackTrace();
		}
		
		return ch;
	}
}
