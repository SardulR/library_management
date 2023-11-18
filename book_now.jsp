<jsp:useBean id="book" class="com.ntt.dataflair.BookNow" scope="session"></jsp:useBean>

<%
	int book_id=Integer.parseInt(request.getParameter("book_now"));
	String name=(String)session.getAttribute("name");
 	if(book.booking(book_id, name)) 
	{
 		response.sendRedirect("Mybooks.jsp");
	}
	else
	{
		session.setAttribute("error", "Unknown error,PLS try again later");
		response.sendRedirect("Error.jsp");
	}
%>