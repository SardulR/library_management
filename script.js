function performChecks() {
      // Check for null values
      var input1 = document.getElementById("author").value;
      var input2 = document.getElementById("book").value;
      var input3=document.getElementById("coverpage").value;

      if (input1 === "" || input2 === "" || input3==+"") {
        alert("Please fill in all fields.");
        return;
      }
      
      
      //Checking whether the image link inserted is valid or not
      var img = new Image();

      img.onload = function() {
        alert("Image is valid and loaded successfully.");	
        document.getElementById("my-form").submit();
         return true;
      };

	//if image link is invalid 
      img.onerror = function() {
        alert("Invalid image URL or unable to load the image.");
        return false; 
        // Prevent form submission
      };

      img.src = input3;
      return false; // Prevent immediate form submission
}