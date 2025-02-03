

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		session.removeAttribute("login");
		response.sendRedirect("index.jsp");
	}


}
