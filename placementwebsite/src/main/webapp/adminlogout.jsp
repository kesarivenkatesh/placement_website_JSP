<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		if(session.getAttribute("username") == null)
			response.sendRedirect("admin.jsp");		
		

		session.removeAttribute("username");
		session.removeAttribute("password");
		
		session.invalidate();
		
		response.sendRedirect("admin.jsp");
%>