

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

/**
 * Servlet implementation class SRegister
 */
@WebServlet("/SRegister")
public class SRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SRegister() {
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
   String email=request.getParameter("email");
   
   RegisterDao rr=new RegisterDao()
;
   rr.RegisterPass(email);
   
   
	}

}
