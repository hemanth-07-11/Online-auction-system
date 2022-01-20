<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Create Your Mobile Auction</title>
    <link rel="icon" href="logo.jpeg" type="image/icon type">
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        body {
            font-family: "Roboto", sans-serif;
            background-image: url('download.jpg');
            background-attachment: fixed;
            height: 710px;
        }

        h2 {
            margin-top: 4rem;
            color: white;
            margin-left: 42%;
        }

        form {
            margin-top: 70px;
            margin-left: 40%;
            border: 3px solid white;
            border-radius: 5px;
            width: 20%;
            height: 470px;
            padding: 30px 30px;
            background-color: white;
        }

        h3 {
            color: #982bd2;
            font-weight: bold;
        }

        #bt2 {

            border: 1px solid #081285;
            font: 17px;
            padding: 8px 8px 8px 8px;
            border-radius: 2px;
            margin-bottom: 0.5rem;
            width: 270px;
        }

        #bt1 {

            border: 1px solid #081285;
            font: 17px;
            padding: 8px 8px 8px 8px;
            border-radius: 2px;
            margin-bottom: 0.5rem;
        }

        #bt3 {
            border: 2px solid #fff;
            background: #473bcd;
            color: white;
            padding: 16px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        #bt3:hover {
            background: #67cbda;
            color: black;
        }
    </style>
</head>

<body>
    <h2>Create Your Mobile Auction!</h2>
    <form method="post" action="mobileauc.jsp">
        <h3>Mobile Name :</h3>
        <input id="bt2" type="text" name="name">
        <br>
        <h3>Mega Pixels ( MP ):</h3>
        <input id="bt2" type="text" name="megapixels">
        <br>
        <h3>Ram </h3>
        <input id="bt2" type="text" name="ram">
        <h3>Mobile Type</h3>
        <select id="bt1" name="mobile_type" id="mobile_type">
            <option>Android</option>
            <option>Apple</option>
            <option>Oxygen</option>
        </select>
        <br><br>
        <input id="bt3" type="submit" value="Create Your Mobile Auction!">
    </form>
</body>

</html>