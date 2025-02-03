

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

/**
 * Servlet implementation class Stock
 */
@WebServlet("/Stock")
public class Stock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stock() {
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
	       String name = request.getParameter("pname");
	        float price = Float.parseFloat(request.getParameter("price"));
	        String surface = request.getParameter("surface");
	        String etat = request.getParameter("etat");
	     //   int nbr =Integer.parseInt(request.getParameter("nbr"));
	        String opera= request.getParameter("op");  
	        String categorie = request.getParameter("categorie"); 
	        String typeC = request.getParameter("typeCat"); 

		product prd=new product(name, price, surface, etat,opera,categorie,typeC);
		RegisterDao rdao=new RegisterDao();
		String result=rdao.insert(prd);
		//rdao.DeleteAchat();
		System.out.print(result);
		//response.getWriter().println(result);
		request.getRequestDispatcher("/List").forward(request,response);
		
	}

}
