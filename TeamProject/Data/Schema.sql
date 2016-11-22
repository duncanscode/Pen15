DROP TABLE Account;
DROP TABLE Products;
DROP TABLE Ratings;
DROP TABLE POrder;
DROP TABLE Shipment;
DROP TABLE Warehouse;

CREATE TABLE Account (
	id			    VARCHAR(20)	    PRIMARY KEY,
	password		VARCHAR(20)		NOT NULL,
	street			VARCHAR(20)		NOT NULL,
	province		VARCHAR(20)		NOT NULL,
	country			VARCHAR(20)		NOT NULL,
	name			VARCHAR(30)		NOT NULL,
	email			VARCHAR(20),
	postalCode		VARCHAR(10)		NOT NULL
	);
	
CREATE TABLE Products (
	productID	INTEGER	PRIMARY KEY,
	name		VARCHAR(100),
	price		DECIMAL(6,2)	NOT NULL,
	description	VARCHAR(500),
	tag			VARCHAR(500)
	);
	
	CREATE TABLE Ratings (
	ratingsID	INTEGER		PRIMARY KEY,
	score		INTEGER		NOT NULL,
	comment		VARCHAR(100),
	date		DATE		NOT NULL,
	productID	INTEGER,
	accountID	VARCHAR(20),
	FOREIGN KEY (productID) REFERENCES Products (productID)
		ON DELETE CASCADE 
		ON UPDATE NO ACTION,
	FOREIGN KEY (accountID) REFERENCES Account (id)
		ON DELETE SET NULL
		ON UPDATE NO ACTION
		);
		
	
INSERT INTO Products VALUES (1,'Blue Supergel 2000',9.50,'Super soft smooth writing for everyday use. (Blue)','gel,soft,blue');

INSERT INTO Products VALUES (2,'Red Supergel 2000',9.50,'Super soft smooth writing for everyday use. (Red)','gel,soft,red');

INSERT INTO Products VALUES (3,'Hunters Camo Pen',10.25,'Every hunters dream. You can do your crossword while lining up your crosshairs.','camo,army,green');

INSERT INTO Products VALUES (4,'Refillable Lighter Pen',15.95,'Sometimes you just need a smoke, but that report isnt going to write itself. Now you can light up while you write up','lighter,black');

INSERT INTO Products VALUES (5,'Knife Pen 1000',21.00,'Trying to concentrate but your roommate just wont keep it down? With the knife pen 1000 you can put him down','red');


INSERT INTO Account VALUES ('Dustin','d','Rutland','BC','Canada','Dustin','Email','code');

INSERT INTO Ratings VALUES (2,5,'Great Pen if you need to stab something!!','2016/12/06',5,'Dustin');

