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
	<?php $title = $_GET['title']; $cinema = $_GET['cinema']; $date = $_GET['date']; $time = $_GET['time'];
		// Establish connection
		@$conn = new mysqli('localhost', 'root', '', 'flix_theatres');

		// Check connection
		if (mysqli_connect_errno()) {
			echo 'Error: Could not connect to database.  Please try again later.';
			exit;
		}?>
	<?php include 'php_files/get_booking_movie.php'; ?>
	<script>
		function setCinemaData(data) {
      window.cinemaData = data; // Assign to global variable
    }

    setCinemaData(<?php echo $cinemaDataJson; ?>); // Get the cinema data from PHP
	</script>

  <script src="https://unpkg.com/lenis@1.1.14/dist/lenis.min.js"></script> 
  <script defer src="general_script.js"></script>
	<script defer src="scripts/cinema_data.js"></script>
</head>

<?php 

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
				<a href="index.html"><img src="assets/flix-logo.svg" alt="Flix Theatres"></a>
				<ul class="d-flex flex-row">
					<li><a href="">All Movies</a></li>
					<li><a href="">Cinemas</a></li>
				</ul>
			</div>
			<a href=""><button class="d-flex flex-row btn-primary btn-lg">Book Tickets<i class='bx bxs-chevron-down icon'></i></button></a>
		</nav>
	</div>

	<!-- Movie Details -->
	<div class="container d-flex flex-row" style="gap: 20px; margin: 20px 0px 72px 0px;">

		<!-- Maybe session for timing -->
		<!-- Left -->
		<div style="width: calc(33% - 20px);">
			<?php echo "<img src='{$poster_url}' alt='{$title}' class='booking_poster'>"; ?>
		</div>

		<!-- Right -->
		<div class="d-flex flex-column" style="gap: 48px; flex-grow: 1;">

			<!-- Steps -->
			<div class="steps">
				<div class="d-flex flex-column align-items-center" style="gap: 12px;">
					<div class="number-field d-flex align-items-center justify-content-center" style="background-color: var(--off-white); color: var(--bg-color-black)">1</div>
					<p>Choose your seats & add-ons</p>
				</div>
				<div class="d-flex flex-column align-items-center" style="gap: 12px;">
					<div class="number-field d-flex align-items-center justify-content-center" style="background-color: var(--bg-color-black); border: 1px solid var(--off-white);">2</div>
					<p>Confirm details</p>
				</div>
				<div class="d-flex flex-column align-items-center" style="gap: 12px;">
					<div class="number-field d-flex align-items-center justify-content-center" style="background-color: var(--bg-color-black); border: 1px solid var(--off-white);">3</div>
					<p>Complete Payment</p>
				</div>
				<div class="line"></div>
			</div>

			<!-- Movie details -->
			<div class="d-flex flex-column" style="gap: 36px; padding: 28px; border: 1px solid var(--border-color);">
				<h1><?php echo "{$title}"; ?></h1>
				<div class="d-flex flex-row" style="gap: 36px;">

					<?php 
						echo "
						<div class='d-flex flex-column' style='flex-grow: 1; flex-basis: 0; gap: 8px;'>
							<p style='color: var(--secondary-onblack-text-color);'>Cinema</p>
							<select class='booking-input' id='cinemaSelect'>
								<option value='{$cinema}'>{$cinema}</option>";
									foreach($cinemaData as $location => $data) {
										if ($location !== $cinema) {
											echo "<option value='{$location}'>{$location}</option>";
										};
									};
								echo "
								</select>
						</div>

						<div class='d-flex flex-column' style='flex-grow: 1; flex-basis: 0; gap: 8px;'>
							<p style='color: var(--secondary-onblack-text-color);'>Date</p>
							<select class='booking-input' id='dateSelect'>
								<option value=''>{$date}</option>
							</select>
						</div>

						<div class='d-flex flex-column' style='flex-grow: 1; flex-basis: 0; gap: 8px;'>
							<p style='color: var(--secondary-onblack-text-color);'>Time</p>
							<select class='booking-input' id='timeSelect'>
								<option value=''>{$time}</option>
							</select>
						</div>";
					?>
					
				</div>
			</div>

			<!-- Seating -->
			<div class="d-flex flex-column align-items-center" style="gap: 20px;">
				<img src="assets/screen_exit.svg" alt="screen">
				<div id="cinema-seating"></div>
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

			<!-- Pricing -->
			<div class="d-flex flex-column" style="gap: 20px;">
				<div class="d-flex flex-row align-items-center" style="flex-grow: 1; gap: 24px;">
					<p style="color: var(--secondary-onblack-text-color);">Select Ticket Type:</p>
					<select class="booking-input" id="">
						<option value="">$19.50 - Standard Ticket</option>
						<option value="">FT </option>
						<option value="">FT </option>
						<option value="">FT </option>
					</select>
					<button class="btn-secondary btn-md" style="border: 1px solid var(--off-white); font-weight: var(--font-weight-regular); width: 180px;">Clear All</button>
				</div>
				<!-- Table for pricing -->
				<div id="price-table">
					<table style="border: 0">
						<tr>
							<th>Ticket Type</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total Amount</th>
						</tr>
						<tr>
							<td>$19.50 - Standard Ticket</td>
							<td>S$19.50</td>
							<td>1</td>
							<td>S$19.50</td>
						</tr>
						<tr>
							<td>Convenience Fee</td>
							<td>S$2.00</td>
							<td>1</td>
							<td>S$2.00</td>
						</tr>
					</table>
				</div>
				
			</div>

			<!-- Add-ons -->
			<div class="d-flex flex-column" style="gap: 12px;">
				<h2 style="align-self: start;">Choose your add-ons:</h2>
				<div class="d-flex flex-row" style="gap: 20px;">
					<div class="d-flex flex-column" style="gap: 16px;">
						<img src="assets/regular-combo.png" alt="combo" style="border: 1px solid var(--border-color);">
						<div style="text-align: center">
							<p>Regular Popcorn Combo</p>
							<p>$8.50</p>
						</div>
						<div class="d-flex flex-row align-items-center justify-content-center" style="gap: 16px;">
							<button class="integer-btn" onclick="decreaseValue('regular_combo')"><i class='bx bx-minus icon'></i></button>
							<input type="number" id="regular_combo" class="number-field" value="0" readonly>
							<button class="integer-btn" onclick="increaseValue('regular_combo')"><i class='bx bx-plus icon'></i></button>
						</div>
					</div>

					<div class="d-flex flex-column" style="gap: 16px;">
						<img src="assets/large-combo.png" alt="combo" style="border: 1px solid var(--border-color);">
						<div style="text-align: center">
							<p>Large Popcorn Combo</p>
							<p>$8.50</p>
						</div>
						<div class="d-flex flex-row align-items-center justify-content-center" style="gap: 16px;">
							<button class="integer-btn" onclick="decreaseValue('large_combo')"><i class='bx bx-minus icon'></i></button>
							<input type="number" id="large_combo" class="number-field" value="0" readonly>
							<button class="integer-btn" onclick="increaseValue('large_combo')"><i class='bx bx-plus icon'></i></button>
						</div>
					</div>
				</div>
			</div>

			<!-- Buttons -->
			<div class="d-flex flex-row" style="gap: 16px;">
				<a href="" style="width: 100%;"><button class="d-flex flex-row btn-primary btn-lg justify-content-center" style="background-color: var(--primary-color-purple); color: var(--off-white); width: 100%;"
					>Next Step<i class='bx bx-right-arrow-circle icon' style="font-size: 24px;"></i></button></a>
			</div>
		</div>

	</div>

	
	<!-- Footer -->
	<footer>
		<div class="container d-flex flex-column">
			<div class="container footer-wrapper">
				<div>
					<img src="assets/flix-logo.svg" alt="Flix Theatres" height="66px">
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
						<a href="">Home</a>
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