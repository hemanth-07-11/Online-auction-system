<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View Auction</title>
    <link rel="icon" href="logo.jpeg" type="image/icon type">
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        body {
            font-family: "Roboto", sans-serif;
            background-image: url('download.jpg');
            background-attachment: fixed;
            height: 710px;
            margin-left: 4%;
        }

        #tbl {
            font-family: "Roboto", sans-serif;
            color: blue;
            text-decoration: none;
            font-weight: bold;
        }

        #tb1 {
            width: 96%;
            text-align: center;
            padding: 0;
            border-collapse: collapse;
            height: 105px;
        }

        #tb2 {
            width: 36%;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            border-collapse: collapse;
            height: 110px;
            margin-bottom: 20px;
        }

        #hd1 {
            background-color: #172fab;
            font-weight: bold;
            color: white;
        }

        #hd1:hover {
            transform: scale(1.02);
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
        }

        #td1 {
            color: black;
            background-color: #F2F2F2;
            font-size: 16px;
            border-bottom: 1px solid #ddd;
        }

        #td1:hover {
            transform: scale(1.02);
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
        }

        #bid {

            border: 2px solid #fff;
            background-color: transparent;
            color: white;
            padding: 16px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        #bid:hover {
            background: #9137d4;
            border: 2px solid #9137d4;
        }

        h3 {
            font-family: "Roboto", sans-serif;
            color: white;
            font-size: 3rem;
            font-weight: bold;
            text-align: center;
        }

        #backbutton {
            border: 2px solid #fff;
            background-color: transparent;
            color: white;
            padding: 16px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            display: table;
            left: 50%;
        }

        #backbutton:hover {
            background: #9137d4;
            border: 2px solid #9137d4;

        }

        .twobutt {
            display: flex;
            margin-left: 35rem;

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
    <h3>PRODUCT DETAILS</h3>
    <br>

    <table id="tb1">
        <tr id="hd1">
            <td>Name</td>
            <td>Type</td>
            <td>

                <% if(v.equals("mobile"))
									out.write("Megapixels");
								else if(v.equals("laptop"))
									out.write("Wingspan");
								else
									out.write("Mileage");%>

            </td>
            <td>

                <% if(v.equals("mobile"))
									out.write("Ram");
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
        </tr>
        <%

			while (result.next()) {
				%>
        <tr id="td1">
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
            <td><%=result.getString("endDate") %><%endDate = result.getString("endDate"); %></td>
        </tr>


        <% }


			%>
    </table>
    <%
		ResultSet result5;
	    result5 = stmt.executeQuery("SELECT * FROM bidFOR bf INNER JOIN bid b ON bf.bidID = b.bidID INNER JOIN hasBid hb ON b.bidID = hb.bidID WHERE bf.itemID = " + itemID + " ORDER BY amount DESC");

		%>
    <br>
    <br>
    <a id="bid" href="biddingpage.jsp?itemID=<%=itemID%>">BID ON THIS AUCTION!</a>
    <br>
    <br>
    <h3>BID HISTORY</h3>
    <br>
    <table id="tb2">
        <tr id="hd1">
            <td>Bidder</td>
            <td>Amount</td>
            <td>View Bidder</td>
        </tr>
        <%
			//parse out the results
			while (result5.next()) {
				%>
        <tr id="td1">
            <td>
                <%= result5.getString("email") %>
            </td>
            <td>
                <%= result5.getString("amount") %>
            </td>
            <td>
                <a id="tbl" href="viewUser.jsp?email=<%=result5.getString("email")%>">View this user</a>
            </td>
        </tr>

        <% }

				    %>
    </table>
    <br>

    <div class="twobutt">
        <a id="backbutton" href="browsefilter.jsp?itemtypes=<%=v%>">Back to looking at <%=v %>s</a>&nbsp;
        <a id="backbutton" href="browse.jsp?sortBy=itemID">Back to all auctions</a>
    </div>
    <%
	    db.closeConnection(con);
	    con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>Oops!! Sorry, there is some problem!");
	}
%>
</body>

</html>