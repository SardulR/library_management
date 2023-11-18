


<!--  
		This is an error page which you can be redirected after getting an error in any of jsp or html
		page and an attribute error will be set to display the message and receive it here
		
-->
<%@ page isErrorPage="true"%>
<% 
	String s=(String)session.getAttribute("error");
	//The error message has been received
%>
<!DOCTYPE html>
<html>
<head>
  <title>Error Page</title>
  <!--
  	Simple css for an error page
  -->
  <style>
  
  
    body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
}

.container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 20px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
  margin: 0;
  font-size: 24px;
  color: #333;
}

.error-message {
  font-size: 18px;
  color: #ff0000;
  font-family:monospace;
}

.back-button
{
    padding: 5px;
    color: #ff0000;
    background-color: aquamarine;
    border-radius: 15px;
    font-size: larger;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    cursor: pointer; 
}
.back-button:hover
{
    background-color: #333;
    color: #f5f5f5;
    transition-delay: 0.1s;
    transition-duration: 0.5s;
}
  </style>
</head>
<body>
  <div class="container">
    <h1>Error</h1>
    <!--  The error message is dispalyed -->
    <p class="error-message"><%=s%></p>
    <button class="back-button" onclick="goBack()">Back to Login</button>
  </div>
  
  
  <!--  
  
  		Simple javascript that allows us to go back to the page from which the error occurred
  	
  -->
  
  <script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>
</html>
