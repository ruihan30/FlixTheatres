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

$seats = isset($data['seats']) ? $data['seats'] : [];
$combos = isset($data['combos']) ? $data['combos'] : [];

echo json_encode([
  'seats' => $seats,
  'combos' => $combos
]);

$_SESSION['selected_seats'] = $seats;
$_SESSION['selected_combos'] = $combos;

// selectedSeats = ["A1", "A2", "B1"];
// selectedCombos = [
//   { name: "Regular Combo", quantity: 1 },
//   { name: "Large Combo", quantity: 2 }
// ];

?>