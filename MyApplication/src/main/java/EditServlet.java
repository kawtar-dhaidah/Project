

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/editurl")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private static final String query = "update products set product_name = ?,price =?,surface= ?,etat = ?,operation= ?,categorie= ?,type_categorie=? where productid = ?";
   	@Override
   	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
   			PrintWriter pw = res.getWriter();
   			res.setContentType("text/html");
   	        String name = req.getParameter("pname");
   	        float price = Float.parseFloat(req.getParameter("price"));
   	        String surface = req.getParameter("surface");
   	        String etat = req.getParameter("etat");
   	       // int nbr =Integer.parseInt(req.getParameter("nbr"));
   	        String operation = req.getParameter("op");  
   	        String categorie = req.getParameter("categorie"); 
   	        String typeC = req.getParameter("typeCat");   

   	       //= int id = req.getParameter("id");
            int id =Integer.parseInt(req.getParameter("id"));
   			RegisterDao reg=new RegisterDao();
   	         reg.loadDriver("com.mysql.cj.jdbc.Driver");
   			
   			try {
   				Connection con=reg.getConnection();
   				String query=reg.editservlet(id);
   				PreparedStatement pst = con.prepareStatement(query);
   			  pst.setString(1, name);
   	        pst.setFloat(2, price);
   	        pst.setString(3, surface);
   	        pst.setString(4, etat);
   	       // pst.setInt(5, nbr);
   	        pst.setString(5, operation);
   	        pst.setString(6, categorie);
			pst.setString(7, typeC);

			pst.setInt(8, id);

   	        
   				int count = pst.executeUpdate();
   				if(count==1) {
   					req.getRequestDispatcher("/List").forward(req, res);

   					
   				}else {
   					pw.println("<h2>Le livre n'a pas été modifié avec succès</h2>");
   				}
   			}catch(SQLException se) {
   				se.printStackTrace();
   				pw.println("<h1>"+se.getMessage()+"</h2>");
   			}catch(Exception e) {
   				e.printStackTrace();
   				pw.println("<h1>"+e.getMessage()+"</h2>");
   			}
   			pw.println("<a href='prod.jsp'>Ajout</a>");
   			pw.println("<br>");
   			pw.println("<a href='List'> List</a>");
   			pw.println("</div>");
   	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
