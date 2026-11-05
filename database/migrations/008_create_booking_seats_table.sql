
-- Migration 008: Create booking_seats table
-- Database: movie_booking_db

CREATE TABLE IF NOT EXISTS booking_seats (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    booking_id BIGINT UNSIGNED NOT NULL,
    showtime_id BIGINT UNSIGNED NOT NULL,
    seat_id BIGINT UNSIGNED NOT NULL,

    ticket_price DECIMAL(10,2) NOT NULL,

    seat_status ENUM(
        'reserved',
        'confirmed',
        'cancelled'
    ) NOT NULL DEFAULT 'reserved',

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_booking_seats_booking
        FOREIGN KEY (booking_id)
        REFERENCES bookings(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_booking_seats_showtime
        FOREIGN KEY (showtime_id)
        REFERENCES showtimes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_booking_seats_seat
        FOREIGN KEY (seat_id)
        REFERENCES seats(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_booking_seats_price
        CHECK (ticket_price >= 0),

    INDEX idx_booking_seats_booking (booking_id),
    INDEX idx_booking_seats_showtime (showtime_id),
    INDEX idx_booking_seats_seat (seat_id),

    INDEX idx_booking_seats_availability (
        showtime_id,
        seat_id,
        seat_status
    )

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
