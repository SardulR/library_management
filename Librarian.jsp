
<%@page import="com.ntt.dataflair.MyConnection"%>
<%@page import="java.sql.*" %>

<%
		
		
	Connection cn=new MyConnection().doConnect();
	String s="select *from catalogue";
	PreparedStatement ps=cn.prepareStatement(s);
	ResultSet rs=ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
  <title>Student Library</title>
  <link rel="stylesheet" href="StudentLibrary.css">
</head>
<body>

<div class="navbar">
        <div class="options">
            <ul>
                <li>
                    <a href="StudentHistory.jsp">Student History</a>
                </li>
                
                <li>
                    <a href="Librarian.jsp">Library</a>
                </li>
                
                <li>
                    <a href="index.html">HOME</a>
                </li>
            </ul>
        </div>
      </div>
  <%if(rs!=null)
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
    </div>
    <div class="available">
  <% 
  if(rs.getString(5).equalsIgnoreCase("yes"))
	{
		s2="hidden";
	}
	else
		s1="hidden";
  %>
        <label for="" class="yes" <%=s1%>>available</label>
        <label for="" class="no" <%=s2%>>Not available</label>
    </div>
     <form id="my-form" action="remove_book.jsp" method="get">
   
    <div class="book_now">
        <button type="submit" class="remove_now" id="remove_now" name="remove_now" onclick="Confirmation()" value="<%=rs.getInt(1)%>" <%=s1%>>REMOVE BOOK</button>
    </div>
    </form>
  </div>
  
	<%
	}
	}
	else
	{
	%>
	
		No books available
	
	<% }%>
	<!--  
	
	A simple confirmation script to ask the user whether he confirms in returning the book or not
	-->
  <script>
  function Confirmation() 
  {
          	  alert("Do you wish to remover this book!?");
    	  document.getElementById("my-form").submit();
   	//If the user confirms the form will submit
    	  }
  </script>
  
</body>
</html>
