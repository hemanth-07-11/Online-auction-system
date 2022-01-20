<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Sales Report</title>
    <link rel="icon" href="logo.jpeg" type="image/icon type">
</head>

<body>
<h1>Report</h1>
    <h1><a href="#" onclick="javascript:window.print();">Generate report</a></h1>

    <style>
        body {
            background-image: url('download.jpg');
            background-attachment: fixed;
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        h1 {
            margin: 30px 0 10px 0;
            font-weight: 700;
            line-height: 0px;
            text-transform: uppercase;
            color: #fff;
            text-align: center;
            vertical-align: middle;
            margin-top: 70px;
        }

        table {
            position: absolute;
            left: 50%;
            top: 15rem;
            margin-top: 250px;
            transform: translate(-50%, -50%);
            border-collapse: collapse;
            width: 670px;
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
            padding: 15px;
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

    <%

		try {

			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			String entity = request.getParameter("command");

			if(entity.equals("item")){
				ResultSet itemIDs = con.createStatement().executeQuery("select DISTINCT itemID from bidFor where bidID IN(SELECT BF.bidID FROM bid AS B INNER JOIN bidFor AS BF ON B.bidID = BF.bidID INNER JOIN auction AS A ON BF.auctionID = A.auctionID WHERE A.endDate<='2023-01-30')");
				out.print("<table>");

				out.print("<tr>");
				out.print("<th >");
				out.print("Item ID");
				out.print("</th>");
				out.print("<th>");
				out.print("Price Paid");
				out.print("</th>");
				out.print("</tr>");

				String itemID = "";
				while(itemIDs.next()){
					itemID = itemIDs.getString("itemID");

					String query2 = "SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN ";
					query2+= " (SELECT bidID FROM bidFor WHERE itemID = " + itemID + ")";

					ResultSet amounts = con.createStatement().executeQuery(query2);
					amounts.next();

					out.print("<tr>");
					out.print("<td>");
					out.print(itemID);
					out.print("</td>");

					out.print("<td>");
					out.print(amounts.getString("amount"));
					out.print("</td>");

					out.print("</tr>");
				}
			out.print("</table>");
			}

			else if(entity.equals("type")){
				ResultSet itemIDs = con.createStatement().executeQuery("select itemID from bidFor where bidID IN(SELECT BF.bidID FROM bid AS B INNER JOIN bidFor AS BF ON B.bidID = BF.bidID INNER JOIN auction AS A ON BF.auctionID = A.auctionID WHERE A.endDate<='2023-01-30')");
				int size =0;
				if (itemIDs != null)
				{
					itemIDs.last();    // moves cursor to the last row
				  	size = itemIDs.getRow(); // get row id
				}
				itemIDs.beforeFirst();

				int laptop = 0;
				int mobile = 0;
				int assembled_cpu = 0;

				for(int i = 0;i<size;i++){
					itemIDs.next();
					String itemID = itemIDs.getString("itemID");

					String query = "SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN ";
					query+= " (SELECT bidID FROM bidFor WHERE itemID = " + itemID + ")";
					ResultSet amounts = con.createStatement().executeQuery(query);
					amounts.next();


					String v = "";
					String query1 = ("SELECT * FROM mobile WHERE itemID = " + itemID);
			        ResultSet result1 = con.createStatement().executeQuery(query1);
			        if(result1.next()==true){v = "mobile";}
			        else
			        {
			            String newQuery = ("SELECT * FROM laptop WHERE itemID = " + itemID + "");
			            ResultSet result2;
			            result2 = con.createStatement().executeQuery(newQuery);
			            if(result2.next()==true){v = "laptop";}
			            else
			            {
			                String query3 = ("SELECT * FROM assembled_cpu WHERE itemID = " + itemID);
			                ResultSet result3;
			                result3 = con.createStatement().executeQuery(query3);
			                if(result3.next()==true){v = "assembled_cpu";}
			            }
			        }

					if(v.equals("assembled_cpu"))
						assembled_cpu +=Integer.parseInt(amounts.getString("amount"));
					else if(v.equals("mobile"))
						mobile+=Integer.parseInt(amounts.getString("amount"));
					else if(v.equals("laptop"))
						laptop+=Integer.parseInt(amounts.getString("amount"));


				}
				out.print("<table>");

				out.print("<tr>");

				out.print("<th>");

				out.print("Type");
				out.print("</th>");
				out.print("<th>");
				out.print("Total Amount Spent");
				out.print("</th>");
				out.print("</tr>");

				out.print("<tr>");

				out.print("<td>");

				out.print("Mobile");
				out.print("</td>");

				out.print("<td>");
				out.print(mobile);
				out.print("</td>");
				out.print("</tr>");

				out.print("<tr>");

				out.print("<td>");
				out.print("Laptop");
				out.print("</td>");
				out.print("<td>");
				out.print(laptop);
				out.print("</td>");
				out.print("</tr>");

				out.print("<tr>");
				out.print("<td>");
				out.print("Cpu");
				out.print("</td>");

				out.print("<td>");
				out.print(assembled_cpu);
				out.print("</td>");
				out.print("</tr>");

				out.print("</table>");
			}

     		else if(entity.equals("user")){
				ResultSet emailBidIDs = con.createStatement().executeQuery("select email,bidID from hasBid where bidID IN(SELECT BF.bidID FROM bid AS B INNER JOIN bidFor AS BF ON B.bidID = BF.bidID INNER JOIN auction AS A ON BF.auctionID = A.auctionID WHERE A.endDate<='2023-01-30')");
				int size = 0;
				if (emailBidIDs != null)
				{
					emailBidIDs.last();
				  	size = emailBidIDs.getRow();
				}
				emailBidIDs.beforeFirst();

				ArrayList<String> emailsArr = new ArrayList<String>();
				ArrayList<Integer> amountArr = new ArrayList<Integer>();
     			for(int i = 0;i<size;i++){
					emailBidIDs.next();
					String currentBidID = emailBidIDs.getString("bidID");
					ResultSet itemID = con.createStatement().executeQuery("select itemID from bidFor where bidID = " + currentBidID + "");
					itemID.next();
					String itemIDNum = itemID.getString("itemID");
					String query2 = "SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN (SELECT bidID FROM bidFor WHERE itemID = " + itemIDNum + ")";
					ResultSet amounts = con.createStatement().executeQuery(query2);
					amounts.next();
					String price = amounts.getString("amount");

					ResultSet temp = con.createStatement().executeQuery("Select bidID FROM bid where amount = " + price + " and bidID IN (SELECT bidID FROM bidFor WHERE itemID = " + itemIDNum + ")");
					temp.next();

					if(temp.getString("bidID").equals(currentBidID)== false){
						continue;
					}

					emailsArr.add((emailBidIDs.getString("email")));
					amountArr.add(Integer.parseInt(amounts.getString("amount")));
				}

				ArrayList<String> alreadyDone = new ArrayList<String>();
				for(int i =0;i<emailsArr.size();i++){
					if(alreadyDone.indexOf(emailsArr.get(i))==-1){
						alreadyDone.add(emailsArr.get(i));
					}
					else{

						int store = alreadyDone.indexOf(emailsArr.get(i));
						int temp = amountArr.get(i);
						amountArr.set(store,temp+amountArr.get(store));
						amountArr.remove(i);
						emailsArr.remove(i);
						i--;
					}
				}
				out.print("<table>");

				out.print("<tr>");
				out.print("<th>");
				out.print("Email");
				out.print("</th>");

				out.print("<th>");
				out.print("Amount Spent");
				out.print("</th>");
				out.print("</tr>");

				int counter = 0;
				while(counter<emailsArr.size()) {

					out.print("<tr>");
					out.print("<td>");
					out.print(emailsArr.get(counter));
					out.print("</td>");
					out.print("<td>");
					out.print(amountArr.get(counter));
					out.print("</td>");
					out.print("</tr>");
					counter++;
				}
				out.print("</table>");
			}

			else if(entity.equals("best selling items")){
				ResultSet itemIDs = con.createStatement().executeQuery("select DISTINCT itemID from bidFor where bidID IN(SELECT BF.bidID FROM bid AS B INNER JOIN bidFor AS BF ON B.bidID = BF.bidID INNER JOIN auction AS A ON BF.auctionID = A.auctionID WHERE A.endDate<='2023-01-30')");
				int size =0;
				if (itemIDs != null)
				{
					itemIDs.last();
				  	size = itemIDs.getRow();
				}
				itemIDs.beforeFirst();
				String[] itemArr = new String[size];
				String[] priceArr = new String[size];
				for(int i = 0;i<size;i++){
					itemIDs.next();
					String itemID = itemIDs.getString("itemID");

					String query2 = "SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN ";
					query2+= " (SELECT bidID FROM bidFor WHERE itemID = " + itemID + ")";
					ResultSet amounts = con.createStatement().executeQuery(query2);
					amounts.next();

					itemArr[i] = itemID;
					priceArr[i] = amounts.getString("amount");
				}
				int[] newItemArr = new int[size];
				int[] newPriceArr = new int[size];
				for(int a=0;a<size;a++){
					newItemArr[a] = Integer.parseInt(itemArr[a]);
					newPriceArr[a] = Integer.parseInt(priceArr[a]);
				}

		        for (int i = 0; i < size-1; i++){
		            for (int j = 0; j < size-i-1; j++){
		                if (newPriceArr[j] > newPriceArr[j+1]){
		                    int temp1 = newPriceArr[j];
		                    int temp2 = newItemArr[j];
		                    newPriceArr[j] = newPriceArr[j+1];
		                    newPriceArr[j+1] = temp1;
		                    newItemArr[j] = newItemArr[j+1];
		                    newItemArr[j+1] = temp2;
		                }
		            }

		        }
				out.print("<table>");

				out.print("<tr>");
				out.print("<th>");

				out.print("Item ID");
				out.print("</th>");

				out.print("<th>");
				out.print("Price Paid");
				out.print("</th>");
				out.print("</tr>");

				int counter = 0;
				while(counter<5||counter<newItemArr.length) {

					out.print("<tr>");
					out.print("<td>");
					out.print(newItemArr[counter]);
					out.print("</td>");
					out.print("<td>");
					out.print(newPriceArr[counter]);
					out.print("</td>");
					out.print("</tr>");
					counter++;
				}
				out.print("</table>");
			}

			else if(entity.equals("best buyer")){

				ResultSet emailBidIDs = con.createStatement().executeQuery("select email,bidID from hasBid where bidID IN(SELECT BF.bidID FROM bid AS B INNER JOIN bidFor AS BF ON B.bidID = BF.bidID INNER JOIN auction AS A ON BF.auctionID = A.auctionID WHERE A.endDate<='2023-01-30')");
				int size = 0;
				if (emailBidIDs != null)
				{
					emailBidIDs.last();    // moves cursor to the last row
				  	size = emailBidIDs.getRow(); // get row id
				}
				emailBidIDs.beforeFirst();

				ArrayList<String> emailsArr = new ArrayList<String>();
				ArrayList<Integer> amountArr = new ArrayList<Integer>();


				for(int i = 0;i<size;i++){
					emailBidIDs.next();
					String currentBidID = emailBidIDs.getString("bidID");
					ResultSet itemID = con.createStatement().executeQuery("select itemID from bidFor where bidID = " + currentBidID + "");
					itemID.next();
					String itemIDNum = itemID.getString("itemID");

     				String query2 = "SELECT MAX(AMOUNT) AS amount FROM bid WHERE bidID IN (SELECT bidID FROM bidFor WHERE itemID = " + itemIDNum + ")";
					ResultSet amounts = con.createStatement().executeQuery(query2);
					amounts.next();
					String price = amounts.getString("amount");

					ResultSet temp = con.createStatement().executeQuery("Select bidID FROM bid where amount = " + price + " and bidID IN (SELECT bidID FROM bidFor WHERE itemID = " + itemIDNum + ")");
					temp.next();

					if(temp.getString("bidID").equals(currentBidID)== false){
						continue;
					}
					emailsArr.add((emailBidIDs.getString("email")));
					amountArr.add(Integer.parseInt(amounts.getString("amount")));
				}

				ArrayList<String> alreadyDone = new ArrayList<String>();

				for(int i =0;i<emailsArr.size();i++){
					if(alreadyDone.indexOf(emailsArr.get(i))==-1){
						alreadyDone.add(emailsArr.get(i));
					}
					else{

						int store = alreadyDone.indexOf(emailsArr.get(i));
						int temp = amountArr.get(i);
						amountArr.set(store,temp+amountArr.get(store));
						//System.out.println(amountArr.get(store));
						amountArr.remove(i);
						emailsArr.remove(i);
						i--;
					}
				}
				String[] storeEmails = new String[emailsArr.size()];
				int[] holdAmounts = new int[amountArr.size()];
				for(int i =0;i<emailsArr.size();i++){
					storeEmails[i] = emailsArr.get(i);
					holdAmounts[i] = amountArr.get(i);
				}
     			int n = storeEmails.length;
		        for (int i = 0; i < n-1; i++)
		            for (int j = 0; j < n-i-1; j++)
		                if (holdAmounts[j] < holdAmounts[j+1])
		                {
		                    int temp1 = holdAmounts[j];
		                    String temp2 = storeEmails[j];
		                    holdAmounts[j] = holdAmounts[j+1];
		                    holdAmounts[j+1] = temp1;
		                    storeEmails[j] = storeEmails[j+1];
		                    storeEmails[j+1] = temp2;
		                }

				out.print("<table>");

				out.print("<tr>");
				out.print("<th>");
				out.print("Email");
				out.print("</th>");
				out.print("<th>");
				out.print("Amount Spent");
				out.print("</th>");
				out.print("</tr>");

				int counter = 0;
				while(counter<5||counter<storeEmails.length) {
					out.print("<tr>");
					out.print("<td>");
					out.print(storeEmails[counter]);
					out.print("</td>");
					out.print("<td>");
					out.print(holdAmounts[counter]);
					out.print("</td>");
					out.print("</tr>");
					counter++;
				}
				out.print("</table>");
			}
			con.close();
		} catch (Exception e) {
		}
	%>
</body>

</html>