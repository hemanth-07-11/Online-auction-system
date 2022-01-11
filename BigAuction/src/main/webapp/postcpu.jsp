<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Your Cpu Auction</title>
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
<body>
	<h2> Create Your CPU Auction !</h2>
	<form method="post" action="assembledcpuauc.jsp">

	<h3>Model Name:</h3>
	<input id="bt2" type="text" name="name">
	<br>
	<h3>Processor speed :</h3>
	<input id="bt2" type="text" name="storage">
	<h3>RAM :</h3>
	<select id="bt1" name = "ram" id = "ram" >
					<option>8</option>
					<option>12</option>
					<option>16</option>
	</select>
	<h3>Type of Cpu:</h3>
	<select id="bt1" name = "assembled_cpu_type" id = "assembled_cpu_type" >
					<option>High performance</option>
					<option>Gaming</option>
					<option>Compact</option>
					<option>Office work</option>
					<option>Dual boot</option>
					<option>Auto cooling</option>
	</select>
	<br><br>
	<input id="bt3" type="submit" value="Create Your CPU Auction!">
	</form>
</body>
</html>