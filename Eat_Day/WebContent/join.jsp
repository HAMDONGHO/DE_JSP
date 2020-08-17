  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>Eat Day : 회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script><script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 </head>
<body>
<%
		String userID = null;
	
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
	%>
	<div class="jumbotron text-center" style="margin-bottom:0">
	  <h1>Eat Day</h1>
	  <p>충북대학교에서 뭘 먹어야 하지!?</p> 
	</div>
	<div class="container">
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card card-signin my-5">
	          <div class="card-body">
	            <h5 class="card-title text-center">Join Us</h5>
	            <form class="form-signin" method="post" action="joinPro.jsp">
	            
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">ID</span>
				 	</div>
	                <input type="text" id="ID" name = "ID" class="form-control" placeholder="ID" required autofocus>
	              </div>
	              
	              <div class="input-group mb-3">
	              	 <div class="input-group-prepend">
				    	<span class="input-group-text">Password</span>
				 	</div>
	                <input type="password" id="password" name = "password" class="form-control" placeholder="password" required>
	              </div>
	              
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">Email</span>
				 	</div>
	                <input type="email" id="email" name = "email" class="form-control" placeholder="email" required autofocus>
	              </div>
	              
	              <div class="input-group mb-3">
 					<div class="input-group-prepend">
				    	<span class="input-group-text">Phone</span>
				 	</div>
	                <input type="text" id="Phone" name = "Phone" class="form-control" placeholder="Phone" required>
	              </div>
              
	              <div class="input-group mb-3">
 					<div class="input-group-prepend">
				    	<span class="input-group-text">Name</span>
				 	</div>
	                <input type="text" id="name" name = "name" class="form-control" placeholder="name" required>
	              </div>
	              
	              <div class="input-group mb-3">
 					 <div class="input-group-prepend">
				    	<span class="input-group-text">Birth</span>
				 	 </div>   
	                   <script type="text/javascript">
                         var today = new Date();
                         var toyear = parseInt(today.getFullYear ());
                         var start = toyear;
                         var end = toyear - 15;

                         document.write("<select name=birth1> ");
                         document.write("<option value='2015' selected>");
                         for (i=start;i>=end;i--) document.write("<option>"+i);
                         document.write("</select>년  ");

                         document.write("<select name=birth2>");
                         document.write("<option value='' selected>");
                         for (i=1;i<=12;i++) document.write("<option>"+i);
                         document.write("</select>월  ");

                         document.write("<select name=birth3>");
                         document.write("<option value='' selected>");
                         for (i=1;i<=31;i++) document.write("<option>"+i);
                         document.write("</select>일  </font>");
                        </script>
                   </div>
                         
                   <div class="input-group mb-3">
 					 <div class="input-group-prepend">
				    	<span class="input-group-text">Gender</span>
				 	 </div>   
                     <input type="radio" id="gender" name = "gender" value="남" class="form-control" required>남
                     <input type="radio" id="gender" name = "gender" value="여" class="form-control" required>여
                   </div>
	              
             	<hr class="my-4">
              	<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">회원가입</button>
            </form>
          </div>
        </div>
      </div>
    </div>
</body>
</html>