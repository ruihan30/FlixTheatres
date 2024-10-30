<?php 
  $datesArray = [];
  $today = new DateTime();
  
  for ($i = 0; $i < 7; $i++) {
    $currentDate = clone $today;
    $currentDate->modify("+$i day");

    $date = $currentDate->format('d'); 
    $month = $currentDate->format('F'); 
    $dayOfWeek = $currentDate->format('D'); 

    // Save to the array
    $datesArray[] = [
      'date' => $date,
      'month' => $month,
      'day_of_week' => $dayOfWeek,
      'full_date' => $currentDate->format('Y-m-d') 
    ];
  }
  
  foreach($datesArray as $index => $date) {
    echo "
      <div>
        <div class='date-container";  
          if ($index != 0) { echo " disabled";}
        echo "'>
          <div class='date'>
            <h3>{$date['date']}</h3>
            <p>{$date['month']}</p>
          </div>
          <p class='date-day'>{$date['day_of_week']}</p>
        </div>";

        foreach ($movie_details[$title]['showtimes'] as $showtime_date => $locations) {
          if ($showtime_date == $date['full_date']) {
            foreach ($locations as $location_name => $showtimes) {
              echo "
              <div class='d-flex flex-column justify-content-center showtimes ". str_replace(' ', '_', $location_name) . "'>";
                foreach ($showtimes as $showtime_list => $showtime) {
                  echo "<a href='booking_1.php?title=". urlencode($title) . "&cinema=" . urlencode($location_name) . 
                  "&date=" . urlencode(formatDay($showtime['showtime'])) . "&time=" . urlencode(formatTime($showtime['showtime'])) . "'>
                  <button class='btn-showtime'>" . formatTime($showtime['showtime']) ."</button></a>";
                };
              echo "</div>";
            };
          };
        };
      echo "</div>";
  };

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