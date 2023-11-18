

<!--  

	This page is for authors to publish there books
-->


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Book Details</title>
    
    
    <link rel="stylesheet" href="author.css">
    
    <!--  
    	The script shall contain numerous checking of credentials
    -->
    <script src="script.js"></script>
</head>
<body>
	<div class="total">
	<div class="container">
    <h1>BOOK</h1>
    
        <form id="my-form" action="publish.jsp">
        <!--  
        After successful submission ,you will be redirected to publish.jsp where the backend logic will
        add book to the catalogue.
        -->
            
            
            <label for="author_name">Author Name</label>
            <input type="text" id="author" name="author" required>
            
            
            
            <label for="Book_name">Book Name</label>
            <input type="text" id="book" name="book" required>
            
            
            
            <label for="cover_link">Paste Cover Page image address after searching</label>
            <input type="text" id="coverpage" name="coverpage" required>
            <!--  
            	Cover-page is an important field where you have to copy correct image address
            	after searching from internet to display
            -->
            
            
			<button type="submit" onclick="return performChecks()">PUBLISH</button>
			<!--  
				Applying script to button so that wrong submission of data is not done
			-->
        </form>
    </div>
    </div>
</body>
</html>
