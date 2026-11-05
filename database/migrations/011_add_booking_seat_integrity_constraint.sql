
-- Migration 011: Strengthen booking seat integrity
-- Database: movie_booking_db

-- Prevent the same seat from being added
-- more than once to the same booking.

ALTER TABLE booking_seats
ADD CONSTRAINT uq_booking_seats_booking_seat
UNIQUE (booking_id, seat_id);
