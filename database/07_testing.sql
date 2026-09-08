-- Test 1: Primary key constraint
INSERT INTO Passenger(
    passengerId,
    firstName,
    lastName,
    gender,
    dateOfBirth,
    email,
    phoneNumber
)
VALUES(
    1001,
    'Test',
    'Passenger',
    'Other',
    '2000-01-01',
    'test@example.com',
    '9999999999'
);

-- Test 2: Foreign key constraint
INSERT INTO Booking(
    bookingStatus,
    journeyDate,
    passengerId
)
VALUES(
    'Confirmed',
    '2026-09-15',
    9999
);

-- Test 3: UNIQUE constraint on QR code
INSERT INTO Ticket
(
    fare,
    qrCode,
    bookingId
)
VALUES
(
    45.00,
    'QR-MTMS-8001-A7K2',
    8001
);
-- Test 4: One booking cannot have multiple tickets
INSERT INTO Ticket(
    fare,
    qrCode,
    bookingId
)
VALUES(
    50.00,
    'QR-TEST-ONE-TO-ONE',
    8001
);

--Test 5: One booking cannot have multiple payments
INSERT INTO Payment(
    amount,
    paymentMethod,
    paymentStatus,
    paymentTime,
    bookingId
)
VALUES(
    50.00,
    'UPI',
    'Successful',
    '2026-09-08 14:30:00',
    8001
);

-- Test 6: NOT NULL constraint
INSERT INTO Passenger(
    lastName,
    gender,
    dateOfBirth,
    email,
    phoneNumber
)
VALUES(
    'TestUser',
    'Other',
    '2000-01-01',
    'nulltest@mtms.com',
    '9999999998'
);

-- Test 7: UNIQUE constraint on passenger email
INSERT INTO Passenger(
    firstName,
    lastName,
    gender,
    dateOfBirth,
    email,
    phoneNumber
)
VALUES(
    'Test',
    'User',
    'Other',
    '2000-01-01',
    'ravi.kumar@gmail.com',
    '9999999996'
);

-- Test 8: UNIQUE constraint on passenger phone number
INSERT INTO Passenger(
    firstName,
    lastName,
    gender,
    dateOfBirth,
    email,
    phoneNumber
)
VALUES(
    'Test',
    'Phone',
    'Other',
    '2000-01-01',
    'phoneuniquetest@mtms.com',
    '9876543210'
);

-- Test 9: Passenger Booking View
SELECT *
FROM PassengerBookingView;

-- Test 10: Train Schedule View
SELECT *
FROM TrainScheduleView;

-- Test 11: Maintenance View
SELECT *
FROM MaintenanceView;

-- Test 12: Get bookings of a passenger
CALL GetPassengerBookings(1001);

-- Test 13: Get maintenance details of a train
CALL GetTrainMaintenance(5001);

-- Test 14: Calculate total fare for a passenger
CALL GetPassengerTotalFare(1001);
/*
Try a passenger who has no ticket, if you have one in your current data:
CALL GetPassengerTotalFare(<passengerId>);
*/

-- Test 15: Prevent negative SmartCard balance
INSERT INTO SmartCard(
    passengerId,
    issueDate,
    balance,
    status
)
VALUES(
    1001,
    '2026-09-08',
    -500.00,
    'Active'
);

-- Test 16: Prevent negative ticket fare
INSERT INTO Ticket(
    fare,
    qrCode,
    bookingId
)
VALUES(
    -50.00,
    'QR-TEST-NEGATIVE-FARE',
    8001
);

-- Test 17: Prevent ticket creation for cancelled booking
INSERT INTO Ticket(
    fare,
    qrCode,
    bookingId
)
VALUES(
    45.00,
    'QR-TEST-CANCELLED',
    8006
);

-- Test 18: Automatically expire SmartCard
UPDATE SmartCard
SET expiryDate = '2026-01-01',
    status = 'Active'
WHERE cardId = 101;

SELECT
    cardId,
    expiryDate,
    status
FROM SmartCard
WHERE cardId = 101;
