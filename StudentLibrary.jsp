<%@ include file="format.jsp"%>
<!--
	Including this file for a common design pattern in multiple web pages
  -->

<%@page import="com.ntt.dataflair.MyConnection"%>
<%@page import="java.sql.*" %>

<!--  
		These are jsp directives that are used example: include,page used in this
		
-->
<%

	Connection cn=new MyConnection().doConnect();
	//connection made
	String s="select *from catalogue";
	PreparedStatement ps=cn.prepareStatement(s);
	ResultSet rs=ps.executeQuery();
	
	//rs has recieved the data of total books [resent in the catalogue to show students
%>

<html>
<head>
  <title>Student Library</title>
  <link rel="stylesheet" href="StudentLibrary.css">
</head>
<body>


  <%if(rs!=null)  //Checking whether there are books in library or not
	{
	  
	while(rs.next())
	{
		String s1="",s2="";
	%>
  <div class="book-container">
    <div class="book-cover">
        <img src="<%=rs.getString(4)%>" width="200px" height="300px" alt="">
    </div>
    <div class="book-details">
      <h2><%=rs.getString(2)%></h2>
      <p><%=rs.getString(3)%></p>
     <h2>BOOK CODE: <%=rs.getInt(1)%></h2>
    </div>
    <div class="available">
  <%
  //Here the availability of a book is checked ,if a student has taken a book then the availability field in 
  
  //database will be overriden by no
  
  //So on checking whether book is available we can show book now button or we can show not available
  
  if(rs.getString(5).equalsIgnoreCase("yes"))
	{
		s2="hidden";
	}
	else
		s1="hidden";
  %>
  <!--  
  		if s1 is assigned with hidden then not available label will not be shown.
  		
  		if s1 is assigned with hidden then available label as well as book now button will not be shown.
  		 
  -->
        <label for="" class="yes" <%=s1%>>available</label>
        <label for="" class="no" <%=s2%>>Not available</label>
        
    </div>
    <form action="book_now.jsp" method="get">
    <div class="book_now">
        
        <button type="submit" class="book_now" id="book_now" name="book_now" value="<%=rs.getInt(1)%>" <%=s1%>>BOOK NOW</button>
    	
    
    												<!--  
    												Each button has a value which is equal to the book id
    												so that after clicking back now, the backend logic will thereafter
    												give that particular book to student 
    												-->
    </div>
    </form>
    
  </div>
  
	<%
	}
	}
  //Only shown if there are no books in library 
	else
	{
	%>
	
			<h1>No books available </h1>
			<p>Let authors publish some books aur ask librarian to publish books</p>
	
	
	<% }%>
  
</body>
</html>
