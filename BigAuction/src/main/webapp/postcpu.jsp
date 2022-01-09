<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Your Cpu Auction</title>
</head>
<body style="background-color:bisque;">
	<form method="post" action="assembledcpuauc.jsp">

	
	<h1 style="font-size:40px"> Create Your Cpu Auction</h1>
	
	
	<br/><br/>
	Model Name:<input type="text" name="name">
	<br/><br/>
	Mileage:<input type="text" name="storage">
	<br/><br/>
	Drive Train:
	<select name = "ram" id = "ram" >
					<option>All-wheel Drive</option>
					<option>Front-wheel Drive</option>
					<option>Rear-wheel Drive</option>
	</select>
	<br/><br/>
	Type of Cpu:
	<select name = "assembled_cpu_type" id = "assembled_cpu_type" >
					<option>Sedan</option>
					<option>Sports</option>
					<option>Compact</option>
					<option>SUV</option>
					<option>Van</option>
					<option>Truck</option>
	</select>
	<br/><br/>
	
	<input type="submit" value="Create Your Cpu Auction!">
	
	</form>
</body>
</html>