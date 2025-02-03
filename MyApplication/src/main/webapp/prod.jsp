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
<title>Livres</title>
<link rel="stylesheet" href="/lstyle.css">
</head>
<style>
.container{ border-spacing: 1;border-collapse: collapse; 
 background: #ecf0f3;  border-radius: 10px;  
  overflow: hidden;   position: absolute; left:35%; top: 15%;
   align-content:center;align-item:center;  
   box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;
   width:500px;
   height:760px ; 
   padding:5px }
th, td { text-align: left;
         padding: 8px; }
body { background-color: #ecf0f3;   
         align-items: center;}
.b{ width: 40px; padding: 8px; }
input{margin:4%;width:100%;height:45px;padding: 12px 20px;margin: 8px 0;box-sizing: border-box;}
select{margin:4%;width:80%;height:45px;width: 100%;padding: 12px 20px;margin: 8px 0;box-sizing: border-box;}
.fct{ position:absolute; top:auto; left:30%}
h1 {font-size: 24px;  margin-top: 10px; font-weight: 900;
 font-size: 1.8rem; 
  color: #16a085;
   letter-spacing: 1px; 
    text-align: center;}
tr:nth-child(even){ background-color: #ecf0f3; }
.aj { font-size: 35px;  bottom: 4px;right: 4px;
text-decoration: none; color: black; background: #1DA1F2;
 border-radius: 10px;
 padding: 2px; }
.logout{ background:#d8d8d8;width: 100px;
cursor:pointer; position:absolute; right:2%; top:2%; border-radius:50px;
 padding:10px 20px 10px 0; color:White;font-size:14px; text-align:left;
 text-indent:40px; display:block; margin:0 auto; font-family: Arial, Helvetica, sans-serif;-webkit-transition-timing-function: ease-in-out;
  -webkit-transition-duration: .4s; -webkit-transition-property: all; -moz-transition-timing-function: ease-in-out;
  -moz-transition-duration: .4s; -moz-transition-property: all;}
.logout:hover {background-image: url( 'https://dh3vbjnk0bnfa.cloudfront.net/static/centralauth/images/btn-login.png' );background-position: 65px 5px;text-indent: 15px;  }
.log_out{text-decoration: none;
   outline: none;
   color: black;}
 .sub{
 
 color: white;
  margin-top: 20px;
  background: #16a085;
  height: 40px;
  width:100px;
  border-radius: 2px;
  cursor: pointer;
  font-weight: 900;
  transition: 0.5s;
  margin-left:40px;
 }
 
 .sub:hover {
  box-shadow: none;
}

* {

    box-sizing: border-box;
    margin: 10px 0px 0px 10px;

    
}

body,html {
  
     position: center;
   self-content:center;
}

.lis{
 position: absolute;
  font-size: 19px;
  bottom: 4px;
  right: 4px;
  text-decoration: none;
  color: black;
  padding: 2px;}
}

a {
   
  text-align: center;
}

a:focus {
    outline: none!important
}

a:hover {
    text-decoration: none
}

</style>

<body >

<div  class="logout"  >
   <a  class="log_out" href="Logout" >Logout</a>
   </div> 
   
<form action="Stock" method="post">

<div class="container"><h1>Ajout d'un Produit</h1>
		<table  class="table table-hover">



 <tr>
                        <td>Operation</td>
                       <td> <input type="text" class="form-control" placeholder="Product Name" name="pname" id="pname" required ></td>
                     </tr>
                        
 <tr>
                        <td>Prix</td>
                       <td> <input type="text" class="form-control" placeholder="price" name="price" id="price" required ></td>
                     </tr>
                        
 <tr>
                        <td>Surface</td>
                        <td><input type="text" class="form-control" placeholder="surface" name="surface" id="surface" required ></td>
                     </tr>
                         
                        
                    
 <tr>
                        <td>Etat</td>
                        <td><input type="text" class="form-control" placeholder="etat" name="etat" id="etat" required ></td>
                     </tr>
                    

                     
                     
<!--  <tr>
                        <td>Nombre d'echeances</td>
                       <td> <input type="text" class="form-control" placeholder="nbr" name="nbr" id="nbr" required ></td>
                     </tr> -->
                         
                        
                    
 <tr>
                       
 <td> Type d'operation</td> :<td><select name="op">
  <option>select une operation</option>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
   PreparedStatement pr = con.prepareStatement("select * from operations"); 
    ResultSet rs = pr.executeQuery();

    while (rs.next()) {
%>    

    
    <option ><%=rs.getString("operation_name") %></option>
  
   <%}       }catch(Exception e){
	    e.printStackTrace();} %> 
    </select ></td>
 </tr>                    
 <tr>
   <td>Categorie</td> :<td><select name="categorie">
  <option>select une categorie</option>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","Kawtardhaidah123*");
   PreparedStatement pr = con.prepareStatement("select * from categories"); 
    ResultSet rs = pr.executeQuery();

    while (rs.next()) {
%>    

    
    <option ><%=rs.getString("categorie_name") %></option>
  
   <%}       }catch(Exception e){
	    e.printStackTrace();} %>
    </select ></td>
     </tr>               
                         </br>
                         
 <tr>
                        <td>Type de categorie</td>
                       <td> <input type="text" class="form-control" placeholder="type de categorie" name="typeCat" id="typeCat" required ></td>
                     </tr>
                     

 <tr>
				<td></td>
			
				<td> <a href=prod.jsp><input class="sub"  type="submit" value="Add"></a></td>
			</tr>

		</table>
		 
	</form>
	
	
</body>
</html>