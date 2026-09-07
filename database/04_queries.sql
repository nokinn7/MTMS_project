-- =========================================
-- 1. Maintenance Report
-- =========================================

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


-- =========================================
-- 2. Passenger Journey History
-- =========================================

SELECT
    j.journeyId,
    p.passengerId,
    CONCAT(p.firstName, ' ', p.lastName) AS passengerName,
    j.journeyDate,
    j.journeyDuration
FROM JourneyHistory j
JOIN Passenger p
    ON j.passengerId = p.passengerId;