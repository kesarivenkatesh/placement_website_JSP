<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if(session.getAttribute("jntuno") != null)
	response.sendRedirect("profile.jsp");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Student</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>

    
    

    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp" style="margin-left: 130px;">Placement Website</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" style="margin-right: 250px;" id="navbarNavDropdown">
                <ul class="navbar-nav" style="margin-left: auto; padding: 0px 30px;">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link active" href="login.jsp">Login/Register</a>
                    </li>  -->
                </ul>
            </div>
        </div>
    </nav>

    <%
        
    %>

    <div class="container mt-5" style="max-width: 678px;">
        <div class="row">
            <div class="card border mb-3">
                <div class="card-body">
                	<div class="card-title" align="center"><h4>Student Login</h4></div>
                    <form action="studentlogin.jsp" method="POST" ng-app="" name="loginform">
                        <div class="mb-3">
                            <label for="jntuno" class="form-label">Jntu Number</label>
                            <input type="text" class="form-control" id="jntuno" name="jntuno" ng-model="jntuno" required>
                            <span ng-show="loginform.jntuno.$touched && loginform.jntuno.$invalid || loginform.jntuno.$dirty && loginform.jntuno.$invalid">
                            	<span ng-show="loginform.jntuno.$error.required" style="color: red;">Username is Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" ng-model="password" required>
                            <span ng-show="loginform.password.$touched && loginform.password.$invalid || loginform.password.$dirty && loginform.password.$invalid">
                            	<span ng-show="loginform.password.$error.required" style="color: red;">Password is Required</span>
                            </span>
                        </div>
                        <!-- btn-block in Bootstrap4 -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-dark" name="login">Login</button>
                        </div>
                    </form>
                    <div class="mt-3">
                        <p>No Login Details? <a style="text-decoration:none;" href="studentregister.html">Register Here</a> </p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    


	

</body>
</html>