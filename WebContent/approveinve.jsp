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
String ano2=request.getParameter("ano2");
String approved="Approved";
try{
	Connection con=connectDB.connect();
	PreparedStatement ps1=con.prepareStatement("select * from investor where iid=?");
	ps1.setString(1,ano2);
	ResultSet r1=ps1.executeQuery();
	if(r1.next())
	{
		PreparedStatement ps2=con.prepareStatement("update investor set statuse=? where iid=?");
		ps2.setString(1,approved);
		ps2.setString(2,ano2);
		ps2.executeUpdate();
		response.sendRedirect("Adminmenu.html");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}

%>

</body>
</html>