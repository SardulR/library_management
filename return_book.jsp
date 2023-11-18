<jsp:useBean id="returnbook" class="com.ntt.dataflair.ReturnBook" scope="session"></jsp:useBean>

<%
	
	int book_id=Integer.parseInt(request.getParameter("return_now"));
	
	String name=(String)session.getAttribute("name");
 	//receives the name of the current user
	
 	if(returnbook.returning(book_id, name))//after succesful returning of the book 
	{
 		response.sendRedirect("Mybooks.jsp");
	}
	else
	{
		//incase of any error in the process
		session.setAttribute("error", "Unknown error,PLS try again later");
		response.sendRedirect("Error.jsp");
	}
%>