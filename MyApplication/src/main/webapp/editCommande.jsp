<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.sql.Date, java.util.* ,java.text.* ,java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
 String name=request.getParameter("name");
 String cin=request.getParameter("cin");
 String tell=request.getParameter("tell");
 String emaill=request.getParameter("emaill");
 String prodd=request.getParameter("prodd");
 String datc=request.getParameter("datc");
 String datn=request.getParameter("datn");
 String price=request.getParameter("price");
 int nbr= Integer.parseInt(request.getParameter("nbbr"));
	int id = Integer.parseInt(request.getParameter("id"));

try {


	  Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		System.out.println(id);
		//String req="UPDATE commandes c join products p   set clientName="+name+",cin="+cin+",telephone="+tell+",email="+emaill+",c.produit="+prodd+",c.date_commande="+datc+",nextDate="+datn+",p.price="+price+",p.nbr_vers="+nbr+"  where c.produit=p.product_name and idcommandes="+id;
		String req="UPDATE commandes c join products p   set clientName=?,cin=?,telephone=?,email=?,c.produit=?,c.date_commande=?,c.date_nextVersement=?,p.price=?, p.nbr_vers=?  where c.produit=p.product_name and idcommandes=?";
Date d=Date.valueOf(datc);
System.out.println(d);
Calendar calendar = Calendar.getInstance();
calendar.setTime(Date.valueOf(datc));
calendar.add(Calendar.MONTH, 6);
Date nextDate = new Date(calendar.getTimeInMillis());

			PreparedStatement ps =con.prepareStatement(req);
			LocalDate localDate = LocalDate.parse(datn);
			String formattedDate = null;
		    formattedDate = localDate.toString();
		ps.setString(1,name);
		ps.setString(2,cin);
		ps.setString(3,tell);
		ps.setString(4,emaill);
		ps.setString(5,prodd);
		ps.setDate(6, Date.valueOf(datc));
		ps.setDate(7, Date.valueOf(datn));

		//ps.setString(7,datn);
		ps.setFloat(8,Float.parseFloat(price));
        ps.setInt(9,nbr);
		ps.setInt(10,id);
	

			ps.executeUpdate();
			response.sendRedirect("Filtre.jsp");
	}catch(Exception e){
		e.getMessage();	}



%>
</body>
</html>