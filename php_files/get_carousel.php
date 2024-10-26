<?php
// Establish connection
@$conn = new mysqli('localhost', 'root', '', 'flix_theatres');

// Check connection
if (mysqli_connect_errno()) {
  echo 'Error: Could not connect to database.  Please try again later.';
  exit;
}

// Query to fetch movies
$query = 'SELECT * FROM movies';
$result = $conn->query($query);

// Save SQL query result in array
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $movies[] = [
      'movie_id' => $row['movie_id'],
      'title' => $row['title'],
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
};

function calc($duration) {
  $hours = floor($duration / 60);
  $min = $duration % 60;
  return "{$hours}h {$min}min";
};

echo "
  <div class='carousel'>
    <div class='carousel-track-container'>
      <ul class='carousel-track'>";

foreach ($movies as $key => $movie_card) {
  if ($key === 0) {
    echo "<li class='carousel-slide current-slide'>";
  } else {
    echo "<li class='carousel-slide'>";
  }

  echo "
          <div class='carousel-overlay-y'></div>
          <div class='carousel-overlay-x1'></div>
          <div class='carousel-overlay-x2'></div>
          <img src='{$movie_card['banner_url']}' alt='{$movie_card['title']}'>
          <div class='d-flex flex-column justify-content-center carousel-info'>
            <h1>{$movie_card['title']}</h1>
            <div class='d-flex flex-row' style='gap: 12px; flex-wrap: wrap;'>
              <p><span>{$movie_card['genre1']}</span>";
                if ($movie_card['genre2']) { echo " | ";};
                echo "<span>{$movie_card['genre2']}</span></p>
              <p>•</p>
              <p>";
                echo calc($movie_card['duration']);
              echo "</p>
            </div>
            <div class='d-flex flex-row align-items-center' style='justify-content: space-between; padding: 0px 8px;'>
              <a href='{$movie_card['trailer_link']}' target='_blank'><div class='d-flex flex-row align-items-center' style='gap: 16px;'><i class='bx bx-play icon'></i>Trailer</div></a>
              <a href='showtime.php?title=". urlencode($movie_card['title']) . "'><button class='btn-primary btn-md'>Showtimes</button></a>
            </div>
          </div>
        </li>
      ";
}

echo "
      </ul>
    </div>
    <button class='carousel-button' id='prevButton' style='left: 10px;'><i class='bx bxs-chevron-left icon'></i></button>
    <button class='carousel-button' id='nextButton' style='right: 10px;'><i class='bx bxs-chevron-right icon'></i></button>
  </div>";

?>