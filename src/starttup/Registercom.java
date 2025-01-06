package starttup;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class Registercom
 */
@WebServlet("/Registercom")
public class Registercom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registercom() {
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
		String cname=request.getParameter("cname");
		String cmail=request.getParameter("cmail");
		String cpass=request.getParameter("cpass");
		String cmob=request.getParameter("cmob");
		String ccity=request.getParameter("ccity");
		String cadr=request.getParameter("cadr");
		String ctype=request.getParameter("ctype");
		String cpan=request.getParameter("cpan");
		String cpname=request.getParameter("cpname");
		String cpmob=request.getParameter("cpmob");
		String statuse="pending";
		try{
			Connection con=connectDB.connect();
			PreparedStatement ps1=con.prepareStatement("insert into company_reg values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1,0);
			ps1.setString(2,cname);
			ps1.setString(3,cmail);
			ps1.setString(4,cpass);
			ps1.setString(5,cmob);
			ps1.setString(6,ccity);
			ps1.setString(7,cadr);
			ps1.setString(8,ctype);
			ps1.setString(9,cpan);
			ps1.setString(10,cpname);
			ps1.setString(11,cpmob);
			ps1.setString(12,statuse);
			int i=ps1.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("companiindex.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
