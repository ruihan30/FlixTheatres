USE flix_theatres;

-- Alien Romulus Bishan 6th Nov 19:30
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'A4', 'Standard', TRUE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', TRUE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE -- Wheelchair seat
    UNION ALL SELECT 'A9', 'Wheelchair', FALSE -- Unavailable wheelchair seat
    
    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', TRUE
    UNION ALL SELECT 'B4', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'B5', 'Standard', TRUE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', TRUE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE -- Wheelchair seat
    
    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', TRUE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', TRUE
    
    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'D3', 'Standard', TRUE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', TRUE 
    UNION ALL SELECT 'D9', 'Standard', TRUE
    
    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', TRUE
    
    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', TRUE
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE 
    
    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', TRUE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-06 19:30:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Alien Romulus'
JOIN cinema_halls c ON c.location_name = 'FT Bishan';

-- Alien Romulus Bishan 6th Nov 21:30
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', FALSE
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', FALSE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', FALSE
    UNION ALL SELECT 'A7', 'Standard', TRUE
    UNION ALL SELECT 'A8', 'Wheelchair', FALSE
    UNION ALL SELECT 'A9', 'Wheelchair', TRUE
    
    UNION ALL SELECT 'B1', 'Standard', FALSE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', TRUE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', FALSE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', FALSE
    UNION ALL SELECT 'B8', 'Standard', TRUE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE
    
    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', FALSE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', FALSE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', FALSE
    
    UNION ALL SELECT 'D1', 'Standard', FALSE
    UNION ALL SELECT 'D2', 'Standard', TRUE
    UNION ALL SELECT 'D3', 'Standard', FALSE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', FALSE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', TRUE
    UNION ALL SELECT 'D9', 'Standard', FALSE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', TRUE
    
    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', TRUE
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE 
    
    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', TRUE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-06 21:30:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Alien Romulus'
JOIN cinema_halls c ON c.location_name = 'FT Bishan';

-- Alien Romulus Bishan 7th Nov 14:00
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', FALSE
    UNION ALL SELECT 'A4', 'Standard', TRUE
    UNION ALL SELECT 'A5', 'Standard', FALSE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', FALSE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE
    UNION ALL SELECT 'A9', 'Wheelchair', FALSE
    
    UNION ALL SELECT 'B1', 'Standard', FALSE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', TRUE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', FALSE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', FALSE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE
    
    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', FALSE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', FALSE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', FALSE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', TRUE
    
    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', TRUE
    UNION ALL SELECT 'D3', 'Standard', FALSE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', FALSE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', FALSE
    UNION ALL SELECT 'D9', 'Standard', TRUE
    
    UNION ALL SELECT 'E1', 'Standard', FALSE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', FALSE
    UNION ALL SELECT 'E4', 'Standard', TRUE
    UNION ALL SELECT 'E5', 'Standard', FALSE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', FALSE
    UNION ALL SELECT 'E9', 'Standard', TRUE
    
    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', FALSE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', FALSE
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', FALSE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE
    
    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', FALSE
    UNION ALL SELECT 'G4', 'Standard', TRUE
    UNION ALL SELECT 'G5', 'Standard', FALSE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', FALSE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-07 14:00:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Alien Romulus'
JOIN cinema_halls c ON c.location_name = 'FT Bishan';

-- Alien Romulus Sembawang 6th Nov 13:00
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', FALSE
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', TRUE
    UNION ALL SELECT 'A5', 'Standard', FALSE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', TRUE
    UNION ALL SELECT 'A8', 'Wheelchair', FALSE
    UNION ALL SELECT 'A9', 'Wheelchair', TRUE

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', FALSE
    UNION ALL SELECT 'B3', 'Standard', TRUE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', FALSE
    UNION ALL SELECT 'B6', 'Standard', FALSE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', FALSE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', FALSE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', FALSE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', FALSE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', FALSE

    UNION ALL SELECT 'D1', 'Standard', FALSE
    UNION ALL SELECT 'D2', 'Standard', TRUE
    UNION ALL SELECT 'D3', 'Standard', TRUE
    UNION ALL SELECT 'D4', 'Standard', FALSE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', FALSE
    UNION ALL SELECT 'D8', 'Standard', TRUE
    UNION ALL SELECT 'D9', 'Standard', TRUE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', FALSE
    UNION ALL SELECT 'E4', 'Standard', FALSE
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', FALSE
    UNION ALL SELECT 'E9', 'Standard', TRUE

    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', FALSE
    UNION ALL SELECT 'F4', 'Standard', TRUE
    UNION ALL SELECT 'F5', 'Standard', FALSE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', FALSE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE

    UNION ALL SELECT 'G1', 'Standard', FALSE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', FALSE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', FALSE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', TRUE
    UNION ALL SELECT 'G9', 'Standard', FALSE
) sts
JOIN showtimes s ON s.showtime = '2024-11-06 13:00:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Alien Romulus'
JOIN cinema_halls c ON c.location_name = 'FT Sembawang';

-- Alien Romulus Sembawang 6th Nov 18:30
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, FALSE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', FALSE
    UNION ALL SELECT 'A4', 'Standard', TRUE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', FALSE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE
    UNION ALL SELECT 'A9', 'Wheelchair', FALSE

    UNION ALL SELECT 'B1', 'Standard', FALSE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', FALSE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', TRUE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', FALSE
    UNION ALL SELECT 'B8', 'Standard', TRUE
    UNION ALL SELECT 'B9', 'Wheelchair', FALSE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', FALSE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', FALSE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', FALSE
    UNION ALL SELECT 'C9', 'Standard', TRUE

    UNION ALL SELECT 'D1', 'Standard', FALSE
    UNION ALL SELECT 'D2', 'Standard', TRUE
    UNION ALL SELECT 'D3', 'Standard', FALSE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', FALSE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', TRUE
    UNION ALL SELECT 'D9', 'Standard', FALSE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', FALSE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', TRUE
    UNION ALL SELECT 'E5', 'Standard', FALSE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', FALSE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', FALSE

    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', FALSE
    UNION ALL SELECT 'F4', 'Standard', TRUE
    UNION ALL SELECT 'F5', 'Standard', FALSE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', FALSE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE

    UNION ALL SELECT 'G1', 'Standard', FALSE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', FALSE
    UNION ALL SELECT 'G4', 'Standard', TRUE
    UNION ALL SELECT 'G5', 'Standard', FALSE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', FALSE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-06 18:30:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Alien Romulus'
JOIN cinema_halls c ON c.location_name = 'FT Sembawang';

-- Alien Romulus Sembawang 7th Nov 20:00
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', FALSE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', FALSE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE
    UNION ALL SELECT 'A9', 'Wheelchair', FALSE

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', FALSE
    UNION ALL SELECT 'B3', 'Standard', FALSE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', FALSE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', FALSE
    UNION ALL SELECT 'B8', 'Standard', TRUE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE

    UNION ALL SELECT 'C1', 'Standard', FALSE
    UNION ALL SELECT 'C2', 'Standard', TRUE
    UNION ALL SELECT 'C3', 'Standard', FALSE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', FALSE
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', FALSE

    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', FALSE
    UNION ALL SELECT 'D3', 'Standard', TRUE
    UNION ALL SELECT 'D4', 'Standard', FALSE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', FALSE
    UNION ALL SELECT 'D8', 'Standard', TRUE
    UNION ALL SELECT 'D9', 'Standard', FALSE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', FALSE
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', FALSE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', TRUE

    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', FALSE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', TRUE
    UNION ALL SELECT 'F5', 'Standard', FALSE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', FALSE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', FALSE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', TRUE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', FALSE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', TRUE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-07 20:00:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Alien Romulus'
JOIN cinema_halls c ON c.location_name = 'FT Sembawang';

-- Beetlejuice Beetlejuice Bedok 6th Nov 09:30
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', TRUE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'A7', 'Standard', TRUE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE -- Wheelchair seat
    UNION ALL SELECT 'A9', 'Wheelchair', FALSE -- Unavailable wheelchair seat

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', TRUE
    UNION ALL SELECT 'B6', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', TRUE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE -- Wheelchair seat

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', FALSE -- Unavailable

    UNION ALL SELECT 'D1', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'D2', 'Standard', TRUE
    UNION ALL SELECT 'D3', 'Standard', TRUE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', TRUE
    UNION ALL SELECT 'D9', 'Standard', TRUE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'E4', 'Standard', TRUE
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', TRUE

    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', TRUE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', FALSE -- Unavailable

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', FALSE -- Unavailable
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', TRUE
    UNION ALL SELECT 'G9', 'Standard', FALSE -- Unavailable
) sts
JOIN showtimes s ON s.showtime = '2024-11-06 09:30:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Beetlejuice Beetlejuice'
JOIN cinema_halls c ON c.location_name = 'FT Bedok';

-- Beetlejuice Beetlejuice Bedok 6th Nov 13:30
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, FALSE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', FALSE
    UNION ALL SELECT 'A4', 'Standard', TRUE
    UNION ALL SELECT 'A5', 'Standard', FALSE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', FALSE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE
    UNION ALL SELECT 'A9', 'Wheelchair', FALSE

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', FALSE
    UNION ALL SELECT 'B3', 'Standard', TRUE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', FALSE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', FALSE
    UNION ALL SELECT 'B8', 'Standard', TRUE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', FALSE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', FALSE
    UNION ALL SELECT 'C6', 'Standard', FALSE
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', FALSE
    UNION ALL SELECT 'C9', 'Standard', TRUE

    UNION ALL SELECT 'D1', 'Standard', FALSE
    UNION ALL SELECT 'D2', 'Standard', TRUE
    UNION ALL SELECT 'D3', 'Standard', FALSE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', FALSE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', FALSE
    UNION ALL SELECT 'D9', 'Standard', TRUE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', FALSE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', TRUE
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', FALSE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', FALSE

    UNION ALL SELECT 'F1', 'Standard', FALSE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', FALSE
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', FALSE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', FALSE
    UNION ALL SELECT 'G3', 'Standard', FALSE
    UNION ALL SELECT 'G4', 'Standard', TRUE
    UNION ALL SELECT 'G5', 'Standard', FALSE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', FALSE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-06 13:30:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Beetlejuice Beetlejuice'
JOIN cinema_halls c ON c.location_name = 'FT Bedok';

-- Beetlejuice Beetlejuice Bedok 7th Nov 18:00
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', FALSE
    UNION ALL SELECT 'A4', 'Standard', FALSE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', FALSE
    UNION ALL SELECT 'A7', 'Standard', TRUE
    UNION ALL SELECT 'A8', 'Wheelchair', FALSE
    UNION ALL SELECT 'A9', 'Wheelchair', TRUE

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', FALSE
    UNION ALL SELECT 'B3', 'Standard', TRUE
    UNION ALL SELECT 'B4', 'Standard', FALSE
    UNION ALL SELECT 'B5', 'Standard', TRUE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', FALSE
    UNION ALL SELECT 'B9', 'Wheelchair', FALSE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', FALSE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', FALSE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', FALSE
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', TRUE

    UNION ALL SELECT 'D1', 'Standard', FALSE
    UNION ALL SELECT 'D2', 'Standard', TRUE
    UNION ALL SELECT 'D3', 'Standard', FALSE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', FALSE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', FALSE
    UNION ALL SELECT 'D9', 'Standard', FALSE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', FALSE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', FALSE
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', FALSE
    UNION ALL SELECT 'E9', 'Standard', TRUE

    UNION ALL SELECT 'F1', 'Standard', FALSE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', FALSE
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', FALSE
    UNION ALL SELECT 'F7', 'Standard', TRUE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', FALSE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', FALSE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', FALSE
    UNION ALL SELECT 'G8', 'Standard', TRUE
    UNION ALL SELECT 'G9', 'Standard', FALSE
) sts
JOIN showtimes s ON s.showtime = '2024-11-07 18:00:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Beetlejuice Beetlejuice'
JOIN cinema_halls c ON c.location_name = 'FT Bedok';

-- Beetlejuice Beetlejuice Katong 6th Nov 12:00
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, FALSE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', FALSE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', FALSE
    UNION ALL SELECT 'A7', 'Standard', TRUE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE
    UNION ALL SELECT 'A9', 'Wheelchair', FALSE

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', FALSE
    UNION ALL SELECT 'B3', 'Standard', FALSE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', TRUE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', FALSE
    UNION ALL SELECT 'B8', 'Standard', TRUE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', FALSE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', FALSE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', FALSE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', FALSE

    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', FALSE
    UNION ALL SELECT 'D3', 'Standard', TRUE
    UNION ALL SELECT 'D4', 'Standard', FALSE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', FALSE
    UNION ALL SELECT 'D9', 'Standard', TRUE

    UNION ALL SELECT 'E1', 'Standard', FALSE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', FALSE
    UNION ALL SELECT 'E4', 'Standard', TRUE
    UNION ALL SELECT 'E5', 'Standard', FALSE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', FALSE

    UNION ALL SELECT 'F1', 'Standard', FALSE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', TRUE
    UNION ALL SELECT 'F5', 'Standard', FALSE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', TRUE
    UNION ALL SELECT 'F8', 'Standard', FALSE
    UNION ALL SELECT 'F9', 'Standard', TRUE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', FALSE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', TRUE
    UNION ALL SELECT 'G5', 'Standard', FALSE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', FALSE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-06 12:00:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Beetlejuice Beetlejuice'
JOIN cinema_halls c ON c.location_name = 'FT Katong';

-- Beetlejuice Beetlejuice Katong 6th Nov 14:30
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', FALSE
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', FALSE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', FALSE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE
    UNION ALL SELECT 'A9', 'Wheelchair', FALSE

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', FALSE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', TRUE
    UNION ALL SELECT 'B6', 'Standard', FALSE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', FALSE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE

    UNION ALL SELECT 'C1', 'Standard', FALSE
    UNION ALL SELECT 'C2', 'Standard', TRUE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', FALSE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', FALSE
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', TRUE

    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', TRUE
    UNION ALL SELECT 'D3', 'Standard', FALSE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', FALSE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', FALSE
    UNION ALL SELECT 'D9', 'Standard', TRUE

    UNION ALL SELECT 'E1', 'Standard', FALSE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', FALSE
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', FALSE
    UNION ALL SELECT 'E9', 'Standard', TRUE

    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', FALSE
    UNION ALL SELECT 'F4', 'Standard', TRUE
    UNION ALL SELECT 'F5', 'Standard', FALSE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', TRUE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', FALSE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', FALSE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', FALSE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', FALSE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-06 14:30:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Beetlejuice Beetlejuice'
JOIN cinema_halls c ON c.location_name = 'FT Katong';

-- Jung Kook: I Am Still Katong 7th Nov 12:00
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, FALSE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', FALSE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', FALSE
    UNION ALL SELECT 'A7', 'Standard', TRUE
    UNION ALL SELECT 'A8', 'Wheelchair', FALSE
    UNION ALL SELECT 'A9', 'Wheelchair', TRUE

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', FALSE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', TRUE
    UNION ALL SELECT 'B6', 'Standard', FALSE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', FALSE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', FALSE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', FALSE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', FALSE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', FALSE

    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', FALSE
    UNION ALL SELECT 'D3', 'Standard', TRUE
    UNION ALL SELECT 'D4', 'Standard', FALSE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', FALSE
    UNION ALL SELECT 'D9', 'Standard', TRUE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', FALSE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', TRUE
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', FALSE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', FALSE

    UNION ALL SELECT 'F1', 'Standard', FALSE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', FALSE
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', FALSE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', FALSE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', FALSE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', FALSE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-07 12:00:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Jung Kook: I Am Still'
JOIN cinema_halls c ON c.location_name = 'FT Katong';

-- Jung Kook: I Am Still Katong 8th Nov 18:30
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', FALSE
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', TRUE
    UNION ALL SELECT 'A5', 'Standard', FALSE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', FALSE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE
    UNION ALL SELECT 'A9', 'Wheelchair', FALSE

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', TRUE
    UNION ALL SELECT 'B4', 'Standard', FALSE
    UNION ALL SELECT 'B5', 'Standard', TRUE
    UNION ALL SELECT 'B6', 'Standard', FALSE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', FALSE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', TRUE
    UNION ALL SELECT 'C3', 'Standard', FALSE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', FALSE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', FALSE

    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', FALSE
    UNION ALL SELECT 'D3', 'Standard', TRUE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', FALSE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', TRUE
    UNION ALL SELECT 'D9', 'Standard', FALSE

    UNION ALL SELECT 'E1', 'Standard', FALSE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', TRUE
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', FALSE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', FALSE
    UNION ALL SELECT 'E9', 'Standard', TRUE

    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', FALSE
    UNION ALL SELECT 'F4', 'Standard', TRUE
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', FALSE
    UNION ALL SELECT 'F7', 'Standard', TRUE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', FALSE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', FALSE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', TRUE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', FALSE
    UNION ALL SELECT 'G8', 'Standard', TRUE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-08 18:30:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Jung Kook: I Am Still'
JOIN cinema_halls c ON c.location_name = 'FT Katong';

-- Jung Kook: I Am Still Bedok 7th Nov 09:00
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', FALSE
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', FALSE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', FALSE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE
    UNION ALL SELECT 'A9', 'Wheelchair', TRUE

    UNION ALL SELECT 'B1', 'Standard', FALSE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', FALSE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', FALSE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', TRUE
    UNION ALL SELECT 'B9', 'Wheelchair', FALSE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', TRUE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', FALSE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', FALSE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', FALSE

    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', FALSE
    UNION ALL SELECT 'D3', 'Standard', TRUE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', FALSE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', FALSE
    UNION ALL SELECT 'D9', 'Standard', TRUE

    UNION ALL SELECT 'E1', 'Standard', FALSE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', TRUE
    UNION ALL SELECT 'E5', 'Standard', FALSE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', FALSE
    UNION ALL SELECT 'E9', 'Standard', TRUE

    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', FALSE
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', FALSE
    UNION ALL SELECT 'F7', 'Standard', TRUE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', FALSE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', FALSE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', FALSE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', TRUE
    UNION ALL SELECT 'G9', 'Standard', FALSE
) sts
JOIN showtimes s ON s.showtime = '2024-11-07 09:00:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Jung Kook: I Am Still'
JOIN cinema_halls c ON c.location_name = 'FT Bedok';

-- Jung Kook: I Am Still Bedok 7th Nov 10:30
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, FALSE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', TRUE
    UNION ALL SELECT 'A4', 'Standard', TRUE
    UNION ALL SELECT 'A5', 'Standard', FALSE
    UNION ALL SELECT 'A6', 'Standard', TRUE
    UNION ALL SELECT 'A7', 'Standard', FALSE
    UNION ALL SELECT 'A8', 'Wheelchair', TRUE
    UNION ALL SELECT 'A9', 'Wheelchair', TRUE

    UNION ALL SELECT 'B1', 'Standard', FALSE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', TRUE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', TRUE
    UNION ALL SELECT 'B6', 'Standard', FALSE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', FALSE
    UNION ALL SELECT 'B9', 'Wheelchair', FALSE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', TRUE
    UNION ALL SELECT 'C3', 'Standard', FALSE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', TRUE
    UNION ALL SELECT 'C6', 'Standard', FALSE
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', FALSE
    UNION ALL SELECT 'C9', 'Standard', TRUE

    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', FALSE
    UNION ALL SELECT 'D3', 'Standard', TRUE
    UNION ALL SELECT 'D4', 'Standard', FALSE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', TRUE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', TRUE
    UNION ALL SELECT 'D9', 'Standard', FALSE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', TRUE
    UNION ALL SELECT 'E5', 'Standard', FALSE
    UNION ALL SELECT 'E6', 'Standard', TRUE
    UNION ALL SELECT 'E7', 'Standard', FALSE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', TRUE

    UNION ALL SELECT 'F1', 'Standard', TRUE
    UNION ALL SELECT 'F2', 'Standard', FALSE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', TRUE
    UNION ALL SELECT 'F5', 'Standard', FALSE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', TRUE
    UNION ALL SELECT 'F8', 'Standard', FALSE
    UNION ALL SELECT 'F9', 'Standard', TRUE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', FALSE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', TRUE
    UNION ALL SELECT 'G8', 'Standard', FALSE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-07 10:30:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Jung Kook: I Am Still'
JOIN cinema_halls c ON c.location_name = 'FT Bedok';

-- Jung Kook: I Am Still Bedok 8th Nov 14:00
INSERT INTO seats (hall_id, showtime_id, seat_number, seat_type, is_available)
SELECT c.hall_id, s.showtime_id, sts.seat_number, sts.seat_type, sts.is_available
FROM (
    SELECT 'A1' AS seat_number, 'Standard' AS seat_type, TRUE AS is_available
    UNION ALL SELECT 'A2', 'Standard', TRUE
    UNION ALL SELECT 'A3', 'Standard', FALSE
    UNION ALL SELECT 'A4', 'Standard', TRUE
    UNION ALL SELECT 'A5', 'Standard', TRUE
    UNION ALL SELECT 'A6', 'Standard', FALSE
    UNION ALL SELECT 'A7', 'Standard', TRUE
    UNION ALL SELECT 'A8', 'Wheelchair', FALSE
    UNION ALL SELECT 'A9', 'Wheelchair', TRUE

    UNION ALL SELECT 'B1', 'Standard', TRUE
    UNION ALL SELECT 'B2', 'Standard', TRUE
    UNION ALL SELECT 'B3', 'Standard', TRUE
    UNION ALL SELECT 'B4', 'Standard', TRUE
    UNION ALL SELECT 'B5', 'Standard', FALSE
    UNION ALL SELECT 'B6', 'Standard', TRUE
    UNION ALL SELECT 'B7', 'Standard', TRUE
    UNION ALL SELECT 'B8', 'Standard', FALSE
    UNION ALL SELECT 'B9', 'Wheelchair', TRUE

    UNION ALL SELECT 'C1', 'Standard', TRUE
    UNION ALL SELECT 'C2', 'Standard', TRUE
    UNION ALL SELECT 'C3', 'Standard', TRUE
    UNION ALL SELECT 'C4', 'Standard', TRUE
    UNION ALL SELECT 'C5', 'Standard', FALSE
    UNION ALL SELECT 'C6', 'Standard', TRUE
    UNION ALL SELECT 'C7', 'Standard', TRUE
    UNION ALL SELECT 'C8', 'Standard', TRUE
    UNION ALL SELECT 'C9', 'Standard', TRUE

    UNION ALL SELECT 'D1', 'Standard', TRUE
    UNION ALL SELECT 'D2', 'Standard', TRUE
    UNION ALL SELECT 'D3', 'Standard', FALSE
    UNION ALL SELECT 'D4', 'Standard', TRUE
    UNION ALL SELECT 'D5', 'Standard', TRUE
    UNION ALL SELECT 'D6', 'Standard', FALSE
    UNION ALL SELECT 'D7', 'Standard', TRUE
    UNION ALL SELECT 'D8', 'Standard', TRUE
    UNION ALL SELECT 'D9', 'Standard', TRUE

    UNION ALL SELECT 'E1', 'Standard', TRUE
    UNION ALL SELECT 'E2', 'Standard', TRUE
    UNION ALL SELECT 'E3', 'Standard', TRUE
    UNION ALL SELECT 'E4', 'Standard', FALSE
    UNION ALL SELECT 'E5', 'Standard', TRUE
    UNION ALL SELECT 'E6', 'Standard', FALSE
    UNION ALL SELECT 'E7', 'Standard', TRUE
    UNION ALL SELECT 'E8', 'Standard', TRUE
    UNION ALL SELECT 'E9', 'Standard', TRUE

    UNION ALL SELECT 'F1', 'Standard', FALSE
    UNION ALL SELECT 'F2', 'Standard', TRUE
    UNION ALL SELECT 'F3', 'Standard', TRUE
    UNION ALL SELECT 'F4', 'Standard', FALSE
    UNION ALL SELECT 'F5', 'Standard', TRUE
    UNION ALL SELECT 'F6', 'Standard', TRUE
    UNION ALL SELECT 'F7', 'Standard', TRUE
    UNION ALL SELECT 'F8', 'Standard', TRUE
    UNION ALL SELECT 'F9', 'Standard', TRUE

    UNION ALL SELECT 'G1', 'Standard', TRUE
    UNION ALL SELECT 'G2', 'Standard', TRUE
    UNION ALL SELECT 'G3', 'Standard', TRUE
    UNION ALL SELECT 'G4', 'Standard', TRUE
    UNION ALL SELECT 'G5', 'Standard', TRUE
    UNION ALL SELECT 'G6', 'Standard', TRUE
    UNION ALL SELECT 'G7', 'Standard', FALSE
    UNION ALL SELECT 'G8', 'Standard', TRUE
    UNION ALL SELECT 'G9', 'Standard', TRUE
) sts
JOIN showtimes s ON s.showtime = '2024-11-08 14:00:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Jung Kook: I Am Still'
JOIN cinema_halls c ON c.location_name = 'FT Bedok';










