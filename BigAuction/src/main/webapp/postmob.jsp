<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Your Mobile Auction</title>
<style>
body{
          background-color: #328f8a;
          background-image: linear-gradient(45deg,#328f8a,#08ac4b);
          height:710px;


}
h2{
color:white;
margin-left:42%;
}

form{
margin-top:70px;
margin-left:35%;
border: 3px solid white;
border-radius:10px;
width:30%;
height:470px;
padding:15px 15px;
background-color:white;
}
h3{
color:#328f8a;
font-weight:bold;
}
#bt2{

border:1px solid #328f8a;
font:17px;
padding:8px 8px 8px 8px;
border-radius:8px;
width:270px;
}
#bt1{

border:1px solid #328f8a;
font:17px;
padding:8px 8px 8px 8px;
border-radius:8px;
}
#bt3{
color:white;;
border:none;
font:17px;
padding:12px 8px 12px 8px;
border-radius:10px;
background-color:#328f8a;
}
#bt3:hover{
background-color:white;
color:#328f8a;
border:2px solid #328f8a;
border-radius:10px;
font:17px;
padding:12px 8px 12px 8px;
}
</style>
</head>
<body style="background-color:bisque;">
    <h2>Create Your Mobile Auction!</h2>
	<form method="post" action="mobileauc.jsp">
	<h3>Model/Mobile Name :</h3>
	<input id="bt2" type="text" name="name">
	<br>
	<h3>Top Speed (Ghz) :</h3>
	<input id="bt2" type="text" name="megapixels">
	<br>
	<h3>Width (inch) :</h3>
	<input id="bt2" type="text" name="ram">
	<h3>Type of Mobile:</h3>
	<select id="bt1" name = "mobile_type" id = "mobile_type" >
					<option>Battery saver</option>
					<option>Performance</option>
					<option>Value for Money</option>
	</select>
	<br><br>
	<input id="bt3" type="submit" value="Create Your Mobile Auction!">
	</form>
</body>
</html>