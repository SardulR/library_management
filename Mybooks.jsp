<%@include file="format.jsp"%>
<!--  
JSP directive to include the common format of a web page
-->

<%@page import="com.ntt.dataflair.MyConnection"%>
<%@page import="java.sql.*" %>

<%

	String name=(String)session.getAttribute("name");
	Connection cn=new MyConnection().doConnect();//recieving connection
	
	
	
	String s="select bk.book_id,ct.cover_link,ct.book_name,ct.author_name,bk.date_of_borrow from borrowed_books bk,catalogue ct where ct.book_id=bk.book_id and bk.date_of_return is NULL and bk.name=?";
	
	//The statement helps in joining the two tables according to given credentials
	
	//Here we have made the primary key of the catalogue foreign key of borrowed_books
	
	//From this we can get the image address from just one table catalogue without entering in another table
	
	
	
	PreparedStatement ps=cn.prepareStatement(s);
	ps.setString(1, name);
	ResultSet rs=ps.executeQuery();
	
	// rs receives a table that will have details of the bookm that have been borrowed and not returned by checking the name of borrower
	//and whether the date of returning is NULL or not.
%>

<!DOCTYPE html>
<html>
<head>
  <title>Student Library</title>
  <link rel="stylesheet" href="StudentLibrary.css">
</head>
<body>

  <%
  //If there are books that are booked by the students then display it 
  if(rs.next())
	{
	do
	{
		
	%>
  <div class="book-container">
    <div class="book-cover">
        <img src="<%=rs.getString(2)%>" width="200px" height="300px" alt="">
    </div>
    <div class="book-details">
      <h2><%=rs.getString(3)%></h2>
      <p><%=rs.getString(4)%></p>
      <label>Issue date: <%=rs.getString(5)%></label>
    </div>
    
    <!--  
    When confirmation is done,you will be redirected to return_book.jsp where the book will be returned.
    -->
   <form action="return_book.jsp" method="get">
 
 
    <div class="return_book">
        <button type="submit" class="return_now" id="return_now" name="return_now" onclick="Confirmation()" value="<%=rs.getInt(1)%>">RETURN</button>
    
    								<!--  Every button recives value which is equal to the unique book id given to the book-->
    								<!--Javscript on the button to ask for the confirmation regarding the return of book  -->
    </div>
    
    
    
    
    </form>
    
    </div>
    
	<%
	}while(rs.next());
	}
  //if there are no books that are borrowed by the student then display this
	else
	{
	%>
	
			<h1>No books available </h1>
			<p>Go back to library to issue some books.!	</p>
	
	<% }%>
	<!--  
	
	A simple confirmation script to ask the user whether he confirms in returning the book or not
	-->
  <script>
  function Confirmation() 
  {
          	  alert("Do you wish to continue!?");
    	  document.getElementById("my-form").submit();
   	//If the user confirms the form will submit
    	  }
  </script>
  
</body>
</html>
