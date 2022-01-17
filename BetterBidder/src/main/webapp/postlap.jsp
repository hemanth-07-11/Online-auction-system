<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Create Your Laptop Auction</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        body {
            font-family: "Roboto", sans-serif;
            background-image: url('download.jpg');
            background-attachment: fixed;
            height: 710px;


        }

        h2 {
            color: white;
            margin-left: 41%;
        }

        form {
            margin-top: 60px;
            margin-left: 40%;
            border: 3px solid white;
            border-radius: 5px;
            width: 20%;
            height: 480px;
            padding: 30px 30px;
            background-color: white;
        }

        h3 {
            color: #982bd2;
            font-weight: bold;
        }

        #bt1 {

            border: 1px solid #081285;
            font: 17px;
            padding: 8px 8px 8px 8px;
            border-radius: 2px;
            margin-bottom: 0.5rem;
        }

        #bt2 {

            border: 1px solid #081285;
            font: 17px;
            padding: 8px 8px 8px 8px;
            border-radius: 2px;
            width: 270px;
            margin-bottom: 0.5rem;
        }

        #bt3 {
            border: none;
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

<body style="background-color:bisque;">\

    <h2> Create Your Laptop Auction !</h2>
    <form method="post" action="laptopauc.jsp">
        <h3>Model/Laptop Name:</h3>

        <input id="bt2" type="text" name="name">
        <br>
        <h3>Storage ( GB ) </h3>

        <input id="bt2" type="text" name="storage">
        <br>
        <h3>RAM (GB) </h3>

        <input id="bt2" type="text" name="ram">
        <br>
        <h3>Type of Laptop:</h3>
        <select id="bt1" name="laptop_type" id="laptop_type">
            <option>i7core</option>
            <option>i9core</option>
            <option>i3core</option>
        </select>
        <br>
        <br>
        <br>
        <input id="bt3" type="submit" value="Create Your Laptop Auction!">
    </form>
</body>

</html>