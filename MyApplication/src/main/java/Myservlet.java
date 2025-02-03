

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;


import classes.Command;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 * Servlet implementation class Myservlet
 */
@WebServlet("/Myservlet")
public class Myservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection connection;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Myservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ArrayList<Command> Emprunts=Command.getAll();
		for (int i=0;i<Emprunts.size();i++) {
		System.out.println(Emprunts.get(i).getClient());
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
