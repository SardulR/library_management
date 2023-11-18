<jsp:useBean id="Regid" class="com.ntt.dataflair.StudentRegister" scope="session"></jsp:useBean>
<jsp:setProperty  name="Regid" property="*"/>
 <%
 	//register() function returns true after succesful registration
 	if(Regid.register())
 		response.sendRedirect("student_login.html");
 	else
 	{
 		//in case of failure in registration
 		session.setAttribute("error","Try different username or try again later");
 		response.sendRedirect("Error.jsp");
 	}
 %>
