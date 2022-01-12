<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BigAuction.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse!</title>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>

body
{
        background-image: url('download.jpg');
        background-attachment:fixed;
          font-family: "Roboto", sans-serif;
          -webkit-font-smoothing: antialiased;
          -moz-osx-font-smoothing: grayscale;

}

h1{
     margin-top:5px;
     font-weight: 700;
     line-height: 0px;
     text-transform: uppercase;
     color: #fff;
     text-align: center;
     vertical-align: middle;
}

table {
    position: absolute;
    left: 50%;
    top: 45rem;
    transform: translate(-50%, -50%);
    border-collapse: collapse;
    width: 800px;
    height: 200px;
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
    font-family: 'Roboto', sans-serif;
}

tr {
    transition: all .2s ease-in;
    cursor: pointer;
}

th,
td {
    padding: 15px;
    text-align: left;
    background-color:#F2F2F2;
    border-bottom: 1px solid #ddd;
}

#header {
    background-color: #081285;
    color: #fff;
    font-family: 'Roboto', sans-serif;
}

.head {
    font-weight: 600;
    text-align: center;
    background-color: #172fab;
    color: #fff;
    padding: 25px 50px;
    font-family: 'Roboto', sans-serif;
}

tr:hover {
    background-color: #081285;
    transform: scale(1.02);
    box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
}

#tbl{
text-decoration:none;
color:blue;
font-weight:bold;
}

#tbl.hover{
border:2px white;
}

#backbutton{
font: 15px;
line-height: 6rem;
  text-decoration: none;
  border: 2px solid #fff;
  color: #fff;
  padding: 10px 10px 10px 10px;
  width:200px;
  height:50px;
  border-radius:10px;
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

@media only screen and (max-width: 768px) {
    table {
        width: 90%;
    }
}

.dropbtn {
   border: 2px solid #fff;
    background-color: transparent;
   color:white;
  padding: 16px;
  font-size: 16px;
  cursor: pointer;
  margin-top: 5rem;

}

.dropbtn2 {
   border: 2px solid #fff;
    background-color: transparent;
   color:white;
  padding: 16px;
  font-size: 16px;
  cursor: pointer;


}

.dropbtn:hover {
     background: #9137d4;
     border: 2px solid #9137d4;
}

.dropbtn2:hover {
     background: #9137d4;
     border: 2px solid #9137d4;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown2 {
  position: relative;
  display: inline-block;
  float:right;
  right:5rem;
}

.dropdown2-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown2-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}


.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown2-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown2:hover .dropdown2-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background: #9137d4;
}

.dropdown2:hover .dropbtn {
  background: #9137d4;
}

</style>
</head>
<body>
<a id="backbutton" href="success.jsp"><i class='fas fa-arrow-alt-circle-left'></i></a>
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
	    <h1>Auction</h1>
	    <table>
		<tr>
            <th class="head"><b>Name</b></th>
            <th class="head"><b>ItemID<b></th>
			<th class="head"><b>Seller<b></th>
			<th class="head"><b>View Seller<b></th>
			<th class="head"><b>Price<b></th>
			<th class="head"><b>End date<b></th>
			<th class="head"><b>View Auction<b></th>
		</tr>
			<%
			//parse out the results
			while (result.next()) { 
				String itemID = result.getString("itemID");%>
				<tr >

					<th><%= result.getString("name") %></th>
					<th><%= result.getString("itemID") %></th>
					<th><%= result.getString("email") %></th>
					<th>
							<a id="tbl" href="viewUser.jsp?email=<%=result.getString("email")%>">View this user</a>
					</th>
					<th>
							<% 
								Statement stmt2 = con.createStatement();
								String query2 = "SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN ";
								query2+= " (SELECT bidID FROM bidFor WHERE itemID = " + itemID + ")";
								ResultSet result2 = stmt2.executeQuery(query2);
								result2.next();
								if(result2.getString("amount")!=null) out.write(result2.getString("amount"));
								else out.write("0");
							%>

						</th>
						<th><%= result.getString("endDate") %></th>
						<th>
							<a id="tbl" href="viewauction.jsp?itemID=<%=itemID%>">View this auction</a>
						</th>
				</tr>
				

			<% }
			//close the connection.
			db.closeConnection(con);
			con.close();
			
			%>
			</table>

				<form method="get" action="browsefilter.jsp">
				<div class="dropdown">
				 <button class="dropbtn">Sort types</button>
                  <div class="dropdown-content">
                    <a href="browsefilter.jsp?itemtypes=mobile">Mobiles</a>
                    <a href="browsefilter.jsp?itemtypes=assembled_cpu">CPU</a>
                    <a href="browsefilter.jsp?itemtypes=laptop">Laptop</a>
                      </div>
                    </div>
				</form>


			<br>
				
				<form method="get" action="browse.jsp">
				<div class="dropdown2">
                <button class="dropbtn2">Sort by</button>
                <div class="dropdown2-content">
                <a href="browse.jsp?sortBy=name" value="name">Sort by name</a>
                <a href="browse.jsp?sortBy=itemID" value="itemID">Sort by itemID</a>
                <a href="browse.jsp?sortBy=endDate" value="endDate">Sort by end date</a>
                      </div>
                    </div>
				</form>
	    <% 
	    
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>some kinda problem");
	}
%>

</body>
</html>