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
        margin-left:3%;
            background-image: linear-gradient(45deg,#328f8a,#08ac4b);
height:710px;
}
h3{
color:white;
font-weight:bold;
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
padding:8px 6px 6px 8px;
border-radius:8px;
}
#st{
border-spacing:0.5rem;
}
#hd1{
background-color:white;
font-weight:bold;
}
#tbl{
color:white;
text-decoration:none;
font-weight:bold;
}

#tb{
width :96%;
text-align:center;

border:2px solid white;
padding:0;
border-collapse:collapse;
height:135px;
}
#td1{
color :white;
font-size:16px;
}
#lb1{
color:white;
padding:8px 4px 4px 8px;
border-radius:8px;
border:none;
}
#l1{
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
		String v = request.getParameter("vehicleCategory");
		String att1 = "", att2= "", att1Value= "", att2Value= "", name= "", type= "", endDate = "";
		if(v.equals("mobile")){att1 = "megapixels"; att2 = "ram";}
		else if(v.equals("laptop")) {att1 = "storage"; att2 = "ram";}
		else {att1 = "storage"; att2 = "ram";}
		String sort = request.getParameter("sortBy");
		String query = "SELECT * FROM " + v + " AS v";
		query+= " INNER JOIN seller s ON v.itemID = s.itemID INNER JOIN auction a ON v.itemID = a.auctionID ";
		query+= " WHERE v.itemID IN (SELECT itemID FROM itemsSold WHERE auctionID IN";
		query+= " (SELECT auctionID FROM auction WHERE valid = true)) ORDER BY " + sort;
		System.out.println(query);
	    result = stmt.executeQuery(query);
	    %>
	    <h3>Behold, the fine <%= v %>s on sale !</h3>
	    <table id="tb">
		<tr id="hd1">
			<td>Name</td>
			<td>Type</td>
			<td>

							<% if(v.equals("mobile"))
									out.write("Topspeed");
								else if(v.equals("laptop"))
									out.write("Wingspan");
								else
									out.write("Mileage");%>

			</td>
			<td>

							<% if(v.equals("mobile"))
									out.write("Width");
								else if(v.equals("laptop"))
									out.write("Capacity");
								else
									out.write("ram");%>

			</td>
			<td>ItemID</td>
			<td>Seller</td>
			<td>View Seller</td>
			<td>Current bid</td>
			<td>End date</td>
			<td>View Auction</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) {
				String itemID = result.getString("itemID");%>
				<tr id="td1">
					<td>

							<%= result.getString("name") %>

					</td>
					<td>

							<%= result.getString(v + "_type") %>

					</td>


					<td>

							<% if(v.equals("mobile"))
									out.write(result.getString("megapixels"));
								else if(v.equals("laptop"))
									out.write(result.getString("storage"));
								else
									out.write(result.getString("storage"));%>

					</td>
					<td>

							<% if(v.equals("mobile"))
									out.write(result.getString("ram"));
								else if(v.equals("laptop"))
									out.write(result.getString("ram"));
								else
									out.write(result.getString("ram"));%>

					</td>
					<td><%= result.getString("itemID")%></td>
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
			%>
		</table>
		<br>
		<form method="get" action="browsefilter.jsp">
					<select id="bt1" name="sortBy" size=1>
						<option value="name">Sort by name</option>
						<option value="itemID">Sort by itemID</option>
						<option value="endDate">Sort by end date</option>
						<%if(v.equals("mobile")) {%>
							<option value="megapixels">Sort by speed</option>
							<option value="ram">Sort by ram</option>
							<option value="mobile_type">Sort by mobile type</option>
						<%}if(v.equals("laptop")) {%>
							<option value="storage">Sort by storage</option>
							<option value="ram">Sort by ram</option>
							<option value="laptop_type">Sort by laptop type</option>
						<%}if(v.equals("assembled_cpu")) {%>
							<option value="storage">Sort by speed</option>
							<option value="ram">Sort by ram</option>
							<option value="assembled_cpu_type">Sort by assembled_cpu type</option><%} %>
					</select>&nbsp;
					<input id="bt1" type="submit" value="SORT!">
					<input id="bt1" name = "vehicleCategory" type = "hidden" value = <%=v %>>
		</form>

		<h3>You can search by: <%=v %> type, name, or any attribute value (just type in the number!)</h3>
		<form method="post" action="searchfilter.jsp">
			<table id="st">
				<tr>
				<td><input id="bt1" type="text" name="searchTerm"></td>
	            <td><input id="bt1" type="submit" value="Search!">
                    			<input id="bt1" name = "vehicleCategory" type = "hidden" value = <%=v %>></td>
				</tr>
			</table>

		</form>


		<h3>Set an alert: fill in fields that are specific to the item you want, leave others blank if any will do.</h3>

		<form method="post" action="alertpage.jsp">
			<table>
				<tr><td id="l1">Name :</td></tr>
				<tr><td><input id="lb1" type="text" name="name"></td></tr>
				<tr><td id="l1"><%=v %> Type :</td></tr>
				<tr><td><input id="lb1"  type="text" name= "type"></td></tr>
				<tr><td id="l1"><%=att1 %> :</td></tr>
				<tr><td><input id="lb1"  type="text" name="att1"></td></tr>
				<tr><td id="l1"><%=att2 %> :</td></tr>
				<tr><td><input id="lb1"  type="text" name="att2"></td></tr>
			</table><br>
			<input id="bt1" type="submit" value="Set Alert">
			<input name = "vehicleCategory" type = "hidden" value = <%=v %>>
		</form>
		<br><br>
		<a id="backbutton" href="browse.jsp?sortBy=itemID">Back to all auctions</a>
	    <% 
	    con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>some broblems teehee");
	}
%>








</body>
</html>