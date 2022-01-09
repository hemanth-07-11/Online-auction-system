<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Your Laptop Auction</title>
</head>
<body style="background-color:bisque;">
	<form method="post" action="laptopauc.jsp">

	
	<h1 style="font-size:40px"> Create Your Laptop Auction</h1>
	
	
	<br/><br/>
	Model/Laptop Name:<input type="text" name="name">
	<br/><br/>
	Wing Span/Helicopter Length (feet):<input type="text" name="storage">
	<br/><br/>
	Capacity:<input type="text" name="ram">
	<br/><br/>
	Type of Laptop:
	<select name = "laptop_type" id = "laptop_type" >
					<option>Helicopter</option>
					<option>Luxury Jet</option>
					<option>Airliner</option>

	</select>
	<br/><br/>
	
	<input type="submit" value="Create Your Laptop Auction!">
	
	</form>
</body>
</html>