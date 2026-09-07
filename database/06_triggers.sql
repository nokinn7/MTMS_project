-- TRIGGER 1: Prevent negative SmartCard balance
DELIMITER //

CREATE TRIGGER PreventNegativeBalance
BEFORE INSERT ON SmartCard
FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'SmartCard balance cannot be negative';
    END IF;
END //

DELIMITER ;

-- TRIGGER 2: Prevent negative ticket fare
DELIMITER //
CREATE TRIGGER PreventNegativeFare
BEFORE INSERT ON Ticket
FOR EACH ROW
BEGIN
    IF NEW.fare < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ticket fare cannot be negative';
    END IF;
END //
DELIMITER ;

-- TRIGGER 3: Prevent ticket creation for cancelled bookings
DELIMITER //
CREATE TRIGGER PreventCancelledBookingTicket
BEFORE INSERT ON Ticket
FOR EACH ROW
BEGIN
    DECLARE booking_status VARCHAR(30);

    SELECT bookingStatus
    INTO booking_status
    FROM Booking
    WHERE bookingId = NEW.bookingId;

    IF booking_status = 'Cancelled' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot create a ticket for a cancelled booking';
    END IF;
END //
DELIMITER ;


-- TRIGGER 4: Automatically expire SmartCards
-- this trigger happens when an update happens in table
--The trigger automatically updates the status when a SmartCard record is updated; it is not a scheduled event.
DELIMITER //
CREATE TRIGGER UpdateExpiredCardStatus
BEFORE UPDATE ON SmartCard
FOR EACH ROW
BEGIN
    IF NEW.expiryDate IS NOT NULL
       AND NEW.expiryDate < CURDATE() THEN

        SET NEW.status = 'Expired';

    END IF;
END //
DELIMITER ;

/* to test trigger 4

1.First find one of your cards:
SELECT *
FROM SmartCard
WHERE cardId = 101;

2.Then update its expiry date to a past date:
UPDATE SmartCard
SET expiryDate = '2026-01-01'
WHERE cardId = 101;

3.Then check:
SELECT
    cardId,
    expiryDate,
    status
FROM SmartCard
WHERE cardId = 101;
*/