<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if(session.getAttribute("username")==null){
	response.sendRedirect("admin.jsp");
}
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Company</title>

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
		String onoffcampus = request.getParameter("onoffcampus");
		String reglink = request.getParameter("reglink");
		String lastdate = request.getParameter("lastdate");
        
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementdatabase", "root", "");

        Statement st = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
        try {
			int rowsaffected = st.executeUpdate("update company set onoffcampus='"+onoffcampus+"',reglink='"+reglink+"',lastdate='"+lastdate+"' where companyname='"+companyname+"'  ");
        
			if(rowsaffected == 1){
				// out.println("Updated successfully............");
				response.sendRedirect("admincompanylist.jsp");

			}
        } catch(Exception e) {
        	// out.println("ERROR: Already Login Existed, Please Login" + e);
%>
				<div class="alert alert-warning" role="alert">
					Please Check Type Mismatchs, But Working Around it too.......
				</div>
<%
        }

%>
   



    

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>




</body>
</html>