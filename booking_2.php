<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Confirm your booking details - Flix Theatres Booking</title>
  <meta charset="utf-8">
	<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Outfit:400,500,600,700">
  <link rel="stylesheet" href="common_styles.css">
  <link rel="icon" href="assets/flix-favicon.svg" type="image/svg">

  <script defer src="general_script.js"></script>
	<script defer src="scripts/payment_details_validation.js"></script>
</head>

<?php 

// Get variables from session
session_start(); 
if(isset($_SESSION['title'])) {
	$title = $_SESSION['title'];
	$cinema = $_SESSION['cinema'];
	$date = $_SESSION['date'];
	$time = $_SESSION['time'];

	$combinedString = "$date, $time";
	$dateTime = DateTime::createFromFormat('D, d M Y, h:i A', $combinedString);
	$showtime = $dateTime -> format('Y-m-d H:i:s');
} 

$selected_seats = $_SESSION['selected_seats'];
$selected_combos = $_SESSION['selected_combos'];

// Establish connection
@$conn = new mysqli('localhost', 'root', '', 'flix_theatres');

// Check connection
if (mysqli_connect_errno()) {
	echo 'Error: Could not connect to database.  Please try again later.';
	exit;
}

// Query to fetch movie poster
$query = "SELECT poster_url FROM movies m WHERE title = '" . $title . "'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
	$row = $result->fetch_assoc();
	$poster_url = $row['poster_url'];
};


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
	<div class="container d-flex flex-row" style="gap: 20px; margin: 20px 0px 72px 0px;">

		<!-- Left -->
		<div style="width: 360px;">
			<?php echo "<img src='{$poster_url}' alt='{$title}' class='booking_poster'>"; ?>
		</div>

		<!-- Right -->
		<div class="d-flex flex-column" style="gap: 48px; flex-grow: 1;">

			<!-- Steps -->
			<div class="steps">
				<div class="d-flex flex-column align-items-center" style="gap: 12px;">
					<div class="number-field d-flex align-items-center justify-content-center" style="background-color: var(--off-white); color: var(--bg-color-black)">
						<i class='bx bx-check icon' style="font-size: 32px;"></i>
					</div>
					<p>Choose your seats & add-ons</p>
				</div>
				<div class="d-flex flex-column align-items-center" style="gap: 12px;">
					<div class="number-field d-flex align-items-center justify-content-center" style="background-color: var(--off-white); color: var(--bg-color-black)">2</div>
					<p>Confirm details</p>
				</div>
				<div class="d-flex flex-column align-items-center" style="gap: 12px;">
					<div class="number-field d-flex align-items-center justify-content-center" style="background-color: var(--bg-color-black); border: 1px solid var(--off-white);">3</div>
					<p>Complete Payment</p>
				</div>
				<div class="line"></div>
				<div class="line" style="width: 30%; border-top: 2px solid var(--off-white); left: 33%;"></div>
			</div>

			<!-- Movie details -->
			<div class="d-flex flex-column" style="gap: 36px; padding: 28px; border: 1px solid var(--border-color);">
				<h1><?php echo "{$title}"; ?></h1>
				<div class="d-flex flex-row" style="gap: 36px;">

					<!-- Display booking information -->
					<?php 
						echo "
						<div class='d-flex flex-column' style='flex-grow: 1; flex-basis: 0; gap: 8px;'>
							<p style='color: var(--secondary-onblack-text-color);'>Cinema</p>
							<div class='d-flex flex-row booking-display'>{$cinema}</div>
						</div>

						<div class='d-flex flex-column' style='flex-grow: 1; flex-basis: 0; gap: 8px;'>
							<p style='color: var(--secondary-onblack-text-color);'>Date</p>
							<div class='d-flex flex-row booking-display'>{$date}</div>
						</div>

						<div class='d-flex flex-column' style='flex-grow: 1; flex-basis: 0; gap: 8px;'>
							<p style='color: var(--secondary-onblack-text-color);'>Time</p>
							<div class='d-flex flex-row booking-display'>{$time}</div>
						</div>";
					?>
					
				</div>

				<!-- Seating -->
				<div class="d-flex flex-column align-items-center" style="gap: 20px;">
					<img src="assets/screen_exit.svg" alt="screen">

					<div id="cinema-seating">
						<div class="seat-letters"><p>A</p><p>B</p><p>C</p><p>D</p><p>E</p><p>F</p><p>G</p></div>
						<div class="seat-letters" style="right: -40px; left: auto;"><p>A</p><p>B</p><p>C</p><p>D</p><p>E</p><p>F</p><p>G</p></div>
						<?php include 'php_files/get_selected_seats.php'; ?>
					</div>

					<!-- Legend -->
					<div class="d-flex flex-column" style="gap: 16px;"> 
						<div class="decorative-header" style="width:180px; padding:8px 0px;">
							<h2 style="font-size: var(--font-size-md-20); font-weight: var(--font-weight-medium);">Legend</h2>
						</div>
						<div class="d-flex flex-row" style="gap: 28px;">
							<div class="d-flex flex-row" style="gap: 12px;">
								<img src="assets/cinema-seating/available-seat.svg" alt="seat">
								<p>Available</p>
							</div>
							<div class="d-flex flex-row" style="gap: 12px;">
								<img src="assets/cinema-seating/selected-seat.svg" alt="seat">
								<p>Selected</p>
							</div>
							<div class="d-flex flex-row" style="gap: 12px;">
								<img src="assets/cinema-seating/unavailable-seat.svg" alt="seat">
								<p>Unavailable</p>
							</div>
							<div class="d-flex flex-row" style="gap: 12px;">
								<img src="assets/cinema-seating/wheelchair-seat.svg" alt="seat">
								<p>Wheelchair Accessible</p>
							</div>
						</div>
					</div>
				</div>

				<!-- Table for pricing -->
				<div id="price-table" style="display: block;">
					<table style="border: 0">
						<tr>
							<th>Ticket Type</th>
							<th>Quantity</th>
							<th>Price</th>
						</tr>
						<tr class="disabled">
							<td>Standard Ticket</td>
							<?php
								$total_price = 2;
								$seats_qty = 0;
								foreach ($selected_seats as $index => $seat) {
									$seats_qty += 1;
								} 
								$total_price += 19.50 * $seats_qty;
								echo "
									<td>{$seats_qty}</td>
									<td>S$" . number_format(19.50 * $seats_qty, 2) . "</td>";
							?>
						</tr>
						<tr class="disabled">
							<td>Convenience Fee</td>
							<td>1</td>
							<td>S$2.00</td>
						</tr>
						<?php 
							foreach($selected_combos as $combo) {
								$query = "SELECT price FROM food_combos WHERE combo_name = '" . $combo['name'] . "'";
								$result = $conn->query($query);

								if ($result->num_rows > 0) {
									$row = $result->fetch_assoc();
									$combo_price = $row['price'];
								};

								$total_price += $combo_price * $combo['quantity'];

								echo "
									<tr class='disabled'>
										<td>{$combo['name']}</td>
										<td>{$combo['quantity']}</td>
										<td>S$" . number_format($combo_price * $combo['quantity'], 2) . "</td>
									</tr>";
							}
							$_SESSION['total_price'] = $total_price;
						?>
						<tr><td></td></tr>
						<tr>
							<td colspan="2" style="border-top: 0.5px solid var(--secondary-onwhite-text-color); font-weight: var(--font-weight-medium);">Payable Amount</td>
							<td style="border-top: 0.5px solid var(--secondary-onwhite-text-color); font-weight: var(--font-weight-medium);">
								<?php echo "S$" . number_format($total_price, 2);?>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<!-- Payment info and method -->
			<div class="d-flex flex-column" style="gap: 48px; width: 800px;">
				<div class="d-flex flex-column" style="gap: 8px;">
					<h2 style="align-self: start;" >Enter your personal details</h2>
					<p style="color: var(--secondary-onblack-text-color);">The information you provide will be used to contact you about your tickets and to send a confirmation email for your payment.</p>
				</div>

				<!-- Inputs -->
				<form action="booking_3.php" method="post" class="d-flex flex-column" style="gap: 48px;" onsubmit="return validateForm()">
				<div class="d-flex flex-column personal-details">

					<div class="d-flex flex-column" style="gap: 8px;">
						<div style="width: 100%;">
							<label for="name">* Name:</label>
							<input type="text" id="name" name="name" required placeholder="Alex Tan" oninput="chkName(event)">
						</div>
						<span class="errorMessage" id="nameError"></span>
					</div>

					<div class="d-flex flex-column" style="gap: 8px;">
						<div style="width: 100%;">
							<label for="email">* Email:</label>
							<input type="email" id="email" name="email" required placeholder="abc@email.com" oninput="chkEmail(event)">
						</div>
						<span class="errorMessage" id="emailError"></span>
					</div>

					<div class="d-flex flex-column" style="gap: 8px;">
						<div style="width: 100%;">
							<label for="contact">Contact Number:</label>
							<input type="number" id="contact" name="contact" required pattern="[0-9]{8,15}" placeholder="1234 5678" oninput="chkContactNumber(event)">
						</div>
						<span class="errorMessage" id="contactNumberError"></span>
					</div>
				
				</div>

				<!-- Payment methods -->
				<div class="d-flex flex-column" style="gap: 20px;">
					<h2 style="align-self: start; font-size: var(--font-size-lg-24);" >Select your payment method</h2>
					<div class="d-flex flex-row" style="flex-wrap: wrap; gap:20px; row-gap: 40px;">

						<div class="radio-container">
							<input type="radio" id="credit-card" name="payment-method" class="custom-radio" required>
							<label for="credit-card" class="radio-square" style="background: url('assets/payment-methods/card.svg');">
								<i class='bx bx-radio-circle icon' style="font-size: 32px;"></i>
							</label>
							<label for="credit-card" class="custom-radio-label">Credit & Debit Card</label>
						</div>

						<div class="radio-container">
							<input type="radio" id="apple-pay" name="payment-method" class="custom-radio" required>
							<label for="apple-pay" class="radio-square" style="background: url('assets/payment-methods/apple-pay.svg');">
								<i class='bx bx-radio-circle icon' style="font-size: 32px;"></i>
							</label>
							<label for="apple-pay" class="custom-radio-label">Apple Pay</label>
						</div>

						<div class="radio-container">
							<input type="radio" id="google-pay" name="payment-method" class="custom-radio" required>
							<label for="google-pay" class="radio-square" style="background: url('assets/payment-methods/google-pay.svg');">
								<i class='bx bx-radio-circle icon' style="font-size: 32px;"></i>
							</label>
							<label for="google-pay" class="custom-radio-label">Google Pay</label>
						</div>

						<div class="radio-container">
							<input type="radio" id="visa" name="payment-method" class="custom-radio" required>
							<label for="visa" class="radio-square" style="background: url('assets/payment-methods/visa.svg');">
								<i class='bx bx-radio-circle icon' style="font-size: 32px;"></i>
							</label>
							<label for="visa" class="custom-radio-label">VISA Mastercard</label>
						</div>

						<div class="radio-container">
							<input type="radio" id="paynow" name="payment-method" class="custom-radio" required>
							<label for="paynow" class="radio-square" style="background: url('assets/payment-methods/paynow.svg');">
								<i class='bx bx-radio-circle icon' style="font-size: 32px;"></i>
							</label>
							<label for="paynow" class="custom-radio-label">PayNow</label>
						</div>
					</div>
				</div>
				<div class="errorMessage" id="paymentMethodError"></div>

				<!-- Buttons -->
				<div class="d-flex flex-row" style="gap: 16px;">
					<a href="javascript:history.back()" style="width: 100%;"><button class="d-flex flex-row btn-secondary btn-lg justify-content-center" style="width: 100%;"
						><i class='bx bx-left-arrow-circle icon' style="font-size: 24px;"></i>Previous Step</button></a>
					<button type="submit" class="d-flex flex-row btn-coloured btn-lg justify-content-center align-items-center" style="width: 100%;"
						>Proceed to Pay<i class='bx bx-right-arrow-circle icon' style="font-size: 24px;"></i></button>
				</div>
				</form>
			</div>
			
		</div>

	</div>

	<script type="text/javascript" src="payment_details_node.js"></script>
	
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