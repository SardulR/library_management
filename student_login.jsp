
<jsp:useBean id="login" class="com.ntt.dataflair.StudentLogin" scope="session"></jsp:useBean>
<jsp:setProperty  name="login" property="*"/>

<%
	String s=request.getParameter("username");
	
	//check_login() returns 1 when it finds a field with given cnstraints
 	if(login.check_Login()==1) 
	{
 		//if there is succesfull login check we can set the name of the user in the seession to use it anywhere
 		session.setAttribute("name",s);
 		response.sendRedirect("StudentLibrary.jsp");
	}
	else
	{
		//in case of wrong login try
		session.setAttribute("error", "Invalid username or password");
		response.sendRedirect("Error.jsp");
	}
%>