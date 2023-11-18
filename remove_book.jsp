<jsp:useBean id="removebook" class="com.ntt.dataflair.RemoveBook" scope="session"></jsp:useBean>

<%
	
	int book_id=Integer.parseInt(request.getParameter("remove_now"));
	
	
	
 	if(removebook.remove(book_id))//after succesful removal of the book 
	{
 		response.sendRedirect("Librarian.jsp");
	}
	else
	{
		//incase of any error in the process
		session.setAttribute("error", "Unknown error,PLS try again later");
		response.sendRedirect("Error.jsp");
	}
%>