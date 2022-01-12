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
@import url(https://fonts.googleapis.com/css?family=Roboto:300);
body{
font-family: "Roboto", sans-serif;
  background-image: url('download.jpg');
    height:710px;


}

form{
margin-top:40px;
margin-left:40%;
border: 3px solid white;
border-radius:5px;
width:20%;
height:560px;
padding:30px 30px;
background-color:white;
}

h3{

color:#982bd2;
font-weight:bold;
}
h2{
color:white;
margin-left:41%;
}

#bt1{
border:1px solid #081285;
font:17px;
padding:8px 8px 8px 8px;
border-radius:2px;
margin-bottom:0.5rem;
}
#bt2{

border:none;
                  background: #473bcd;
                 color:white;
                padding: 16px;
                font-size: 16px;
                cursor: pointer;
                text-decoration:none;
                margin-top:1rem;

}
#bt2:hover{
          background: #67cbda;
          color:black;
}

</style>
</head>



<body>
<br>
  <h2>ENTER PRODUCT DETAILS !</h2>
	<form method="post" action="itemtype.jsp">
				<h3>Select product type: </h3>
				<select id="bt1" name = "itmtype" id = "itmtype" >
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