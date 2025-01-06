package starttup;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class logininv
 */
@WebServlet("/logininv")
public class logininv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logininv() {
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
		String imail=request.getParameter("imail");
		String ipass=request.getParameter("ipass");
		String Approved="Approved";
		try{
			Connection con=connectDB.connect();
			PreparedStatement ps1=con.prepareStatement("select * from investor where imail=? AND ipass=? and statuse=?");
			ps1.setString(1, imail);
			ps1.setString(2, ipass);
			ps1.setString(3, Approved);
			ResultSet res=ps1.executeQuery();
			if(res.next())
			{   getsetinv.setimail(imail);
				response.sendRedirect("investormenu.html");
				System.out.println("login");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		}

		}
