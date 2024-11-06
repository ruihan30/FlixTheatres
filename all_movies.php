<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>All Movies - Flix Theatres</title>
  <meta charset="utf-8">
	<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Outfit:400,500,600,700">
  <link rel="stylesheet" href="common_styles.css">
  <link rel="icon" href="assets/flix-favicon.svg" type="image/svg">

  <script defer src="general_script.js"></script>
	<script defer src="scripts/cinema_filter.js"></script>
	<script defer src="scripts/day_filter.js"></script>
</head>

<?php 

$cinemas = [];
$default_cinema = [];

session_start(); 
if(isset($_SESSION['cinemas'])) {
	$cinemas = $_SESSION['cinemas'];
} 

// Get URL param when directed from cinemas page
$default_cinema_name = isset($_GET['cinema']) ? $_GET['cinema'] : null;

foreach ($cinemas as $cinema => $cinema_details) {
	if ($default_cinema_name && $cinema_details['locationName'] == $default_cinema_name) {
		$default_cinema = [
      'location_name' => $cinema_details['locationName'],
			'address' => $cinema_details['address'],
			'img' => $cinema_details['img'],
			'IMAX' => $cinema_details['IMAX'],
			'LUMIERE' => $cinema_details['LUMIERE'],
			'PREMIERE' => $cinema_details['PREMIERE'],
    ];
	}
}

// Today + 6 days after today
$datesArray = [];
$today = new DateTime();

for ($i = 0; $i < 7; $i++) {
  $currentDate = clone $today;
  $currentDate->modify("+$i day");

  $date = $currentDate->format('d'); 
  $month = $currentDate->format('F'); 
  $dayOfWeek = $currentDate->format('D'); 

  // Save to the array
  $datesArray[] = [
    'date' => $date,
    'month' => $month,
    'day_of_week' => $dayOfWeek,
    'full_date' => $currentDate->format('Y-m-d') 
  ];
}

?>

<body>

	<!-- Navbar -->
	<div class="d-flex justify-content-center navbar-wrapper">
		<nav id="navbar" class="container d-flex flex-row">
			<div class="d-flex flex-row align-items-center nav-items">
				<a href="index.php"><img src="assets/flix-logo.svg" alt="Flix Theatres"></a>
				<ul class="d-flex flex-row">
					<a href="all_movies.php"><li class="active">All Movies</li></a>
					<a href="cinemas.php"><li>Cinemas</li></a>
				</ul>
			</div>
		</nav>
	</div>

	<!-- Choose cinema -->
	<div class="container d-flex flex-column align-items-center" style="gap: 32px; margin-top: 20px;">
		
		<div class="d-flex flex-row" style="height: 48px; gap: 28px; width: 780px;">
			<h2>View available showtimes: </h2>
			<select id="cinemasFilter" onchange="filterCinemas()">
				<option value="default">at your nearest Flix Theatre</option>
				<option value="Bedok">Flix Theatres Bedok</option>
				<option value="Bishan">Flix Theatres Bishan</option>
				<option value="Bugis+">Flix Theatres Bugis+</option>
				<option value="Cineleisure">Flix Theatres Cineleisure</option>
				<option value="City Square">Flix Theatres City Square</option>
				<option value="Funan">Flix Theatres Funan</option>  
				<option value="Grand, Great World">Flix Theatres Grand, Great World</option>
				<option value="JCube">Flix Theatres JCube</option>
				<option value="Jurong Point">Flix Theatres Jurong Point</option>
				<option value="Katong">Flix Theatres Katong</option>
				<option value="Paya Lebar">Flix Theatres Paya Lebar</option>
				<option value="Sembawang">Flix Theatres Sembawang</option>
				<option value="TheRailMall">Flix Theatres TheRailMall</option>
				<option value="Yishun">Flix Theatres Yishun</option>
			</select>
		</div>

		<!-- Print URL param cinema if any, else print blank -->
		<?php

		echo "
		<div class='d-flex flex-row justify-content-center cinema-card-box' style='gap:20px;'>
			<div class='d-flex flex-column cinema-info-box'>
				<div class='d-flex flex-column' style='gap: 24px;'>";

					if ($default_cinema_name) { echo "<h1 style='color: var(--bg-color-black)' id='cinema_name'>{$default_cinema['location_name']}</h1>";}
					else { echo "<h1 style='color: var(--secondary-onwhite-text-color)' id='cinema_name'>Select your cinema</h1>"; };

					echo "<div class='d-flex flex-row' style='gap: 24px;' id='cinema_type'>";
						if ($default_cinema_name) {
							if ($default_cinema['IMAX']) {
								echo "<img src='assets/cinema-types/imax-black.svg'>";
							}
							if ($default_cinema['LUMIERE']) {
								echo "<img src='assets/cinema-types/lumiere-black.svg'>";
							}
							if ($default_cinema['PREMIERE']) {
								echo "<img src='assets/cinema-types/premiere-black.svg'>";
							}
						}
					echo "</div>
					<p id='cinema_address'>";
						if ($default_cinema_name) { echo $default_cinema['address'];}
					echo "</p>
				</div>

				<button id='cinema_directions' onclick=\"";
					if ($default_cinema_name) { echo "handleClick('{$default_cinema['location_name']}')";}
				echo "\" style='align-self: end;' class='btn-coloured btn-md'>Directions</button>
				<div class='decoration-box'></div>
			</div>

			<div class='cinema-img'><img id='cinema_img' ";
				if ($default_cinema_name) { echo "src='{$default_cinema['img']}'"; };
			echo "></div>
		</div>";

		?>

	</div>
	
	<!-- List of movies -->
	<div class="container d-flex flex-column" style="gap: 32px; margin: 40px 0px;">
		<div class="decorative-header"><h2>Showtimes</h2></div>

		<div class="d-flex flex-column" style="gap:24px;">
			<div class="d-flex flex-row" style="gap:12px;">
				<!-- Print tabs for 7 days -->
				<?php 
					foreach($datesArray as $index => $date) {
						if ($index == 0) {
							echo "<button class='btn-secondary btn-md btn-disabled day-tab active' data-date='{$date['full_date']}'>Today, " . date('d M', strtotime($date['full_date'])) . "</button>";
						} else {
							echo "<button class='btn-secondary btn-md btn-disabled day-tab' data-date='{$date['full_date']}'>{$date['day_of_week']}</button>";
						}
					}
				?>
			</div>
			
			<!-- Movie List -->
			<?php include 'php_files/get_cinema_showtimes.php'; ?>

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