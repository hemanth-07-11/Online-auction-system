<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Browse!</title>
    <style>
        body {
            @import url(https://fonts.googleapis.com/css?family=Roboto:300);
            background-image: url('download.jpg');
            margin-left: 3%;
            font-family: "Roboto", sans-serif;
            height: 710px;
        }

        h3 {
            color: white;
            font-weight: bold;
        }

        #backbutton {
            border: 2px solid #fff;
            background-color: transparent;
            color: white;
            padding: 16px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;

        }

        .search {
            float: right;
        }

        .browse {
            float: left;
        }

        #backbutton:hover {
            background: #9137d4;
            border: 2px solid #9137d4;

        }

        #bt2 {

            border: none;
            font: 25px;
            text-align: center;
            padding: 20px;
            border-radius: 8px;
        }

        #bt1 {
            border: 2px solid #fff;
            background-color: transparent;
            color: white;
            padding: 16px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        #bt1:hover {
            background: #9137d4;
            border: 2px solid #9137d4;
        }

        #st {
            border-spacing: 0.5rem;
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

        #tbl {
            color: blue;
            text-decoration: none;
            font-weight: bold;
            padding: 0.1px;
        }

        #tb {
            width: 96%;
            background-color: white;
            text-align: center;
            padding: 20px;
            border-collapse: collapse;
            height: 250px;
        }

        .dropbtn {
            border: 2px solid #fff;
            background-color: transparent;
            color: white;
            padding: 16px;
            font-size: 16px;
            cursor: pointer;
        }

        .dropbtn:hover {
            background: #9137d4;
            border: 2px solid #9137d4;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }


        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background: #9137d4;
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

        #lb1 {
            color: white;
            padding: 8px 4px 4px 8px;
            border-radius: 8px;
            border: none;
        }

        #l1 {
            color: white;
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
    <br><br>
    <br>
    <center>
        <h3>Better Bidder - The Premium <%= v %>s for Auction !!! </h3>
    </center>
    <br> <br>
    <table id="tb">
        <tr id="hd1">
            <td>NAME</td>
            <td>TYPE</td>
            <td>

                <% if(v.equals("mobile"))
									out.write("MEGAPIXELS");
								else if(v.equals("laptop"))
									out.write("STORAGE");
								else
									out.write("STORAGE");%>

            </td>
            <td>

                <% if(v.equals("mobile"))
									out.write("RAM");
								else if(v.equals("laptop"))
									out.write("RAM");
								else
									out.write("RAM");%>

            </td>
            <td>ITEMID</td>
            <td>SELLER</td>
            <td>VIEW SELLER</td>
            <td>CURRENT BID</td>
            <td>END DATE</td>
            <td>VIEW AUCTION</td>
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

    <div class="browse">
        <br>
        <form method="get" action="browsefilter.jsp">
            <div class="dropdown">
                <button class="dropbtn">Sort by</button>
                <div class="dropdown-content">

                    <%if(v.equals("mobile")) {%>
                    <a href="browsefilter.jsp?sortBy=name&itemtypes=mobile" value="name">Sort by name</a>
                    <a href="browsefilter.jsp?sortBy=endDate&itemtypes=mobile" value="endDate">Sort by end date</a>
                    <a href="browsefilter.jsp?sortBy=megapixels&itemtypes=mobile" value="megapixels">Sort by
                        megapixels</a>
                    <a href="browsefilter.jsp?sortBy=ram&itemtypes=mobile" value="ram">Sort by ram</a>
                    <a href="browsefilter.jsp?sortBy=mobile_type&itemtypes=mobile" value="mobile_type">Sort by mobile
                        type</a>
                    <%}if(v.equals("laptop")) {%>
                    <a href="browsefilter.jsp?sortBy=name&itemtypes=laptop" value="name">Sort by name</a>
                    <a href="browsefilter.jsp?sortBy=storage&itemtypes=laptop" value="storage">Sort by storage</a>
                    <a href="browsefilter.jsp?sortBy=endDate&itemtypes=laptop" value="endDate">Sort by end date</a>
                    <a href="browsefilter.jsp?sortBy=ram&itemtypes=laptop" value="ram">Sort by ram</a>
                    <a href=" browsefilter.jsp?sortBy=laptop_type&itemtypes=laptop" value="laptop_type">Sort by laptop
                        type</a>
                    <%}if(v.equals("assembled_cpu")) {%>
                    <a href="browsefilter.jsp?sortBy=name&itemtypes=assembled_cpu" value="name">Sort by name</a>
                    <a href="browsefilter.jsp?sortBy=endDate&itemtypes=assembled_cpu" value="endDate">Sort by end
                        date</a>
                    <a href="browsefilter.jsp?sortBy=storage&itemtypes=assembled_cpu" value="storage">Sort by
                        storage</a>
                    <a href="browsefilter.jsp?sortBy=ram&itemtypes=assembled_cpu" value="ram">Sort by ram</a>
                    <a href="browsefilter.jsp?sortBy=assembled_cpu_type&itemtypes=assembled_cpu"
                        value="assembled_cpu_type">Sort by assembled_cpu type</a><%} %>
                </div>
            </div>
        </form><br><br><br>
        <a id="backbutton" href="browse.jsp?sortBy=itemID">Back to all auctions</a>
    </div>
    <div class="search">
        <h3>Search by: <%=v %> name / type / any attribute &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h3><br>
        <form method="post" action="searchfilter.jsp">
            <table id="st">
                <tr>
                    <td><input id="bt2" type="text" name="searchTerm"></td>
                    <td><input id="bt1" type="submit" value="Search!">
                        <input id="bt1" name="itemtypes" type="hidden" value=<%=v %>></td>
                </tr>
            </table>

        </form>
    </div>

    <div class="back">
        <br><br>

    </div>
    <%
	    con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>Oops!! Sorry, there is some problem!");
}

%>
</body>

</html>