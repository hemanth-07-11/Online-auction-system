<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Your Mobile Auction</title>
</head>
<body style="background-color:bisque;">
	<form method="post" action="mobileauc.jsp">

	
	<h1 style="font-size:40px"> Create Your Mobile Auction</h1>
	
	
	<br/><br/>
	Model/Mobile Name:<input type="text" name="name">
	<br/><br/>
	Top Speed (mph):<input type="text" name="megapixels">
	<br/><br/>
	Width (feet):<input type="text" name="ram">
	<br/><br/>
	Type of Mobile:
	<select name = "mobile_type" id = "mobile_type" >
					<option>Yacht</option>
					<option>Sailboat</option>
					<option>Caravel</option>
					
	</select>
	<br/><br/>
	
	<input type="submit" value="Create Your Mobile Auction!">
	
	</form>
</body>
</html>