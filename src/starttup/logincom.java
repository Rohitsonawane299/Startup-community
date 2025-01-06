package starttup;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class logincom
 */
@WebServlet("/logincom")
public class logincom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logincom() {
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
		String cmail=request.getParameter("cmail");
		String cpass=request.getParameter("cpass");
		String approved="Approved";
		try{
			Connection con=connectDB.connect();
			PreparedStatement ps1=con.prepareStatement("select * from company_reg where cmail=? AND cpass=? and statuse=?");
			ps1.setString(1, cmail);
			ps1.setString(2, cpass);
			ps1.setString(3,approved);
			ResultSet res=ps1.executeQuery();
			if(res.next())
			{   getsetcom.setcmail(cmail);
				response.sendRedirect("companymenu.html");
				System.out.println("login");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
