CREATE TABLE USERS (
	USERID	VARCHAR(20) PRIMARY KEY,
	PASSWD 	VARCHAR(15) NOT NULL
);

CREATE TABLE ITEMS (
	PID				INT AUTO_INCREMENT PRIMARY KEY,
	NAME			VARCHAR(30) NOT NULL,
	PRICE			FLOAT(8,2) UNSIGNED NOT NULL,
	QUANTITY		INT NOT NULL,
	POWER_CONSUMP	FLOAT(8,2),
	TYPE			VARCHAR(20),
	GENRE			VARCHAR(20),
	FLAG			CHAR(1) NOT NULL
);

CREATE TABLE ITEM_TAGS (
	PID		INT,
	TAGS	VARCHAR(20),
	PRIMARY KEY(PID, TAGS),
	FOREIGN KEY(PID) REFERENCES ITEMS(PID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IN_CART (
	USERID		VARCHAR(20),
	PID			INT,
	COUNT		INT NOT NULL,
	TOT_PRICE	FLOAT(8,2) UNSIGNED NOT NULL,
	PRIMARY KEY(USERID, PID),
	FOREIGN KEY(USERID) REFERENCES USERS(USERID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(PID) REFERENCES ITEMS(PID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE VENDORS (
	VID		INT PRIMARY KEY,
	VNAME	VARCHAR(20) NOT NULL
);

CREATE TABLE SUPPLY (
	PID		INT,
	VID		INT,
	PRIMARY KEY(PID, VID),
	FOREIGN KEY(PID) REFERENCES ITEMS(PID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(VID) REFERENCES VENDORS(VID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PERSONAL_INFORMATION (
	USERID	VARCHAR(20),
	FNAME	VARCHAR(20),
	LNAME	VARCHAR(20),
	PHONE	BIGINT(10),
	PRIMARY KEY(USERID, FNAME, LNAME),
	FOREIGN KEY(USERID) REFERENCES USERS(USERID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ADDRESS (
	USERID		VARCHAR(20),
	ADDRESS_NO 	INT NOT NULL,
	STREET		VARCHAR(20),
	CITY		VARCHAR(20),
	STATE		CHAR(2),
	ZIP			INT(5),
	PRIMARY KEY(USERID, STREET, CITY, STATE, ZIP),
	FOREIGN KEY(USERID) REFERENCES USERS(USERID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE BELONGS_TO (
	USERID	VARCHAR(20),
	FNAME	VARCHAR(20),
	LNAME	VARCHAR(20),
	PRIMARY KEY(USERID, FNAME, LNAME),
	FOREIGN KEY(USERID, FNAME, LNAME) REFERENCES PERSONAL_INFORMATION(USERID, FNAME, LNAME) ON DELETE CASCADE ON UPDATE CASCADE
);