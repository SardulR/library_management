
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
  <title>BOOKS</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      overflow: auto;
    }

    .navbar {
      background-color: #232f3e;
      padding: 10px;
      color: #fff;
    }

    .navbar button {
      color: #fff;
      background-color: #4CAF50;
      border: none;
      padding: 10px 20px;
      cursor: pointer;
    }

    .book-container {
      display: flex;
      align-items: center;
      margin: 20px auto;
      padding: 20px;
      background-color: #f2f2f2;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      
    }

    .book-cover {
      width: 200px;
      height: 300px;
      margin-right: 20px;
      background-color: #ccc;
    }

    .book-details {
      display: flex;
      flex-direction: column;
    }

    h2 {
      margin-top: 0;
    }
  </style>
</head>
<body><div class="navbar">
        <button onclick="goBack()">Back</button>
      </div>

	<%if(rs!=null)
	{
	while(rs.next())
	{
	%>
  <div class="book-container">
    <div class="book-cover">
        <img src="<%=rs.getString(4)%>" width="200px" height="300px" alt="">
    </div>
    <div class="book-details">
      <h2><%=rs.getString(2)%></h2>
      <p><%=rs.getString(3)%></p>
    </div>
  </div>
  
	<% }
	}
	
	
	else
	{
	%>
	
		No books available
			
			
	
	<% }%>
  <script>
    function goBack() {
      window.history.back(); // Go back to the previous page
    }
  </script>

</body>
</html>
