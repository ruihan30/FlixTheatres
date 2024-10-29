<?php 

// Query to fetch movie poster
$query = 
"SELECT sts.seat_number, sts.seat_type, sts.is_available FROM seats sts 
JOIN cinema_halls c ON c.hall_id = sts.hall_id
JOIN showtimes s ON s.showtime_id = sts.showtime_id
JOIN movies m ON m.movie_id = s.movie_id
WHERE m.title = '" . $title . "' AND
s.showtime = '" . $showtime . "' AND
c.location_name = '" . $cinema . "'";
$result = $conn->query($query);

$seatsGrid = [];

foreach ($result as $row) {
  // Get the row and column identifiers from seat_number
  $rowId = strtoupper($row['seat_number'][0]); // A-G
  $colId = (int)$row['seat_number'][1]; // 1-9

  // Create the row if it doesn't exist
  if (!isset($seatsGrid[$rowId])) {
      $seatsGrid[$rowId] = [];
  }

  // Fill in the column with the seat data
  $seatsGrid[$rowId][$colId] = [
    'seat_type' => $row['seat_type'],
    'is_available' => $row['is_available']
  ];
}

foreach ($seatsGrid as $rows => $columns) {
  foreach ($columns as $column_num => $seat_details) {
    $type = $seat_details['seat_type'];
    $is_available = $seat_details['is_available'];
    $seat_id = $rows . $column_num;

    $is_selected = false;

    foreach ($selected_seats as $index => $seat) {
      if ($seat  == $seat_id) {
        $is_selected = true;
      }
    } 

    echo "<div class='seat' data-seat-id='$seat_id'>";
    if ($is_selected) {
      echo "<img src='assets/cinema-seating/selected-seat.svg'>";
    } else {
      if (($type == 'Standard') && ($is_available == '1')) {
        echo "<img src='assets/cinema-seating/available-seat.svg' data-original-src='assets/cinema-seating/available-seat.svg'>";
      } else if (($type == 'Standard') && ($is_available == '0')) {
        echo "<img src='assets/cinema-seating/unavailable-seat.svg' data-original-src='assets/cinema-seating/unavailable-seat.svg'>";
      } else if (($type == 'Wheelchair') && ($is_available == '1')){
        echo "<img src='assets/cinema-seating/wheelchair-seat.svg' data-original-src='assets/cinema-seating/wheelchair-seat.svg'>";
      } else if (($type == 'Wheelchair') && ($is_available == '0')) {
        echo "<img src='assets/cinema-seating/wheelchair-unavailable-seat.svg' data-original-src='assets/cinema-seating/wheelchair-unavailable-seat.svg'>";
      }
    }
    echo "</div>";
  }
}


// echo "<pre>"; 
// print_r($seatsGrid); 
// echo "</pre>";


// "SELECT sts.seat_number, sts.seat_type, sts.is_available FROM seats sts 
// JOIN cinema_halls c ON c.hall_id = sts.hall_id
// JOIN showtimes s ON s.showtime_id = sts.showtime_id
// JOIN movies m ON m.movie_id = s.movie_id
// WHERE m.title = 'Alien Romulus' AND
// s.showtime = '2024-10-26 19:30:00' AND
// c.location_name = 'FT Bishan'";




?>