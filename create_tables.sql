DROP DATABASE IF EXISTS online_reservation_travel_system;


CREATE DATABASE IF NOT EXISTS online_reservation_travel_system;

USE online_reservation_travel_system;

CREATE TABLE Airline (
    Id CHAR(2),
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE AdvPurchaseDiscount (
    AirlineID CHAR(2),
    Days INTEGER NOT NULL,
    DiscountRate NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (AirlineID, Days),
    FOREIGN KEY (AirlineID) REFERENCES Airline(Id),
    CHECK (Days > 0),
    CHECK (DiscountRate > 0 AND DiscountRate < 100)
);

CREATE TABLE Flight (
    AirlineID CHAR(2),
    FlightNo INTEGER NOT NULL,
    NoOfSeats INTEGER NOT NULL,
    DaysOperating CHAR(7) NOT NULL,
    MinLengthOfStay INTEGER NOT NULL,
    MaxLengthOfStay INTEGER NOT NULL,
    PRIMARY KEY (AirlineID, FlightNo),
    FOREIGN KEY (AirlineID) REFERENCES Airline(Id),
    CHECK (NoOfSeats > 0),
    CHECK (MinLengthOfStay >= 0),
    CHECK (MaxLengthOfStay > MinLengthOfStay)
);

CREATE TABLE Airport (
    Id CHAR(3),
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Leg (
    AirlineID CHAR(2),
    FlightNo INTEGER NOT NULL,
    LegNo INTEGER NOT NULL,
    DepAirportID CHAR(3) NOT NULL,
    ArrAirportID CHAR(3) NOT NULL,
    ArrTime DATETIME NOT NULL,
    DepTime DATETIME NOT NULL,
    PRIMARY KEY (AirlineID, FlightNo, LegNo),
    UNIQUE(AirlineID, FlightNo, DepAirportID),
    FOREIGN KEY (AirlineID, FlightNo) REFERENCES Flight(AirlineID, FlightNo),
    FOREIGN KEY (DepAirportID) REFERENCES Airport(Id),
    FOREIGN KEY (ArrAirportID) REFERENCES Airport(Id),
    CHECK (LegNo > 0)
);

CREATE TABLE Fare (
    AirlineID CHAR(2) NOT NULL,
    FlightNo INTEGER NOT NULL,
    FareType VARCHAR(20) NOT NULL,
    Class VARCHAR(20) NOT NULL,
    Fare NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (AirlineID, FlightNo, FareType, Class),
    FOREIGN KEY (AirlineID, FlightNo) REFERENCES Flight(AirlineID, FlightNo),
    CHECK (Fare > 0)
);

CREATE TABLE Person (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    ZipCode INTEGER NOT NULL,
    CHECK (ZipCode > 0)
);

CREATE TABLE Account (
    Id INTEGER PRIMARY KEY, 
    Email VARCHAR(50) NOT NULL,
    Pw VARCHAR(50) NOT NULL,
    FOREIGN KEY (Id) REFERENCES PERSON (Id)
);

CREATE TABLE Customer (
    Id INTEGER NOT NULL,
    AccountNo INTEGER,
    PhoneNo CHAR(16),
    Email VARCHAR(50),
    CreationDate DateTime NOT NULL,
    Rating INTEGER,
    PRIMARY KEY (AccountNo),
    FOREIGN KEY (Id) REFERENCES Person (Id),
    CHECK (Rating >= 0 AND Rating <= 10)
);

CREATE TABLE CustomerPreferences(
    AccountNo INTEGER NOT NULL,
    Preference VARCHAR(50) NOT NULL,
    PRIMARY KEY (AccountNo, Preference),
    FOREIGN KEY(AccountNo) REFERENCES Customer (AccountNo)
);

CREATE TABLE Employee (
    Id INTEGER NOT NULL,
    SSN VARCHAR(10) NOT NULL,
    IsManager BOOLEAN NOT NULL,
    StartDate DATE NOT NULL,
    Email VARCHAR(50) NOT NULL,
    HourlyRate NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (SSN),
    FOREIGN KEY (Id) REFERENCES Person (Id),
    UNIQUE (Id),
    CHECK (SSN > 0),
    CHECK (HourlyRate > 0)
);

CREATE TABLE Passenger (
    Id INTEGER,
    AccountNo INTEGER,
    PRIMARY KEY (Id, AccountNo),
    FOREIGN KEY (Id) REFERENCES Person(Id),
    FOREIGN KEY (AccountNo) REFERENCES Customer(AccountNo)
);

CREATE TABLE Reservation (
    ResrNo INTEGER AUTO_INCREMENT PRIMARY KEY,
    ResrDate DATETIME NOT NULL,
    BookingFee NUMERIC(10,2) NOT NULL,
    TotalFare NUMERIC(10,2) NOT NULL,
    RepSSN VARCHAR(10),
    AccountNo INTEGER NOT NULL,
    FOREIGN KEY (RepSSN) REFERENCES Employee (SSN),
    FOREIGN KEY (AccountNo) REFERENCES Customer (AccountNo),
    CHECK (BookingFee >= 0),
    CHECK ((TotalFare = 0 AND BookingFee = 0) OR TotalFare > BookingFee)
);

CREATE TABLE Includes (
    ResrNo INTEGER,
    AirlineID CHAR(2),
    FlightNo INTEGER,
    LegNo INTEGER,
    Date DATE NOT NULL,
    PRIMARY KEY (ResrNo, AirlineID, FlightNo, LegNo),
    FOREIGN KEY (ResrNo) REFERENCES Reservation (ResrNo),
    FOREIGN KEY (AirlineID, FlightNo, LegNo) REFERENCES Leg(AirlineID, FlightNo, LegNo)
);

CREATE TABLE ReservationPassenger (
    ResrNo INTEGER,
    PersonId INTEGER,
    AccountNo INTEGER,
    AirlineID CHAR(2),
    FlightNo INTEGER,
    SeatNo CHAR(5) NOT NULL,
    Class VARCHAR(20) NOT NULL,
    Meal VARCHAR(50),
    PRIMARY KEY (AirlineId, FlightNo, SeatNo),
    FOREIGN KEY (AirlineID) REFERENCES Airline (Id),
    FOREIGN KEY (AirlineID, FlightNo) REFERENCES Flight(AirlineID, FlightNo),
    FOREIGN KEY (ResrNo) REFERENCES Reservation (ResrNo),
    FOREIGN KEY (PersonId, AccountNo) REFERENCES Passenger (Id, AccountNo)
);

CREATE TABLE Auctions (
    AccountNo INTEGER,
    AirlineID CHAR(2),
    FlightNo INTEGER,
    Class VARCHAR(20),
    Date DATETIME,
    NYOP NUMERIC(10,2) NOT NULL,
    Accepted BOOLEAN NOT NULL,
    PRIMARY KEY (AccountNo, AirlineID, FlightNo, Class, Date),
    FOREIGN KEY (AccountNo) REFERENCES Customer(AccountNo),
    FOREIGN KEY (AirlineID, FlightNo) REFERENCES Flight(AirlineID, FlightNo),
    CHECK (NYOP > 0)
);