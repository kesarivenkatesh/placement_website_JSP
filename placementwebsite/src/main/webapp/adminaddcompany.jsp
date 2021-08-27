<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if(session.getAttribute("username") == null)
		response.sendRedirect("admin.jsp");
%>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<!-- CSS only -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
	                    <li class="nav-item">
	                        <a class="nav-link" href="adminprofile.jsp"><%= session.getAttribute("username") %></a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="adminlogout.jsp">Logout</a>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </nav>
	


		<div class="container mt-5" style="max-width: 678px;">
		        <div class="row">
		            <div class="card border mb-3">
		                <div class="card-body">
		                	<div class="card-title" align="center"><h4>Add Company Details</h4></div>
		                    <form action="addcompanytodb.jsp" method="POST" ng-app="" name="registerform">
		                        <div class="mb-3">
		                            <label for="companyname" class="form-label">Company Name</label>
		                            <input type="text" class="form-control" id="companyname" name="companyname" ng-model="companyname" required>
		                            <span ng-show="registerform.companyname.$touched && registerform.companyname.$invalid || registerform.companyname.$dirty && registerform.companyname.$invalid">
		                            	<span ng-show="registerform.companyname.$error.required" style="color: red;">Required</span>
		                            </span>
		                        </div>
		                        <div class="mb-3">
		                            <label for="drive" class="form-label">Drive</label>
		                            <input type="text" class="form-control" id="drive" name="drive" ng-model="drive" required>
		                            <span ng-show="registerform.drive.$touched && registerform.drive.$invalid || registerform.drive.$dirty && registerform.drive.$invalid">
		                            	<span ng-show="registerform.drive.$error.required" style="color: red;">Required</span>
		                            </span>
		                        </div>
		                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
									  <input type="radio" class="btn-check" name="onoffcampus" id="btnradio1" value="oncampus" autocomplete="off" checked>
									  <label class="btn btn-outline-primary" for="btnradio1">On Campus</label>
									
									  <input type="radio" class="btn-check" name="onoffcampus" id="btnradio2" value="offcampus" autocomplete="off">
									  <label class="btn btn-outline-primary" for="btnradio2">Off Campus</label>
								</div>
		                        <div class="mb-3">
		                            <label for="reglink" class="form-label">Registration Link</label>
		                            <input type="text" class="form-control" id="reglink" name="reglink" ng-model="reglink" required>
		                            <span ng-show="registerform.reglink.$touched && registerform.reglink.$invalid || registerform.reglink.$dirty && registerform.reglink.$invalid">
		                            	<span ng-show="registerform.reglink.$error.required" style="color: red;">Required</span>
		                            </span>
		                        </div>
		                        <div class="mb-3">
		                            <label for="start">Last date </label>
									<input type="date" class="form-control" id="lastdate" name="lastdate" value="2021-07-22" min="2021-01-01" max="2023-12-31" ng-model="lastdate">
		                            <span ng-show="registerform.lastdate.$touched && registerform.lastdate.$invalid || registerform.lastdate.$dirty && registerform.lastdate.$invalid">
		                            	<span ng-show="registerform.lastdate.$error.required" style="color: red;">Required</span>
		                            </span>
		                        </div>
		                        <div class="d-grid">
                            		<button type="submit" class="btn btn-primary btn-block" name="register" ng-disabled="companyname==null || companyname=='' || drive==null || drive=='' || reglink==null || reglink=='' || lastdate==null">Register</button>
                        		</div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>



    

		    <!-- JavaScript Bundle with Popper -->
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    




	</body>
</html>