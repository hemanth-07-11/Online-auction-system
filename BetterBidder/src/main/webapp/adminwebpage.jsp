<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin Page</title>
    <link rel="icon" href="logo.jpeg" type="image/icon type">
</head>

<body>
    <style>
        body {
            background-image: url('bg2.jpg');
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

        #popUpYes {
            font-family: "Raleway", sans-serif;
            text-transform: uppercase;
            font-weight: 500;
            font-size: 16px;
            letter-spacing: 1px;
            display: inline-block;
            newline;
            padding: 8px 20px;
            border-radius: 2px;
            transition: 0.5s;
            margin: 10px;
            border: 2px solid #fff;
            background: transparent;
            color: white;

        }

        #popUpYes:hover {
            background: #031231;
            border: 2px solid white;
            color: white;
        }

        input[type="text"],
        input[type="password"] {
            width: 35%;
            height: 25px;
            border: 2px solid #D3D3D3;
            ;
            border-radius: 0.3rem;
            font-size: inherit;
            background: none;
            color: white;
            padding: 10px;
            outline: none;
        }

        input[type="text"]: {
            background: #adffff;
        }

        .radio {
        display: inline-flex;
        overflow:hidden;
        border-radius: 15px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.25);
        }

        .radio__input {
        display: none;
        }

        .radio__label {
        padding: 20px 20px;
        font-size: 20px;
        margin-left: 2rem;
        font-family: sans-serif;
        color: #ffffff;
        background: #182f58;
        cursor: pointer;
        transition: background 0.1s;
        }

        .radio__label:not(:last-of-type) {
        border-right :1px solid #001437;
        }

        .radio__input:checked + .radio__label {
        background: #001437;

        }

        input[type="password"]: {
            background: #adffff;
        }
    </style>
    <section id="hero">
        <div class="hero-container">
            <div data-aos="fade-in">
                <br><br><br>
                <h1> Hi <%=session.getAttribute("user")%>!</h1>
                <h2>New Customer Representative</h2>
                <form method="post" action="repcreation.jsp">

                    <h3> Email </h3>
                    <input type="text" name="email">
                    <br><br><br><br>
                    <h3>Username</h3>
                    <input type="text" name="username">
                    <br><br><br><br>
                    <h3>Password</h3>
                    <input type="password" name="password">
                    <br><br><br><br>
                    <input type="submit" id="popUpYes" value="Create Account">
                    <div class="actions">
                        <a href='logout.jsp' class="btn-services">Logout</a>
                    </div>
                </form>
                <br>
                <br><br><br><br><br>
                <h1>Generate Sales Report:</h1>
                <br><br><br><br><br>

<div class="radio">
                <form method="post" action="report.jsp">
                    <input class="radio__input" type="radio" name="command" value="item" id="myRadio1"/>
                    <label class="radio__label" for="myRadio1">Earnings per item </label>
                    <input class="radio__input" type="radio" name="command" value="type" id="myRadio2"/>
                    <label class="radio__label" for="myRadio2">Earnings per item type </label>
                    <input class="radio__input" type="radio" name="command" value="best selling items" id="myRadio3"/>
                    <label class="radio__label" for="myRadio3">Best Selling Items </label>
                    <input class="radio__input" type="radio" name="command" value="best buyer" id="myRadio4"/>
                    <label class="radio__label" for="myRadio4">Best Buyers </label>
                     <input type="submit" value="submit" id="popUpYes">
                </form>
            </div>
            <br><br><br><br><br>
        </div>
    </section>
    <br>
</body>

</html>