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
  <script defer src="scripts/cinemaLocations.js"></script>
</head>

<?php 

$cinemas = [];

session_start(); 
if(isset($_SESSION['cinemas'])) {
	$cinemas = $_SESSION['cinemas'];
} 

// Get URL param when directed from all_movies page
$first_cinema = isset($_GET['cinema']) ? $_GET['cinema'] : null;

?>

<body>

	<!-- Navbar -->
	<div class="d-flex justify-content-center navbar-wrapper">
		<nav id="navbar" class="container d-flex flex-row">
			<div class="d-flex flex-row align-items-center nav-items">
				<a href="index.php"><img src="assets/flix-logo.svg" alt="Flix Theatres"></a>
				<ul class="d-flex flex-row">
					<a href="all_movies.php"><li>All Movies</li></a>
					<a href="cinemas.php"><li class="active">Cinemas</li></a>
				</ul>
			</div>
		</nav>
	</div>

	<!-- Wrapper -->
	<div class="container d-flex flex-column align-items-center" style="gap: 28px; margin-top: 20px; margin-bottom: 40px;">
		
		<div class="d-flex flex-row" style="height: 48px; gap: 28px; width: 780px;">
			<h2>Flix Theatres in the area: </h2>
			<select id="cinemasFilter" onchange="cinemasInArea()">
				<option value="">Select your area</option>
				<option value="North">North</option>
				<option value="South">South</option>
				<option value="East">East</option>
				<option value="West">West</option>
			</select>
		</div>

		<!-- List of cinemas -->
		<div id="default-cinemas" class="d-flex flex-column" style="gap: 24px;">
			<?php 
				if ($first_cinema) {
					// Get from URL params
					foreach ($cinemas as $cinema => $cinema_details) {
						if ($cinema_details['locationName'] == $first_cinema) {
							echo "
							<div class='d-flex flex-row cinema-card-default'>
								<div class='cinema-img'><img class='location-img' src='{$cinema_details['img']}' ></div>

								<div class='d-flex flex-column cinema-info'>
									<div class='d-flex flex-column' style='gap: 24px;'>
										<div class='d-flex flex-column' style='gap: 8px;'>
											<h3>{$cinema_details['locationName']}</h3>
											<p>{$cinema_details['address']}</p>
											<div class='d-flex flex-row' style='gap: 16px;'>
												<p>{$cinema_details['halls']}</p><p>|</p>
													<div class='d-flex flex-row cinemaTypes' style='gap: 8px; flex-wrap: wrap;'>";
														if ($cinema_details['IMAX']) {
															echo "<img src='assets/cinema-types/imax-white.svg'>";
														}
														if ($cinema_details['LUMIERE']) {
															echo "<img src='assets/cinema-types/lumiere-white.svg'>";
														}
														if ($cinema_details['PREMIERE']) {
															echo "<img src='assets/cinema-types/premiere-white.svg'>";
														}
													echo "</div>
											</div>
										</div>
										
										<div class='d-flex flex-row' style='gap: 36px;'>
											<div class='d-flex flex-column' style='gap: 8px;'>
												<div class='d-flex flex-row' style='gap: 4px;'>
													<i class='bx bxs-train icon'></i><p>MRT</p>
												</div>
												<div class='d-flex flex-row' style='gap: 4px;'>
													<i class='bx bxs-bus icon'></i><p>Bus</p>
												</div>
											</div>
											<div class='d-flex flex-column' style='gap: 8px;'>
												<p>{$cinema_details['mrt']}</p>
												<p>{$cinema_details['bus']}</p>
											</div>
										</div>
									</div>

									<a href='all_movies.php?cinema=" . urlencode($cinema_details['locationName']) . "' style='align-self: end'><button class='btn-primary btn-lg'>Showtimes</button></a>
								</div>
							</div>";
						}
					}

					// The rest of the cinemas
					foreach ($cinemas as $cinema => $cinema_details) {
						if ($cinema_details['locationName'] !== $first_cinema) {
							echo "
							<div class='d-flex flex-row cinema-card-default'>
								<div class='cinema-img'><img class='location-img' src='{$cinema_details['img']}' ></div>

								<div class='d-flex flex-column cinema-info'>
									<div class='d-flex flex-column' style='gap: 24px;'>
										<div class='d-flex flex-column' style='gap: 8px;'>
											<h3>{$cinema_details['locationName']}</h3>
											<p>{$cinema_details['address']}</p>
											<div class='d-flex flex-row' style='gap: 16px;'>
												<p>{$cinema_details['halls']}</p><p>|</p>
													<div class='d-flex flex-row cinemaTypes' style='gap: 8px; flex-wrap: wrap;'>";
														if ($cinema_details['IMAX']) {
															echo "<img src='assets/cinema-types/imax-white.svg'>";
														}
														if ($cinema_details['LUMIERE']) {
															echo "<img src='assets/cinema-types/lumiere-white.svg'>";
														}
														if ($cinema_details['PREMIERE']) {
															echo "<img src='assets/cinema-types/premiere-white.svg'>";
														}
													echo "</div>
											</div>
										</div>
										
										<div class='d-flex flex-row' style='gap: 36px;'>
											<div class='d-flex flex-column' style='gap: 8px;'>
												<div class='d-flex flex-row' style='gap: 4px;'>
													<i class='bx bxs-train icon'></i><p>MRT</p>
												</div>
												<div class='d-flex flex-row' style='gap: 4px;'>
													<i class='bx bxs-bus icon'></i><p>Bus</p>
												</div>
											</div>
											<div class='d-flex flex-column' style='gap: 8px;'>
												<p>{$cinema_details['mrt']}</p>
												<p>{$cinema_details['bus']}</p>
											</div>
										</div>
									</div>

									<a href='all_movies.php?cinema=" . urlencode($cinema_details['locationName']) . "' style='align-self: end'><button class='btn-primary btn-lg'>Showtimes</button></a>
								</div>
							</div>";
						}
					}
				} else {
					// When URL params is empty
					foreach ($cinemas as $cinema => $cinema_details) {
						echo "
						<div class='d-flex flex-row cinema-card-default'>
							<div class='cinema-img'><img class='location-img' src='{$cinema_details['img']}' ></div>

							<div class='d-flex flex-column cinema-info'>
								<div class='d-flex flex-column' style='gap: 24px;'>
									<div class='d-flex flex-column' style='gap: 8px;'>
										<h3>{$cinema_details['locationName']}</h3>
										<p>{$cinema_details['address']}</p>
										<div class='d-flex flex-row' style='gap: 16px;'>
											<p>{$cinema_details['halls']}</p><p>|</p>
												<div class='d-flex flex-row cinemaTypes' style='gap: 8px; flex-wrap: wrap;'>";
													if ($cinema_details['IMAX']) {
														echo "<img src='assets/cinema-types/imax-white.svg'>";
													}
													if ($cinema_details['LUMIERE']) {
														echo "<img src='assets/cinema-types/lumiere-white.svg'>";
													}
													if ($cinema_details['PREMIERE']) {
														echo "<img src='assets/cinema-types/premiere-white.svg'>";
													}
												echo "</div>
										</div>
									</div>
									
									<div class='d-flex flex-row' style='gap: 36px;'>
										<div class='d-flex flex-column' style='gap: 8px;'>
											<div class='d-flex flex-row' style='gap: 4px;'>
												<i class='bx bxs-train icon'></i><p>MRT</p>
											</div>
											<div class='d-flex flex-row' style='gap: 4px;'>
												<i class='bx bxs-bus icon'></i><p>Bus</p>
											</div>
										</div>
										<div class='d-flex flex-column' style='gap: 8px;'>
											<p>{$cinema_details['mrt']}</p>
											<p>{$cinema_details['bus']}</p>
										</div>
									</div>
								</div>

								<a href='all_movies.php?cinema=" . urlencode($cinema_details['locationName']) . "' style='align-self: end'><button class='btn-primary btn-lg'>Showtimes</button></a>
							</div>
						</div>";
					}
				}
			?>
		</div>

		<!-- Filtered cinemas -->
		<div class="d-flex flex-row cinema-card" id="cinemaCard1">
			<div class="cinema-img">
				<img class="location-img" alt="locationImage1" id="locationImage1">
			</div>

			<div class="d-flex flex-column cinema-info">
				<div class="d-flex flex-column" style="gap: 24px;">
					<div class="d-flex flex-column" style="gap: 8px;">
						<h3 id="locationName1"></h3>
						<p id="cinemaAddress1"></p>
						<div class="d-flex flex-row" style="gap: 16px;">
							<p id="cinemaHalls1"></p><p>|</p>
								<div class="d-flex flex-row cinemaTypes" style="gap: 8px; flex-wrap: wrap;">
									<img alt="cinemaTypeIMAX1" id="cinemaTypeIMAX1">
									<img alt="cinemaTypesLUMIERE1" id="cinemaTypeLUMIERE1">
									<img alt="cinemaTypesPREMIERE1" id="cinemaTypePREMIERE1">
								</div>
						</div>
					</div>
					
					<div class="d-flex flex-row" style="gap: 36px;">
						<div class="d-flex flex-column" style="gap: 8px;">
							<div class="d-flex flex-row" style="gap: 4px;">
								<i class='bx bxs-train icon'></i><p>MRT</p>
							</div>
							<div class="d-flex flex-row" style="gap: 4px;">
								<i class='bx bxs-bus icon'></i><p>Bus</p>
							</div>
						</div>
						<div class="d-flex flex-column" style="gap: 8px;">
							<p id="nearestMRT1"></p>
							<p id="busServices1"></p>
						</div>
					</div>
				</div>

				<a class="cinema-showtime-btn" href="" style="align-self: end"><button class="btn-primary btn-lg">Showtimes</button></a>
			</div>
		</div>

		<div class="d-flex flex-row cinema-card" id="cinemaCard2">
			<div class="cinema-img test">
				<img class="location-img" alt="locationImage2" id="locationImage2">
			</div>

			<div class="d-flex flex-column cinema-info">
				<div class="d-flex flex-column" style="gap: 24px;">
					<div class="d-flex flex-column" style="gap: 8px;">
						<h3 id="locationName2"></h3>
						<p id="cinemaAddress2"></p>
						<div class="d-flex flex-row" style="gap: 16px;">
							<p id="cinemaHalls2"></p><p>|</p>
								<div class="d-flex flex-row cinemaTypes" style="gap: 8px; flex-wrap: wrap;">
									<img alt="cinemaTypeIMAX2" id="cinemaTypeIMAX2">
									<img alt="cinemaTypesLUMIERE2" id="cinemaTypeLUMIERE2">
									<img alt="cinemaTypesPREMIERE2" id="cinemaTypePREMIERE2">
								</div>
						</div>
					</div>
					
					<div class="d-flex flex-row" style="gap: 36px;">
						<div class="d-flex flex-column" style="gap: 8px;">
							<div class="d-flex flex-row" style="gap: 4px;">
								<i class='bx bxs-train icon'></i><p>MRT</p>
							</div>
							<div class="d-flex flex-row" style="gap: 4px;">
								<i class='bx bxs-bus icon'></i><p>Bus</p>
							</div>
						</div>
						<div class="d-flex flex-column" style="gap: 8px;">
							<p id="nearestMRT2"></p>
							<p id="busServices2"></p>
						</div>
					</div>
				</div>

				<a class="cinema-showtime-btn"  href="" style="align-self: end"><button class="btn-primary btn-lg">Showtimes</button></a>
			</div>
		</div>

		<div class="d-flex flex-row cinema-card" id="cinemaCard3">
			<div class="cinema-img test">
				<img class="location-img" alt="locationImage3" id="locationImage3">
			</div>

			<div class="d-flex flex-column cinema-info">
				<div class="d-flex flex-column" style="gap: 24px;">
					<div class="d-flex flex-column" style="gap: 8px;">
						<h3 id="locationName3"></h3>
						<p id="cinemaAddress3"></p>
						<div class="d-flex flex-row" style="gap: 16px;">
							<p id="cinemaHalls3"></p><p>|</p>
								<div class="d-flex flex-row cinemaTypes" style="gap: 8px; flex-wrap: wrap;">
									<img alt="cinemaTypeIMAX3" id="cinemaTypeIMAX3">
									<img alt="cinemaTypesLUMIERE3" id="cinemaTypeLUMIERE3">
									<img alt="cinemaTypesPREMIERE3" id="cinemaTypePREMIERE3">
								</div>
						</div>
					</div>
					
					<div class="d-flex flex-row" style="gap: 36px;">
						<div class="d-flex flex-column" style="gap: 8px;">
							<div class="d-flex flex-row" style="gap: 4px;">
								<i class='bx bxs-train icon'></i><p>MRT</p>
							</div>
							<div class="d-flex flex-row" style="gap: 4px;">
								<i class='bx bxs-bus icon'></i><p>Bus</p>
							</div>
						</div>
						<div class="d-flex flex-column" style="gap: 8px;">
							<p id="nearestMRT3"></p>
							<p id="busServices3"></p>
						</div>
					</div>
				</div>

				<a class="cinema-showtime-btn"  href="" style="align-self: end"><button class="btn-primary btn-lg">Showtimes</button></a>
			</div>
		</div>

		<div class="d-flex flex-row cinema-card" id="cinemaCard4">
			<div class="cinema-img test">
				<img class="location-img" alt="locationImage4" id="locationImage4">
			</div>

			<div class="d-flex flex-column cinema-info">
				<div class="d-flex flex-column" style="gap: 24px;">
					<div class="d-flex flex-column" style="gap: 8px;">
						<h3 id="locationName4"></h3>
						<p id="cinemaAddress4"></p>
						<div class="d-flex flex-row" style="gap: 16px;">
							<p id="cinemaHalls4"></p><p>|</p>
								<div class="d-flex flex-row cinemaTypes" style="gap: 8px; flex-wrap: wrap;">
									<img alt="cinemaTypeIMAX4" id="cinemaTypeIMAX4">
									<img alt="cinemaTypesLUMIERE4" id="cinemaTypeLUMIERE4">
									<img alt="cinemaTypesPREMIERE4" id="cinemaTypePREMIERE4">
								</div>
						</div>
					</div>
					
					<div class="d-flex flex-row" style="gap: 36px;">
						<div class="d-flex flex-column" style="gap: 8px;">
							<div class="d-flex flex-row" style="gap: 4px;">
								<i class='bx bxs-train icon'></i><p>MRT</p>
							</div>
							<div class="d-flex flex-row" style="gap: 4px;">
								<i class='bx bxs-bus icon'></i><p>Bus</p>
							</div>
						</div>
						<div class="d-flex flex-column" style="gap: 8px;">
							<p id="nearestMRT4"></p>
							<p id="busServices4"></p>
						</div>
					</div>
				</div>

				<a class="cinema-showtime-btn"  href="" style="align-self: end"><button class="btn-primary btn-lg">Showtimes</button></a>
			</div>
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