CREATE TABLE Passenger(
    passengerId INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    middleName VARCHAR(50),
    lastName VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    dateOfBirth DATE,
    email VARCHAR(100) UNIQUE,
    phoneNumber VARCHAR(15) UNIQUE,
    houseNo VARCHAR(20),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10)
)AUTO_INCREMENT=1001;

CREATE TABLE SmartCard (
    cardId INT PRIMARY KEY AUTO_INCREMENT,
    passengerId INT,
    issueDate DATE NOT NULL,
    balance DECIMAL(10,2) DEFAULT 0.00,
    status VARCHAR(20) DEFAULT 'Active',
    expiryDate DATE,
    
    FOREIGN KEY (passengerId) 
        REFERENCES Passenger(passengerId)
)AUTO_INCREMENT=101;

CREATE TABLE MetroLine (
    lineId INT PRIMARY KEY AUTO_INCREMENT,
    lineName VARCHAR(50) NOT NULL UNIQUE,
    lineColor VARCHAR(30)
);

CREATE TABLE Station (
    stationId INT PRIMARY KEY AUTO_INCREMENT,
    stationName VARCHAR(100) NOT NULL,
    location VARCHAR(100)
) AUTO_INCREMENT = 4001;

CREATE TABLE Train (
    trainId INT PRIMARY KEY AUTO_INCREMENT,
    trainName VARCHAR(100) NOT NULL,
    capacity INT NOT NULL,
    status VARCHAR(30) NOT NULL,
    lineId INT NOT NULL,

    FOREIGN KEY (lineId)
    REFERENCES MetroLine(lineId)
) AUTO_INCREMENT = 5001;

CREATE TABLE Route (
    routeId INT PRIMARY KEY AUTO_INCREMENT,
    distance DECIMAL(6,2) NOT NULL
) AUTO_INCREMENT = 6001;

CREATE TABLE Schedule (
    scheduleId INT PRIMARY KEY AUTO_INCREMENT,
    arrivalTime TIME NOT NULL,
    departureTime TIME NOT NULL,
    platformNo INT NOT NULL,
    trainId INT NOT NULL,
    stationId INT NOT NULL,

    FOREIGN KEY (trainID)
    REFERENCES Train(trainId),

    FOREIGN KEY (stationId)
    REFERENCES Station(stationId)
) AUTO_INCREMENT = 7001;

CREATE TABLE Booking (
    bookingId INT PRIMARY KEY AUTO_INCREMENT,
    bookingStatus VARCHAR(30) NOT NULL,
    journeyDate DATE NOT NULL,
    passengerId INT NOT NULL,

    FOREIGN KEY (passengerId)
    REFERENCES Passenger(passengerId)
) AUTO_INCREMENT = 8001;

CREATE TABLE Ticket (
    ticketId INT PRIMARY KEY AUTO_INCREMENT,
    fare DECIMAL(10,2) NOT NULL,
    qrCode VARCHAR(255) NOT NULL UNIQUE,
    bookingId INT NOT NULL UNIQUE,

    FOREIGN KEY (bookingId)
    REFERENCES Booking(bookingId)
) AUTO_INCREMENT = 9001;

CREATE TABLE Payment (
    paymentId INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10,2) NOT NULL,
    paymentMethod VARCHAR(50) NOT NULL,
    paymentStatus VARCHAR(30) NOT NULL,
    paymentTime DATETIME NOT NULL,
    bookingId INT NOT NULL UNIQUE,

    FOREIGN KEY (bookingId)
    REFERENCES Booking(bookingId)
) AUTO_INCREMENT = 10001;

CREATE TABLE Employee (
    empId INT PRIMARY KEY AUTO_INCREMENT,
    empName VARCHAR(100) NOT NULL,
    empEmail VARCHAR(100) NOT NULL UNIQUE,
    empPhoneNumber VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255),
    supervisorId INT,

    FOREIGN KEY (supervisorId)
    REFERENCES Employee(empId)
) AUTO_INCREMENT = 11001;

CREATE TABLE MaintenanceRecord (
    maintenanceId INT PRIMARY KEY AUTO_INCREMENT,
    maintenanceDate DATE NOT NULL,
    description VARCHAR(255),
    cost DECIMAL(10,2) NOT NULL,
    trainId INT NOT NULL,
    empId INT NOT NULL,

    FOREIGN KEY (trainId)
    REFERENCES Train(trainId),
    
    FOREIGN KEY (empId)
    REFERENCES Employee(empId)
) AUTO_INCREMENT = 12001;

CREATE TABLE JourneyHistory (
    journeyId INT PRIMARY KEY AUTO_INCREMENT,
    journeyDate DATE NOT NULL,
    journeyDuration TIME NOT NULL,
    passengerId INT NOT NULL,

    FOREIGN KEY (passengerId)
    REFERENCES Passenger(passengerId)
) AUTO_INCREMENT = 13001;

CREATE TABLE RouteStation(
    routeId INT,
    stationId Int,
    PRIMARY KEY (routeId, stationId),

    FOREIGN KEY (routeId)
    REFERENCES Route(routeId),

    FOREIGN KEY (stationId)
    REFERENCES Station(stationId)
);

CREATE TABLE MetroLineStation(
    lineId INT,
    stationId INT,
    PRIMARY KEY (lineId, stationId),

    FOREIGN KEY(lineId)
    REFERENCES MetroLine(lineId),

    FOREIGN KEY (stationId)
    REFERENCES Station(stationId)
);