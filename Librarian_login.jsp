<jsp:useBean id="log" class="com.ntt.dataflair.LibrarianLogin" scope="session"></jsp:useBean>
<jsp:setProperty  name="log" property="*"/>

<%
	
 	if(log.check_Login()==1) 
	{
 		session.setAttribute("name", "librarian");
 		response.sendRedirect("Librarian.jsp");
	}
	else
	{
		session.setAttribute("error", "Invalid username or password");
		response.sendRedirect("Error.jsp");
	}
%>