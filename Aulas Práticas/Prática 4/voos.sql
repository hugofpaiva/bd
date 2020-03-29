CREATE SCHEMA voos;
GO

CREATE TABLE voos.Airport(
	Airport_code		INT		NOT NULL		PRIMARY KEY,
	City				VARCHAR(35)	,
	State				VARCHAR(35),
	Name				VARCHAR(35)
);

CREATE TABLE voos.Airplane_Type(
	Type__name			VARCHAR(30)		NOT NULL		PRIMARY KEY,
	Max_seats			SMALLINT,
	Company				VARCHAR(30)
);

CREATE TABLE voos.Airplane(
	Airplane_id			INT		NOT NULL		PRIMARY KEY,
	Total_no_of_seats	SMALLINT,
	Type_name_Airplane	VARCHAR(30)		REFERENCES voos.Airplane_Type(Type__name),
);

CREATE TABLE voos.Flight(
	Number				INT		NOT NULL		PRIMARY KEY,
	Airline				VARCHAR(30),
	Weekdays			TINYINT
);

CREATE TABLE voos.Fare(
	Code				INT		NOT NULL,
	Number_Flight		INT		NOT NULL		REFERENCES	voos.Flight(Number),
	Amount				DECIMAL(10,2),
	Restrictions		VARCHAR(50),
	PRIMARY KEY(Code, Number_Flight)
);

CREATE TABLE voos.Flight_Leg(
	Leg_no				INT		NOT NULL,
	Number_Flight		INT		REFERENCES voos.Flight(Number),
	Airport_code_arr		INT		NOT NULL REFERENCES voos.Airport(Airport_code),
	Airport_code_dep		INT		NOT NULL REFERENCES voos.Airport(Airport_code),
	Scheduled_arr_time	SMALLDATETIME		NOT NULL,
	Scheduled_dep_time	SMALLDATETIME		NOT NULL,
	PRIMARY KEY(Leg_no, Number_Flight)
);

CREATE TABLE voos.Leg_Instance(
	Date				SMALLDATETIME		NOT NULL,
	Leg_no				INT,
	Number_Flight		INT,
	Airport_code_arr		INT		NOT NULL REFERENCES voos.Airport(Airport_code),
	Airport_code_dep		INT		NOT NULL REFERENCES voos.Airport(Airport_code),
	Airplane_id			INT		REFERENCES voos.Airplane(Airplane_id),
	Dep_time			SMALLDATETIME,
	Arr_time			SMALLDATETIME,
	No_of_avail_seats	SMALLINT,
	PRIMARY KEY(Date, Leg_no, Number_Flight)
);

CREATE TABLE voos.Seats(
	Seat_no				INT		NOT NULL,
	date				SMALLDATETIME,
	Number_Flight		INT,
	Leg_no				INT,
	Customer_name		VARCHAR(35),
	Cphone				CHAR(9),
	PRIMARY KEY(Seat_no, date, Number_Flight, Leg_no),
	FOREIGN KEY (date,Leg_no,Number_Flight) REFERENCES voos.Leg_Instance(Date,Leg_no,Number_flight)

);

CREATE TABLE voos.Can_land(
	Airport_code	INT		REFERENCES	voos.Airport(Airport_code),
	Type_name_Airplane		VARCHAR(30)		REFERENCES voos.Airplane_Type(Type__name),
	PRIMARY KEY(Airport_code, Type_name_Airplane)
);

ALTER TABLE voos.Leg_Instance  ADD FOREIGN KEY (Leg_no, Number_Flight) REFERENCES voos.Flight_Leg(Leg_no, Number_Flight);




