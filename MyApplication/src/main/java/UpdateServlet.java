

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

import classes.Command;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		HttpSession session = request.getSession();
		System.out.println("Hello");
		String etat=request.getParameter("etat");
		String id=(String) session.getAttribute("id");
		Command.Update_Etat(Integer.parseInt(id), etat);
		 request.getRequestDispatcher("/Validation_update.jsp").forward(request, response);
		
	}

}
