# ELECTRONIC ITEMS - ONLINE AUCTION SYSTEM
<div align="justify">
The "Online auction system" project entails the creation of a free standalone JAVA program for online auctioning. The goal is to provide an online auction environment for the customers/bidders. Since everything has been switched to online mode during the pandemic COVID crisis, this project will be a benefit to individuals who need to buy products from auction but are unable to attend due to lockdowns. This project uses JSP as the main development tool for building, aided by JDBC connections for MySQL databases. The buyer's auctioneer's data and product data will all be saved in the database.
</div>

## Group Members 
- N HEMANTH 
- MITHESH A
- RUBAK PREYAN G

### Development tools
Java Servlets, JSP, Apache Tomcat, MySQL and JDBC Connections, IntelliJ for development & XAMPP Phpmyadmin for SQL commands
### Server
XAMPP – Localhost
### Database
The database component of the system is SQL Server. JDBC connections are used to communicate with the database. 

## Database Design 
The below diagram show the Entity relationships in a relational model view.

<div align="justify">
The database that has been designed has 18 tables. User table has information of all the registered users. The admin and rep table have user information that correspond to admin and customer representative respectively. The items table has information of all the listed items for auction, while the auction table has information of all the auctions that are open and also closed for bidding. The end date of auction and valid attributes together determine if the auction has ended or not. The bid and bidFor tables determine which auction is bid by which of registered users. The questions table has a list of all the questions and also the answers added by the customer representatives. 
<div>
   
## Main Features of the project
   

- Users can perform multiple actions – post an auction and browse all auctions. Admin has access to assign a new customer representative and also generate reports on request, based upon various criteria. The customer representative has access to the portal that allows answering all the customer queries. 
- For posting an auction, the user must firstly select the product type and specify the start and end date of the auction. Once the specified product type page is rendered, the user can specify the model name, storage, RAM specifications and other attributes of the electronic item. This would create the auction under the user profile where he is the seller. All the actions are recorded in the database.
- The browse option would allow the user to view the list of electronics available for auction along with the end date and current bid. The page also allows the user to sort the items based on type (mobile, laptop, CPU), name, ID and end date. The page redirects, allowing the user to view the auction for mobile, laptop, CPU separately and bid on the same. The customer has options to add queries relating to the product and also browse the previously answered questions relating to all products, based on a search filter
- On request, the system would also display products filtered based on type, where the logged in user can view the details of other users whose bidding history would be available. The logged in user can view a particular auction and view its history and also bid on the same. Once the bid amount has been entered, the system would check for various constraints, like if the user has already bid on the product, or if the user bids on his own product, and allow the user to bid on the item, only if few conditions have been satisfied
- The bidding history, the items bid by each user, are recorded in the database via the interface. The fetched data is displayed in the interface in various pages where tables are displayed as per user request in the search fields
- Any user logged in, can view the running auctions and also details of users who have bid on the particular auction. The view user page also renders the auction won by the user. This information about the winner of the auction of any item is accessible by all the logged in users. 
- Report Generation feature has been implemented which has sub modules. 
   - Earnings per item: Data is fetched by ordering the bid by value, confirming if the date has passed and finally displaying the results after performing inner join using the itemID from bidFor
   - Earning per itemtype: Data is fetched by selecting all items performing an inner join with itemtype on bidFor, and using item ID to calculate amount and returns the final amount.
   - Earning per end user: Data is fetched by grabbing the email from user table and matching the same to buyer, further fetching itemID from buyer, and matching to auction id to check end date and finally using itemID, matched from bidFor, the amount is ordered in ascending order and the result is displayed. 

## Conclusion





