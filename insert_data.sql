USE online_reservation_travel_system;

INSERT INTO Airline (Id, Name) VALUES
('1', 'Air Berlin'),
('2', 'Air Japan'),
('3', 'Air Madagascar'),
('4', 'American Airlines'),
('5', 'Britiish Airways'),
('6', 'Delta Airlines'),
('7', 'JetBlue Airways'),
('8', 'Lufthansa'),
('9', 'SouthwestAirlines'),
('10', 'United Airlines');

INSERT INTO Flight (
    AirlineID,
    FlightNo,
    NoOfSeats,
    DaysOperating,
    MinLengthOfStay,
    MaxLengthOfStay
) VALUES 
('4', 1112, 100, 1010100, 0, 100),
('4', 111, 100, 1010100, 0, 100),
('4', 112, 100, 1010100, 0, 100),
('7', 111, 150, 1111111, 0, 100),
('7', 112, 150, 1111111, 0, 100),
('7', 113, 150, 1111111, 0, 100),
('3', 1336, 33, 1111111, 5, 100),
('3', 1337, 33, 0000011, 15, 100),
('3', 1338, 33, 1111111, 0, 100);

INSERT INTO AdvPurchaseDiscount (
    AirlineID,
    Days, 
    DiscountRate
) VALUES 
('4', 1, 10),
('4', 2, 15),
('4', 3, 20),
('4', 5, 30),
('4', 10, 70);

INSERT INTO Airport (
    Id, 
    Name,
    City,
    Country
) VALUES
('1', 'Berlin Tegel', 'Berlin', 'Germany'),
('2', 'Chicago O''Hare International', 'Chicago', 'Illinois'),
('3', 'Hartsfield-Jackson Atlanta Int', 'Atlanta', 'United States of America'),
('4', 'Ivato International', 'Antananarivo', 'Madagascar'),
('5', 'John F. Kennedy International', 'New York', 'United States of America'),
('6', 'LaGuardia', 'New York', 'United States of America'),
('7', 'Logan International', 'Boston', 'United States of America'),
('8', 'London Heathrow', 'London', 'United Kingdom'),
('9', 'Los Angeles International', 'Los Angeles', 'United States of America'),
('10', 'San Francisco International', 'San Francisco', 'United States of America'),
('11', 'Tokyo International', 'Tokyo', 'Japan');

INSERT INTO Leg (
    AirlineID,
    FlightNo,
    LegNo,
    DepAirportID,
    ArrAirportID,
    DepTime,
    ArrTime
) VALUES 
('4', 1112, 1, '6', '9', TIMESTAMP('2021-01-05', '11:00:00'), TIMESTAMP('2021-01-05', '17:00:00')),
('4', 1112, 2, '9', '11', TIMESTAMP('2031-01-05', '11:00:00'), TIMESTAMP('2031-01-05', '17:00:00')),
('4', 111, 1, '6', '9', TIMESTAMP('2011-01-05', '11:00:00'), TIMESTAMP('2011-01-05', '17:00:00')),
('4', 111, 2, '9', '11', TIMESTAMP('2011-01-05', '19:00:00'), TIMESTAMP('2011-01-06', '07:30:00')),
('4', 111, 3, '11', '10', TIMESTAMP('2011-01-06', '19:00:00'), TIMESTAMP('2011-01-07', '07:30:00')),
('4', 112, 1, '6', '11', TIMESTAMP('2011-01-07', '19:00:00'), TIMESTAMP('2011-01-07', '07:30:00')),
('7', 111, 1, '10', '7', TIMESTAMP('2011-01-10', '14:00:00'), TIMESTAMP('2011-01-10', '19:30:00')),
('7', 111, 2, '7', '8', TIMESTAMP('2011-01-10', '22:30:00'), TIMESTAMP('2011-01-11', '05:00:00')),
('3', 1336, 1, '5', '4', TIMESTAMP('2011-01-13', '07:00:00'), TIMESTAMP('2011-01-13', '23:00:00')),
('3', 1337, 1, '5', '4', TIMESTAMP('2011-01-13', '07:00:00'), TIMESTAMP('2011-01-13', '23:00:00')),
('3', 1338, 1, '4', '5', TIMESTAMP('2011-01-23', '07:00:00'), TIMESTAMP('2011-01-23', '23:00:00')),
('7', 112, 1, '4', '5', TIMESTAMP('2011-01-23', '07:00:00'), TIMESTAMP('2011-01-23', '23:00:00')),
('7', 113, 1, '4', '5', TIMESTAMP('2011-01-25', '07:00:00'), TIMESTAMP('2011-01-25', '23:00:00'));

INSERT INTO Fare (AirlineID, FlightNo, FareType, Class, Fare) VALUES
('4', 111, 'Full', 'Economy', 450.00),
('4', 111, 'Full', 'Business', 800.00),
('4', 111, 'Full', 'First', 1200.00),
('7', 111, 'Discount', 'Economy', 600.00),
('7', 111, 'Full', 'First', 1500.00),
('3', 1336, 'Full', 'Economy', 1100.00),
('3', 1337, 'Full', 'Economy', 1100.00),
('3', 1338, 'Full', 'Economy', 1100.00);

INSERT INTO Person (Id, FirstName, LastName, Address, City, State, ZipCode) VALUES
(107, 'Jane', 'Smith', '100 Nicolls Rd', 'Stony Brook', 'NY', 17790),
(108, 'John', 'Doe', '123 N Fake Street', 'New York', 'NY', 10001),
(109, 'Rick', 'Astley', '1337 Internet Lane', 'Los Angeles', 'CA', 90001),
(110, 'Linda', 'L', '124 Nicolls Rd', 'Stony Brook', 'NY', 17790),
(111, 'Eric', 'H', '120 Nicolls Rd', 'Stony Brook', 'NY', 17790),
(112, 'Dennis', 'K', '120 Nicolls Rd', 'Stony Brook', 'NY', 17790);

INSERT INTO Customer (Id, AccountNo, PhoneNo, Email, CreationDate, Rating) VALUES
(107, 1, '555-555-5555', 'awesomejane@ftw.com', NOW(), 10),
(108, 4, '123-123-1234', 'jdoe@woot.com', NOW(), 5),
(109, 3, '314-159-2653', 'rickroller@rolld.com', NOW(), 7),
(108, 2, '123-123-1235', 'customer@gmail.com', NOW(), 5);

INSERT INTO Employee (Id, SSN, IsManager, StartDate, Email, HourlyRate) VALUES 
(110, "111111111", 0, NOW(), 'employee@gmail.com', 15),
(111, "222222222", 1, NOW(), 'manager@gmail.com', 30),
(112, "333333333", 0, NOW(), 'employee2@gmail.com', 40);

INSERT INTO Account (Id, Email, Pw) VALUES
(110, 'employee@gmail.com', '123'),
(111, 'manager@gmail.com', '123'),
(109, 'customer@gmail.com', '123');

INSERT INTO Passenger (Id, AccountNo) VALUES
(107, 1),
(108, 2),
(109, 3);

INSERT INTO Reservation (
    ResrNo,
    ResrDate,
    BookingFee,
    TotalFare,
    RepSSN,
    AccountNo
) VALUES 
(222, NOW(), 45.46, 500.00, NULL, 1),
(111, NOW(), 109.09, 1200.00, NULL, 2),
(444, NOW(), 303.03, 3333.33, NULL, 2),
(333, NOW(), 303.03, 3333.33, NULL, 3);

INSERT INTO Includes (
    ResrNo,
    AirlineID,
    FlightNo,
    LegNo,
    Date
) VALUES
(444, '4', 1112, 2, TIMESTAMP('2031-01-05 19:00:00')),
(111, '4', 111, 1, TIMESTAMP('2011-01-05 11:00:00')),
(111, '4', 111, 2, TIMESTAMP('2011-01-05 19:00:00')),
(222, '7', 111, 1, TIMESTAMP('2011-01-14 22:30:00')),
(333, '3', 1337, 1, TIMESTAMP('2011-01-13 07:00:00')),
(333, '4', 111, 1, TIMESTAMP('2011-01-05 11:00:00'));


INSERT INTO ReservationPassenger (
    ResrNo,
    PersonId, 
    AccountNo,
    AirlineID,
    FlightNo,
    SeatNo,
    Class,
    Meal
) VALUES 
(111, 108, 2, '4', 111, '33F', 'Economy', 'Chips'),
(222, 107, 1, '7', 111, '13A', 'First', 'Fish and Chips'),
(333, 109, 3, '3', 1337, '1A', 'First', 'Sushi'),
(333, 109, 3, '4', 111, '33D', 'Economy', 'Chips');

INSERT INTO Auctions (AccountNo, AirlineID, FlightNo, Class, Date, NYOP)
VALUES (2, '4', 111, 'Economy', TIMESTAMP('2011-01-05', '11:00:00'), 400.00);
