CREATE DATABASE flix_theatres;

USE flix_theatres;

CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    poster_url VARCHAR(255),
    banner_url VARCHAR(255),
    content_rating VARCHAR(50) NOT NULL,
    content_rating_description VARCHAR(50),
    rating DECIMAL(2,1),
    trailer_link VARCHAR(255),
    synopsis TEXT,
    language VARCHAR(50) NOT NULL,
    duration INT NOT NULL,
    genre1 VARCHAR(50) NOT NULL,
    genre2 VARCHAR(50),
    director VARCHAR(100) NOT NULL,
    casts VARCHAR(500),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE cinema_halls (
    hall_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(100),
    hall_name VARCHAR(50) NOT NULL,
    cinema_type VARCHAR(50) NOT NULL
);

CREATE TABLE showtimes (
    showtime_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    hall_id INT NOT NULL,
    showtime DATETIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (hall_id) REFERENCES cinema_halls(hall_id)
);

CREATE TABLE seats (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    hall_id INT NOT NULL,
    showtime_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    seat_type VARCHAR(50),
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (hall_id) REFERENCES cinema_halls(hall_id)
    FOREIGN KEY (showtime_id) REFERENCES showtimes(showtime_id)
);

CREATE TABLE tickets_ordered (
    tickets_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

CREATE TABLE food_combos (
    combo_id INT PRIMARY KEY AUTO_INCREMENT,
    combo_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    img_url VARCHAR(255)
);

CREATE TABLE food_combos_ordered (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    combo_id INT NOT NULL,
    sub_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (combo_id) REFERENCES food_combos(combo_id)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    seat_id INT NOT NULL,
    hall_id INT NOT NULL,
    showtime_id INT NOT NULL,
    tickets_id INT NOT NULL,
    combo_id INT,
    booking_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10, 2) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id),
    FOREIGN KEY (hall_id) REFERENCES cinema_halls(hall_id),
    FOREIGN KEY (showtime_id) REFERENCES showtimes(showtime_id),
    FOREIGN KEY (ticket_id) REFERENCES tickets_ordered(tickets_id),
    FOREIGN KEY (combo_id) REFERENCES food_combos_ordered(order_id)
);






