<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Query page</title>
    <style>
        body {
            @import url(https://fonts.googleapis.com/css?family=Roboto:300);
            background-image: url('download.jpg');
            margin-left: 3%;
            font-family: "Roboto", sans-serif;
            height: 710px;
        }

        table {
            width: 96%;
            background-color: white;
            text-align: center;
            padding: 20px;
            border-collapse: collapse;
            height: 250px;
        }

        tr {
            background-color: #172fab;
            font-weight: bold;
            color: white;
            padding: 20px;
        }

        tr:hover {
            transform: scale(1.02);
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
        }

        td {
            font-weight: 600;
            text-align: center;
            background-color: #172fab;
            color: #fff;
            padding: 25px 50px;
            font-family: 'Roboto', sans-serif;
        }
    </style>
</head>
<body>

    <%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			//Get the combobox from the index.jsp
			String entity = request.getParameter("command");

			String str = "";

			if(entity.equals(""))
				str = "SELECT qID,question,answer FROM questions";
			else
				str = "Select qID,question,answer FROM questions WHERE question LIKE '%" + entity + "%'";


			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			//Run the query against the database.
			ResultSet result = con.createStatement().executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table >");

			//make a row
			out.print("<tr>");

			out.print("<td>");
			//print out column header
			out.print("Q ID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Question");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Answer");
			out.print("</td>");
			//make a column

			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");

				out.print("<td>");
				//print out column header
				out.print(result.getString("qID"));
				out.print("</td>");

				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("question"));
				out.print("</td>");


				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("answer"));
				out.print("</td>");


				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>
