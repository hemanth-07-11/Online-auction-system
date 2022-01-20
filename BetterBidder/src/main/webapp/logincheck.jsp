<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login Check</title>
    <link rel="icon" href="logo.jpeg" type="image/icon type">
</head>

<body>
    <%
	try {

		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		Class.forName("com.mysql.jdbc.Driver");
		Statement stmt = con.createStatement();
		ResultSet rs;
		ResultSet admin;
		ResultSet rep;
	    rs = stmt.executeQuery("select * from users where username='" + username + "' and password='" + password + "'");

	    if (rs.isBeforeFirst()) {
	    	admin = con.createStatement().executeQuery("select * from users where email in (select * from admin) and username='" + username + "' and password='" + password + "'");
			rep = con.createStatement().executeQuery("select * from users where email in (select * from rep) and username='" + username + "' and password='" + password + "'");
			if(rep.isBeforeFirst()){
		    	session.setAttribute("user", username);
		        out.println("welcome " + username);
		        out.println("<a href='logout.jsp'>Log out</a>");
		        response.sendRedirect("repscreen.jsp");
		    }
			else if(admin.isBeforeFirst()){
		    	session.setAttribute("user", username);
		        out.println("welcome " + username);
		        out.println("<a href='logout.jsp'>Log out</a>");
		        response.sendRedirect("adminwebpage.jsp");
		    }
			else{
				rs = stmt.executeQuery("select email as amount from users where username='" + username + "' and password='" + password + "'");
	            rs.next();
	            email = rs.getString("amount");
	            session.setAttribute("user", username);
	            session.setAttribute("email", email);
	            session.setAttribute("password", password);
	            out.println("welcome " + username);
	            out.println("<a href='logout.jsp'>Log out</a>");
	            response.sendRedirect("success.jsp");
			}
		}

		else
		 {
	    	%>
    Invalid Password
    <br>
    <a href='login.jsp'>try again</a>
    <input type="submit" value="Try Again" href="login.jsp">
    <%
	    }
		con.close();
	} catch (Exception ex)
	 {
		out.print(ex);
		out.print("<br>login failed");
	}
%>
</body>

</html>