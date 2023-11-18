package com.ntt.dataflair;
import java.sql.*;
public class ReturnBook {
/*
 * In order to return a book to the catalogue,
 * First we have to insert the returning date to the borrowed_books table in database
 * 
 * Second we have to set availability to yes in catalogue table in database.
 * */	
	
	Connection cn=null;
	public boolean returning(int book_id,String name)
	{
		try
		{
			cn=new MyConnection().doConnect();
			
			String s="update borrowed_books set date_of_return=curdate() where book_id=? and name=?";
			PreparedStatement ps=cn.prepareStatement(s);
			
			ps.setString(2, name);
			ps.setInt(1, book_id);
			ps.executeUpdate();
			//this will update the value of date_of_return to curdate() which is the current date
			//of the system when the book is returned
			
			
			ps=cn.prepareStatement("UPDATE catalogue set availability=? where book_id=?");
			ps.setString(1, "yes");
			ps.setInt(2, book_id);
			ps.executeUpdate();
			
			//This will set the availability to yes in catalogue table so that other students can take it
			
			
			
			return true;//after successful return of book
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;//after failure in book return process
	}
}
