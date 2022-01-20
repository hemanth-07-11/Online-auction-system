<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Item Types</title>
    <link rel="icon" href="logo.jpeg" type="image/icon type">


    <%
	session.setAttribute("reserve", request.getParameter("reserve") );
	session.setAttribute("closeDate", request.getParameter("closeDate") );
	session.setAttribute("closeTime", request.getParameter("closeTime") );
	session.setAttribute("am_or_pm", request.getParameter("am_or_pm") );
	String itmtype = request.getParameter("itmtype");
	%>

    <%
	if (itmtype.equals("Cpu")){
		response.sendRedirect("postcpu.jsp");
	}
	else if (itmtype.equals("Mobile")){
		response.sendRedirect("postmob.jsp");
	}
	else if (itmtype.equals("Laptop")){
		response.sendRedirect("postlap.jsp");
	}
	%>
</head>

<body>
</body>

</html>