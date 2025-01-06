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
String dele=request.getParameter("dele");
String app="Approved";

try{
	Connection con=connectDB.connect();
	PreparedStatement ps1=con.prepareStatement("select * from company_reg where statuse=? and cid=?");
	ps1.setString(1,app);
	ps1.setString(2,del);
	ResultSet r1=ps1.executeQuery();
	if(r1.next())
	{
		PreparedStatement ps2=con.prepareStatement("delete from company_reg  where cid=?");
		
		ps2.setString(1,del);
		int i=ps2.executeUpdate();
		
		if(i>0){
		PreparedStatement ps3=con.prepareStatement("delete from company_data  where cmail=?");
        ps3.setString(1,dele);
        ps3.executeUpdate();
        response.sendRedirect("Adminmenu.html");
	}}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>