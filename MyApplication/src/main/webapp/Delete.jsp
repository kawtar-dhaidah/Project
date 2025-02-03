<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
	try {	  Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
	 int id=Integer.parseInt(request.getParameter("id"));

		System.out.println(id);
		String req="delete from commandes where idcommandes="+id;
			
			PreparedStatement ps =con.prepareStatement(req);
			ps.executeUpdate();
			request.getRequestDispatcher("Filtre.jsp").forward(request,response);

	}catch(Exception e){
		e.printStackTrace();
	}
	  %>
	
  
</body>
</html>