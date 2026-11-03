
-- Migration 007: Create bookings table
-- Database: movie_booking_db

CREATE TABLE IF NOT EXISTS bookings (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    booking_reference VARCHAR(30) NOT NULL,

    user_id BIGINT UNSIGNED NOT NULL,
    showtime_id BIGINT UNSIGNED NOT NULL,

    ticket_count SMALLINT UNSIGNED NOT NULL,

    total_amount DECIMAL(10,2) NOT NULL,

    booking_status ENUM(
        'pending',
        'confirmed',
        'cancelled',
        'expired'
    ) NOT NULL DEFAULT 'pending',

    payment_status ENUM(
        'unpaid',
        'paid',
        'refunded',
        'failed'
    ) NOT NULL DEFAULT 'unpaid',

    expires_at DATETIME NULL,

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_bookings_reference
        UNIQUE (booking_reference),

    
    CONSTRAINT fk_bookings_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,


    CONSTRAINT fk_bookings_showtime
        FOREIGN KEY (showtime_id)
        REFERENCES showtimes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_bookings_ticket_count
        CHECK (ticket_count > 0),

    CONSTRAINT chk_bookings_total_amount
        CHECK (total_amount >= 0),

    INDEX idx_bookings_user (user_id),
    INDEX idx_bookings_showtime (showtime_id),
    INDEX idx_bookings_status (booking_status),
    INDEX idx_bookings_payment_status (payment_status),
    INDEX idx_bookings_expires_at (expires_at)

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
