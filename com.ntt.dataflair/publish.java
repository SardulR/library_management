package com.ntt.dataflair;
import java.sql.*;
public class publish {
	
	String author;
	String book;
	String coverpage;
	Connection cn=null;
	/*
	 * In order to create setters and getters the variable name should be the same as the 
	 * name of the input fields
	 * */
	
	
	//The book code is a unique code that will automatically increment from 100 in the database
	//so we need not to enter the book code manually.
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getCoverpage() {
		return coverpage;
	}
	public void setCoverpage(String coverpage) {
		this.coverpage = coverpage;
	}
	public boolean  insert()
	{
		try
		{
			cn=new MyConnection().doConnect();
			String s="insert into catalogue(author_name,book_name,cover_link) values(?,?,?)";
			PreparedStatement ps=cn.prepareStatement(s);
			//Placing the neccessary values in correct order according to database
			ps.setString(1, author);
			ps.setString(2, book);
			ps.setString(3,coverpage);
			ps.executeUpdate();
			
			//After succesfull insertion of book we will return true to indicate the succesfull insertion 
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//If a error occurs, we will return false so that after catch() statement we can tell an error occured
		return false;
	}
	
}
