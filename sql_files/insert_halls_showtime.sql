USE flix_theatres;

INSERT INTO cinema_halls (
  location_name, cinema_type
) VALUES 
(
  'FT Bishan', 'IMAX'
), (
  'FT Sembawang', 'Premiere'
);

INSERT INTO showtimes (
  movie_id, hall_id, showtime
) 
SELECT m.movie_id, c.hall_id, showtime_list.showtime
FROM movies m JOIN cinema_halls c ON m.title = 'Alien Romulus' AND c.location_name = 'FT Bishan'
JOIN (
  SELECT '2024-11-06 19:30:00' AS showtime
  UNION ALL
  SELECT '2024-11-06 21:30:00'
  UNION ALL
  SELECT '2024-11-07 14:00:00'
) AS showtime_list; 

INSERT INTO showtimes (
  movie_id, hall_id, showtime
) 
SELECT m.movie_id, c.hall_id, showtime_list.showtime
FROM movies m JOIN cinema_halls c ON m.title = 'Alien Romulus' AND c.location_name = 'FT Sembawang'
JOIN (
  SELECT '2024-11-06 13:00:00' AS showtime
  UNION ALL
  SELECT '2024-11-06 18:30:00'
  UNION ALL
  SELECT '2024-11-07 20:00:00'
) AS showtime_list; 


INSERT INTO cinema_halls (
  location_name, cinema_type
) VALUES 
(
  'FT Bedok', 'Lumiere'
), (
  'FT Katong', 'IMAX'
);

INSERT INTO showtimes (
  movie_id, hall_id, showtime
) 
SELECT m.movie_id, c.hall_id, showtime_list.showtime
FROM movies m JOIN cinema_halls c ON m.title = 'Beetlejuice Beetlejuice' AND c.location_name = 'FT Bedok'
JOIN (
  SELECT '2024-11-06 09:30:00' AS showtime
  UNION ALL
  SELECT '2024-11-06 13:30:00'
  UNION ALL
  SELECT '2024-11-07 18:00:00'
) AS showtime_list; 

INSERT INTO showtimes (
  movie_id, hall_id, showtime
) 
SELECT m.movie_id, c.hall_id, showtime_list.showtime
FROM movies m JOIN cinema_halls c ON m.title = 'Beetlejuice Beetlejuice' AND c.location_name = 'FT Katong'
JOIN (
  SELECT '2024-11-06 12:00:00' AS showtime
  UNION ALL
  SELECT '2024-11-06 14:30:00'
) AS showtime_list; 

INSERT INTO showtimes (
  movie_id, hall_id, showtime
) 
SELECT m.movie_id, c.hall_id, showtime_list.showtime
FROM movies m JOIN cinema_halls c ON m.title = 'Jung Kook: I Am Still' AND c.location_name = 'FT Bedok'
JOIN (
  SELECT '2024-11-07 09:00:00' AS showtime
  UNION ALL
  SELECT '2024-11-07 10:30:00'
  UNION ALL
  SELECT '2024-11-08 14:00:00'
) AS showtime_list; 

INSERT INTO showtimes (
  movie_id, hall_id, showtime
) 
SELECT m.movie_id, c.hall_id, showtime_list.showtime
FROM movies m JOIN cinema_halls c ON m.title = 'Jung Kook: I Am Still' AND c.location_name = 'FT Katong'
JOIN (
  SELECT '2024-11-07 12:00:00' AS showtime
  UNION ALL
  SELECT '2024-11-08 18:30:00'
) AS showtime_list; 

-- -- To update all showtime dates to today
-- UPDATE showtimes
-- SET showtime = DATE_ADD(showtime, INTERVAL 1 DAY);
