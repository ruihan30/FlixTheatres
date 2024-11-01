<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Flix Theatres</title>
  <meta charset="utf-8">
	<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Outfit:400,500,600,700">
  <link rel="stylesheet" href="common_styles.css">
  <link rel="icon" href="assets/flix-favicon.svg" type="image/svg">
  <link rel="stylesheet" href="https://unpkg.com/lenis@1.1.13/dist/lenis.css">

  <script src="https://unpkg.com/lenis@1.1.14/dist/lenis.min.js"></script> 
  <script defer src="general_script.js"></script>
</head>

<?php 

// Establish connection
@$conn = new mysqli('localhost', 'root', '', 'flix_theatres');

// Check connection
if (mysqli_connect_errno()) {
	echo 'Error: Could not connect to database.  Please try again later.';
	exit;
}

$selected_seats_qty = 0;

session_start(); 
if(isset($_SESSION['title'])) {
	$title = $_SESSION['title'];
	$cinema = $_SESSION['cinema'];
	$date = $_SESSION['date'];
	$time = $_SESSION['time'];

	$combinedString = "$date, $time";
	$dateTime = DateTime::createFromFormat('D, d M Y, h:i A', $combinedString);
	$showtime = $dateTime -> format('Y-m-d H:i:s');

	$selected_seats = $_SESSION['selected_seats'];
	$selected_combos = $_SESSION['selected_combos'];
	$total_price = $_SESSION['total_price']; 

	// Get price for each food combo
	if (!empty($selected_combos)) {
		foreach($selected_combos as $index => $combo) {
			$query = "SELECT price FROM food_combos WHERE combo_name = '" . $combo['name'] . "'";
			$result = $conn->query($query);

			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$selected_combos[$index]['sub-price'] = $row['price'] * $combo['quantity'];
			};
		}
	}
	
	// Calculate number of seats
	foreach($selected_seats as $seats) {
		$selected_seats_qty += 1;
	}
}

$name = $_POST['name'];
$email = $_POST['email']; 
$contact = $_POST['contact'];

if(!empty($_SESSION)) {
	// Insert into bookings table
	$query = 
	"INSERT INTO bookings (movie_id, hall_id, showtime_id, booking_time, total_price, customer_name, email, contact_number)
	SELECT m.movie_id, c.hall_id, s.showtime_id, NOW(), {$total_price}, '{$name}', '{$email}', '{$contact}'
	FROM movies m
	JOIN cinema_halls c ON c.location_name = '{$cinema}'
	JOIN showtimes s ON s.showtime = '{$showtime}'
	WHERE m.title = '{$title}';";
	$result = $conn->query($query);

	$booking_id = $conn->insert_id; 

	// Insert into tickets_ordered table
	$query = 
	"INSERT INTO tickets_ordered (movie_id, quantity, price, booking_id)
	SELECT m.movie_id, {$selected_seats_qty}, 19.50, {$booking_id}
	FROM movies m
	WHERE m.title = '{$title}'";
	$result = $conn->query($query);

	// Insert into combos_ordered table
	if (!empty($selected_combos)) {
		foreach($selected_combos as $index => $combo) {
			$query = 
			"INSERT INTO food_combos_ordered (combo_id, sub_price, quantity, booking_id)
			SELECT fc.combo_id, {$combo['sub-price']}, {$combo['quantity']}, {$booking_id} 
			FROM food_combos fc
			WHERE fc.combo_name = '{$combo['name']}'";
			$result = $conn->query($query);
		}
	}

	// Update seats availability
	foreach($selected_seats as $index => $seat) {
		$query = 
		"UPDATE seats s
		SET s.is_available = 0, s.booking_id = {$booking_id}
		WHERE s.seat_number = '{$seat}'
		AND s.hall_id = (SELECT c.hall_id FROM cinema_halls c WHERE c.location_name = '{$cinema}')
		AND s.showtime_id = (SELECT sh.showtime_id FROM showtimes sh WHERE sh.showtime = '{$showtime}');";
		$result = $conn->query($query);
	}
}

include 'php_files/email_confirmation.php';

session_unset();
session_destroy();

?>

<body>

	<!-- Navbar -->
	<div class="d-flex justify-content-center navbar-wrapper">
		<nav id="navbar" class="container d-flex flex-row">
			<div class="d-flex flex-row align-items-center nav-items">
				<a href="index.php"><img src="assets/flix-logo.svg" alt="Flix Theatres"></a>
				<ul class="d-flex flex-row">
					<a href="all_movies.php"><li>All Movies</li></a>
					<a href="cinemas.php"><li>Cinemas</li></a>
				</ul>
			</div>
		</nav>
	</div>

	<!-- Movie Details -->
	<div class="container d-flex flex-column" style="gap: 52px; margin: 20px 0px 72px 0px; width: 780px;">

		<!-- Steps -->
		<div class="steps">
			<div class="d-flex flex-column align-items-center" style="gap: 12px;">
				<div class="number-field d-flex align-items-center justify-content-center" style="background-color: var(--off-white); color: var(--bg-color-black)">
					<i class='bx bx-check icon' style="font-size: 32px;"></i>
				</div>
				<p>Choose your seats & add-ons</p>
			</div>
			<div class="d-flex flex-column align-items-center" style="gap: 12px;">
				<div class="number-field d-flex align-items-center justify-content-center" style="background-color: var(--off-white); color: var(--bg-color-black)">
					<i class='bx bx-check icon' style="font-size: 32px;"></i>
				</div>
				<p>Confirm details</p>
			</div>
			<div class="d-flex flex-column align-items-center" style="gap: 12px;">
				<div class="number-field d-flex align-items-center justify-content-center" style="background-color: var(--off-white); color: var(--bg-color-black)">3</div>
				<p>Complete Payment</p>
			</div>
			<div class="line"></div>
			<div class="line" style="width: 30%; border-top: 2px solid var(--off-white); left: 33%;"></div>
		</div>

		<!-- Confirmation -->
		<div class="d-flex flex-column align-items-center" style="gap: 40px;">
			<div class="d-flex justify-content-center align-items-center" style="width: 180px; height: 180px; border: 1px solid #6e6e6e;">
				<i class='bx bx-check-circle icon' style="font-size: 120px;"></i>
			</div>

			<!-- Message -->
			<div class="d-flex flex-column msg">
				<h2 style="color: var(--bg-color-black); align-self: start;">Thank you for your purchase!</h2>
				<p>Your movie tickets have been <span style="color: var(--success-color);">successfully booked.</span><br><br>
				A confirmation email with your ticket details and payment information has been sent to your email address. Please scan the QR code sent to your email at the usher for entry.</p>
				<div class="decoration-box"></div>
			</div>

			<div class="d-flex flex-row align-items-center" style="gap: 32px;">
				<hr style="width: 200px; height: 4px; background-color: var(--off-white);">
				<h2>Enjoy the show!</h2>
				<hr style="width: 200px; height: 4px; background-color: var(--off-white);">
			</div>
		</div>
		
		<!-- Buttons -->
		<div class="d-flex flex-row" style="gap: 16px;">
			<a href="all_movies.php" style="width: 100%;"><button class="d-flex flex-row btn-secondary btn-lg justify-content-center" style="width: 100%; cursor: pointer;"
				><i class='bx bx-movie-play icon' style="font-size: 24px;"></i>Discover more movies</button></a>
			<a href="index.php" style="width: 100%;"><button class="d-flex flex-row btn-primary btn-lg justify-content-center" style="background-color: var(--primary-color-purple); color: var(--off-white); width: 100%;"
				><i class='bx bx-home-smile icon' style="font-size: 24px;"></i>Back to Home</button></a>
		</div>

	</div>

	
	<!-- Footer -->
	<footer>
		<div class="container d-flex flex-column">
			<div class="container footer-wrapper">
				<div>
					<a href="index.php"><img src="assets/flix-logo.svg" alt="Flix Theatres" height="66px"></a>
				</div>
				<div class="d-flex flex-column" style="gap:20px;">
					<p class="footer-header">Follow Us</p>
					<div class="d-flex flex-row" style="gap:12px;">
						<a href=""><i class='bx bxl-facebook-square icon'></i></a>
						<a href=""><i class='bx bxl-instagram-alt icon'></i></a>
						<a href=""><i class='bx bxl-twitter icon'></i></a>
					</div>
				</div>
				<div class="d-flex flex-column" style="gap:20px;">
					<p class="footer-header">Download our App</p>
					<div class="d-flex flex-column" style="gap:12px;">
						<img src="assets/footer/download-apple.png" alt="download" width="140px">
						<img src="assets/footer/download-google.png" alt="download" width="140px">
					</div>
				</div>
				<div class="d-flex flex-column" style="gap:20px;">
					<p class="footer-header">Information</p>
					<div class="footer-links">
						<a href="index.php">Home</a>
						<a href="">Privacy Policy</a>
						<a href="">About Flix</a>
						<a href="">Terms of Service</a>
						<a href="">Careers</a>
						<a href="">Contact Us</a>
					</div>
				</div>
			</div>

			<div class="copyright">
				Copyright &copy 2024 Flix Theatres Pte. Ltd. All rights reserved.
			</div>
		</div>
	</footer>
</body>

</html>