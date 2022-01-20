<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Query page</title>
    <link rel="icon" href="logo.jpeg" type="image/icon type">
    <style>
        body {
            @import url(https://fonts.googleapis.com/css?family=Roboto:300);
            background-image: url('download.jpg');
            margin-left: 3%;
            font-family: "Roboto", sans-serif;
            background-attachment: fixed;
        }

        table {
            position: absolute;
            left: 50%;
            top: 30rem;
            transform: translate(-50%, -50%);
            border-collapse: collapse;
            width: 800px;
            height: 200px;
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
            font-family: 'Roboto', sans-serif;
            content-align: center;
        }

        tr {
            transition: all .2s ease-in;
            cursor: pointer;
        }

        th,
        td {
            padding: 10px;
            text-align: center;
            background-color: #F2F2F2;
            border-bottom: 1px solid #ddd;
        }

        th {
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
    </style>
</head>

<body>

    <%
		List<String> list = new ArrayList<String>();
		try {

			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			String entity = request.getParameter("command");

			String str = "";

			if(entity.equals(""))
				str = "SELECT qID,question,answer FROM questions";
			else
				str = "Select qID,question,answer FROM questions WHERE question LIKE '%" + entity + "%'";

			ResultSet result = con.createStatement().executeQuery(str);

			out.print("<table >");
			out.print("<tr>");
			out.print("<th>");
			out.print("Q ID");
			out.print("</th>");

			out.print("<th>");
			out.print("Question");
			out.print("</th>");

			out.print("<th>");
			out.print("Answer");
			out.print("</th>");
			out.print("</tr>");

			while (result.next()) {
				out.print("<tr>");
				out.print("<td>");

				out.print(result.getString("qID"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("question"));
				out.print("</td>");

				out.print("<td>");
				out.print(result.getString("answer"));
				out.print("</td>");

				out.print("</tr>");
			}
			out.print("</table>");
			con.close();
		} catch (Exception e) {
		}
	%>
</body>

</html>