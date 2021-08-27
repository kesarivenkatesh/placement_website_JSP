<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.sql.*, java.util.*" %>
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
		<title>All Companies</title>
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
	
<%
    
    try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementdatabase", "root", "");
		
		Statement st = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		ResultSet rs = st.executeQuery(" select * from company ");
		
		if(rs.next())
		{
			rs.beforeFirst();
%>
					<div class="container mt-4 mr-5 mb-3 ml-5">
						      <table class="table table-striped">
						      	  <tr>
						      	  	<th>Company Name</th>
						      	  	<th>Drive</th>
						      	  	<th>On/Off Campus</th>
						      	  	<th>Registration Link</th>
						      	  	<th>Last Date for Register</th>
						      	  </tr>
						          
<%
			while(rs.next()) {
%>

								  <tr>
						            <td> <%= rs.getString("companyname") %> </td>
						            <td> <%= rs.getString("drive") %> </td>
						            <td> <%= rs.getString("onoffcampus") %> </td>
						            <td> <%= rs.getString("reglink") %> </td>
						            <td> <%= rs.getString("lastdate") %> </td>
						          </tr>

<%
			
			}
%>

							</table>
					   </div>

<%
			
			
		}
		else
		{
%>

		<div class="alert alert-warning" role="alert">
				Login Details are Incorrect. <a href="admin.jsp">Admin Login</a>
		</div>

<% 
		}
    } catch(Exception e) {
    	// out.println("You are not valid Admin.. Please Try Again");
%>
    	<div class="alert alert-warning" role="alert">
			Some Error Occured.... <a href="adminprofile.jsp">Try again</a>
		</div>
<%
    }
    
%>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
	
	
	<!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
    </script>
	
	</body>
</html>