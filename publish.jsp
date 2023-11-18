
<jsp:useBean id="author" class="com.ntt.dataflair.publish" scope="session"></jsp:useBean>
<jsp:setProperty  name="author" property="*"/>

<!--  
	Using beans for this book publishing operation 
-->
<%
	
	//return type of insert is boolean
			
 	if(author.insert()) 
	{
 		//if there is successful insertion of the book then you will be redirected to books.jsp
 		//showing all the books that are in catalogue
 		
 		
 		response.sendRedirect("books.jsp");
	}
	else
	{
		//In case of an error,you will be redirected to error.jsp
		//an attribute error will be assigned with error message
		
		session.setAttribute("error","Something has gone wrong,try later");
		response.sendRedirect("Error.jsp");
	}
%>