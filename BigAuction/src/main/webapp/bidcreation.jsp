<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BigAuction.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
	<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
font-family: "Roboto", sans-serif;
  background-image: url('download.jpg');
height:710px;
margin-left:4%;
}

#box{
width:40%;
background-color:white;
height: 200px;
border-radius: 20px;
text-align:center;
padding:10px;
margin-left:30%;
margin-top:80px;
}
h2{
color:#328f8a;
}
#bt3{
 border: 2px solid #fff;
  background-color:black;
 color:white;
padding: 16px;
font-size: 16px;
cursor: pointer;
text-decoration:none;
}
#bt3:hover{
background: #9137d4;
border: 2px solid #9137d4;

}
</style>
</head>
<body>

	<%
try {
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();


	Class.forName("com.mysql.jdbc.Driver");
	Statement stmt = con.createStatement();
	String string_email = (String) session.getAttribute("email");
	String itemID = request.getParameter("itemID");
	String string_amount = request.getParameter("bid");

	int amount = Integer.parseInt(string_amount);
	int int_itemID = Integer.parseInt(itemID);



	//insert into bid
	String insert_in_bid = "INSERT INTO bid(amount) VALUES(?)" ;
	PreparedStatement ps = con.prepareStatement(insert_in_bid);
	ps.setInt(1, amount);
	ps.executeUpdate();



	ResultSet rs = stmt.executeQuery("SELECT max(bidID) as amount FROM bid");
	rs.next();
	String string_bidID = rs.getString("amount");
	int bidID = Integer.parseInt(string_bidID);

	rs = stmt.executeQuery("SELECT auctionID as amount FROM auction WHERE auctionID =" + itemID );
	rs.next();
	String string_auctionID = rs.getString("amount");
	int auctionID = Integer.parseInt(string_auctionID);



	//insert into bidFor
	String insert_in_bidFor = "INSERT INTO bidFor(auctionID, bidID, itemID) VALUES(?,?,?)" ;
	ps = con.prepareStatement(insert_in_bidFor);
	ps.setInt(1, auctionID);
	ps.setInt(2, bidID);
	ps.setInt(3, int_itemID);
	ps.executeUpdate();



	//insert into hasBid
	String insert_in_hasBid = "INSERT INTO hasBid(email, bidID) VALUES(?,?)" ;
	ps = con.prepareStatement(insert_in_hasBid);
	ps.setString(1, string_email);
	ps.setInt(2, bidID);
	ps.executeUpdate();



	//insert into buyer
	String insert_in_buyer = "INSERT INTO buyer(auctionID, email, itemID) VALUES(?,?,?)" ;
	ps = con.prepareStatement(insert_in_buyer);
	ps.setInt(1, auctionID);
	ps.setString(2, string_email);
	ps.setInt(3, int_itemID);
	ps.executeUpdate();


  // show success message
  %>
   <div id="box">
  <h2> Your bid of $<%=string_amount%> was successfully placed on the item with itemID:<%=itemID%> </h2>
  <br>
  <a id="bt3" href="browse.jsp">View other Auctions</a>
      	</div>

  <%
  } catch (Exception ex) {
    %>
   <div id="box">
   <h2>  An error has occurred please try again. [<%=ex%>>] </h2>
     <br>
    <a id="bt3" href="success.jsp">Return to main page</a>
    <%
    }
  %>
</body>
</html>
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>