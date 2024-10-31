<?php 

session_start(); 
header('Content-Type: application/json');

// Get the incoming data
$data = json_decode(file_get_contents('php://input'), true);

if ($data === null) {
	// Handle the error - data could not be decoded
	echo json_encode(['error' => 'No data received or data could not be decoded']);
	exit;
}

$cinemas = isset($data['cinemas']) ? $data['cinemas'] : [];

// $_SESSION['cinemas'] = $cinemas;

echo json_encode([
	'cinemas' => $cinemas
]);

$_SESSION['cinemas'] = $cinemas;

?>