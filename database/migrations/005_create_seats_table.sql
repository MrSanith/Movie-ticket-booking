
-- Migration 005: Create seats table
-- Database: movie_booking_db

CREATE TABLE IF NOT EXISTS seats (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    screen_id BIGINT UNSIGNED NOT NULL,

    row_label VARCHAR(5) NOT NULL,
    seat_number SMALLINT UNSIGNED NOT NULL,

    seat_type ENUM(
        'standard',
        'premium',
        'vip'
    ) NOT NULL DEFAULT 'standard',

    status ENUM(
        'active',
        'maintenance'
    ) NOT NULL DEFAULT 'active',

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_seats_screen
        FOREIGN KEY (screen_id)
        REFERENCES screens(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_seats_screen_position
        UNIQUE (screen_id, row_label, seat_number),

    CONSTRAINT chk_seats_number
        CHECK (seat_number > 0),

    INDEX idx_seats_status (status)

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
