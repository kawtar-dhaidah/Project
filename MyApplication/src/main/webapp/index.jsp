<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<%

String login="admin";
session.setAttribute("login",login);

if (session.getAttribute("login")!=null){
	login=session.getAttribute("login").toString();
}else{
	response.sendRedirect("auth.jsp");
}
%>




<!DOCTYPE html>
<html  >
  <head>
    <meta charset="UTF-8">
    <title> Al Omrane </title>
    <link rel="stylesheet" href="style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='side.css' rel='stylesheet'>
    
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <style>
 
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
   
   
   
        <li class="log_out">
          <a href="Logout">
            <i class='bx bx-log-out'></i>
          <span class="links_name">Deconnexion</span>
          </a>   
  
  
        </li>
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>
      
      <div class="profile-details">
        <img src="img/adminn.png" alt="noot">
        <span class="admin_name"></span>
      </div>
    </nav>

    <div class="home-content">
      <div class="overview-boxes">
        <div class="box">
          <div class="right-side">
          
            <div class="box-topic" > Rappel de versements</div>
            <div class="number"><a href="https://localhost:7208/WeatherForecast" id="btn"><input type="button" style="background-color:#16a085;Color:white;border:solid 1px white;border-radius:4px;width:180px;height:26px;font-size:10px" value="Envoyer des e-mails de rappel." onclick="executerCodeCSharp()" />
</a></div>
       <!--     <div class="number"><a href="https://localhost:7208/Home" id="btn"><input type="button" style="background-color:#16a085;Color:white;border:solid 1px white;border-radius:4px;width:200px;height:26px;font-size:7px" value="Envoyer des e-mails de rappel a categrie :commercial." onclick="executerCodeCSharp()" />
</a></div>

   <div class="number"><a href="https://localhost:7208/categorie" id="btn"><input type="button" style="background-color:#16a085;Color:white;border:solid 1px white;border-radius:4px;width:200px;height:26px;font-size:7px" value="Envoyer des e-mails de rappel a categrie :habitat" onclick="executerCodeCSharp()" />
       </a></div>       
     <form action="https://localhost:7208/categorie" method="post">
        
          <input type="text" name="rr">
          <input type="submit" value="send">
         </form> 
  --> 
            <div class="indicator">
            </div>
          </div>
          <img src='img/reminder.png'  style="height:80px;width:100px;border:solid 1px ;border-radius:15px" />
        </div>
      </div>

      <div class="sales-boxes">
        <div class="recent-sales box">
          <div class="title">Commandes Recentes</div>
          <div class="sales-details">
         <% try{ String query="select date_commande,clientName,p.etat,p.price from commandes c ,products p where c.produit=p.product_name and date_commande like adddate(curdate(),'yyyy-MM-JJ')";
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
         PreparedStatement stm=con.prepareStatement(query);
         ResultSet rs=stm.executeQuery();
     
        	 
      
           %>  
           
           
           <table style="width: 100%;border-collapse: collapse;">
  <tr>
    <th class="tt">Date</th>
    <th class="tt">Nom de client</th>
    <th class="tt">Etat</th>
    <th class="tt">Prix</th>
  </tr>  
  <%    while(rs.next()){ %> 
  <tr>
    <td><%=rs.getDate(1) %></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(3) %></td>
    <td><%=rs.getFloat(4) %></td>
  </tr>


          <%} %>       </table>
          </div>
      
       
          <div class="button" >
            <a href="Filtre.jsp" style="background-color:#16a085" >Voir tout</a>
          </div>
        </div>
        <div class="top-sales box" style="width:510px">
          <div class="title" > Produits</div>
          
           <% try{ String queryy="select product_name,price from products where etat like 'en cours' ";
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
         PreparedStatement stmm=conn.prepareStatement(queryy);
         ResultSet rss=stmm.executeQuery();
         while(rss.next()){
        	 
      
           %>
          <ul class="top-sales-details">
            <li>
            <a href="#">
              <span class="product"><%=rss.getString(1) %></span>
            </a>
            
            <span class="price"><%=rss.getFloat(2) %></span>
          </li>
          
           <%} %>
          </ul>
        </div>
      </div>
    </div>
        
          <%}catch(Exception e){
        	  e.getMessage();   }
        	  }catch(Exception e){
        	  e.getMessage();   }%>
  </section>

  <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
 </script>

</body>
</html>




