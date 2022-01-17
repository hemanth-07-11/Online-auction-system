<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Account Page</title>
    <style>
        body {
            background-image: url('download.jpg');
            -webkit-font-smoothing: antialiased;
            background-attachment: fixed;
            -moz-osx-font-smoothing: grayscale;
            color: #43A047;
            font-family: "Open Sans", sans-serif;
        }

        a {
            text-decoration: none;
            color: #03C4EB;
            transition: 0.5s;
        }

        a:hover,
        a:active,
        a:focus {
            color: #03c5ec;
            outline: none;
            text-decoration: none;
        }

        p {
            padding: 0;
            margin: 0 0 30px 0;
        }

        h1 {
            font-size: 3rem;

        }

        h2,
        h3,
        h4,
        h5,
        h6 {
            font-family: "Raleway", sans-serif;
            font-weight: 400;
            margin: 0 0 20px 0;
            padding: 0;
            color: #fff;
        }

        #hero {
            display: table;
            width: 100%;
            height: 100vh;
        }

        @media (min-width: 1024px) {
            #hero {
                background-attachment: fixed;
            }
        }

        #hero .hero-container {
            background: rgba(0, 0, 0, 0.8);
            display: table-cell;
            margin: 0;
            padding: 0;
            text-align: center;
            vertical-align: middle;
        }

        #hero h1 {
            margin: 30px 0 10px 0;
            font-weight: 700;
            line-height: 48px;
            text-transform: uppercase;
            color: #fff;
        }

        @media (max-width: 768px) {
            #hero h1 {
                font-size: 28px;
                line-height: 36px;
            }
        }

        #hero h2 {
            color: #ccc;
            margin-bottom: 50px;
        }

        #hero h3 {
            color: #ccc;
        }

        #hero h2 span {
            color: #fff;
            transition: 0.3s;
            border-bottom: 2px solid #03C4EB;
        }

        @media (max-width: 768px) {
            #hero h2 {
                font-size: 24px;
                line-height: 26px;
                margin-bottom: 30px;
            }

            #hero h2 .rotating {
                display: block;
            }
        }

        #hero .rotating>.animated {
            display: inline-block;
        }

        #hero .actions a {
            font-family: "Raleway", sans-serif;
            text-transform: uppercase;
            font-weight: 500;
            font-size: 16px;
            letter-spacing: 1px;
            display: inline-block;
            padding: 8px 20px;
            border-radius: 2px;
            transition: 0.5s;
            margin: 10px;
        }

        #hero .btn-services {
            border: 2px solid #fff;
            color: #fff;
        }

        #hero .btn-services:hover {
            background: #9137d4;
            border: 2px solid #9137d4;
        }

        #header {
            background: #0d0d0d;
            transition: all 0.5s;
            z-index: 997;
            height: 70px;
        }

        input[type="text"]{
            width:35%;
            height:35px;
            border:2px solid #D3D3D3;;
            border-radius:0.3rem;
            font-size:inherit;
            background:none;
            color:white;
            padding:10px;
            outline:none;
        }
        input[type="text"]:{
            background: #adffff;
        }

    </style>
</head>

<body>
    <section id="hero">
        <div class="hero-container">
            <div data-aos="fade-in">
                <%
    	if ((session.getAttribute("user") == null)) {
	%>
                You are not logged in<br />
                <a href="login.jsp">Please Login</a>
                <%	} else {
	%>
                <h1> Hi <%=session.getAttribute("user")%>!</h1>
                <h2>Welcome to Better bidder Auction</h2>
                <div class="actions">
                    <a href='postauction.jsp' class="btn-services" onClick="postauction.jsp">Post an auction</a>
                    <a href='browse.jsp' class="btn-services" onClick="browse.jsp">Browse</a>
                    <a href='logout.jsp' class="btn-services" onClick="logout.jsp">Logout</a>
                </div>
            </div>
            <h1></h1>
            <form method="post" action="queriespage.jsp">
                <h3>Browse Questions</h3>
                <input type="text" name="command">

                <br>
            </form>
            <h1></h1>
            <form method="post">
                <h3>Add Questions</h3>
                <input type="text" name="command">

                <br>
            </form>
        </div>
    </section>

    <%
         ApplicationDB db = new ApplicationDB();
		 Connection con = db.getConnection();
         String entity = request.getParameter("command");
         String str = "insert into questions (question,answer) values ('" + entity + "', 'No answer')";
         System.out.println(str);
         con.createStatement().executeUpdate(str);

         %>
    <br>

    <br>

    Notifications:

    <%
	    }
	%>

    <%
try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
				Class.forName("com.mysql.jdbc.Driver");
				Statement stmt = con.createStatement();
				ResultSet result, rs2, rs3, rs4;
				String email = (String)session.getAttribute("email"); System.out.println(email);
				String query = "SELECT * FROM notifications WHERE email = '" + email + "'";
				System.out.println(query);
			    result = con.createStatement().executeQuery(query);
			    // find the auctions that have ended
			    rs2 = con.createStatement().executeQuery("SELECT A.auctionID, A.valid, A.reserve "
			    		+ "FROM auction AS A "
			    		+ "WHERE A.endDate < curdate()");
			    // if there are auctions that have ended
			    String auctionID = "", valid = "", reserve = "", highestBid = "", currentEmail = "";
			    double highestBidNum = 0, reserveNum = 0;
			    if(rs2.isBeforeFirst()) {
			    	// go through every auction that has ended
			    	while(rs2.next()) {
			    		// get the auctionID, validity, and reserve of every auction that ended
				    	valid = rs2.getString("valid");
				    	auctionID = rs2.getString("auctionID");
				    	reserve = rs2.getString("reserve");
				    	if (valid.equals("0")) // if the auction has already ended skip to the next row
				    		continue;
				    	else {
				    		// otherwise set the validity to false
				    		con.createStatement().executeUpdate("UPDATE auction SET valid = 0 WHERE auctionID = " + auctionID);
			    			// get the highest bid on the auction that ended
						    rs3 = con.createStatement().executeQuery("SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN "
						    		+ " (SELECT bidID FROM bidFor WHERE itemID = " + auctionID + ")");
						    rs3.next();
						    if(rs3.getString("amount")!=null) {
						    	highestBid = rs3.getString("amount");
						    }
						    else {
						    	highestBid = "0";
						    }
						    // check if the highest bid is higher than the reserve
						    highestBidNum = Double.parseDouble(highestBid);
						    reserveNum = Double.parseDouble(reserve);
						    if (reserveNum > highestBidNum) { // if the reserve is higher (strictly?) than the last bid none is the winner.
						    	; // do nothing except set valid to false (already done)
						    }
						    else {
						    	// alert the winner (whoever placed the highest bid) that they won
						    	// get the email of whoever placed the highest bid on this item
						    	rs4 = con.createStatement().executeQuery("SELECT BU.email, B.amount, B.bidID, BU.itemID, BU.auctionID "
						    			+ "FROM buyer AS BU "
						    			+ "INNER JOIN "
						    			+ "bidFor AS BF "
						    			+ "ON BU.auctionID = BF.auctionID "
						    			+ "INNER JOIN "
						    			+ "bid AS B "
						    			+ "ON BF.bidID = B.bidID "
						    			+ "WHERE BU.auctionID = `" + auctionID + "` AND B.amount = `" + highestBid + "`");
						    	rs4.next();
						    	currentEmail = rs4.getString("email");
						    	// create the notification
						    	con.createStatement().executeUpdate("INSERT INTO notification(email, itemID, notification_text)"
							    		+ "VALUES('" + currentEmail + "', "
							    		+ "'" + auctionID + "', "
							    		+ "'Your have won an auction for auctionID: " + auctionID + "'");
						    }
				    	}

			    	}
			    }
			    // if there are no auctions that have ended
			    else {
			    	; // do nothing
			    }


	    %>

    <table>
        <tr>
            <td>ItemID~~~~~</td>
            <td>Notification text:</td>
            <td>



            </td>
            <td>



            </td>

        </tr>
        <%
        			//parse out the results
        			while (result.next()) { %>
        <tr>
            <td><%= result.getString("itemID")%></td>
            <td><%= result.getString("notification_text")%></td>
            <td>
                <a href="viewAuction.jsp?itemID=<%=result.getString("itemID")%>">View this auction</a>
            </td>

        </tr>


        <% }
        			%>
    </table>
    <br>
    <table>



        </tr>
        <%
			//parse out the results
			while (result.next()) { %>
        <tr>
            <td><%= result.getString("itemID")%></td>
            <td><%= result.getString("notification_text")%></td>
            <td>
                <a href="viewauction.jsp?itemID=<%=result.getString("itemID")%>">View this auction</a>
            </td>

        </tr>


        <% }
			//close the connection.
			db.closeConnection(con);
			%>
    </table>
    <%
	    con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>some problem");
	}
%>

</body>
</html>
