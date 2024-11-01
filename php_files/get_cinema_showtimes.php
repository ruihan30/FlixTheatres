<?php 

// Establish connection
@$conn = new mysqli('localhost', 'root', '', 'flix_theatres');

// Check connection
if (mysqli_connect_errno()) {
  echo 'Error: Could not connect to database.  Please try again later.';
  exit;
}

// Query to fetch movies
$query = 
"SELECT * FROM movies m 
LEFT JOIN showtimes s ON m.movie_id = s.movie_id 
LEFT JOIN cinema_halls c ON c.hall_id = s.hall_id 
WHERE s.showtime_id IS NOT NULL";
$result = $conn->query($query);

// Save SQL query result in array
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    if (!isset($movie_details[$row['title']])) {
      $movie_details[$row['title']] = [
        'movie_id' => $row['movie_id'],
        'poster_url' => $row['poster_url'],
        'banner_url' => $row['banner_url'],
        'content_rating' => $row['content_rating'],
        'content_rating_description' => $row['content_rating_description'],
        'rating' => $row['rating'],
        'trailer_link' => $row['trailer_link'],
        'synopsis' => $row['synopsis'],
        'language' => $row['language'],
        'duration' => $row['duration'],
        'genre1' => $row['genre1'],
        'genre2' => $row['genre2'],
        'director' => $row['director'],
        'casts' => $row['casts'],
      ];
    };

    $showtime_date = date('Y-m-d', strtotime($row['showtime']));
    if (!isset($movie_details[$row['title']]['showtimes'][$showtime_date][$row['location_name']])) {
      $movie_details[$row['title']]['showtimes'][$showtime_date][$row['location_name']] = [];
    }

    $movie_details[$row['title']]['showtimes'][$showtime_date][$row['location_name']][] = [
      'cinema_type' => $row['cinema_type'],
      'hall_name' => $row['hall_name'],
      'showtime' => $row['showtime'],
    ];
  };
};

foreach($datesArray as $index => $date) {
  if ($index != 0) {echo "<div class='movieList' style='display: none;' data-date='{$date['full_date']}'>";}
  else {echo "<div class='movieList' data-date='{$date['full_date']}'>";};
  
  foreach ($movie_details as $title => $details) {

    if (isset($details['showtimes'][$date['full_date']])) {
    echo"
    <div class='d-flex flex-column movie-card'>
      <img style='width: 100%, height: auto;' src='{$details['poster_url']}' alt='{$title}'>

      <div class='d-flex flex-column movie-details'>
        <div class='d-flex flex-column' style='gap: 4px; width: 100%; flex-grow: 1;'> 
          <p class='movie-title'>{$title}</p>
          <p>{$details['language']}</p>
        </div>
          
        <div class='d-flex flex-row align-items-center' style='gap: 8px; width: 100%;'>
          <div class='pg-rating " . strtolower($details['content_rating']) . "'> {$details['content_rating']}</div>
          <p class='pg-description'>{$details['content_rating_description']}</p>
        </div>";

        foreach ($movie_details[$title]['showtimes'] as $showtime_date => $locations) {
          if ($showtime_date == $date['full_date']) {
            foreach ($locations as $location_name => $showtimes) {                
              echo "
              <div class='d-flex flex-row align-items-center showtimes-movies ". str_replace(' ', '_', $location_name) . "' style='align-self: start; flex-wrap: wrap;";
                $convert_name = str_replace("FT", "Flix Theatres", $location_name);
                if ($convert_name != $default_cinema_name) {
                  echo "display: none;";
                }
                echo "'>";
                foreach ($showtimes as $showtime_list => $showtime) {
                  echo "<a href='booking_1.php?title=". urlencode($title) . "&cinema=" . urlencode($location_name) . 
                  "&date=" . urlencode(formatDay($showtime['showtime'])) . "&time=" . urlencode(formatTime($showtime['showtime'])) . "'>
                  <button class='btn-showtime'>" . formatTime($showtime['showtime']) ."</button></a>";
                };
              echo "</div>";
            };
          };
        };

        echo "
      </div>

    </div>";
    }
  }
  
  echo "</div>";
}

function formatTime($showtime) {
	$dateTime = new DateTime($showtime);
	$formattedTime = $dateTime->format('g:i A'); // 'g' for 12-hour format, 'A' for AM/PM

	return $formattedTime; 
};

function formatDay($showtime) {
	$dateTime = new DateTime($showtime);
	$formattedDay = $dateTime->format('D, d M Y'); // 'g' for 12-hour format, 'A' for AM/PM

	return $formattedDay; 
};


?>