<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Admin Login Check</title>
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
                </ul>
            </div>
        </div>
    </nav>
    
<%
    
    try {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementdatabase", "root", "");
		
		Statement st = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		ResultSet rs = st.executeQuery(" select * from admin where username='"+username+"' and password='"+password+"' ");
		
		if(rs.next())
		{
			session = request.getSession(true);
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			
			response.sendRedirect("adminprofile.jsp");
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
			Some Error Occured.... <a href="admin.jsp">Try again</a>
		</div>
<%
    }
    
%>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
    </script>
    
    
    
    
    
    
    
		
	</body>
</html>