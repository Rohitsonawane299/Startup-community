
<%@ page import="java.io.*"%>
<%@ page import="starttup.*" %>
<%@ page import="java.sql.*" %>


	<% Blob image = null;

	Connection con = null;

	byte[ ] imgData = null ;

	Statement stmt = null;

	ResultSet rs = null;

	try {


		String id = request.getParameter("id");

		con=connectDB.connect();	

		stmt = con.createStatement();

		rs = stmt.executeQuery("select docu from company_data where comid = '"+id+"'");

		if (rs.next()) {

		image = rs.getBlob(1);


		imgData = image.getBytes(1,(int)image.length());

	} else {

			out.println("Display Blob Example");

			out.println("image not found for given id>");

		return;

	}


// display the image

response.setContentType("image/gif");

OutputStream o = response.getOutputStream();

o.write(imgData);


o.flush();

o.close();

} catch (Exception e) {

out.println("Unable To Display image");



return;

} 


%>