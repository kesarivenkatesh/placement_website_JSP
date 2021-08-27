<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
//if(session.getAttribute("jntuno") == null)
//	response.sendRedirect("login.jsp");
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
		                        <a class="nav-link" href="login.jsp">Login/Register</a>
		                    </li>
		
		                </ul>
		            </div>
		        </div>
		    </nav>

<%

   try
   {
        String jntuno=request.getParameter("jntuno");
        String password=request.getParameter("password");

        session = request.getSession(true);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementdatabase", "root", "");

        Statement st = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        ResultSet rs = st.executeQuery(" select * from student where jntuno='"+jntuno+"' and password = '"+password+"' ");

        int count = 0;
        if(rs != null){
        	// out.println("Counting .... ");
        	rs.last();
        	count = rs.getRow();
        	// out.println(count);
        }
        
        if(count == 0)
        {
        	session.invalidate();
        	// out.println("Invalid Login Details");
%>
		<div class="alert alert-warning" role="alert">
				Login Details are Incorrect.
		</div>
<%
        }
        
        else if(count == 1) {
	        out.println("Success");
	        
            String fullname = rs.getString("fullname");
            float btechcgpa = Float.parseFloat(rs.getString("btechcgpa"));
            int intermarks = Integer.parseInt(rs.getString("intermarks"));
            float tenthcgpa = Float.parseFloat(rs.getString("tenthcgpa"));
            int activebacklogs = Integer.parseInt(rs.getString("activebacklogs"));
            String branch = rs.getString("branch");
            long contactno = Long.parseLong(rs.getString("contactno"));
            String personalemail = rs.getString("personalemail");
            int companiesplaced = Integer.parseInt(rs.getString("companiesplaced"));
            String companiesregistered = rs.getString("companiesregistered");

            session.setAttribute("jntuno", jntuno);
            session.setAttribute("fullname", fullname);
            session.setAttribute("btechcgpa", btechcgpa);
            session.setAttribute("intermarks", intermarks);
            session.setAttribute("tenthcgpa", tenthcgpa);
            session.setAttribute("activebacklogs", activebacklogs);
            session.setAttribute("branch", branch);
            session.setAttribute("jntuno", jntuno);
            session.setAttribute("contactno", contactno);
            session.setAttribute("personalemail", personalemail);
            session.setAttribute("companiesplaced", companiesplaced);
            session.setAttribute("companiesregistered", companiesregistered);

            response.sendRedirect("profile.jsp");
        }

   }
   catch(Exception e) {
       out.println(e);
   }

%>


   	<!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>




</body>
</html>