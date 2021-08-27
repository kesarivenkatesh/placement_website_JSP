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
    
        String fullname = request.getParameter("fullname");
        float btechcgpa = Float.parseFloat(request.getParameter("btechcgpa"));
        int intermarks = Integer.parseInt(request.getParameter("intermarks"));
        float tenthcgpa = Float.parseFloat(request.getParameter("tenthcgpa"));
        Integer k1 = Integer.parseInt(request.getParameter("activebacklogs"));
        int activebacklogs = k1.intValue();
        String branch = request.getParameter("branch");
        String jntuno = request.getParameter("jntuno");
        long contactno = Long.parseLong(request.getParameter("contactno"));
        String personalemail = request.getParameter("personalemail");
        Integer k = Integer.parseInt(request.getParameter("companiesplaced"));
        int companiesplaced = k.intValue();
        String password = request.getParameter("password");
        String companiesregistered = request.getParameter("companiesregistered");
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementdatabase", "root", "");

        Statement st = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
        try {
			int rowsaffected = st.executeUpdate("insert into student(fullname, btechcgpa, intermarks, tenthcgpa, activebacklogs, branch, jntuno, contactno, personalemail, companiesplaced, companiesregistered, password) values('"+fullname+"', '"+btechcgpa+"', '"+intermarks+"', '"+tenthcgpa+"', '"+activebacklogs+"', '"+branch+"', '"+jntuno+"' , '"+contactno+"', '"+personalemail+"', '"+companiesplaced+"', '"+companiesregistered+"', '"+password+"')");
        
			if(rowsaffected == 1){
				// out.println("Inserted successfully............");
				response.sendRedirect("login.jsp");
			}
			//else {
			//	out.println("Not Inserted............");
			//}
        } catch(Exception e) {
        	// out.println("ERROR: Already Login Existed, Please Login" + e);
%>
				<div class="alert alert-warning" role="alert">
					Already Login Existed for <%= jntuno %>, Please Login.
				</div>
<%
        }

%>
   



    

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>




</body>
</html>