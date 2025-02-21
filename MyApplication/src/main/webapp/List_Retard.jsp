<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%@ page import="classes.Command" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    
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

	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>All commandes</title>
<link rel="stylesheet" type="text/css" href="Styless.css">

    <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
	    <!----css3---->
        <link rel="stylesheet" href="css/custom.css">
		
		
		<!--google fonts -->
	
	    <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
	
	
	<!--google material icon-->
      <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='side.css' rel='stylesheet'>
    
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <style>
 .table-wrapperrr{
 overflow-y:scroll;
 max-height:950px;
  margin-left:2px;
 
 
 
 }
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
          <a href="index.jsp" class="">
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
          <a href="List_Retard.jsp" class="active">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Liste des retards</span>
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
<br><br><br>
	<h1 style="background-color:#16a085;color:white;font-size:30px;" >G�rer Votre Espace de commandes</h1>
	<br><br><br>
	
	
	<br><br><br><br>
	<br><br>
	
	    <div class="table-wrapperrr">
    <table style="min-width:max-content;" class="table table-striped table-hover">
    
    
      <thead >
        <tr>
       <th>Id de commande</th>
       <th>Client</th>
      <th>CIN</th>
      <th>Telephone</th>
      <th>Email</th>
      <th>Operation</th>
        <th>Date de commande</th>
      <th>Date de versement suivant</th>
      <th>Prix de Produit</th>
      <th>Type d'operation</th>
      <th>Categorie</th>
       <th>Type de Categorie</th>
        <th>Nombre de versement</th>
       
      <th>Etat</th>
      
        </tr>
      </thead>
      <tbody>
<%
		
    
         try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
		 PreparedStatement ps=con.prepareStatement("SELECT idcommandes,c.clientName,c.cin,c.telephone,c.email,c.produit,c.date_commande,c.date_nextVersement,p.price,p.operation,p.categorie,p.type_categorie,e.nbr_echeance,p.etat from commandes c,products p,echeance e where c.produit=p.product_name and p.type_categorie=e.sous_categorie and e.idcategorie in (select idcategories from categories where categorie_name=p.categorie) and e.idoperation in(select idoperations from operations where product_name=p.product_name) and p.etat='Retard' ");
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
				<td><a href="Etat_update.jsp?id=<%=rs.getInt(1)%>">D�tails</a></td>
		
			   	     
			     
			 </tr>        
   
		 <%}}catch(Exception e){ e.printStackTrace();
				 } %>
		 
      </tbody>
    </table>
	
	 </div>

</section>

</body>
</html>