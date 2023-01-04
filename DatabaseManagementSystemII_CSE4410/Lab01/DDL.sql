
drop table Location;
drop table FranchiseLocation;
drop table FranchiseLocationChef;
drop table ChefMenu;
drop table FranchiseMenu;
drop table CustomerFoodOrder;
drop table CustomerFranchise;
drop table CustomerFoodRating;
drop table CustomerCuisine;
drop table Customer;
drop table Chef;
drop table Franchise;
drop table Menu;

CREATE TABLE Franchise (
  FranchiseID varchar2(100),
  FranchiseName varchar2(100),
  CONSTRAINT pkFranchise PRIMARY KEY (FranchiseID)
);

CREATE TABLE Customer (
  CustomerID varchar2(100),
  CustomerName varchar2(200),
  CONSTRAINT pkCustomer PRIMARY KEY (CustomerID)
);

CREATE TABLE Location (
  LocationID varchar2(100),
  LocationDetails varchar2(200),
  CONSTRAINT pkLocation PRIMARY KEY (LocationID)
);

CREATE TABLE Chef (
  ChefID varchar2(100),
  ChefName varchar2(200),
  Cuisine varchar2(100),
  CONSTRAINT pkChef PRIMARY KEY (ChefID)
);

CREATE TABLE FranchiseLocationChef (
  LocationID varchar2(100),
  FranchiseID varchar2(100),
  ChefID varchar2(100),
  CONSTRAINT pkFranchiseLocationChef PRIMARY KEY (LocationID, FranchiseID),
  CONSTRAINT FKFranchiseLocationChefChefID
    FOREIGN KEY (ChefID)
      REFERENCES Chef(ChefID)
);

CREATE TABLE FranchiseLocation (
  LocationID varchar2(100),
  FranchiseID varchar2(100),
  CONSTRAINT pkFranchiseLocation PRIMARY KEY (LocationID),
  CONSTRAINT FKFranchiseLocationFranchiseID
    FOREIGN KEY (FranchiseID)
      REFERENCES Franchise(FranchiseID),
  CONSTRAINT FKFranchiseLocationLocationID
    FOREIGN KEY (LocationID)
      REFERENCES Location(LocationID),
  CONSTRAINT FKFranchiseLocationLocationID
    FOREIGN KEY (LocationID,FranchiseID)
      REFERENCES FranchiseLocationChef(LocationID,FranchiseID),
);

CREATE TABLE Menu (
  MenuName varchar2(100),
  Cuisine varchar2(100),
  MainIngredients varchar2(100),
  Price number,
  Calorie number,
  CONSTRAINT pkMenu PRIMARY KEY (MenuName)
);

CREATE TABLE ChefMenu (
  ChefID varchar2(100),
  MenuName varchar2(100),
  CONSTRAINT pkChefMenu PRIMARY KEY (ChefID, MenuName),
  CONSTRAINT FKChefMenuChefID
    FOREIGN KEY (ChefID)
      REFERENCES Chef(ChefID)
);

CREATE TABLE FranchiseMenu (
  FranchiseID varchar2(100),
  MenuName varchar2(100),
  CONSTRAINT pkFranchiseMenu PRIMARY KEY (FranchiseID, MenuName),
  CONSTRAINT FKFranchiseMenuFranchiseID
    FOREIGN KEY (FranchiseID)
      REFERENCES Franchise(FranchiseID),
  CONSTRAINT FKFranchiseMenuMenuName
    FOREIGN KEY (MenuName)
      REFERENCES Menu(MenuName)
);

CREATE TABLE CustomerFoodRating (
  CustomerID varchar2(100),
  MenuName varchar2(100),
  FranchiseID varchar2(100),
  Rating number,
  CONSTRAINT pkCustomerFoodRating PRIMARY KEY (MenuName, FranchiseID),
  CONSTRAINT FKCustomerFoodRatingCustomerID
    FOREIGN KEY (CustomerID)
      REFERENCES Customer(CustomerID),
  CONSTRAINT FKCustomerFoodRatingMenuName
    FOREIGN KEY (MenuName)
      REFERENCES FranchiseMenu(FranchiseID),
  CONSTRAINT FKFoodRatingFranchiseID
    FOREIGN KEY (FranchiseID)
      REFERENCES FranchiseMenu(MenuName)
);

CREATE TABLE CustomerCuisine (
  CustomerID varchar2(100),
  Cuisine varchar2(100),
  CONSTRAINT pkCustomerCuisine PRIMARY KEY (CustomerID, Cuisine),
  CONSTRAINT FKCustomerCuisineCustomerID
    FOREIGN KEY (CustomerID)
      REFERENCES Customer(CustomerID)
);

CREATE TABLE CustomerFoodOrder (
  OrderID varchar2(100),
  CustomerID varchar2(100),
  MenuName varchar2(100),
  FranchiseID varchar2(100),
  CONSTRAINT pkCustomerFoodOrder PRIMARY KEY (OrderID),
  CONSTRAINT FKCustomerFoodOrderCustomerID
    FOREIGN KEY (CustomerID)
      REFERENCES Customer(CustomerID),
  CONSTRAINT FKCustomerFoodOrderFranchiseID
    FOREIGN KEY (FranchiseID)
      REFERENCES FranchiseMenu(FranchiseID),
  CONSTRAINT FKCustomerFoodOrderMenuName
    FOREIGN KEY (MenuName)
      REFERENCES FranchiseMenu(MenuName)
);

CREATE TABLE CustomerFranchise (
  CustomerID varchar2(100),
  FranchiseID varchar2(100),
  PRIMARY KEY (CustomerID, FranchiseID)
);



