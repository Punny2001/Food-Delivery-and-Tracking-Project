DROP DATABASE IF EXISTS DBDKinRaiDee;
CREATE DATABASE DBDKinRaiDee;
USE DBDKinRaiDee;

CREATE TABLE Branch 
(
	BranchID		VARCHAR(4)		NOT NULL	PRIMARY	KEY,
	Branch_name		VARCHAR(255)	NOT NULL,
	Branch_phoneno	VARCHAR(10)		NOT NULL,
	Branch_address	VARCHAR(255)	NOT NULL,
	ManagerID		VARCHAR(5)		
);

CREATE TABLE Staff 
(
	Staff_ID			VARCHAR(5)		NOT NULL	PRIMARY KEY,
	Staff_fname			VARCHAR(255)	NOT NULL,
	Staff_lname			VARCHAR(255)	NOT NULL,
	Staff_gender		CHAR(1)			NOT NULL,
	Staff_position		VARCHAR(255)	NOT NULL,
	Staff_CitizenID		VARCHAR(13)		UNIQUE		NOT NULL,
	Staff_startDate		DATE			NOT NULL,
	Staff_address		VARCHAR(255)	NOT NULL,
	Staff_DoB			DATE			NOT NULL,
	Staff_Email			VARCHAR(255)	NOT NULL,
	BranchID			VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES Branch(BranchID)
);

ALTER TABLE	Branch
ADD CONSTRAINT ManagerID FOREIGN KEY (ManagerID) REFERENCES Staff(Staff_ID);

CREATE TABLE Customer
(
	Customer_ID				VARCHAR(4)		NOT NULL	PRIMARY KEY,
	Customer_fname			VARCHAR(255)	NOT NULL,
	Customer_lname			VARCHAR(255)	NOT NULL,
	Customer_Email			VARCHAR(255)	NOT NULL,
	Customer_telno			VARCHAR(10)		NOT NULL,
	Customer_password		VARCHAR(255)	NOT NULL,
	Customer_DoB			DATE			NOT NULL,
	Customer_gender			CHAR(1)			NOT NULL,
	Customer_address		VARCHAR(255)	--Delivery address
);

CREATE TABLE Restaurant
(
	Restaurant_ID				VARCHAR(4)		NOT NULL	PRIMARY KEY,
	Restaurant_name				VARCHAR(255)	NOT NULL,
	Restaurant_description		VARCHAR(500)	NOT NULL,
	Restaurant_address			VARCHAR(255)	NOT NULL,
	Restaurant_telno			VARCHAR(10)		NOT NULL,
	Restaurant_email			VARCHAR(255)	NOT NULL,
	Owner_Citizen_ID			VARCHAR(13)		UNIQUE		NOT NULL,
	Restaurant_status			VARCHAR(255)	NOT NULL,
	Restaurant_OpenHR			TIME			NOT NULL,
	Restaurant_CloseHR			TIME			NOT NULL,
	Restaurant_type				VARCHAR(255)	NOT NULL,
	Vat_certification			VARCHAR(255),
	Company_certification		VARCHAR(255)
);

CREATE TABLE Category
(
	Category_ID		VARCHAR(5)		NOT NULL	PRIMARY KEY,
	Category_name	VARCHAR(255)	NOT NULL
);

CREATE TABLE Menu
(
	Menu_ID			VARCHAR(5)		NOT NULL	PRIMARY KEY,
	Menu_name		VARCHAR(255)	NOT NULL,
	Menu_price		INT				NOT NULL,
	Menu_detail		VARCHAR(255)	NOT NULL,
	Restaurant_ID	VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES Restaurant(Restaurant_ID),
	Category_ID		VARCHAR(5)		NOT NULL	FOREIGN KEY REFERENCES Category(Category_ID)
);

CREATE TABLE Rider
(
	Rider_ID			VARCHAR(5)		NOT NULL	PRIMARY KEY,
	Rider_fname			VARCHAR(255)	NOT NULL,
	Rider_lname			VARCHAR(255)	NOT NULL,
	Rider_Citizen_ID	VARCHAR(13)		UNIQUE		NOT NULL,
	Rider_telno			VARCHAR(10)		NOT NULL,
	Rider_email			VARCHAR(255)	NOT NULL,
	Rider_gender		VARCHAR(255)	NOT NULL,
	Rider_address		VARCHAR(255)	NOT NULL,
	Rider_License_ID	VARCHAR(255)	UNIQUE		NOT NULL,
	Rider_DoB			DATE			NOT NULL,
	Rider_RegDate		DATE			NOT NULL,	/*Registration Date*/
	Rider_License_plate	VARCHAR(10)		NOT NULL
);

CREATE TABLE Orders
(
	OrderID					VARCHAR(5)		NOT NULL	PRIMARY KEY,
	Total_price				INT				NOT NULL,
	Order_datetime			DATETIME		NOT NULL,
	Order_status			VARCHAR(255)	NOT NULL,
	Restaurant_address		VARCHAR(255)	NOT NULL,
	Customer_address		VARCHAR(255)	NOT NULL,
	Restaurant_ID			VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES Restaurant(Restaurant_ID),
	CustomerID				VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES Customer(Customer_ID),
	Rider_ID				VARCHAR(5)		NOT NULL	FOREIGN KEY REFERENCES Rider(Rider_ID)
);

CREATE TABLE Order_Detail
(
	OrderID			VARCHAR(5)		NOT NULL	FOREIGN KEY REFERENCES orders(OrderID),
	Detail_ID		VARCHAR(5)		UNIQUE		NOT NULL,
	Quantity		INT				NOT NULL,
	Price			INT				NOT NULL
	PRIMARY KEY (OrderID, Detail_ID)
);

CREATE TABLE Detail_Menu
(
	Detail_ID			VARCHAR(5)		NOT NULL	FOREIGN KEY REFERENCES Order_Detail(Detail_ID),
	Menu_ID				VARCHAR(5)		NOT NULL	FOREIGN KEY REFERENCES Menu(Menu_ID),
	Adding_DateTime		DATETIME		NOT NULL,
	PRIMARY KEY (Detail_ID, Menu_ID, Adding_DateTime)
);

CREATE TABLE Payment
(
	Payment_ID			VARCHAR(4)		NOT NULL	PRIMARY KEY,
	Payment_method		VARCHAR(255)	NOT NULL,
	Payment_status		VARCHAR(255)	NOT NULL,
	Amount				INT				NOT NULL,
	Payment_datetime	DATETIME		NOT NULL,
	OrderID				VARCHAR(5)		NOT NULL	FOREIGN KEY REFERENCES Orders(OrderID),
	Customer_ID			VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES Customer(Customer_ID)
);

CREATE TABLE Menu_Search
(
	Customer_ID			VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES Customer(Customer_ID),
	Menu_ID				VARCHAR(5)		NOT NULL	FOREIGN KEY REFERENCES Menu(Menu_ID),
	Search_DateTime		DATETIME		NOT NULL,
	Keyword				VARCHAR(255),	
	PRIMARY KEY (Customer_ID, Menu_ID, Search_DateTime)
);

CREATE TABLE Restaurant_Search
(
	Customer_ID			VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES Customer(Customer_ID),
	Restaurant_ID		VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES Restaurant(Restaurant_ID),
	Search_DateTime		DATETIME		NOT NULL,
	Keyword				VARCHAR(255),	
	PRIMARY KEY (Customer_ID, Restaurant_ID, Search_DateTime)
);

CREATE TABLE Delivery
(
	Delivery_NO				VARCHAR(5)		NOT NULL	PRIMARY KEY,
	Rider_License_plate		VARCHAR(10)		NOT NULL,
	Delivery_DateTime		DATETIME		NOT NULL,
	Rider_phoneno			VARCHAR(10)		NOT NULL,
	Destination_address		VARCHAR(255)	NOT NULL,
	Delivery_status			VARCHAR(10)		NOT NULL,
	OrderID					VARCHAR(5)		NOT NULL	FOREIGN KEY REFERENCES Orders(OrderID),
	Customer_ID				VARCHAR(4)		NOT NULL	FOREIGN KEY REFERENCES Customer(Customer_ID),
	Rider_ID				VARCHAR(5)		NOT NULL	FOREIGN KEY REFERENCES Rider(Rider_ID)
);