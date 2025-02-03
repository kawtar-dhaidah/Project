

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;


import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

/**
 * Servlet implementation class EditScreenServlet
 */
@jakarta.servlet.annotation.WebServlet("/editScreen")
public class EditScreenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditScreenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //private static final String query = "SELECT nom,auteur,prix,qte FROM livres where id=?";

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		int id = Integer.parseInt(req.getParameter("id"));
		
		try {
			HttpSession session=req.getSession();
			String login="";
			if (session.getAttribute("login")!=null){
				login=session.getAttribute("login").toString();
			}else{
				res.sendRedirect("auth.jsp");
			}
			RegisterDao  r=new RegisterDao();
			ResultSet rs=r.update(id);				
			pw.println("<form action='editurl?id="+id+"' method='post'>");
			
			pw.println("<style>");
			pw.println(".container{ border-spacing: 1;border-collapse: collapse;  background: #ecf0f3;  border-radius: 10px;   overflow: hidden;   position: absolute; left:35%; top: 15%; align-content:center;align-item:center;  box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;width:400px;height:650px ; padding:40px }");
			pw.println("th, td { text-align: left; padding: 8px; }");
			pw.println("body { background-color: #ecf0f3;    align-items: center;}");
			pw.println(".b{ width: 40px; padding: 8px; }");pw.println("input{margin:4%;width:80%;height:45px;width: 100%;padding: 12px 20px;margin: 8px 0;box-sizing: border-box;}");
			pw.println("select{margin:4%;width:80%;height:45px;width: 100%;padding: 12px 20px;margin: 8px 0;box-sizing: border-box;}");
			pw.println(".fct{ position:absolute; top:auto; left:30%}");
			pw.println("h1 {font-size: 24px;  margin-top: 10px; font-weight: 900; font-size: 1.8rem;  color: #16a085; letter-spacing: 1px;  text-align: center;}");
			pw.println("tr:nth-child(even){ background-color: #ecf0f3; }");
			//pw.println("input ,select{ background: #ecf0f3;  padding: 10px;padding-left: 20px; height: 50px; font-size: 14px;  box-shadow: inset 6px 6px 6px #cbced1, inset -6px -6px 6px white;}");
			pw.println(".aj { font-size: 35px;  bottom: 4px;right: 4px;text-decoration: none; color: black; background: #1DA1F2; border-radius: 10px;padding: 2px; }");
			pw.println(".logout{ background:#d8d8d8;width: 100px;cursor:pointer; position:absolute; right:2%; top:2%; border-radius:50px; padding:10px 20px 10px 0; color:White;font-size:14px; text-align:left;text-indent:40px; display:block; margin:0 auto; font-family: Arial, Helvetica, sans-serif;-webkit-transition-timing-function: ease-in-out; -webkit-transition-duration: .4s; -webkit-transition-property: all; -moz-transition-timing-function: ease-in-out;-moz-transition-duration: .4s; -moz-transition-property: all;}");
			pw.println(".logout:hover {background-image: url( 'https://dh3vbjnk0bnfa.cloudfront.net/static/centralauth/images/btn-login.png' );background-position: 65px 5px;text-indent: 15px;  }");
			pw.println(".log_out{text-decoration: none;outline: none;color: black;}");
			pw.println("</style>");
			pw.println("<div  class='logout' > <a  class='log_out' href='Logout' >Logout</a></div> ");
			pw.println("<br>");
			pw.println("<br>");
			pw.println("<br>");
			pw.println("<div class='container'>");

			pw.println("<table class='table table-hover'>");
			pw.println("<h1>Modification d'un Produit</h1>");

			pw.println("<tr>");
			pw.println("<td>Operation</td>");
			pw.println("<td><input type='text' name='pname' value='"+rs.getString(1)+"'></td>");
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>prix</td>");
			pw.println("<td><input type='text' name='price' value='"+rs.getFloat(2)+"'></td>");
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>surface</td>");
			pw.println("<td><input type='text' name='surface' value='"+rs.getString(3)+"'></td>");
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>Etat</td>");
			pw.println("<td><input type='text' name='etat' value='"+rs.getString(4)+"'></td>");
			pw.println("</tr>");
			/*pw.println("<tr>");
			pw.println("<td>Nombre d'echeances</td>");
			pw.println("<td><input type='text' name='nbr' value='"+rs.getInt(5)+"'></td>");
			pw.println("</tr>");*/
			pw.println("<td>Type d'operation</td>");
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
			   PreparedStatement pr = con.prepareStatement("select * from operations"); 
			    ResultSet rss = pr.executeQuery();
			    pw.println("<td><select name='op'>");
			    while (rss.next()) {
			

	
			
			pw.println(" <option >"+rss.getString("operation_name")+"</option>");		    
			System.out.println(rss.getString("operation_name"));
			  
				   }			pw.println(" </select></td>");		    
    }catch(Exception e){ e.getMessage();}
		
		
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>Categorie</td>");
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
			   PreparedStatement pr = con.prepareStatement("select * from categories"); 
			    ResultSet rss = pr.executeQuery();
			    pw.println("<td><select name='categorie'>");
			    while (rss.next()) {
			

	
			
			pw.println(" <option >"+rss.getString("categorie_name")+"</option>");		    
			System.out.println(rss.getString("categorie_name"));
			  
				   } pw.println("</select></td>");   }catch(Exception e){ e.getMessage();}	
			pw.println("</tr>");
			pw.println("<tr>");
			pw.println("<td>Type de Categorie</td>");
			pw.println("<td><input type='text' name='typeCat' value='"+rs.getString(7)+"'></td>");
			pw.println("</tr>");
			pw.println("<tr>");

			pw.println("<tr class='fct'>");
			pw.println("<td class='b'><input type='submit' value='Modifier'></td>");
			pw.println("<td class='b'><input type='reset' value='cancel'></td>");
			pw.println("</tr>");
			pw.println("</table>");
			
			pw.println("</div>");

			pw.println("</form>");
		}catch(SQLException se) {
			se.printStackTrace();
			pw.println("<h1>"+se.getMessage()+"</h2>");
		}catch(Exception e) {
			e.printStackTrace();
			pw.println("<h1>"+e.getMessage()+"</h2>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
