package starttup;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registerinv
 */
@WebServlet("/Registerinv")
public class Registerinv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registerinv() {
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
		String iname=request.getParameter("iname");
		String imail=request.getParameter("imail");
		String imob=request.getParameter("imob");
		String ipan=request.getParameter("ipan");
		String iloc=request.getParameter("iloc");
		String ipass=request.getParameter("ipass");
		String interest=request.getParameter("interest");
		String funding=request.getParameter("funding");
        String statuse= "pending";
        String invested="NULL";
        String investedcom="NULL";
		try
		{
			Connection con=connectDB.connect();
			PreparedStatement ps1=con.prepareStatement("insert into investor values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1,0);
			ps1.setString(2, iname);
			ps1.setString(3, imail);
			ps1.setString(4, imob);
			ps1.setString(5, ipan);
			ps1.setString(6, iloc);
			ps1.setString(7, ipass);
			ps1.setString(8, interest);
			ps1.setString(9, funding);
			ps1.setString(10,statuse);
			ps1.setString(11,invested);
			ps1.setString(12,investedcom);
			int i=ps1.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("investorindex.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
