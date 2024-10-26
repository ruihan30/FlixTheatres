<?php
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

  echo "<div id='movieList'>";

  foreach ($movies as $movie_card) {
    echo "
    <div class='d-flex flex-column movie-card'>
      <div class='movie-card-img'> <img src='{$movie_card['poster_url']}' alt='{$movie_card['title']}'> </div>

      <div class='d-flex flex-column movie-details'>
        <div class='d-flex flex-column' style='gap: 4px; width: 100%; flex-grow: 1;'> 
          <p class='movie-title'> {$movie_card['title']} </p>
          <div class='d-flex flex-row' style='gap: 16px;'>
            <p><span> {$movie_card['genre1']} </span>";
              if ($movie_card['genre2']) { echo " | ";};
            echo "<span> {$movie_card['genre2']} </span></p>
            <p>•</p>
            <p>".calc($movie_card['duration'])."</p>
          </div>
          <div class='d-flex flex-row' style='gap: 2px;'>";

          printRating($movie_card['rating']);

          echo "</div>
        </div>
          
        <div class='d-flex flex-row align-items-center' style='gap: 8px; width: 100%;'>
          <div class='pg-rating " . strtolower($movie_card['content_rating']) . "'> {$movie_card['content_rating']} </div>
          <p class='pg-description'> {$movie_card['content_rating_description']} </p>
        </div>

        <button class='btn-primary btn-md' style='background-color: var(--primary-color-purple); color: var(--off-white);'>Book Now</button>
      </div>
    </div>";
  };


  echo "</div>";

  $result->free();
  $conn->close();

?>