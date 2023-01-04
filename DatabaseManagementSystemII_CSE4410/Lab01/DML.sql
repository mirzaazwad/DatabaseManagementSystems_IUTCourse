--1--
SELECT FranchiseID,count(*) FROM CustomerFranchise GROUP BY FranchiseID;
--2--
SELECT Franchise.FranchiseName,RatingTable.MenuName,RatingTable.avgrating 
FROM Franchise,(SELECT FranchiseID,MenuName,avg(Rating)avgrating FROM CustomerFoodRating GROUP BY FranchiseID,Menu)RatingTable WHERE Franchise.FranchiseID=RatingTable.FranchiseID;

--3--
SELECT * FROM (SELECT MenuName,count(MenuName)MenuCount FROM CustomerFoodOrder GROUP BY MenuName ORDER BY MenuCount DESC) WHERE ROWNUM<=5;

--4--
SELECT Customer.CustomerName FROM Customer,
(SELECT CustomerCuisine.CustomerID,count(FranchiseMenu.FranchiseID) FROM CustomerCuisine,Menu,FranchiseMenu WHERE CustomerCuisine.Cuisine=Menu.Cuisine AND Menu.MenuName=FranchiseMenu.MenuName GROUP BY FranchiseMenu.FranchiseID,CustomerCuisine.CustomerID)Preference WHERE Preference.CustomerID=Customer.CustomerID;

--5--
SELECT Customer.CustomerName FROM (SELECT CustomerID FROM Customer minus SELECT CustomerID FROM CustomerFoodOrder)Ordered,Customer WHERE Customer.CustomerID=Ordered.CustomerID;
