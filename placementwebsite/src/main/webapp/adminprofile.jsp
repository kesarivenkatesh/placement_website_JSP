<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if(session.getAttribute("username") == null)
		response.sendRedirect("admin.jsp");
%>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Admin Profile</title>
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
	
	<div class="d-flex align-items-center flex-column bd-highlight mb-3" style="height: 200px;">
		  <a type="submit" class="btn btn-primary mb-3" href="admincompanylist.jsp">Display Companies List</a>
		  <a type="submit" class="btn btn-primary mb-3" href="adminaddcompany.jsp">Add Company</a>
		  <a type="submit" class="btn btn-primary mb-3" href="admindeletecompany.jsp">Delete Company</a>
		  <a type="submit" class="btn btn-primary mb-3" href="adminupdatecompany.jsp">Update Company</a>
	</div>





	
	<!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
    </script>
	
	</body>
</html>