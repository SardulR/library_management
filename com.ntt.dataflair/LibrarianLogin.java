package com.ntt.dataflair;
import java.sql.*;
public class LibrarianLogin {

	/*
	 * This program shall check login credentials of the librarian
	 * */
	
	
	
	//There is no library register,in order to make more librarian accounts,manul insertion of
	//username and password will have to be done.
	
	
	
	
	String username;
	String password;
	Connection cn=null;
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
	public int check_Login()
	{
		int count=0;
		try
		{
			cn=new MyConnection().doConnect();
			String s="select count(*) as total_rows from librarian_login where username=? and password=?";
			PreparedStatement ps=cn.prepareStatement(s);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet resultSet=ps.executeQuery();
			
			//resultSet shall receive the count of those fields matching the credentials
			
			
			 if (resultSet.next()) {
	                count = resultSet.getInt("total_rows");
	            }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
		
		//returning the number of fields that are found with the matching credentials
	}
}
