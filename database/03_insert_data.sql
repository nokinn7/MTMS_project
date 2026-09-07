USE MTMS;

INSERT INTO Passenger
(firstName, middleName, lastName, gender, dateOfBirth, email,
 phoneNumber, houseNo, street, city, state, pincode)
VALUES
('Arun', NULL, 'Kumar', 'Male', '2001-05-14',
 'arun.kumar@gmail.com', '9876543210',
 '12', 'Anna Nagar Main Road', 'Chennai', 'Tamil Nadu', '600040'),

('Priya', 'R', 'Sharma', 'Female', '2002-08-21',
 'priya.sharma@gmail.com', '9876543211',
 '45', 'Gandhi Street', 'Chennai', 'Tamil Nadu', '600032'),

('Karthik', NULL, 'Rajan', 'Male', '1999-11-03',
 'karthik.rajan@gmail.com', '9876543212',
 '18', 'Mount Road', 'Chennai', 'Tamil Nadu', '600002'),

('Ananya', 'S', 'Iyer', 'Female', '2003-02-17',
 'ananya.iyer@gmail.com', '9876543213',
 '27', 'Lake View Road', 'Chennai', 'Tamil Nadu', '600034'),

('Vishal', NULL, 'Menon', 'Male', '1998-07-09',
 'vishal.menon@gmail.com', '9876543214',
 '33', 'Velachery Main Road', 'Chennai', 'Tamil Nadu', '600042'),

('Meera', 'K', 'Nair', 'Female', '2001-12-28',
 'meera.nair@gmail.com', '9876543215',
 '51', 'Guindy Industrial Estate', 'Chennai', 'Tamil Nadu', '600032'),

('Rahul', NULL, 'Krishnan', 'Male', '2000-04-11',
 'rahul.krishnan@gmail.com', '9876543216',
 '9', 'Poonamallee High Road', 'Chennai', 'Tamil Nadu', '600010'),

('Divya', 'M', 'Sundar', 'Female', '2002-09-30',
 'divya.sundar@gmail.com', '9876543217',
 '64', 'Perambur High Road', 'Chennai', 'Tamil Nadu', '600011'),

('Aditya', NULL, 'Verma', 'Male', '1997-06-19',
 'aditya.verma@gmail.com', '9876543218',
 '22', 'OMR Road', 'Chennai', 'Tamil Nadu', '600096'),

('Sneha', 'P', 'Rao', 'Female', '2004-01-25',
 'sneha.rao@gmail.com', '9876543219',
 '38', 'Ashok Nagar Main Road', 'Chennai', 'Tamil Nadu', '600083');

 INSERT INTO SmartCard
 (passengerId, issueDate, balance, status, expiryDate)
 VALUES
(1001, '2026-01-10', 450.00, 'Active', '2027-01-10'),
(1002, '2026-01-15', 275.50, 'Active', '2027-01-15'),
(1003, '2026-02-05', 120.00, 'Active', '2027-02-05'),
(1004, '2026-02-18', 600.00, 'Active', '2027-02-18'),
(1005, '2026-03-01', 80.00, 'Active', '2027-03-01'),
(1006, '2026-03-12', 350.75, 'Active', '2027-03-12'),
(1007, '2026-04-03', 50.00, 'Active', '2027-04-03'),
(1008, '2026-04-20', 425.25, 'Active', '2027-04-20'),
(1009, '2026-05-11', 900.00, 'Active', '2027-05-11'),
(1010, '2026-05-25', 190.00, 'Active', '2027-05-25');

INSERT INTO MetroLine
(lineName, lineColor)
VALUES
('Blue Line', 'Blue'),
('Green Line', 'Green');

INSERT INTO Station
(stationName, location)
VALUES
('Washermenpet', 'North Chennai'),
('Central', 'Central Chennai'),
('Egmore', 'Central Chennai'),
('Guindy', 'South Chennai'),
('Alandur', 'South Chennai'),
('Airport', 'Chennai Airport'),
('Koyambedu', 'West Chennai'),
('St Thomas Mount', 'South Chennai');

INSERT INTO MetroLineStation
(lineId, stationId)
VALUES
(1, 2001),
(1, 2002),
(1, 2003),
(1, 2004),
(1, 2005),
(1, 2006),
(2, 2002),
(2, 2005),
(2, 2007),
(2, 2008);

INSERT INTO Train
(trainName, capacity, status, lineId)
VALUES
('Blue Express 01', 1200, 'Operational', 1),
('Blue Express 02', 1200, 'Operational', 1),
('Blue Express 03', 1200, 'Maintenance', 1),
('Green Express 01', 1200, 'Operational', 2),
('Green Express 02', 1200, 'Operational', 2);

INSERT INTO Route
(distance)
VALUES
(12.50),
(18.75),
(24.30),
(31.20),
(15.60);

INSERT INTO RouteStation
(routeId, stationId)
VALUES
(6001, 2001),
(6001, 2002),
(6001, 2003),

(6002, 2002),
(6002, 2004),
(6002, 2005),

(6003, 2005),
(6003, 2006),

(6004, 2002),
(6004, 2007),
(6004, 2008),

(6005, 2003),
(6005, 2004),
(6005, 2005);

INSERT INTO Schedule
(arrivalTime, departureTime, platformNo, trainId, stationId)
VALUES
('08:00:00', '08:02:00', 1, 5001, 2001),
('08:08:00', '08:10:00', 2, 5001, 2002),
('08:15:00', '08:17:00', 1, 5001, 2003),

('09:00:00', '09:02:00', 1, 5002, 2004),
('09:08:00', '09:10:00', 2, 5002, 2005),
('09:18:00', '09:20:00', 1, 5002, 2006),

('10:00:00', '10:02:00', 1, 5004, 2007),
('10:08:00', '10:10:00', 2, 5004, 2008),
('10:18:00', '10:20:00', 1, 5004, 2002);

INSERT INTO Employee
(empName, empEmail, empPhoneNumber, address, supervisorId)
VALUES
('Ravi Kumar', 'ravi.kumar@mtms.com', '9000000001',
 'Chennai, Tamil Nadu', NULL),

('Suresh Babu', 'suresh.babu@mtms.com', '9000000002',
 'Chennai, Tamil Nadu', 11001),

('Priya Menon', 'priya.menon@mtms.com', '9000000003',
 'Chennai, Tamil Nadu', 11001),

('Arun Raj', 'arun.raj@mtms.com', '9000000004',
 'Chennai, Tamil Nadu', 11001),

('Meena Krishnan', 'meena.krishnan@mtms.com', '9000000005',
 'Chennai, Tamil Nadu', 11002);

 INSERT INTO MaintenanceRecord
(maintenanceDate, description, cost, trainId, empId)
VALUES
('2026-08-05', 'Brake system inspection', 12500.00, 5001, 11002),
('2026-08-18', 'Door mechanism servicing', 8500.00, 5002, 11003),
('2026-08-27', 'Routine electrical inspection', 6200.00, 5003, 11004),
('2026-09-02', 'Air conditioning maintenance', 9800.00, 5004, 11005),
('2026-09-05', 'General preventive maintenance', 15000.00, 5005, 11002);

INSERT INTO Booking
(bookingStatus, journeyDate, passengerId)
VALUES
('Confirmed', '2026-09-08', 1001),
('Confirmed', '2026-09-08', 1002),
('Confirmed', '2026-09-09', 1003),
('Completed', '2026-09-05', 1004),
('Confirmed', '2026-09-10', 1005),
('Cancelled', '2026-09-06', 1006),
('Confirmed', '2026-09-11', 1007),
('Completed', '2026-09-04', 1008),
('Confirmed', '2026-09-12', 1009),
('Confirmed', '2026-09-13', 1010);

INSERT INTO Ticket
(fare, qrCode, bookingId)
VALUES
(40.00, 'QR-MTMS-8001-A7K2', 8001),
(30.00, 'QR-MTMS-8002-B4P9', 8002),
(50.00, 'QR-MTMS-8003-C8L1', 8003),
(40.00, 'QR-MTMS-8004-D3M6', 8004),
(60.00, 'QR-MTMS-8005-E9Q4', 8005),
(35.00, 'QR-MTMS-8006-F2R8', 8006),
(45.00, 'QR-MTMS-8007-G5T3', 8007),
(30.00, 'QR-MTMS-8008-H1V7', 8008),
(55.00, 'QR-MTMS-8009-J6W2', 8009),
(40.00, 'QR-MTMS-8010-K9X5', 8010);

INSERT INTO Payment
(amount, paymentMethod, paymentStatus, paymentTime, bookingId)
VALUES
(40.00, 'UPI', 'Successful', '2026-09-07 08:15:00', 8001),
(30.00, 'Card', 'Successful', '2026-09-07 08:22:00', 8002),
(50.00, 'UPI', 'Successful', '2026-09-07 09:05:00', 8003),
(40.00, 'Cash', 'Successful', '2026-09-05 10:10:00', 8004),
(60.00, 'Card', 'Successful', '2026-09-07 11:30:00', 8005),
(35.00, 'UPI', 'Refunded', '2026-09-06 12:45:00', 8006),
(45.00, 'UPI', 'Successful', '2026-09-07 13:20:00', 8007),
(30.00, 'Card', 'Successful', '2026-09-04 14:05:00', 8008),
(55.00, 'Net Banking', 'Successful', '2026-09-07 15:10:00', 8009),
(40.00, 'UPI', 'Successful', '2026-09-07 16:00:00', 8010);

INSERT INTO JourneyHistory
(journeyDate, journeyDuration, passengerId)
VALUES
('2026-09-01', '00:35:00', 1001),
('2026-09-02', '00:42:00', 1002),
('2026-09-03', '00:28:00', 1003),
('2026-09-04', '00:45:00', 1004),
('2026-09-05', '00:31:00', 1005),
('2026-09-05', '00:38:00', 1001),
('2026-09-06', '00:52:00', 1006),
('2026-09-06', '00:25:00', 1007),
('2026-09-07', '00:40:00', 1008),
('2026-09-07', '00:33:00', 1009),
('2026-09-07', '00:47:00', 1010);