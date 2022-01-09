<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BigAuction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Auction</title>
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
		
		ResultSet result1;
		String v = "";
		String itemID = request.getParameter("itemID");
		String query1 = ("SELECT * FROM mobile WHERE itemID = " + itemID);
	    result1 = stmt.executeQuery(query1);
	    if(result1.next()==true){v = "mobile";}
	    else
	    {
		    String query2 = ("SELECT * FROM laptop WHERE itemID = " + itemID);
		    ResultSet result2;
		    result2 = stmt.executeQuery(query2);
		    if(result2.next()==true){v = "laptop";}
		    else
		    {
			    String query3 = ("SELECT * FROM assembled_cpu WHERE itemID = " + itemID);
			    ResultSet result3;
			    result3 = stmt.executeQuery(query3);
			    if(result3.next()==true){v = "assembled_cpu";}
		    }
	    }
	    String att1 = "", att2= "", att1Value= "", att2Value= "", name= "", type= "", endDate = "";
	    if(v.equals("mobile")){att1 = "megapixels"; att2 = "ram";}
		else if(v.equals("laptop")) {att1 = "storage"; att2 = "ram";}
		else {att1 = "storage"; att2 = "ram";}
	    ResultSet result;
	    result = stmt.executeQuery("SELECT * FROM " + v + " v INNER JOIN seller s ON v.itemID = s.itemID INNER JOIN auction a ON v.itemID = a.auctionID WHERE v.itemID = " + itemID);
	    %>
	    <table>
		<tr>   
			<td>Name~~~~~</td> 
			<td>Type~~~~~</td>
			<td>
						
							<% if(v.equals("mobile"))
									out.write("Topspeed~~~~~");
								else if(v.equals("laptop"))
									out.write("Wingspan~~~~~");
								else 
									out.write("Mileage~~~~~");%>
						
			</td>
			<td>
						
							<% if(v.equals("mobile"))
									out.write("Width~~~~~");
								else if(v.equals("laptop"))
									out.write("Capacity~~~~~");
								else 
									out.write("ram~~~~~");%>
						
			</td>
			<td>ItemID~~~~~</td> 
			<td>Seller~~~~~~~~~~~~~~~</td> 
			<td>View Seller~~~~~</td>
			<td>Current bid~~~~~</td>
			<td>End date~~~~~</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { 
				%>
				<tr>    
					<td>
						
							<%= result.getString("name") %>
							<% name = result.getString("name"); %>
							
						
					</td>
					<td>
						
							<%= result.getString(v + "_type") %>
							<% type = result.getString(v + "_type"); %>
						
					</td>
					
					
					<td>
						
							<% if(v.equals("mobile"))
							{
									out.write(result.getString("megapixels"));
									att1Value = result.getString("megapixels");
							}
								else if(v.equals("laptop"))
								{
									out.write(result.getString("storage"));
									att1Value = result.getString("storage");
								}
								else 
								{
									out.write(result.getString("storage"));
									att1Value = result.getString("storage");
									}%>
							
						
					</td>
					<td>
						
							<% if(v.equals("mobile"))
							{
									out.write(result.getString("ram"));
									att2Value = result.getString("ram");
							}
								else if(v.equals("laptop"))
								{
									out.write(result.getString("ram"));
									att2Value = result.getString("ram");
								}
								else 
								{
									out.write(result.getString("ram"));
									att2Value = result.getString("ram");
									}%>
						
					</td>
					<td><%= result.getString("itemID")%></td>
					<td><%= result.getString("email") %></td>
					<td>
							<a href="viewUser.jsp?email=<%=result.getString("email")%>">View this user</a>
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
						<td><%=result.getString("endDate") %><%endDate = result.getString("endDate"); %></td>
				</tr>
				

			<% }
			//close the connection.
			
			%>
		</table>
		<%
		ResultSet result5;
	    result5 = stmt.executeQuery("SELECT * FROM bidFOR bf INNER JOIN bid b ON bf.bidID = b.bidID INNER JOIN hasBid hb ON b.bidID = hb.bidID WHERE bf.itemID = " + itemID + " ORDER BY amount DESC");

	    
		

		%>
		<br>
		<a href="biddingpage.jsp?itemID=<%=itemID%>">BID ON THIS AUCTION!</a>
		<br>
		<br>
		Bid History
		<br>
		<table>
			<tr>
				<td>Bidder~~~~~~~~~~~~~~~~</td>
				<td>Amount~~~~~</td>
				<td>View Bidder~~~~~</td>
			</tr>
			<%
			//parse out the results
			while (result5.next()) { 
				%>
				<tr>    
					<td>
							<%= result5.getString("email") %>
					</td>
					<td>
							<%= result5.getString("amount") %>
					</td>
					<td>
							<a href="viewUser.jsp?email=<%=result5.getString("email")%>">View this user</a>
					</td>
					</tr>
				

			<% }
			
				    %>
		</table>
		<br>
		Similar auctions
		
		
		
		<%
		ResultSet result6;
		String query6 = "SELECT * FROM " + v + " v INNER JOIN auction a ON v.itemID = a.auctionID INNER JOIN seller s ON v.itemID = s.itemID WHERE v.itemID <> " + itemID + " AND (";
		query6 += v + "_type = '" + type + "' OR " + att1 + " = '" + att1Value + "' OR " + att2 + " = '" + att2Value + "')";
	    result6 = stmt.executeQuery(query6);
	    System.out.println(query6);
		
		
		%>
		<table>
		<tr>   
			<td>Name~~~~~</td> 
			<td>Type~~~~~</td>
			<td>
						
							<% if(v.equals("mobile"))
									out.write("Topspeed~~~~~");
								else if(v.equals("laptop"))
									out.write("Wingspan~~~~~");
								else 
									out.write("Mileage~~~~~");%>
						
			</td>
			<td>
						
							<% if(v.equals("mobile"))
									out.write("Width~~~~~");
								else if(v.equals("laptop"))
									out.write("Capacity~~~~~");
								else 
									out.write("ram~~~~~");%>
						
			</td>
			<td>ItemID~~~~~</td> 
			<td>Seller~~~~~~~~~~~~~~~</td> 
			<td>View Seller~~~~~</td>
			<td>Current bid~~~~~</td>
			<td>End date~~~~~</td>
			<td>View Auction</td>
		</tr>
			<%
			//parse out the results
			while (result6.next()) {
				String itemID2 = result6.getString("itemID");%>
				<tr>    
					<td>
						
							<%= result6.getString("name") %>
						
					</td>
					<td>
						
							<%= result6.getString(v + "_type") %>
						
					</td>
					
					
					<td>
						
							<% if(v.equals("mobile"))
									out.write(result6.getString("megapixels"));
								else if(v.equals("laptop"))
									out.write(result6.getString("storage"));
								else 
									out.write(result6.getString("storage"));%>
						
					</td>
					<td>
						
							<% if(v.equals("mobile"))
									out.write(result6.getString("ram"));
								else if(v.equals("laptop"))
									out.write(result6.getString("ram"));
								else 
									out.write(result6.getString("ram"));%>
						
					</td>
					<td><%= result6.getString("itemID")%></td>
					<td><%= result6.getString("email") %></td>
					<td>
							<a href="viewUser.jsp?email=<%=result6.getString("email")%>">View this user</a>
					</td>
						<td>
							<% 
								Statement stmt2 = con.createStatement();
								String query2 = "SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN ";
								query2+= " (SELECT bidID FROM bidFor WHERE itemID = " + itemID2 + ")";
								ResultSet result2 = stmt2.executeQuery(query2);
								result2.next();
								if(result2.getString("amount")!=null) out.write(result2.getString("amount"));
								else out.write("0");
							%>

						</td>
						<td><%= result6.getString("endDate") %></td>
						<td>
							<a href="viewauction.jsp?itemID=<%=itemID2%>">View this auction</a>
						</td>
				</tr>
				

			<% }
			//close the connection.
			db.closeConnection(con);
			%>
		</table>
		
	
		<br><br>
		<a href="browsefilter.jsp?vehicleCategory=<%=v%>">Back to looking at <%=v %>s</a>
		<br><br>
		<a href="browse.jsp?sortBy=itemID">Back to all auctions</a>
	    <% 
	    db.closeConnection(con);
	    con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>some broblems teehee");
	}
%>








</body>
</html>