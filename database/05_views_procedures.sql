--VIEW 1: Passenger Booking Details
CREATE VIEW PassengerBookingView AS SELECT
b.bookingId,
p.passengerId,
CONCAT(p.firstName,' ',p.lastName) AS passengerName,
b.bookingStatus,
b.journeyDate
FROM Booking b
JOIN Passenger p
ON b.passengerId = p.passengerId;

-- VIEW 2: Train Schedule Details
CREATE VIEW TrainScheduleView AS
SELECT
    s.scheduleId,
    t.trainName,
    ml.lineName,
    st.stationName,
    s.arrivalTime,
    s.departureTime,
    s.platformNo
FROM Schedule s
JOIN Train t
    ON s.trainId = t.trainId
JOIN MetroLine ml
    ON t.lineId = ml.lineId
JOIN Station st
    ON s.stationId = st.stationId;

-- VIEW 3: Train Maintenance Details
CREATE VIEW MaintenanceView AS
SELECT
    m.maintenanceId,
    t.trainName,
    e.empName,
    m.maintenanceDate,
    m.description,
    m.cost
FROM MaintenanceRecord m
JOIN Train t
    ON m.trainId = t.trainId
JOIN Employee e
    ON m.empId = e.empId;

-- ============================================
-- STORED PROCEDURES
-- ============================================

-- Procedure 1: Get bookings of a passenger
DELIMITER //

CREATE PROCEDURE GetPassengerBookings(IN p_passengerId INT)
BEGIN
    SELECT
        b.bookingId,
        b.bookingStatus,
        b.journeyDate
    FROM Booking b
    WHERE b.passengerId = p_passengerId;
END //

DELIMITER ;

-- Procedure 2: Get maintenance details of a train
DELIMITER //

CREATE PROCEDURE GetTrainMaintenance(IN p_trainId INT)
BEGIN
    SELECT
        m.maintenanceId,
        t.trainName,
        e.empName,
        m.maintenanceDate,
        m.description,
        m.cost
    FROM MaintenanceRecord m
    JOIN Train t
        ON m.trainId = t.trainId
    JOIN Employee e
        ON m.empId = e.empId
    WHERE m.trainId = p_trainId;
END //

DELIMITER ;

-- Procedure 3: Calculate total fare paid by a passenger
DELIMITER //

CREATE PROCEDURE GetPassengerTotalFare(IN p_passengerId INT)
BEGIN
    SELECT
        p.passengerId,
        CONCAT(p.firstName, ' ', p.lastName) AS passengerName,
        COUNT(t.ticketId) AS totalTickets,
        COALESCE(SUM(t.fare), 0) AS totalFare
    FROM Passenger p
    LEFT JOIN Booking b
        ON p.passengerId = b.passengerId
    LEFT JOIN Ticket t
        ON b.bookingId = t.bookingId
    WHERE p.passengerId = p_passengerId
    GROUP BY
        p.passengerId,
        p.firstName,
        p.lastName;
END //

DELIMITER ;