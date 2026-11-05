
-- Migration 010: Create tickets table
-- Database: movie_booking_db

CREATE TABLE IF NOT EXISTS tickets (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    booking_seat_id BIGINT UNSIGNED NOT NULL,

    ticket_number VARCHAR(50) NOT NULL,

    ticket_status ENUM(
        'valid',
        'used',
        'cancelled'
    ) NOT NULL DEFAULT 'valid',

    issued_at DATETIME NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    checked_in_at DATETIME NULL,

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_tickets_number
        UNIQUE (ticket_number),

    CONSTRAINT uq_tickets_booking_seat
        UNIQUE (booking_seat_id),

    CONSTRAINT fk_tickets_booking_seat
        FOREIGN KEY (booking_seat_id)
        REFERENCES booking_seats(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    INDEX idx_tickets_status (ticket_status),

    INDEX idx_tickets_issued_at (issued_at)

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
