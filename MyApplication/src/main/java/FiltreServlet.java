

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import classes.Command;

/**
 * Servlet implementation class FiltreServlet
 */
@WebServlet("/FiltreServlet")
public class FiltreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FiltreServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		if(!request.getParameter("search_name").isEmpty()) {
		List<Command> Emprunts=new ArrayList<>(); 		Command.getAll();

		Emprunts=Command.getEmprunt_name(request.getParameter("search_name"));
		 request.getRequestDispatcher("/name_Search.jsp").forward(request, response);
		}
		
		 
		if(!request.getParameter("search_Date").isEmpty()) {
			List<Command> Emprunts=new ArrayList<>();
			Emprunts=Command.getEmprunt_date(request.getParameter("search_Date"));
			request.setAttribute("client", Emprunts);
			 request.getRequestDispatcher("/Date_search.jsp").forward(request, response);
			
		}
		
	}

}
