
-- Migration 002: Create movies table
-- Database: movie_booking_db

CREATE TABLE IF NOT EXISTS movies (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(255) NOT NULL,
    description TEXT NULL,
    genre VARCHAR(100) NOT NULL,
    duration_minutes SMALLINT UNSIGNED NOT NULL,

    language VARCHAR(100) NOT NULL,
    release_date DATE NULL,

    poster_path VARCHAR(500) NULL,
    trailer_url VARCHAR(500) NULL,

    age_rating VARCHAR(20) NULL,

    status ENUM('coming_soon', 'now_showing', 'archived')
        NOT NULL DEFAULT 'coming_soon',

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT chk_movies_duration
        CHECK (duration_minutes > 0)

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
