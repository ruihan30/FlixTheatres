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

// echo "<pre>"; 
// print_r($datesArray); 
// echo "</pre>";

?>

<body>

	<!-- Navbar -->
	<div class="d-flex justify-content-center" style="width: 100vw; position: sticky;">
		<nav id="navbar" class="container d-flex flex-row">
			<div class="d-flex flex-row align-items-center nav-items">
				<a href="index.html"><img src="assets/flix-logo.svg" alt="Flix Theatres"></a>
				<ul class="d-flex flex-row">
					<li class="active"><a href="">All Movies</a></li>
					<li><a href="">Cinemas</a></li>
				</ul>
			</div>
			<a href=""><button class="d-flex flex-row btn-primary btn-lg">Book Tickets<i class='bx bxs-chevron-down icon'></i></button></a>
		</nav>
	</div>

	<!-- Choose cinema -->
	<div class="container d-flex flex-column align-items-center" style="gap: 32px;">
		
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

		<!-- Print default cinema if have, else print blank -->
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
			
			<!-- <div id="movieList">
				<div class="d-flex flex-column movie-card">
					<div class="test">img</div>

					<div class="d-flex flex-column movie-details">
						<div class="d-flex flex-column" style="gap: 4px; width: 100%; flex-grow: 1;"> 
							<p class="movie-title">Beetlejuice Beetlejuice</p>
							<p>English (Chinese Subbed)</p>
						</div>
							
						<div class="d-flex flex-row align-items-center" style="gap: 8px; width: 100%;">
							<div class="pg-rating pg13">PG13</div>
							<p class="pg-description">Some frightening scenes & coarse language</p>
						</div>

						<div class="d-flex flex-row align-items-center" style="gap: 8px; width: 100%; flex-wrap: wrap;">
							<a href=""><button class="btn-showtime">1.30 PM</button></a>
							<a href=""><button class="btn-showtime">4.35 PM</button></a>
							<a href=""><button class="btn-showtime">9.25 PM</button></a>
						</div>
					</div>
				</div>

				<div class="d-flex flex-column movie-card">
					<div class="test">img</div>

					<div class="d-flex flex-column movie-details">
						<div class="d-flex flex-column" style="gap: 4px; width: 100%; flex-grow: 1;"> 
							<p class="movie-title">Marvel Studios' Deadpool & Wolverine</p>
							<p>English (Chinese Subbed)</p>
						</div>
							
						<div class="d-flex flex-row align-items-center" style="gap: 8px; width: 100%;">
							<div class="pg-rating m18 align-items-center">M18</div>
							<p class="pg-description">Violence & coarse language</p>
						</div>

						<div class="d-flex flex-row align-items-center" style="gap: 8px; width: 100%; flex-wrap: wrap;">
							<a href=""><button class="btn-showtime">2.05 PM</button></a>
							<a href=""><button class="btn-showtime">5.05 PM</button></a>
							<a href=""><button class="btn-showtime">7.25 PM</button></a>
							<a href=""><button class="btn-showtime">10.00 PM</button></a>
						</div>
					</div>
				</div>
				
				<div class="test">test</div>
				<div class="test">test</div>
				<div class="test">test</div>
				<div class="test">test</div>

			</div> -->



		</div>

	</div>

</body>

</html>