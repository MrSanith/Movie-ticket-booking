
-- Migration 012: Create showtime seat locks table
-- Database: movie_booking_db

CREATE TABLE IF NOT EXISTS showtime_seat_locks (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    showtime_id BIGINT UNSIGNED NOT NULL,

    seat_id BIGINT UNSIGNED NOT NULL,

    booking_id BIGINT UNSIGNED NOT NULL,

    lock_status ENUM(
        'held',
        'reserved'
    ) NOT NULL DEFAULT 'held',

    expires_at DATETIME NULL,

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_showtime_seat_locks_seat
        UNIQUE (showtime_id, seat_id),

    CONSTRAINT fk_seat_locks_showtime
        FOREIGN KEY (showtime_id)
        REFERENCES showtimes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_seat_locks_seat
        FOREIGN KEY (seat_id)
        REFERENCES seats(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_seat_locks_booking
        FOREIGN KEY (booking_id)
        REFERENCES bookings(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_seat_locks_expiry
        CHECK (
            lock_status <> 'held'
            OR expires_at IS NOT NULL
        ),

    INDEX idx_seat_locks_booking (booking_id),

    INDEX idx_seat_locks_expiry (
        lock_status,
        expires_at
    )

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
