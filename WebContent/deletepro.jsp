<%@ page import="starttup.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String del=request.getParameter("del");


try{
	Connection con=connectDB.connect();
	
		PreparedStatement ps3=con.prepareStatement("delete from company_data  where comid=?");
        ps3.setString(1,del);
        ps3.executeUpdate();
        response.sendRedirect("companymenu.html");
	}

catch(Exception e)
{
	e.printStackTrace();
}
%>


</body>
</html>