<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="classes.Command" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" import="java.sql.*" %>
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
<title> Commandes</title>

	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="Styless.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
		
			
	    <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
	
	      <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='side.css' rel='stylesheet'>
    
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="Styless.css">
  <style>

 th{
 background-color:#16a085;
 }</style>
</head>
<body>


 <div class="sidebar">
    <div class="logo-details">
      <img class="lg" src="img/logo.jpg">
      <span class="logo_name"></span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="index.jsp" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="List">
            <i class='bx bx-box' ></i>
            <span class="links_name">Produits</span>
          </a>
        </li>
        <li>
          <a href="Filtre.jsp">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Liste des commandes</span>
          </a>
        </li>
        <li>


          <a href="gest_emp.jsp">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">Ajouter une commande</span>
          </a>
        </li>
        <li>
          <a href="List_Retard.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Liste des retards</span>
          </a>
        </li>
   
   
        <li>
          <a href="#">
            <i class='bx bx-cog' ></i>
            <span class="links_name">Parametres</span>
          </a>
        </li>
        <li class="log_out">
          <a href="Logout">
            <i class='bx bx-log-out'></i>
          <span class="links_name">Deconnexion</span>
          </a>   
  
  
        </li>
      </ul>
  </div>
		
		
		
		
	
		<section class="home-section">
    <nav >
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>
      
      <div class="profile-details">
        <img src="img/adminn.png" alt="noot">
        <span class="admin_name"><%=login %></span>
      </div>
    </nav>



<div  class="logout"  >
   <a  class="log_out"href="Logout" >Logout</a>
   </div> 
<br><br>
	<h2 style=" background-color:#16a085;color:white;margin-top:23px">Changer l'état de vos commandes</h2>
	<%session.setAttribute("id", request.getParameter("id")); %>
	<br><br><br>
	<div class="search_zone">
	
	</div>
	
	<br><br>
	<br><br>
	
	<form  method="post" action="UpdateServlet">
	<table>
    <tr>
      <th>Client</th>
      <th>CIN</th>
      <th>Telephone</th>
      <th>produit</th>
      <th>Prix</th>
      <th>Date de commande</th>
      <th>Date de versement suivant</th>
      <th>Action</th>
      
    </tr>
    
   
     
	  <%
	try {	  Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		int id=Integer.parseInt(request.getParameter("id"));
		String req="SELECT clientName,cin,telephone,email,c.produit,c.date_commande,c.date_nextVersement,p.etat FROM commandes c,products p where c.produit=p.product_name and idcommandes="+id;
	
			
			PreparedStatement ps =con.prepareStatement(req);
			ResultSet res =ps.executeQuery();
			while(res.next()) {
			
				
			
	  %>
	
     
	
		<tr>
		
		<td><%=res.getString("clientName")%></td>
		<td><%=res.getString("cin")%></td>
		<td><%=res.getString("telephone")%></td>
		<td><%=res.getString("email")%></td>
		<td><%=res.getString("produit")%></td>
		<td><%=res.getDate("date_commande")%></td>
		<td><%=res.getDate("date_nextVersement")%></td>
		
		<td>
			
			<label><input type="checkbox" name="etat" value="Valider" >V</label>
			<label><input type="checkbox" name="etat" value="Retard">R</label>
			
			
		
		</td>
		 </tr>
			<% 
			}
		} catch (Exception e) {
			System.out.println("problem");
		}
	  
		%>
	</table>
	
		
		
<br><br>
	<input style=" background-color:#16a085;"  class="btn" type="submit" value="Valider">
</form>		
		
		




</body>
</html>