<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BigAuction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse!</title>
<style>
body{
          background-color: #328f8a;
          text-align:center;
            background-image: linear-gradient(45deg,#328f8a,#08ac4b);
height:710px;
}
.glow{
  color: black;
    text-shadow:
      0 0 5px #fff,
      0 0 10px #fff,
      0 0 20px #fff,
      0 0 40px #0ff,
      0 0 80px #0ff,
      0 0 90px #0ff,
      0 0 100px #0ff,
      0 0 150px #0ff;
    text-align:center;
}

table{

width : 80%;
height : 400px;
text-align:center;
margin-left:10%;
border-spacing:1.5rem 1rem;
}
td{
test-align:center;
color:white;
font-size:15px;
}
#header{
background-color:white;
margin-right:10px;
font-size :18px;
color:black;
padding:8px 8px;
font-weight:bold;
border-radius:10px;
}

#tbl{
text-decoration:none;
color:white;
font-weight:bold;
}
#tbl.hover{
border:2px white;
}
#backbutton{
font: 15px;
  text-decoration: none;
  background-color: #EEEEEE;
  color: #333333;
  padding: 10px 10px 10px 10px;

  width:200px;
  height:50px;
  border-radius:15px;
}

#backbutton:hover{
color: #328f8a;

}

#bt1{

border:none;
font:17px;
padding:8px 8px 8px 8px;
border-radius:8px;
}

#nt{
color:white;
}

</style>
</head>
<body>

<% 
try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		//Create a SQL statement
		Class.forName("com.mysql.jdbc.Driver");
		Statement stmt = con.createStatement();
		ResultSet result;
		String sort = request.getParameter("sortBy");
		if(sort==null || sort.equals("itemID")) sort = "v.itemID";
		String query = "SELECT * FROM item AS v";
		query+= " INNER JOIN seller s ON v.itemID = s.itemID INNER JOIN auction a ON v.itemID = a.auctionID";
		query+= " WHERE v.itemID IN (SELECT itemID FROM itemsSold WHERE auctionID IN";
		query+= " (SELECT auctionID FROM auction WHERE valid = true)) ORDER BY " + sort;
		System.out.println(query);
	    result = stmt.executeQuery(query);
	    %>
	    <h3 class="glow">BEHOLD: the fine wares and goodes on sale</h3>
	    <table>
		<tr>
			<td id="header">Name</td>
			<td id="header">ItemID</td>
			<td id="header">Seller</td>
			<td id="header">View Seller</td>
			<td id="header">Price</td>
			<td id="header">End date</td>
			<td id="header">View Auction</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { 
				String itemID = result.getString("itemID");%>
				<tr >
					<td><%= result.getString("name") %></td>
					<td><%= result.getString("itemID") %></td>
					<td><%= result.getString("email") %></td>
					<td>
							<a id="tbl" href="viewUser.jsp?email=<%=result.getString("email")%>">View this user</a>
					</td>
					<td>
							<% 
								Statement stmt2 = con.createStatement();
								String query2 = "SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN ";
								query2+= " (SELECT bidID FROM bidFor WHERE itemID = " + itemID + ")";
								ResultSet result2 = stmt2.executeQuery(query2);
								result2.next();
								if(result2.getString("amount")!=null) out.write(result2.getString("amount"));
								else out.write("0");
							%>

						</td>
						<td><%= result.getString("endDate") %></td>
						<td>
							<a id="tbl" href="viewauction.jsp?itemID=<%=itemID%>">View this auction</a>
						</td>
				</tr>
				

			<% }
			//close the connection.
			db.closeConnection(con);
			con.close();
			
			%>
			</table>
<br><br>
				<form method="get" action="browsefilter.jsp">
					<select id="bt1" name="vehicleCategory" size=1>
						<option value="mobile">Show me mobiles!</option>
						<option value="assembled_cpu">Show me CPU!</option>
						<option value="laptop">Show me laptops!</option>
					</select>&nbsp; <input id="bt1" type="submit" value="GO!">
				</form>


			<br>
				
				<form method="get" action="browse.jsp">
					<select id="bt1" name="sortBy" size=1>
						<option value="name">Sort by name</option>
						<option value="itemID">Sort by itemID</option>
						<option value="endDate">Sort by end date</option>
					</select>&nbsp;&nbsp;&nbsp; <input id="bt1" type="submit" value="SORT!">
				</form>
				<br><br>
				<a id="backbutton" href="success.jsp">Back to main menu</a>
				
			
			
		
	    <% 
	    
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>some kinda problem");
	}
%>

</body>
</html>