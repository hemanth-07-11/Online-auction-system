<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Bid in auction</title>

    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        body {
            font-family: "Roboto", sans-serif;
            background-image: url('download.jpg');
            height: 710px;
            margin-left: 4%;
            color: white;
            padding: 75px;
            overflow: hidden;
        }

        form {
            width: 500px;
            height: 175px;
            text-align: center;
            border: 2px solid white;
            border-radius: 5px;
            padding: 10px 10px 10px 10px;

        }

        input[type=text] {
            width: 85%;
            align: center;
            padding: 1rem;
            margin: 0.5rem 3rem;
            box-sizing: border-box;

        }

        .btn {
            margin-top: 3rem;
            border: 2px solid #fff;
            background-color: transparent;
            color: white;
            padding: 16px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background: #9137d4;
            border: 2px solid #9137d4;
        }
    </style>
</head>

<body>

    <center>
        <h1 style="font-size:40px"> Bid in your auction</h1>
        <h2>
            <%
	String itemID = request.getParameter("itemID");

	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt2 = con.createStatement();
    String query2 = "SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN ";
    query2+= " (SELECT bidID FROM bidFor WHERE itemID = " + itemID + ")";
    ResultSet result2 = stmt2.executeQuery(query2);
    result2.next();
    if(result2.getString("amount")!=null) out.write("Highest current bid: " + result2.getString("amount"));
    else out.write("No bids yet. Be the first!");
    %>
        </h2>

    </center>
    <center>
        <form method="post" action="bidcreation.jsp?itemID=<%=itemID%>">
            <table>
                <tr>
                    <td>
                        <h2>Bid your amount</h2>
                    </td>
                    <td><input type="text" name="bid"></td>
                </tr>
            </table>
            <input class="btn" type="submit" value="Post Your Bid">
        </form>
        <br>

</body>

</html>