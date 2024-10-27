USE flix_theatres;

INSERT INTO movies (
    title, poster_url, banner_url, content_rating, content_rating_description, rating, 
    trailer_link, 
    synopsis, 
    language, duration, genre1, genre2, 
    director, casts
) VALUES 
(
  'Alien Romulus', 
  'https://m.media-amazon.com/images/I/614lcZY032L.jpg', 
  'https://www.irishtimes.com/resizer/v2/2ORNOHCEOFED7AK5B6NEWJ4RZI.jpg?smart=true&auth=b0e0ea278f80e6f24480beec81308c546a03fe5a03242d1487fb49ee7031b18a&width=1200&height=630', 
  'NC16', 'Gore & violence', 4.5, 
  'https://www.youtube.com/watch?v=x0XDEhP4MQs', 
  'Space colonizers come face to face with the most terrifying life-form in the universe while scavenging the deep ends of a derelict space station.', 
  'English (Chinese Subbed)', 119, 
  'Horror', 'Thriller', 
  'Fede Álvarez', 'Cailee Spaeny, David Jonsson, Archie Renaux, Isabela Merced, Spike Fearn, Aileen Wu'
),
(
  'Beetlejuice Beetlejuice', 
  'https://m.media-amazon.com/images/I/71YA6AM-V8L.jpg', 
  'https://www.beetlejuicemovie.com/toolkit/img/bannerImg_m.jpg', 
  'PG13', 'Some frightening scenes & coarse language', 4, 
  'https://www.youtube.com/watch?v=CoZqL9N6Rx4', 
  'Three generations of the Deetz family return home to Winter River after an unexpected family tragedy. Still haunted by Beetlejuice, Lydia''s life soon gets turned upside down when her rebellious teenage daughter discovers a mysterious portal to the afterlife. When someone says Beetlejuice''s name three times, the mischievous demon gleefully returns to unleash his very own brand of mayhem.', 
  'English (Chinese Subbed)', 105, 
  'Fantasy', 'Sci-Fi', 
  'Tim Burton', 'Michael Keaton, Catherine O''Hara, Winona Ryder, Jenna Ortega, Willem Dafoe'
),
(
  'Marvel Studio''s Deadpool & Wolverine', 
  'https://m.media-amazon.com/images/I/810zZ6ger0L._AC_UF894,1000_QL80_.jpg', 
  'https://miro.medium.com/v2/resize:fit:1400/1*B6zJAX5gnzxj7AYOtR8reQ.png',
  'https://www.youtube.com/watch?v=73_1biulkYk', 
  'Deadpool''s peaceful existence comes crashing down when the Time Variance Authority recruits him to help safeguard the multiverse. He soon unites with his would-be pal, Wolverine, to complete the mission and save his world from an existential threat.', 
  'English (Chinese Subbed)', 127, 
  'Action', 'Comedy', 
  'Shawn Levy', 'Ryan Reynolds, Hugh Jackman, Emma Corrin, Morena Baccarin, Rob Delaney, Leslie Uggams, Aaron Stanford, Matthew Macfadyen'
),
(
  'Jung Kook: I Am Still', 
  'https://m.media-amazon.com/images/M/MV5BNzJmNDBkOTMtYmI0OS00NGM1LWE3MjEtYzliYjNiY2FmZjUzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 
  'https://philstarlife.s3.ap-east-1.amazonaws.com/pslife_photos/Yoniel_temp/August%202024/banner%20jung%20kook.jpg',
  'PG', NULL , 5, 
  'https://www.youtube.com/watch?v=LWkh_hXeEeg', 
  'Through exclusive, unseen interviews and behind-the-scenes footage, alongside electrifying concert performances, this brand new film showcases Jung Kook''s eight-month journey, capturing his unwavering dedication and growth.', 
  'English (Chinese Subbed)', 93, 
  'Documentary', NULL, 
  'Park Jun Soo', 'Jimin, Jung Kook'
)
;
