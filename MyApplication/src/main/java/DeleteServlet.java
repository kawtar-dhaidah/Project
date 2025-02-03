

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

import jakarta.servlet.http.*;
import jakarta.servlet.*;


/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/deleteurl")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		int id = Integer.parseInt(request.getParameter("id"));
		
		RegisterDao rdao=new RegisterDao();
		String rr=rdao.delete(id);
		//response.getWriter().println(rr);
	
		request.getRequestDispatcher("/List").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
