
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import jakarta.servlet.http.*;
import jakarta.servlet.*;
/**
 * Servlet implementation class NewPassword
 */
@jakarta.servlet.annotation.WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?useSSL=false", "root","Kawtardhaidah123*");
				PreparedStatement pst = con.prepareStatement("update login set pasword = ? where email = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("auth.jsp");
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("auth.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
