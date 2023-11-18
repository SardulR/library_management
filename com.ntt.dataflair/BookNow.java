package com.ntt.dataflair;
import java.sql.*;
public class BookNow {

	Connection cn=null;
	
	/*
	 * This program shall help students to take books from the library
	 * */
	
	
	public boolean booking(int book_id,String name)
	{
		try
		{
			cn=new MyConnection().doConnect();
				
			String s2="insert into borrowed_books(name,date_of_borrow,book_id) values(?,curdate(),?)";
				PreparedStatement ps=cn.prepareStatement(s2);
				ps=cn.prepareStatement(s2);
				ps.setString(1, name);
				ps.setInt(2, book_id);
				ps.executeUpdate();
				
				/*	These statements will insert the details of student along with the book code and
				 * date on which he has borrowed the book in borrowed_books table in database
				 * */
				
				
				
				
				s2="update catalogue set availability=? where book_id=?";
				ps=cn.prepareStatement(s2);
				ps.setString(1,"no");
				ps.setInt(2, book_id);				
				ps.executeUpdate();
				
				//These statements will set availability to false in catalogue in order to show to other students that
				//this book is borrowed 
				
				
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
