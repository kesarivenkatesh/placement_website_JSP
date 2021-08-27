<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if(session.getAttribute("jntuno") == null)
	response.sendRedirect("login.jsp");
%>

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
                        <a class="nav-link active" href="profile.jsp" id="jntuno">
                          <%-- jsp --%>
                          <%
                            if(request.getSession(false).getAttribute("jntuno") != null) {
                              out.print(request.getSession(false).getAttribute("jntuno"));
                            } else {
                              response.sendRedirect("index.jsp");
                            }
                          %>
                        </a>
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
	    	String jntuno = session.getAttribute("jntuno").toString();
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementdatabase", "root", "");
		    
		    Statement st = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		    
		    ResultSet rs = st.executeQuery("select * from student where jntuno='"+jntuno+"'");
		    rs.first();
	    
    %>
    
    
    <div class="container mt-5" style="max-width: 678px;">
        <div class="row">
            <div class="card border mb-3">
                <div class="card-body">
                	<div class="card-title" align="center"><h4>Update Details</h4></div>
                    <form action="update.jsp" method="POST" ng-app="" name="registerform">
                        <div class="mb-3">
                            <label for="fullname" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" ng-model="fullname" ng-init="fullname='<%= rs.getString("fullname") %>'"  required>
                            <span ng-show="registerform.fullname.$touched && registerform.fullname.$invalid || registerform.fullname.$dirty && registerform.fullname.$invalid">
                            	<span ng-show="registerform.fullname.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="btechcgpa" class="form-label">B.Tech CGPA</label>
                            <input type="text" class="form-control" id="btechcgpa" name="btechcgpa" ng-model="btechcgpa" ng-init="btechcgpa='<%= rs.getString("btechcgpa") %>'" required>
                            <span ng-show="registerform.btechcgpa.$touched && registerform.btechcgpa.$invalid || registerform.btechcgpa.$dirty && registerform.btechcgpa.$invalid">
                            	<span ng-show="registerform.btechcgpa.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="intermarks" class="form-label">Inter Marks</label>
                            <input type="text" class="form-control" id="intermarks" name="intermarks" ng-model="intermarks" ng-init="intermarks='<%= rs.getString("intermarks") %>'" required>
                            <span ng-show="registerform.intermarks.$touched && registerform.intermarks.$invalid || registerform.intermarks.$dirty && registerform.intermarks.$invalid">
                            	<span ng-show="registerform.intermarks.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="tenthcgpa" class="form-label">Tenth CGPA</label>
                            <input type="text" class="form-control" id="tenthcgpa" name="tenthcgpa" ng-model="tenthcgpa" ng-init="tenthcgpa='<%= rs.getString("tenthcgpa") %>'" required>
                            <span ng-show="registerform.tenthcgpa.$touched && registerform.tenthcgpa.$invalid || registerform.tenthcgpa.$dirty && registerform.tenthcgpa.$invalid">
                            	<span ng-show="registerform.tenthcgpa.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="activebacklogs" class="form-label">Active Backlogs</label>
                            <input type="text" class="form-control" id="activebacklogs" name="activebacklogs" ng-model="activebacklogs" ng-init="activebacklogs='<%= rs.getString("activebacklogs") %>'" required>
                            <span ng-show="registerform.activebacklogs.$touched && registerform.activebacklogs.$invalid || registerform.activebacklogs.$dirty && registerform.activebacklogs.$invalid">
                            	<span ng-show="registerform.activebacklogs.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="branch" class="form-label">Branch</label>
                            <input type="text" class="form-control" id="branch" name="branch" ng-model="branch" ng-init="branch='<%= rs.getString("branch") %>'" required>
                            <span ng-show="registerform.branch.$touched && registerform.branch.$invalid || registerform.branch.$dirty && registerform.branch.$invalid">
                            	<span ng-show="registerform.branch.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="companiesplaced" class="form-label">Companies Placed</label>
                            <input type="text" class="form-control" id="companiesplaced" name="companiesplaced" ng-model="companiesplaced" ng-init="companiesplaced='<%= rs.getString("companiesplaced") %>'" required>
                            <span ng-show="registerform.comapniesplaced.$touched && registerform.companiesplaced.$invalid || registerform.companiesplaced.$dirty && registerform.companiesplaced.$invalid">
                            	<span ng-show="registerform.companiesplaced.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="companiesregistered" class="form-label">Companies Registered</label>
                            <input type="text" class="form-control" id="companiesregistered" name="companiesregistered" ng-model="companiesregistered" ng-init="companiesregistered='<%= rs.getString("companiesregistered") %>'" required>
                            <span ng-show="registerform.companiesregistered.$touched && registerform.companiesregistered.$invalid || registerform.companiesregistered.$dirty && registerform.companiesregistered.$invalid">
                            	<span ng-show="registerform.companiesregistered.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="contactno" class="form-label">Contact Number</label>
                            <input type="text" class="form-control" id="contactno" name="contactno" ng-model="contactno" ng-init="contactno='<%= rs.getString("contactno") %>'" required>
                            <span ng-show="registerform.contactno.$touched && registerform.contactno.$invalid || registerform.contactno.$dirty && registerform.contactno.$invalid">
                            	<span ng-show="registerform.contactno.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="personalemail" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="personalemail" name="personalemail" ng-model="personalemail" ng-init="personalemail='<%= rs.getString("personalemail") %>'" required>
                            <span ng-show="registerform.personalemail.$touched && registerform.personalemail.$invalid || registerform.personalemail.$dirty && registerform.personalemail.$invalid">
                            	<span ng-show="registerform.personalemail.$error.required" style="color: red;">Required</span>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" ng-model="password" ng-init="password='<%= rs.getString("password") %>'" required>
                            <span ng-show="registerform.password.$touched && registerform.password.$invalid || registerform.password.$dirty && registerform.personalemail.$invalid">
                            	<span ng-show="registerform.password.$error.required" style="color: red;">Required</span>
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