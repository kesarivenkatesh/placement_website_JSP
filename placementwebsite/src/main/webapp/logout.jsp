<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if(session.getAttribute("jntuno") == null)
		response.sendRedirect("login.jsp");
	
	
    session.removeAttribute("jntuno");
    session.removeAttribute("fullname");
    session.removeAttribute("btechcgpa");
    session.removeAttribute("intermarks");
    session.removeAttribute("tenthcgpa");
    session.removeAttribute("activebacklogs");
    session.removeAttribute("branch");
    session.removeAttribute("jntuno");
    session.removeAttribute("contactno");
    session.removeAttribute("personalemail");
    session.removeAttribute("companiesplaced");
    session.removeAttribute("companiesregistered");
    
    
    
    session.invalidate();
//    out.println("Logged out");

	response.sendRedirect("login.jsp");
    
%>
