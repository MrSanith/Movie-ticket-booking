
-- Migration 004: Create cinema screens table
-- Database: movie_booking_db

CREATE TABLE IF NOT EXISTS screens (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    cinema_id BIGINT UNSIGNED NOT NULL,

    name VARCHAR(100) NOT NULL,

    screen_type ENUM(
        'standard',
        'premium',
        'imax',
        '3d',
        'vip'
    ) NOT NULL DEFAULT 'standard',

    status ENUM('active', 'inactive')
        NOT NULL DEFAULT 'active',

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_screens_cinema
        FOREIGN KEY (cinema_id)
        REFERENCES cinemas(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_screens_cinema_name
        UNIQUE (cinema_id, name),

    INDEX idx_screens_status (status)

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
