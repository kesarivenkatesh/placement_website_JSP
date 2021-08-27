<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Admin Delete Company</title>
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

<%
	String companyname = request.getParameter("companyname");
	String drive = request.getParameter("drive");
	
	
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementdatabase", "root", "");
		
		Statement st = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		int rowsaffected = st.executeUpdate("delete from company where companyname='"+companyname+"' and drive='"+drive+"'");
		if(rowsaffected >= 1) {
			// out.println("Registered Successfully");
			response.sendRedirect("admincompanylist.jsp");
			
		} else {
			// out.println("Not Inserted");
%>

			<div class="alert alert-warning" role="alert">
					Not Deleted Successfully......... Please Try Again <a href="admindeletecompany.jsp">Here</a>
			</div>

<%
		}

	} catch(Exception e) {
		// out.println(e);
		
%>

		<div class="alert alert-warning" role="alert">
				Some Error Occured...Not Deleted Successfully......... Please Try Again <a href="admindeletecompany.jsp">Here</a>
		</div>

<%
		
		
	}

%>

			<!-- JavaScript Bundle with Popper -->
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>


	</body>
</html>