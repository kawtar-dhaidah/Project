<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>All commandes</title>

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
 /*.table-wrapperrr{
 overflow-y:scroll;
 max-height:1000px;
  margin-left:2px;
 
 height:1000px;
 margin:20px;
 }
 th{
 background-color:#16a085;
 }
 
 form{


    margin-bottom: 1rem;

  box-sizing: border-box;


    margin-left:350px;
    width:800px;
    height:980px;
   font-size:140%;
   border:none;
      display:inline-block;
      
      padding: 30px 40px;
      
      margin-top: 170px;margin-bottom: 60px;
border: none !important;box-shadow: 0 6px 12px 0 rgba(0,0,0,0.2)}
   
   
}

input{
  width: 80%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
}

input{
 margin:4%;
 width:80%;
 height:45px;
}

.btn{
	display: inline-block;
  padding: 15px 25px;
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
  margin-left:6%;
}*/

h1{
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
    height:760px;
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
</head>
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
          <a href="Filtre.jsp" class="active">
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


  <%
	try {	  Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
	 int id=Integer.parseInt(request.getParameter("id"));
	    request.setAttribute(request.getParameter("id"), "id");

		System.out.println(id);
		String req="SELECT clientName,cin,telephone,email,c.produit,c.date_commande,c.date_nextVersement,p.price,p.nbr_vers FROM commandes c,products p where c.produit=p.product_name and idcommandes="+id;
	
			
			PreparedStatement ps =con.prepareStatement(req);
			ResultSet res =ps.executeQuery();
			
			
			while(res.next()){	
	  %>
	
     <div class="table-wrapperrr">
	<form action="editCommande.jsp?id=<%=id %>" method="post">
	

<h1>Modifier la commande</h1>
<input type="text" name="name" value="<%=res.getString("clientName")%>" placeholder="Nom de client"><br>

  <input type="text" name="cin" value="<%=res.getString("cin")%>" placeholder="Cin"><br>
<input type="text" name="tell" value="<%=res.getString("telephone")%>" placeholder="Telephone"><br>
<input type="text" name="emaill" value="<%=res.getString("email")%>" placeholder="Email"><br>
<input type="text" name="prodd" value="<%=res.getString("produit")%>" placeholder="Produit"><br>
<input type="Date" name="datc" value="<%=res.getDate("date_commande")%>" placeholder="Date de commande"><br>
<input type="Date" name="datn" value="<%=res.getDate("date_nextVersement")%>" placeholder="Date de versement suivant"><br>
<input type="text" name="price" value="<%=res.getFloat("price")%>" placeholder="Prix"><br>
<input type="text" name="nbbr" value="<%=res.getInt("nbr_vers")%>" placeholder="Nombre de versement"><br>
  
  
  <input class="btn" type="submit"  value="modifier">
  
</form>

</div>
<%}}catch(Exception e){
	e.getMessage();}%>

</section>
</body>
</html>