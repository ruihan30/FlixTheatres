<?php 
$title = $_GET['title'];

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
JOIN showtimes s ON m.movie_id = s.movie_id
JOIN cinema_halls c ON c.hall_id = s.hall_id
WHERE title = '" . $title . "'";
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

echo "<pre>"; 
print_r($movie_details); 
echo "</pre>";

echo "
  <div class='container d-flex flex-row' style='gap: 12px;'>";

  foreach ($movie_details as $title => $details) {
    echo "
      <img class='showtime-movie-poster' src='{$details['poster_url']}' alt='{$title}'>

      <div class='d-flex flex-column showtime-movie-details'>
        <h1>{$title}</h1>
        <div class='d-flex flex-row' style='gap: 32px;'>
          <div class='d-flex flex-row' style='gap: 2px; font-size: 28px;'>";
            printRating($details['rating']);
          echo "</div>
          <div class='d-flex flex-row align-items-center' style='gap: 8px; width: 100%;'>
            <div class='pg-rating " . strtolower($details['content_rating']) . "'> {$details['content_rating']} </div>
            <p class='pg-description'>{$details['content_rating_description']}</p>
          </div>
        </div>
        <div class='d-flex flex-row align-items-center' style='gap: 12px;'>
          <p>Available in: </p>";
            cinemaTypes($details['showtimes']);            
          echo "</div>
        <a href='{$details['trailer_link']}' target='_blank'><div class='d-flex flex-row align-items-center' style='gap: 16px; align-self: center; padding: 8px 0px;'><i class='bx bx-play icon'></i>Watch the trailer</div></a>
        <div class='d-flex flex-column' style='gap: 8px; flex-grow: 1; '>
          <p style='font-size: var(--font-size-sm-16); color: var(--off-white);'>Synopsis</p>
          <p style='font-size: var(--font-size-sm-16); flex-grow: 1;'>{$details['synopsis']}</p>
        </div>
      </div>

      <div class='d-flex flex-column showtime-movie-moreDetails'>
        <div class='d-flex flex-column' style='gap: 12px;'>
          <div class='d-flex flex-column' style='gap: 4px;'>
            <p style='color: var(--secondary-onblack-text-color);'>Genre:</p>
            <p style='font-size: var(--font-size-md-20);'><span>{$details['genre1']}</span>";
              if ($details['genre2']) { echo " | ";};
            echo "<span>{$details['genre2']}</span></p>
          </div>
          <div class='d-flex flex-column' style='gap: 4px;'>
            <p style='color: var(--secondary-onblack-text-color);'>Duration:</p>
            <p style='font-size: var(--font-size-md-20);'>";
              echo calc($details['duration']);
            echo "</p>
          </div>
          <div class='d-flex flex-column' style='gap: 4px;'>
            <p style='color: var(--secondary-onblack-text-color);'>Language:</p>
            <p style='font-size: var(--font-size-md-20);'>{$details['language']}</p>
          </div>
        </div>

        <div class='d-flex flex-column' style='gap: 12px;'>
          <div class='d-flex flex-column' style='gap: 4px;'>
            <p style='color: var(--secondary-onblack-text-color);'>Directed by:</p>
            <p style='font-size: var(--font-size-md-20);'>{$details['director']}</p>
          </div>
          <div class='d-flex flex-column' style='gap: 4px;'>
            <p style='color: var(--secondary-onblack-text-color);'>Cast:</p>
            <p style='font-size: var(--font-size-md-20);'>{$details['casts']}</p>
          </div>
        </div>
      </div>";
  }

	echo "</div>";

  function printRating($rating) {
    for ($i = floor($rating); $i >= 1; $i--) {
      echo "<i class='bx bxs-star icon'></i>";
    };
  
    if (($rating - floor($rating)) >= 0.5) {
      echo "<i class='bx bxs-star-half icon'></i>";
      $remainingStars = 4 - floor($rating);
    } else {
      $remainingStars = 5 - floor($rating);
    };
  
    for ($i = 0; $i < $remainingStars; $i++) {
      echo "<i class='bx bx-star icon'></i>";
    }
  };
  
  function calc($duration) {
    $hours = floor($duration / 60);
    $min = $duration % 60;
    return "{$hours}h {$min}min";
  };

  function cinemaTypes($showtimes) {
    $found_cinema_types = [
      'IMAX' => false,
      'Premiere' => false
    ];

    // Check if the movie has showtimes
    if ($showtimes) {
      foreach ($showtimes as $showtime_date => $locations) {
        foreach ($locations as $location_name => $showtime) {
          // Check each showtime for the specified cinema type
          foreach ($showtime as $each_showtime) {
            if ($each_showtime['cinema_type'] === 'IMAX' && !$found_cinema_types['IMAX']) {
              echo "<img src='assets/cinema-types/imax-white.svg' alt='imax'>";
              $found_cinema_types['IMAX'] = true;
            }
            if ($each_showtime['cinema_type'] === 'IMAX'  && !$found_cinema_types['Premiere']) {
              echo "<img src='assets/cinema-types/premiere-white.svg' alt='premiere'>";
              $found_cinema_types['Premiere'] = true;
            }
          }
        }
      }
    }
  };
?>