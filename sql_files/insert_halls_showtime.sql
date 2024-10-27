USE flix_theatres;

INSERT INTO cinema_halls (
  location_name, hall_name, cinema_type
) VALUES 
(
  'FT Bishan', 'Hall 1', 'IMAX'
), (
  'FT Sembawang', 'Hall 2', 'Premiere'
);

INSERT INTO showtimes (
  movie_id, hall_id, showtime
) 
SELECT m.movie_id, c.hall_id, showtime_list.showtime
FROM movies m JOIN cinema_halls c ON m.title = 'Alien Romulus' AND c.location_name = 'FT Bishan' AND c.hall_name = 'Hall 1'
JOIN (
  SELECT '2024-10-26 19:30:00' AS showtime
  UNION ALL
  SELECT '2024-10-26 21:30:00'
  UNION ALL
  SELECT '2024-10-27 14:00:00'
) AS showtime_list; 

INSERT INTO showtimes (
  movie_id, hall_id, showtime
) 
SELECT m.movie_id, c.hall_id, showtime_list.showtime
FROM movies m JOIN cinema_halls c ON m.title = 'Alien Romulus' AND c.location_name = 'FT Sembawang' AND c.hall_name = 'Hall 2'
JOIN (
  SELECT '2024-10-26 13:00:00' AS showtime
  UNION ALL
  SELECT '2024-10-26 18:30:00'
  UNION ALL
  SELECT '2024-10-27 20:00:00'
) AS showtime_list; 

-- -- To update all showtime dates to today
-- UPDATE showtimes
-- SET showtime = DATE_ADD(showtime, INTERVAL 1 DAY);
