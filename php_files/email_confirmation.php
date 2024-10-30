<?php
// customer details
$email = $_SESSION['email']; // email
$name = $_SESSION['name']; // name
$contact = $_SESSION['contact']; // contact number

// movie details
$time = $_SESSION['time']; // showtime
$date = $_SESSION['date']; // date of show
$movie = $_SESSION['movie']; // movie title
$cinema = $_SESSION['cinema']; // cinema location

// Retrieve the selected seats from the session
$selected_seats = $_SESSION['selected_seats']; // user selected seats
$selected_combos = $_SESSION['selected_combos']; // user selected food combo

// Format the selected seats as a comma-separated string
$selected_seats_string = implode(', ', $selected_seats); 

$to = $email; // set recipient
$subject = 'Ordered tickets successfully!'; // email subject
$message = "
Dear $name,

Thank you for your purchase of $movie tickets for $time on $date at $cinema.

Your seats: $selected_seats_string.

Your combo: $selected_combos.

We look forward to your visit at Flix Theatres. Have a nice day!

Best Regards,
Flix Theatres";

$headers = 'From: dg14@gmail.com' . "\r\n" .
    'Reply-To: dg14@gmail.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);


?>