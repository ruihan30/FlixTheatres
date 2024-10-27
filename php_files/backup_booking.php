<?php 
// Query to fetch showtime options
$query = 
"SELECT c.location_name, c.hall_name, DATE(s.showtime) AS showtime_date, TIME(s.showtime) AS showtime_time FROM movies m 
JOIN showtimes s ON m.movie_id = s.movie_id
JOIN cinema_halls c ON c.hall_id = s.hall_id
WHERE title = '" . $title . "'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    // Extract the relevant data
    $locationName = $row['location_name'];
    $showtimeDate = $row['showtime_date'];
    $showtimeTime = date('g:i A', strtotime($row['showtime_time'])); 

    // Structure the array
    if (!isset($cinemaData[$locationName])) {
      $cinemaData[$locationName] = ['dates' => []];
    }

    // If the date is not already set, initialize it
    if (!isset($cinemaData[$locationName]['dates'][$showtimeDate])) {
      $cinemaData[$locationName]['dates'][$showtimeDate] = [];
    }

    // Add the showtime
    $cinemaData[$locationName]['dates'][$showtimeDate][] = $showtimeTime;
  }
}

// echo "<pre>"; 
// print_r($cinemaData); 
// echo "</pre>";

$cinemaDataJson = json_encode($cinemaData);

// echo"
//   <div class='d-flex flex-column' style='gap: 36px; padding: 28px; border: 1px solid var(--border-color);'>
//     <h1>{$title}</h1>
//     <div class='d-flex flex-row' style='gap: 36px;'>

//       <div class='d-flex flex-column' style='flex-grow: 1; flex-basis: 0; gap: 8px;'>
//         <p style='color: var(--secondary-onblack-text-color);'>Cinema</p>
//         <select class='booking-input' id=''>
//           <option value=''>{$cinema}</option>
//           <option value=''>FT </option>
//           <option value=''>FT </option>
//           <option value=''>FT </option>
//         </select>
//       </div>

//       <div class='d-flex flex-column' style='flex-grow: 1; flex-basis: 0; gap: 8px;'>
//         <p style='color: var(--secondary-onblack-text-color);'>Date</p>
//         <select class='booking-input' id=''>
//           <option value=''>{$date}</option>
//           <option value=''>Flix Theatres</option>
//           <option value=''>Flix Theatres</option>
//           <option value=''>Flix Theatres</option>
//         </select>
//       </div>

//       <div class='d-flex flex-column' style='flex-grow: 1; flex-basis: 0; gap: 8px;'>
//         <p style='color: var(--secondary-onblack-text-color);'>Time</p>
//         <select class='booking-input' id=''>
//           <option value=''>{$time}</option>
//           <option value=''>Flix Theatres</option>
//           <option value=''>Flix Theatres</option>
//           <option value=''>Flix Theatres</option>
//         </select>
//       </div>
      
//     </div>
//   </div>";

?>