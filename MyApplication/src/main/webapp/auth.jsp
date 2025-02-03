<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">


    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Entreprise</title> 
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <link rel="stylesheet" href="style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='side.css' rel='stylesheet'>
    
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
body{
  background:  #ECEBEB ;
  overflow: hidden;
}
::selection{
  background: rgba(26,188,156,0.3);
}
.container{
  max-width: 440px;
  padding: 0 20px;
  margin: 170px auto;
}
.wrapper{
  width: 100%;
  background: #ECEBEB;
  border-radius: 5px;
  box-shadow: 0px 4px 10px 1px rgba(0,0,0,0.1);
}
.wrapper .title{
  height: 90px;
  background: #16a085;
  border-radius: 5px 5px 0 0;
  color: #fff;
  font-size: 30px;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: center;
}
.wrapper form{
  padding: 30px 25px 25px 25px;
}
.wrapper form .row{
  height: 45px;
  margin-bottom: 15px;
  position: relative;
}
.wrapper form .row input{
  height: 100%;
  width: 100%;
  outline: none;
  padding-left: 60px;
  border-radius: 5px;
  border: 1px solid lightgrey;
  font-size: 16px;
  transition: all 0.3s ease;
}
form .row input:focus{
  border-color: #16a085;
  box-shadow: inset 0px 0px 2px 2px rgba(26,188,156,0.25);
}
form .row input::placeholder{
  color: #999;
}
.wrapper form .row i{
  position: absolute;
  width: 47px;
  height: 100%;
  color: #fff;
  font-size: 18px;
  background: #16a085;
  border: 1px solid #16a085;
  border-radius: 5px 0 0 5px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.wrapper form .pass{
  margin: -8px 0 20px 0;
}
.wrapper form .pass a{
  color: #16a085;
  font-size: 17px;
  text-decoration: none;
}
.wrapper form .pass a:hover{
  text-decoration: underline;
}
.wrapper form .button input{
  color: #fff;
  font-size: 20px;
  font-weight: 500;
  padding-left: 0px;
  background: #16a085;
  border: 1px solid #16a085;
  cursor: pointer;
}
form .button input:hover{
  background: #12876f;
}
.wrapper form .signup-link{
  text-align: center;
  margin-top: 20px;
  font-size: 17px;
}
.wrapper form .signup-link a{
  color: #16a085;
  text-decoration: none;
}
form .signup-link a:hover{
  text-decoration: underline;
}
/*
#ssbt{
 background-color:gray;
 color:white;
 border:1px solid  #87CEFA;
 font-size:70%;
 background-color: #87CEFA;
 width: 36%;
 height: 50%;
 margin:4%;
}
ssbt:hover {
  opacity: 0.8;
}
.container{
    margin-left:31%;
    margin-reight:30%;
    margin-top:7%;
   font-size:140%;
}
h1{
    margin-left: 44%;
    margin-top: 10%;
    color : #87CEFA;
}

#inpt{
  border-radius:10% 10% 10% 10%;
  width: 155%;
  height: 50%;
  margin:7%;
  border-style: solid 0.5px gray;
  
}*/

}
</style>
  </head>
  <body>
    <div class="container">
      <div class="wrapper">
     <div class="logo-details">
      <img style="margin-left:120px;height:90px" class="lg" src="img/logo.jpg">
      <span class="logo_name"></span>
    </div>
        <form  action="Login" method="post">
          <div class="row">
            <i class="fas fa-user"></i>
            <input type="text"  name="login" placeholder="Username" required>
          </div>
          <div class="row">
            <i class="fas fa-lock"></i>
            <input type="password"  name="pwd" placeholder="Password" required>
          </div>
          <div class="pass"><a href="forgotPassword.jsp">Forgot password?</a></div>
          <div class="row button">
            <input type="submit" value="Login">
          </div>
        </form>
      </div>
    </div>


</body>
</html>