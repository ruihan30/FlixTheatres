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
JOIN showtimes s ON s.showtime = '2024-10-26 19:30:00'
JOIN movies m ON m.movie_id = s.movie_id AND m.title = 'Alien Romulus'
JOIN cinema_halls c ON c.location_name = 'FT Bishan';

