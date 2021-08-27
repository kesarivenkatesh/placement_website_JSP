<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
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
                	
                    
                    <%
                        HttpSession s = request.getSession(false);
                        if(s.getAttribute("jntuno") == null && s.getAttribute("username") == null) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login/Register</a>
                    </li>
                    <%
                        }
                        else if(s.getAttribute("jntuno") != null) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link active" href="profile.jsp">
                            <%= session.getAttribute("jntuno") %>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="logout.jsp">Logout</a>
                    </li>
                    <%
                        }
                    %>
                    
                    <%
                        if(s.getAttribute("jntuno") == null && s.getAttribute("username") == null) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="admin.jsp">Admin</a>
                    </li>
                    <%
                        }
                        else if(s.getAttribute("username") != null) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link active" href="adminprofile.jsp">
                            <%= session.getAttribute("username") %>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="adminlogout.jsp">Logout</a>
                    </li>
                    <%
                        }
                    %>

                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Facilities of College</h5>
                <ul class="card-text">
                    <li>CSE</li>
                    <li>ECE</li>
                    <li>CIV</li>
                    <li>IT</li>
                    <li>MECH</li>
                </ul>
                <!-- Button trigger modal -->
                <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#allDept">Read More</button>
            </div>
        </div>
    </div>
  
  <!-- Modal -->
  <div class="modal fade" id="allDept" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">All Departments</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <ul>
              <li>Computer Science Engineering</li>
              <li>Information Technology</li>
              <li>Electronics and Communications Engineering</li>
              <li>Civil Engineering</li>
              <li>Mechanical Engineering</li>
          </ul>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

<!--<footer>

</footer>-->

</html>