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
			
			ResultSet rs = st.executeQuery(" select * from student where jntuno='"+jntuno+"' ");
			
			rs.first();
			// rs.getString("");
	
%>

    <div class="container mt-4 mr-5 mb-3 ml-5">
      <div class="d-flex justify-content-end">
            <a href="edit.jsp" class="text-dark" style="text-decoration: none;"> Modify </a>
      </div>
      <table class="table table-striped">
          <tr>
            <td> Username </td>
            <td> <%= rs.getString("jntuno") %> </td>
          </tr>
          <tr>
            <td> Full Name </td>
            <td> <%= rs.getString("fullname") %> </td>
          </tr>
          <tr>
            <td> BTech CGPA </td>
            <td> <%= rs.getString("btechcgpa") %> </td>
          </tr>
          <tr>
            <td> Inter Marks </td>
            <td> <%= rs.getString("intermarks") %> </td>
          </tr>
          <tr>
            <td> Tenth CGPA </td>
            <td> <%= rs.getString("tenthcgpa") %> </td>
          </tr>
          <tr>
            <td> Active Backlogs </td>
            <td> <%= rs.getString("activebacklogs") %> </td>
          </tr>
          <tr>
            <td> Branch </td>
            <td> <%= rs.getString("branch") %> </td>
          </tr>
          <tr>
            <td> Contact Number </td>
            <td> <%= rs.getString("contactno") %> </td>
          </tr>
          <tr>
            <td> Email Address </td>
            <td> <%= rs.getString("personalemail") %> </td>
          </tr>
          <tr>
            <td> You Have Offers @ </td>
            <td> <%= rs.getString("companiesplaced") %> Companies </td>
          </tr>
          <tr>
            <td> You have registered for </td>
            <td> <%= rs.getString("companiesregistered") %> </td>
          </tr>
      </table>
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