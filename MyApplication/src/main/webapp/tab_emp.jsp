<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.* ,java.sql.Date,java.text.SimpleDateFormat, java.time.LocalDate" import="java.util.*" %>
<%
String login="";
if (session.getAttribute("login")!=null){
	login=session.getAttribute("login").toString();
}else{
	response.sendRedirect("auth.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stylee.css">
<title>HOME PAGE </title>
</head>

<body>
   <div  class="logout"  >
   <a  class="log_out"href="Logout" >Logout</a>
   </div> 
   <br><br><br><br>
   <h4>Table des commandes</h4>    
    <button class="btn"><a href="gest_emp.jsp">Ajouter Commande</a></button> 
    <button class="btn"><a href="List_Retard.jsp">Commandes en Retard</a></button>  
    <button class="btn"><a href="Filtre.jsp">Gestion Commandes</a></button>                                   
   <table border="1" width="100%">
   <tr>
     <th>Id</th>
     <th>Nom</th>
     <th>CIN</th>
     <th>Telephone</th>
     <th>Email</th>
     <th>Produit</th>
       <th>Date de commande</th>
      <th>Date de next echeance</th>
      <th>Prix de Produit</th>
      <th>Type d'operation</th>
      <th>Categorie</th>
       <th>Type de Categorie</th>
        <th>Nombre de versement de produit</th>
       
      <th>Etat</th>
        
   </tr>
   <%
   int nbr=0;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		 PreparedStatement ps=con.prepareStatement("SELECT idcommandes,c.clientName,c.cin,c.telephone,c.email,c.produit,c.date_commande,c.date_nextVersement,p.price,p.operation,p.categorie,p.type_categorie,e.nbr_echeance,p.etat from commandes c,products p,echeance e where c.produit=p.product_name and p.type_categorie=e.sous_categorie and e.idcategorie in (select idcategories from categories where categorie_name=p.categorie) and e.idoperation in(select idoperations from operations where product_name=p.product_name) ");
		// PreparedStatement ps=con.prepareStatement("select idachats,name,cin,tele,email,prod,date_echeance,nextDate,price,nbr,categ,etat from achats");
		 ResultSet rs=ps.executeQuery();
		 while(rs.next()){
			 
			 %>
			 <tr>
			     <td><%=rs.getInt(1) %></td>
			     <td><%=rs.getString(2) %></td>
			     <td><%=rs.getString(3) %></td>
			     <td><%=rs.getString(4) %></td>
			     <td><%=rs.getString(5) %></td>
			     <td><%=rs.getString(6) %></td>
			     <td><%=rs.getDate(7) %></td>
			     <td><%=rs.getDate(8) %></td>
			     
			     <td><%=rs.getFloat(9) %></td>
			     <td><%=rs.getString(10) %></td>
		        <td><%=rs.getString(11) %></td>
			     <td><%=rs.getString(12) %></td>    
			     <td><%=rs.getInt(13) %></td>
			     <td><%=rs.getString(14) %></td>
		
			   	     
			     
			 </tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
			     	<% 	 }	 %>		     			    
			 <% 	
		ps=con.prepareStatement("select COUNT(*) from commandes c,products p where c.produit=p.product_name");
			 //ps=con.prepareStatement("select count(*) from achats");
		rs=ps.executeQuery();
		rs.next();
		nbr= rs.getInt(1);
	
		rs.close();
		ps.close();
		con.close();
}catch(ClassNotFoundException e){
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();
}
   %>
   </table>
   le nombre des commandes : <%=nbr %>
   
 
</body>
</html>