package starttup;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/**
 * Servlet implementation class addprod
 */
@WebServlet("/addprod")
@MultipartConfig(maxFileSize = 16177215)  
public class addprod extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addprod() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String compname=request.getParameter("compname");
		String prodname=request.getParameter("prodname");
		
		String fund=request.getParameter("fund");
		String categoury=request.getParameter("categoury");
		String proddesc=request.getParameter("proddesc");
		String email=getsetcom.getcmail();
		
		InputStream inputStream = null; // input stream of the upload file
        
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
		try{
			Connection con=connectDB.connect();
			PreparedStatement ps1=con.prepareStatement("insert into company_data values(?,?,?,?,?,?,?,?)");
			ps1.setInt(1,0);
			ps1.setString(2,compname);
			ps1.setString(3,prodname);
			ps1.setBlob(4,inputStream);
			ps1.setString(5,fund);
			ps1.setString(6,categoury);
			ps1.setString(7,proddesc);
			ps1.setString(8,email);
			 
			int i=ps1.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("companymenu.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
