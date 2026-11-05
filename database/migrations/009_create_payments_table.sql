
-- Migration 009: Create payments table
-- Database: movie_booking_db

CREATE TABLE IF NOT EXISTS payments (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    booking_id BIGINT UNSIGNED NOT NULL,

    payment_reference VARCHAR(100) NOT NULL,

    gateway_transaction_id VARCHAR(150) NULL,

    payment_method ENUM(
        'card',
        'bank_transfer',
        'cash',
        'other'
    ) NOT NULL,

    payment_gateway VARCHAR(50) NULL,

    amount DECIMAL(10,2) NOT NULL,

    currency CHAR(3) NOT NULL DEFAULT 'LKR',

    payment_status ENUM(
        'pending',
        'processing',
        'completed',
        'failed',
        'cancelled',
        'refunded'
    ) NOT NULL DEFAULT 'pending',

    paid_at DATETIME NULL,

    failure_reason VARCHAR(255) NULL,

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_payments_reference
        UNIQUE (payment_reference),

    CONSTRAINT uq_payments_gateway_transaction
        UNIQUE (
            payment_gateway,
            gateway_transaction_id
        ),

    CONSTRAINT fk_payments_booking
        FOREIGN KEY (booking_id)
        REFERENCES bookings(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_payments_amount
        CHECK (amount > 0),

    INDEX idx_payments_booking (booking_id),

    INDEX idx_payments_status (payment_status),

    INDEX idx_payments_created_at (created_at)

) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
