

import java.io.IOException;

import jakarta.servlet.http.*;
import jakarta.servlet.*;

/**
 * Servlet implementation class ChangeState
 */
@jakarta.servlet.annotation.WebServlet("/ChangeState")
public class ChangeState extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ChangeState() {
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
	
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		RegisterDao rdao=new RegisterDao();
		rdao.updateAll(id);
        response.sendRedirect("tab_emp.jsp");
       

	}

}
