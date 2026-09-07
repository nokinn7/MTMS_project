-- 1. Display all passengers
SELECT *
FROM Passenger;

-- 2. Passenger contact details
SELECT
    passengerId,
    firstName,
    lastName,
    email,
    phoneNumber
FROM Passenger;

-- 3. Display metro lines
SELECT
    lineId,
    lineName,
    lineColor
FROM MetroLine;

-- 4. Display train information
SELECT
    trainId,
    trainName,
    capacity,
    status,
    lineId
FROM Train;

-- 5. Display ticket information
SELECT
    ticketId,
    bookingId,
    fare,
    qrCode
FROM Ticket;

-- 6. Passengers from Chennai
SELECT
    passengerId,
    firstName,
    lastName,
    city
FROM Passenger
WHERE city = 'Chennai';

-- 7. Active SmartCards
SELECT
    cardId,
    passengerId,
    balance,
    status
FROM SmartCard
WHERE status = 'Active';

-- 8. Operational trains
SELECT
    trainId,
    trainName,
    capacity,
    status
FROM Train
WHERE status = 'Operational';

-- 9. Confirmed bookings
SELECT
    bookingId,
    passengerId,
    bookingStatus,
    journeyDate
FROM Booking
WHERE bookingStatus = 'Confirmed';

-- 10. Tickets with fare greater than 40
SELECT
    ticketId,
    bookingId,
    fare
FROM Ticket
WHERE fare > 40;

-- 11. Passengers sorted by first name
SELECT
    passengerId,
    firstName,
    lastName,
    email
FROM Passenger
ORDER BY firstName ASC;

-- 12. Passengers sorted by first name descending
SELECT
    passengerId,
    firstName,
    lastName
FROM Passenger
ORDER BY firstName DESC;

-- 13. SmartCards by balance
SELECT
    cardId,
    passengerId,
    balance,
    status
FROM SmartCard
ORDER BY balance DESC;

-- 14. Tickets from lowest to highest fare
SELECT
    ticketId,
    bookingId,
    fare
FROM Ticket
ORDER BY fare ASC;

-- 15. Maintenance records by cost
SELECT
    maintenanceId,
    trainId,
    description,
    cost
FROM MaintenanceRecord
ORDER BY cost DESC;

-- 16. Active SmartCards sorted by balance
SELECT
    cardId,
    passengerId,
    balance
FROM SmartCard
WHERE status = 'Active'
ORDER BY balance DESC;

-- 17. Confirmed bookings by journey date
SELECT
    bookingId,
    passengerId,
    bookingStatus,
    journeyDate
FROM Booking
WHERE bookingStatus = 'Confirmed'
ORDER BY journeyDate ASC;

-- 18. Total number of passengers
SELECT COUNT(*) AS totalPassengers
FROM Passenger;

-- 19. Total number of bookings
SELECT COUNT(*) AS totalBookings
FROM Booking;

-- 20. Total payment amount
SELECT SUM(amount) AS totalPaymentAmount
FROM Payment;

-- 21. Average ticket fare
SELECT AVG(fare) AS averageFare
FROM Ticket;

-- 22. Minimum ticket fare
SELECT MIN(fare) AS minimumFare
FROM Ticket;

-- 23. Maximum ticket fare
SELECT MAX(fare) AS maximumFare
FROM Ticket;

-- 24. Total maintenance cost
SELECT SUM(cost) AS totalMaintenanceCost
FROM MaintenanceRecord;

-- 25. Average maintenance cost
SELECT AVG(cost) AS averageMaintenanceCost
FROM MaintenanceRecord;

-- 26. Number of active SmartCards
SELECT COUNT(*) AS activeCards
FROM SmartCard
WHERE status = 'Active';

-- 27. Number of bookings made by each passenger
SELECT
    passengerId,
    COUNT(*) AS totalBookings
FROM Booking
GROUP BY passengerId;

-- 28. Number of trains on each metro line
SELECT
    lineId,
    COUNT(*) AS totalTrains
FROM Train
GROUP BY lineId;

-- 29. Total maintenance cost for each train
SELECT
    trainId,
    SUM(cost) AS totalMaintenanceCost
FROM MaintenanceRecord
GROUP BY trainId;

-- 30. Passengers who have made more than one booking
SELECT
    passengerId,
    COUNT(*) AS totalBookings
FROM Booking
GROUP BY passengerId
HAVING COUNT(*) > 1;

-- 31. Trains with more than one maintenance record
SELECT
    trainId,
    COUNT(*) AS maintenanceCount
FROM MaintenanceRecord
GROUP BY trainId
HAVING COUNT(*) > 1;

-- 32. Metro lines with more than one train
SELECT
    lineId,
    COUNT(*) AS totalTrains
FROM Train
GROUP BY lineId
HAVING COUNT(*) > 1;

-- 33. Display passenger details with their bookings
SELECT
    b.bookingId,
    p.passengerId,
    CONCAT(p.firstName, ' ', p.lastName) AS passengerName,
    b.bookingStatus,
    b.journeyDate
FROM Booking b
JOIN Passenger p
    ON b.passengerId = p.passengerId;

-- 34. Display booking details with ticket information
SELECT
    b.bookingId,
    b.bookingStatus,
    b.journeyDate,
    t.ticketId,
    t.fare,
    t.qrCode
FROM Booking b
JOIN Ticket t
    ON b.bookingId = t.bookingId;

-- 35. Display booking details with payment information
SELECT
    b.bookingId,
    b.bookingStatus,
    p.amount,
    p.paymentMethod,
    p.paymentStatus,
    p.paymentTime
FROM Booking b
JOIN Payment p
    ON b.bookingId = p.bookingId;

-- 36. Display passenger, booking and ticket details
SELECT
    b.bookingId,
    CONCAT(p.firstName, ' ', p.lastName) AS passengerName,
    b.journeyDate,
    b.bookingStatus,
    t.ticketId,
    t.fare,
    t.qrCode
FROM Booking b
JOIN Passenger p
    ON b.passengerId = p.passengerId
JOIN Ticket t
    ON b.bookingId = t.bookingId;

-- 37. Display complete booking, ticket and payment details
SELECT
    b.bookingId,
    CONCAT(p.firstName, ' ', p.lastName) AS passengerName,
    b.journeyDate,
    b.bookingStatus,
    t.ticketId,
    t.fare,
    pay.paymentMethod,
    pay.paymentStatus,
    pay.paymentTime
FROM Booking b
JOIN Passenger p
    ON b.passengerId = p.passengerId
JOIN Ticket t
    ON b.bookingId = t.bookingId
JOIN Payment pay
    ON b.bookingId = pay.bookingId;

-- 38. Display trains along with their metro lines
SELECT
    t.trainId,
    t.trainName,
    t.capacity,
    t.status,
    m.lineName,
    m.lineColor
FROM Train t
JOIN MetroLine m
    ON t.lineId = m.lineId;

-- 39. Display train schedules with train and station details
SELECT
    s.scheduleId,
    t.trainName,
    st.stationName,
    s.arrivalTime,
    s.departureTime,
    s.platformNo
FROM Schedule s
JOIN Train t
    ON s.trainId = t.trainId
JOIN Station st
    ON s.stationId = st.stationId;

-- 40. Display maintenance records with train and employee details
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

-- 41. Display routes with their stations
SELECT
    r.routeId,
    r.distance,
    s.stationName
FROM Route r
JOIN RouteStation rs
    ON r.routeId = rs.routeId
JOIN Station s
    ON rs.stationId = s.stationId;

-- 42. Display metro lines with their stations
SELECT
    m.lineName,
    m.lineColor,
    s.stationName
FROM MetroLine m
JOIN MetroLineStation ms
    ON m.lineId = ms.lineId
JOIN Station s
    ON ms.stationId = s.stationId;

-- 43. Display passengers who have made at least one booking
SELECT
    passengerId,
    firstName,
    lastName
FROM Passenger
WHERE passengerId IN (
    SELECT passengerId
    FROM Booking
);

-- 44. Display tickets with fare above the average ticket fare
SELECT
    ticketId,
    bookingId,
    fare
FROM Ticket
WHERE fare > (
    SELECT AVG(fare)
    FROM Ticket
);

-- 45. Display trains with capacity above the average capacity
SELECT
    trainId,
    trainName,
    capacity
FROM Train
WHERE capacity > (
    SELECT AVG(capacity)
    FROM Train
);

-- 46. Display the maintenance record with the highest cost
SELECT
    maintenanceId,
    trainId,
    maintenanceDate,
    description,
    cost
FROM MaintenanceRecord
WHERE cost = (
    SELECT MAX(cost)
    FROM MaintenanceRecord
);

-- 43. Display passenger journey history
SELECT
    j.journeyId,
    p.passengerId,
    CONCAT(p.firstName, ' ', p.lastName) AS passengerName,
    j.journeyDate,
    j.journeyDuration
FROM JourneyHistory j
JOIN Passenger p
    ON j.passengerId = p.passengerId;

-- 44. Display total payment amount by payment method
SELECT
    paymentMethod,
    SUM(amount) AS totalAmount
FROM Payment
WHERE paymentStatus = 'Successful'
GROUP BY paymentMethod;

-- 45. Display total maintenance cost for each train
SELECT
    t.trainId,
    t.trainName,
    SUM(m.cost) AS totalMaintenanceCost
FROM Train t
JOIN MaintenanceRecord m
    ON t.trainId = m.trainId
GROUP BY t.trainId, t.trainName;

-- 46. Display number of bookings for each booking status
SELECT
    bookingStatus,
    COUNT(*) AS totalBookings
FROM Booking
GROUP BY bookingStatus;

-- 47. Display passenger booking summary
SELECT
    p.passengerId,
    CONCAT(p.firstName, ' ', p.lastName) AS passengerName,
    COUNT(b.bookingId) AS totalBookings
FROM Passenger p
LEFT JOIN Booking b
    ON p.passengerId = b.passengerId
GROUP BY p.passengerId, p.firstName, p.lastName
ORDER BY totalBookings DESC;

-- 48. Display passengers with more than one booking
SELECT
    p.passengerId,
    CONCAT(p.firstName, ' ', p.lastName) AS passengerName,
    COUNT(b.bookingId) AS totalBookings
FROM Passenger p
JOIN Booking b
    ON p.passengerId = b.passengerId
GROUP BY p.passengerId, p.firstName, p.lastName
HAVING COUNT(b.bookingId) > 1
ORDER BY totalBookings DESC;

-- 49. Display total maintenance cost handled by each employee
SELECT
    e.empId,
    e.empName,
    COUNT(m.maintenanceId) AS maintenanceRecords,
    SUM(m.cost) AS totalMaintenanceCost
FROM Employee e
JOIN MaintenanceRecord m
    ON e.empId = m.empId
GROUP BY e.empId, e.empName
ORDER BY totalMaintenanceCost DESC;

-- 50. Display complete train schedule
SELECT
    t.trainName,
    ml.lineName,
    s.stationName,
    sc.arrivalTime,
    sc.departureTime,
    sc.platformNo
FROM Schedule sc
JOIN Train t
    ON sc.trainId = t.trainId
JOIN MetroLine ml
    ON t.lineId = ml.lineId
JOIN Station s
    ON sc.stationId = s.stationId
ORDER BY sc.arrivalTime;

-- 51. Display total successful revenue from bookings
SELECT
    SUM(t.fare) AS totalSuccessfulRevenue
FROM Ticket t
JOIN Booking b
    ON t.bookingId = b.bookingId
JOIN Payment p
    ON b.bookingId = p.bookingId
WHERE p.paymentStatus = 'Successful';

