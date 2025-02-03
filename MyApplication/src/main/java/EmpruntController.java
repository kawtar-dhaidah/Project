

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

import jee_pr_oof.Emprunt;
import jee_pr_oof.EmpruntDao;

/**
 * Servlet implementation class EmpruntController
 */
@WebServlet("/EmpruntController")
public class EmpruntController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpruntController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
        String cin = request.getParameter("cin");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String produit = request.getParameter("produit");
      //  Date dateEmprunt = Date.valueOf(request.getParameter("date_commande"));
        Emprunt emprunt = new Emprunt();
        emprunt.setNom(nom);
        emprunt.setCin(cin);
        emprunt.setTel(tel);
        emprunt.setEmail(email);
        emprunt.setProduit(produit);
      //  emprunt.setDateCommand(dateEmprunt);

        EmpruntDao empruntDao = new EmpruntDao();
        empruntDao.insertEmprunt(emprunt);
        //empruntDao.insertAcht();
        response.sendRedirect("Filtre.jsp");
	}

}
