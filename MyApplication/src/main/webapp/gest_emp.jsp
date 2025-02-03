<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.sql.* "%>
    
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
<title>Insert title here</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/custom.css">
		
		
	
	    <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
	
	
      <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='side.css' rel='stylesheet'>
    
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
</head>
<style>
h2{
    margin-left: 2%;
    margin-top: 3%;
    font-size:100%;
    margin-left:60px;
     color:#16a085;
}

form{


    margin-bottom: 1rem;

  box-sizing: border-box;


    margin-left:350px;
    width:500px;
    height:470px;
   font-size:140%;
   border:none;
      display:inline-block;border-radius:4px;
      
      
      padding: 30px 40px;
      
      margin-top: 170px;margin-bottom: 60px;
border: none !important;box-shadow: 0 6px 12px 0 rgba(0,0,0,0.2)}
   
   
}

input{width: 60%;padding: 12px 20px;margin: 8px 0;box-sizing: border-box;   margin-left:180px;
}
select{
  width: 60%;
  padding: 2px ;
  margin-left: 20px;   margin-left:80px;

}
input{margin:4%;width:60%;height:30px;   margin-left:80px;}
label{
 color:gray;
}
.btn{
	display: inline-block;
  padding: 5px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  background-color:#16a085;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
  margin:3%;
margin-left:80px;  height:40px;
  color:white;
}
.nav{
   margin-top:0%;

}
</style>
<body>
 <div class="sidebar">
    <div class="logo-details">
      <img class="lg" src="img/logo.jpg">
      <span class="logo_name"></span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="index.jsp" >
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


          <a href="gest_emp.jsp" class="active">
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


   <div class="containerrr">
  
     <form method="post" action="EmpruntController">
         <h2>Ajouter une Commande</h2>

    <input type="text" name="nom" placeholder="Nom"><br>

    
    <input type="text" name="cin" placeholder="CIN"><br>

    
    <input type="text" name="tel" placeholder="Telephone"><br>

    
    <input type="email" name="email" placeholder="Email"><br>
  <select name="produit" ">
  <option>select a product</option>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
   PreparedStatement pr = con.prepareStatement("select * from products where etat like 'en cours'"); 
    ResultSet rs = pr.executeQuery();

    while (rs.next()) {
%>    

    
    <option ><%=rs.getString("product_name") %></option>
<%} %>
    </select >

 
	
	<!--  <input type="date" name="date_commande"placeholder="Date de commande"><br>-->
	
	
	<input type="submit" value="Enregistrer" class="btn">
  
    </form> </div> </section>
     <% }catch(Exception e){
 	    e.printStackTrace();}

   %>

</body>
</html>




