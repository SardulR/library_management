package com.ntt.dataflair;
import java.sql.*;

/*
 * This program shall help in removing  a book completely from catalogue table which is available
 * */
public class RemoveBook {
	public boolean remove(int book_id)
	{
		Connection cn=null;
		try
		{
			cn=new MyConnection().doConnect();
			String s="delete from catalogue where book_id=?";
			PreparedStatement ps=cn.prepareStatement(s);
			ps.setInt(1, book_id);
			ps.executeUpdate();
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
