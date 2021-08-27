<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <title>Home</title>

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
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <%
    	try {
	    	String companyname = request.getParameter("companyname");
	    	String drive = request.getParameter("drive");
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementdatabase", "root", "");
		    
		    Statement st = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		    
		    ResultSet rs = st.executeQuery("select * from company where companyname='"+companyname+"' and drive='"+drive+"' ");
		    if(!rs.next()) {
		    	response.sendRedirect("adminupdatecompany.jsp");
		    }
		    rs.first();
	    
    %>
    
    
    <div class="container mt-5" style="max-width: 678px;">
        <div class="row">
            <div class="card border mb-3">
                <div class="card-body">
                	<div class="card-title" align="center"><h4>Update Details</h4></div>
                    <form action="updatecompany.jsp" method="POST" ng-app="" name="registerform">
                    	<div class="mb-3">
                            <label for="companyname" class="form-label">Company Name</label>
                            <input type="text" class="form-control" id="onoffcampus" name="companyname" ng-model="companyname" ng-init="companyname='<%= rs.getString("companyname") %>'" readonly>
                            
                        </div>
                        <div class="mb-3">
                            <label for="drive" class="form-label">Drive</label>
                            <input type="text" class="form-control" id="drive" name="drive" ng-model="drive" ng-init="drive='<%= rs.getString("drive") %>'" readonly>
                        </div>
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
<%
				String onoffcampus = rs.getString("onoffcampus");
                if(onoffcampus.equals("oncampus")) {

%>


							  <input type="radio" class="btn-check" name="onoffcampus" id="btnradio1" value="oncampus" autocomplete="off" checked>
							  <label class="btn btn-outline-primary" for="btnradio1">On Campus</label>
							
							  <input type="radio" class="btn-check" name="onoffcampus" id="btnradio2" value="offcampus" autocomplete="off">
							  <label class="btn btn-outline-primary" for="btnradio2">Off Campus</label>
<%
                }
                else if(onoffcampus.equals("offcampus")) {
%>
							  <input type="radio" class="btn-check" name="onoffcampus" id="btnradio1" value="oncampus" autocomplete="off">
							  <label class="btn btn-outline-primary" for="btnradio1">On Campus</label>
							
							  <input type="radio" class="btn-check" name="onoffcampus" id="btnradio2" value="offcampus" autocomplete="off" checked>
							  <label class="btn btn-outline-primary" for="btnradio2">Off Campus</label>
<%
                }

%>
							  
							  
						</div>
                        <div class="mb-3">
                            <label for="reglink" class="form-label">Registration Link</label>
                            <input type="text" class="form-control" id="reglink" name="reglink" ng-model="reglink" ng-init="reglink='<%= rs.getString("reglink") %>'" required>
                            <span ng-show="registerform.reglink.$touched && registerform.reglink.$invalid || registerform.reglink.$dirty && registerform.reglink.$invalid">
                            	<span ng-show="registerform.reglink.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="start">Last date </label>
							<input type="text" class="form-control" id="lastdate" name="lastdate" ng-model="lastdate" ng-init="lastdate='<%= rs.getString("lastdate") %>'" required>
                            <span ng-show="registerform.lastdate.$touched && registerform.lastdate.$invalid || registerform.lastdate.$dirty && registerform.lastdate.$invalid">
                            	<span ng-show="registerform.lastdate.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        
                        <!-- btn-block in Bootstrap4 -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-dark btn-block" name="update">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
<%

    	} catch(Exception e) {
    		out.println(e);
    	}
%>



    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
    </script>

</body>



</html>