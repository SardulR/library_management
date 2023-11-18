<%@ include file="format.jsp"%>
<%@page import="com.ntt.dataflair.MyConnection"%>
<%@page import="java.sql.*" %>

<%
	String name=(String)session.getAttribute("name");
	//Recieving the name of the student that is logged-in
	
	Connection cn=new MyConnection().doConnect();
	ResultSet rs=null;
	//MySql Connection from Myconnection.java's function doConnect
	String s="select *from borrowed_books where name=?";
	PreparedStatement ps=cn.prepareStatement(s);
	ps.setString(1,name);
	/*
	This result set will recieve a table from table name borrowed_books of library database
	which will filter out those results that match with the current user and display the 
	history of borrowing and returning of books by this student
	*/
	rs=ps.executeQuery();
	
%>

<html>
<head>
  <title>Student Profile</title>
  <link rel="stylesheet" href="StudentLibrary.css">
</head>
<body>

<div class="middiv">
	<%
	//Checking whether the data in rs is null or not and if null then output else part
		if(rs.next())
		{
		%>	
		
			<div class="tabdiv">
			
				<table>
				<!-- 
				Creating a Normal table
				 -->
					<tr>
					<th>BOOK ID</th>
					<th>Date of borrow</th>
					<th>Date of return</th>
					</tr>
					<%do
				{
				int b_id=rs.getInt(4);	//book id
				String d_b=rs.getString(2);	//date of borrow
				String d_r=rs.getString(3);	//date of return
				
				if(d_r==null)//Checking is book has not been returned then display not returned
					d_r="not returned";
		%>
						<tr>
							<td><%=b_id %></td>
							<td><%=d_b%></td>
							<td><%=d_r%></td>
						</tr>
					
				<% } 	while(rs.next());
					/*
						A do-while loop is used because in the if statement we have already
						increased the pointer of rs by 1 row
						
					*/
			
	%>
		</table>
				</div>
				
	<% 
	}
	//Only going to happen if the data in rs is null and there is no history of borrowing books
			else
			{
				
			%>
			
					<h1>NO BORROW HISTORY</h1>
			<p>Go and borrow some books from library.!</p>
						</div>
			
			<% }
			%>
			
					
		
</body>
</html>
