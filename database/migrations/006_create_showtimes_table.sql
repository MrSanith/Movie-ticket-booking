
-- Migration 006: Create showtimes table
-- Database: movie_booking_db

CREATE TABLE IF NOT EXISTS showtimes (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    movie_id BIGINT UNSIGNED NOT NULL,
    screen_id BIGINT UNSIGNED NOT NULL,

    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,

    base_price DECIMAL(10,2) NOT NULL,

    status ENUM(
        'scheduled',
        'cancelled',
        'completed'
    ) NOT NULL DEFAULT 'scheduled',

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_showtimes_movie
        FOREIGN KEY (movie_id)
        REFERENCES movies(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_showtimes_screen
        FOREIGN KEY (screen_id)
        REFERENCES screens(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_showtimes_time
        CHECK (end_time > start_time),

    CONSTRAINT chk_showtimes_price
        CHECK (base_price >= 0),

    CONSTRAINT uq_showtimes_screen_start
        UNIQUE (screen_id, start_time),

    INDEX idx_showtimes_movie (movie_id),
    INDEX idx_showtimes_start_time (start_time),
    INDEX idx_showtimes_status (status)

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
