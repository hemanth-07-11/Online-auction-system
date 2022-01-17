<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Search Results</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        body {
            background-image: url('download.jpg');
            margin-left: 3%;
            font-family: "Roboto", sans-serif;
            height: 710px;
        }


        #tbl {
            color: blue;
            text-decoration: none;
            font-weight: bold;
            padding: 0.1px;

        }



        #tb1 {
            width: 96%;
            text-align: center;
            padding: 0;
            border-collapse: collapse;
            height: 105px;
            text-decoration: none;
        }



        #tb2 {
            width: 36%;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            border: 2px solid white;
            border-collapse: collapse;
            height: 110px;
            margin-bottom: 20px;
        }

        #hd1 {
            background-color: #172fab;
            font-weight: bold;
            color: white;
            padding: 20px;
        }

        #hd1:hover {
            transform: scale(1.02);
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
        }

        #td1 {
            color: black;
            background-color: #F2F2F2;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
            padding: 2px;
        }

        #td1:hover {
            transform: scale(1.02);
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
        }

        .test {
            display: flex;

        }

        .bid {
            font-family: "Raleway", sans-serif;
            text-transform: uppercase;
            color: white;
            border: 2px solid white;
            font-weight: 500;
            font-size: 16px;
            text-decoration: none;
            letter-spacing: 1px;
            display: inline-block;
            padding: 8px 20px;
            transition: 0.5s;
            margin: 5rem 10rem;

        }

        .bid:hover {
            background: #03C4EB;
            border: 2px solid #03C4EB;
        }

        p {
            font-family: "Roboto", sans-serif;
            color: white;
            font-size: 200%;
            font-weight: bold;
            text-align: center;
            padding-bottom: 3px;
            padding-top: 3rem;
        }

        h4 {
            font-family: "Roboto", sans-serif;
            color: white;
            font-size: 100%;
            font-weight: bold;
            padding-bottom: 3px;
            border-bottom: 2px solid white;
            text-align: center;
        }

        h3 {
            color: white;
            font-weight: bold;
        }

        input[type=text] {
            width: 100%;
            align: center;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            float: left;
        }

        input[type=submit] {

            font-family: "Raleway", sans-serif;
            text-transform: uppercase;
            color: white;
            background-color: transparent;
            border: 2px solid white;
            font-weight: 500;
            font-size: 16px;
            text-decoration: none;
            letter-spacing: 1px;
            display: inline-block;
            padding: 8px 20px;

            transition: 0.5s;
            margin: 10px;

        }

        input[type=submit]:hover {
            background: #03C4EB;
            border: 2px solid #03C4EB;
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
		String v = request.getParameter("itemtypes");
		String att1, att2;
		if(v.equals("mobile")){att1 = "megapixels"; att2 = "ram";}
		else if(v.equals("laptop")) {att1 = "storage"; att2 = "ram";}
		else {att1 = "storage"; att2 = "ram";}
		String term = request.getParameter("searchTerm");
		if(term == null || term.equals("")) {response.sendRedirect("browse.jsp");}
		/*String sort = request.getParameter("sortBy");
		String query = "SELECT * FROM " + v + " AS v";
		query+= " INNER JOIN seller s ON v.itemID = s.itemID ";
		query+= " WHERE v.itemID IN (SELECT itemID FROM itemsSold WHERE auctionID IN";
		query+= " (SELECT auctionID FROM auction WHERE valid = true)) GROUP BY v.itemID ORDER BY " + sort;*/
		String query = "SELECT * FROM item AS i INNER JOIN " + v + " b ON i.itemID = b.itemID INNER JOIN seller s ON i.itemID = s.itemID INNER JOIN auction a ON i.itemID = a.auctionID";
		query+=" WHERE i.name = '" + term + "' OR " + v + "_type = '" + term + "' OR " + att1 + " = '" + term + "' OR " + att2 + " = '" + term + "'";
		System.out.println(query);
	    result = stmt.executeQuery(query);
	    %>
    <p>Behold the fine <%= v %>s on sale </p>
    <table id="tb1">
        <tr id="hd1">
            <td>Name</td>
            <td>Type</td>
            <td>

                <% if(v.equals("mobile"))
									out.write("Megapixels");
								else if(v.equals("laptop"))
									out.write("Storage");
								else
									out.write("Storage");%>

            </td>
            <td>

                <% if(v.equals("mobile"))
									out.write("Ram");
								else if(v.equals("laptop"))
									out.write("Ram");
								else
									out.write("Ram");%>

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
    <div class="test">
        <a href="browsefilter.jsp?itemtypes=<%=v%>" class="bid">Back to looking at <%=v %>s</a>
        <br><br>
        <a href="browse.jsp?sortBy=itemID" class="bid">Back to all auctions</a>
    </div>
    <div class="test">
        <form method="post" action="searchfilter.jsp">
            <table>
                <tr>
                    <td>
                        <input type="text" name="searchTerm">
                    </td>
                </tr>
            </table>
            <input type="submit" value="Search <%=v %>s!">
            <input name="itemtypes" type="hidden" value=<%=v %>>
        </form>
    </div>
    <br>

    <%
	    con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>Oops!! Sorry, there is some problem!");
	}
%>

</body>

</html>