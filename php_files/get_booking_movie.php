<?php 
// Query to fetch seats
$query = "SELECT poster_url FROM movies m WHERE title = '" . $title . "'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
	$row = $result->fetch_assoc();
	$poster_url = $row['poster_url'];
};

?>