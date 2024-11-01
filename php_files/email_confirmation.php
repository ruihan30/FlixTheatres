<?php
// customer details
$email = $_SESSION['email']; // email
$name = $_SESSION['name']; // name
$contact = $_SESSION['contact']; // contact number

// movie details
$time = $_SESSION['time']; // showtime
$date = $_SESSION['date']; // date of show
$title = $_SESSION['title']; // movie title
$cinema = $_SESSION['cinema']; // cinema location

// Retrieve the selected seats from the session
$selected_seats = $_SESSION['selected_seats']; // user selected seats

// Format the selected seats as a comma-separated string
$selected_seats_string = implode(', ', $selected_seats); 

$to = 'f31ee@localhost'; // set recipient
$subject = 'Ordered tickets successfully!'; // email subject
$message = "
Dear $name,

Thank you for your purchase of $title tickets for $time on $date at $cinema.

Your seats: $selected_seats_string.

We look forward to your visit at Flix Theatres. Have a nice day!

Best Regards,
Flix Theatres";

$headers = 'From: f32ee@localhost' . "\r\n" .
    'Reply-To: f32ee@localhost' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);


?>