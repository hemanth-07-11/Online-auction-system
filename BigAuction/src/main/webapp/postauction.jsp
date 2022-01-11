<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>

<html>
<head>


<meta charset="UTF-8">
<title>Post An Auction</title>
<style>
body{
          background-color: #328f8a;
          background-image: linear-gradient(45deg,#328f8a,#08ac4b);
          height:710px;


}
#bt1{

border:none;
font:17px;
padding:12px 8px 12px 8px;
border-radius:8px;
}
#bt2{
color:white;;
border:none;
font:17px;
padding:12px 8px 12px 8px;
border-radius:10px;
background-color:#328f8a;
}
#bt2:hover{
background-color:white;
color:#328f8a;
border:2px solid #328f8a;
border-radius:10px;
font:17px;
padding:12px 8px 12px 8px;
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
h2{
color:white;
margin-left:41%;
}

#bt1{

border:1px solid #328f8a;
font:17px;
padding:8px 8px 8px 8px;
border-radius:8px;
}

</style>
</head>



<body>
<br>
  <h2>ENTER PRODUCT DETAILS !</h2>
	<form method="post" action="itemtype.jsp">
				<h3>Select product type: </h3>
				<select id="bt1" name = "vehicleType" id = "vehicleType" >
					<option>Cpu</option>
					<option>Laptop</option>
					<option>Mobile</option>
				</select>
				<h3>Set A Closing Date (yyyy-mm-dd):</h3><input id="bt1" type="text" name="closeDate" id = "closeDate">
				<table>
					<tr><td><h3>Time of Day (hh:mm):</h3><input id="bt1" type="text" id="closeTime" name="closeTime"></td></tr>
					<tr><td>
					<select id="bt1" name = "am_or_pm" id = "am_or_pm" >
						<option>AM</option>
						<option>PM</option>
					</select>
					</td></tr>

				</table>
				<h3>Set Reserve Price:</h3><input id="bt1" type="text" name="reserve" id = "reserve">
<br><br>
			<input id="bt2" type="submit" value="Continue">
		</form>
</body>
</html>