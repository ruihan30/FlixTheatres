<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Showtimes - Flix Theatres</title>
  <meta charset="utf-8">
	<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Outfit:400,500,600,700">
  <link rel="stylesheet" href="common_styles.css">
  <link rel="icon" href="assets/flix-favicon.svg" type="image/svg">

  <script defer src="general_script.js"></script>
	<script defer src="scripts/showtime.js"></script>
</head>

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
	<?php include 'php_files/get_movie_details.php'; ?>

	<!-- Cinema Filter-->
	<div class="container d-flex flex-column" style="gap: 32px; margin: 40px 0px;">
		<div class="decorative-header"><h2>Showtimes</h2></div>

		<!-- Cinema Filter -->
		<div class="d-flex flex-column" style="gap: 8px;"> 
			<div class="d-flex flex-row" style="gap: 4px;"><i class='bx bxs-map icon'></i><p>Select a cinema:</p></div>

			<div class="d-flex flex-row" style="gap: 16px; position: relative;">
				<!-- left -->
				<div class="d-flex flex-column showtime-cinema" style="gap: 16px; width: calc(50% - 8px);">
					<!-- North -->
					<div class="d-flex flex-column" style="gap: 12px; padding: 16px; background-color: var(--off-white);">
						<h2 style="align-self: start;">North</h2>
						<div class="d-flex flex-row" style="gap: 8px; flex-wrap: wrap;">
							<button class="btn-secondary btn-md cinema-btn">FT Bishan</button>
							<button class="btn-secondary btn-md cinema-btn">FT Sembawang</button>
							<button class="btn-secondary btn-md cinema-btn">FT Yishun</button>
						</div>
					</div>
					<!-- South-->
					<div class="d-flex flex-column" style="gap: 12px; padding: 16px; background-color: var(--off-white);">
						<h2 style="align-self: start;">South</h2>
						<div class="d-flex flex-row" style="gap: 8px; flex-wrap: wrap;">
							<button class="btn-secondary btn-md cinema-btn">FT Cineleisure</button>
							<button class="btn-secondary btn-md cinema-btn">FT City Square</button>
							<button class="btn-secondary btn-md cinema-btn">FT Funan</button>
							<button class="btn-secondary btn-md cinema-btn">FT Grand, Great World</button>
						</div>
					</div>
				</div>

				<!-- right -->
				<div class="d-flex flex-column showtime-cinema" style="gap: 16px; width: calc(50% - 8px); flex-grow: 1;">
					<!-- East -->
					<div class="d-flex flex-column" style="gap: 12px; padding: 16px; background-color: var(--off-white);">
						<h2 style="align-self: start;">East</h2>
						<div class="d-flex flex-row" style="gap: 8px; flex-wrap: wrap;">
							<button class="btn-secondary btn-md cinema-btn">FT Bedok</button>
							<button class="btn-secondary btn-md cinema-btn">FT Bugis+</button>
							<button class="btn-secondary btn-md cinema-btn">FT Katong</button>
							<button class="btn-secondary btn-md cinema-btn">FT Paya Lebar</button>
						</div>
					</div>
					<!-- West-->
					<div class="d-flex flex-column" style="gap: 12px; padding: 16px; background-color: var(--off-white); flex-grow: 1;">
						<h2 style="align-self: start;">West</h2>
						<div class="d-flex flex-row" style="gap: 8px; flex-wrap: wrap;">
							<button class="btn-secondary btn-md cinema-btn">FT JCube</button>
							<button class="btn-secondary btn-md cinema-btn">FT Jurong Point</button>
							<button class="btn-secondary btn-md cinema-btn">FT TheRailMall</button>
						</div>
					</div>
				</div>

				<div class="decoration-box" style="top: 16px; bottom: -16px;"></div>
			</div>

			
		</div>
		
	</div>

	<!-- Showtimes according to date -->
	<div class="container d-flex flex-column align-items-center" style="gap: 32px; margin: 40px 0px;">
		<div class="d-flex flex-row" style="height: 48px; gap: 28px; width: 780px;">
			<h2>Showtimes available at: </h2>
			<p class="selected-cinema"></p>
		</div>

		<!-- Dates in a week -->
		<div class="d-flex flex-row" style="gap: 20px; margin-bottom: 100px;">

			<?php include 'php_files/print_showtimes.php'; ?>

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