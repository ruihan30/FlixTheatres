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
	<script defer src="scripts/carousel.js"></script>
</head>

<?php include 'php_files/save_cinemas.php'; ?>

<body>

	<!-- Navbar -->
	<div class="d-flex justify-content-center navbar-wrapper">
		<nav id="navbar" class="container d-flex flex-row">
			<div class="d-flex flex-row align-items-center nav-items">
				<a href="index.html"><img src="assets/flix-logo.svg" alt="Flix Theatres"></a>
				<ul class="d-flex flex-row">
					<li><a href="all_movies.php">All Movies</a></li>
					<li><a href="cinemas.php">Cinemas</a></li>
				</ul>
			</div>
			<a href=""><button class="d-flex flex-row btn-primary btn-lg">Book Tickets<i class='bx bxs-chevron-down icon'></i></button></a>
		</nav>
	</div>

	<!-- Carousel -->
	<?php include 'php_files/get_carousel.php'; ?>
	
	<!-- <div class="carousel">
		<div class="carousel-track-container">
			<ul class="carousel-track">
				<li class="carousel-slide current-slide">
					<div class="carousel-overlay-y"></div>
					<div class="carousel-overlay-x1"></div>
					<div class="carousel-overlay-x2"></div>
					<img src="assets/testbanner1.png" alt="Image 1">
					<div class="d-flex flex-column justify-content-center carousel-info">
						<h1>Dune</h1>
						<div class="d-flex flex-row" style="gap: 12px; flex-wrap: wrap;">
							<p><span>Sci-Fi</span> | <span>Adventure</span></p>
							<p>•</p>
							<p>2h 35min</p>
						</div>
						<div class="d-flex flex-row align-items-center" style="justify-content: space-between; padding: 0px 8px;">
							<a href=""><div class="d-flex flex-row align-items-center" style="gap: 16px;"><i class='bx bx-play icon'></i>Trailer</div></a>
							<button class="btn-primary btn-md">Showtimes</button>
						</div>
					</div>
				</li>
				<li class="carousel-slide">
					<div class="carousel-overlay-y"></div>
					<div class="carousel-overlay-x1"></div>
					<div class="carousel-overlay-x2"></div>
					<img src="assets/testbanner2.png" alt="Image 2">
					<div class="d-flex flex-column justify-content-center carousel-info">
						<h1>Dune</h1>
						<div class="d-flex flex-row" style="gap: 12px; flex-wrap: wrap;">
							<p><span>Sci-Fi</span> | <span>Adventure</span></p>
							<p>•</p>
							<p>2h 35min</p>
						</div>
						<div class="d-flex flex-row align-items-center" style="justify-content: space-between; padding: 0px 8px;">
							<a href=""><div class="d-flex flex-row align-items-center" style="gap: 16px;"><i class='bx bx-play icon'></i>Trailer</div></a>
							<button class="btn-primary btn-md">Showtimes</button>
						</div>
					</div>
				</li>
				<li class="carousel-slide">
						<img src="assets/testbanner3.png" alt="Image 3">
				</li>
			</ul>
		</div>
		<button class="carousel-button" id="prevButton" style="left: 10px;"><i class='bx bxs-chevron-left icon'></i></button>
		<button class="carousel-button" id="nextButton" style="right: 10px;"><i class='bx bxs-chevron-right icon'></i></button>
	</div> -->

	<!-- Wrapper -->
	<div class="container d-flex flex-column" style="gap: 28px; margin-bottom: 100px;">
		
		<!-- Tabs -->
		<div class="d-flex flex-row" style="gap: 16px;">
			<button class="btn-primary btn-lg">Now Showing</button>
			<button class="btn-secondary btn-lg">Coming Soon</button>
		</div>

		<!-- Get movies list from database -->
		<?php include 'php_files/get_movies.php'; ?>

		<!-- Movie List
		<div id="movieList" >

			<div class="d-flex flex-column movie-card">
				<div class="test">img</div>

				<div class="d-flex flex-column movie-details">
					<div class="d-flex flex-column" style="gap: 4px; width: 100%; flex-grow: 1;"> 
						<p class="movie-title">Beetlejuice Beetlejuice</p>
						<div class="d-flex flex-row" style="gap: 16px;">
							<p><span>Fantasy</span> | <span>Sci-Fi</span></p>
							<p>•</p>
							<p>1h 45min</p>
						</div>
						<div class="d-flex flex-row" style="gap: 2px;">
							<i class='bx bxs-star icon'></i>
							<i class='bx bxs-star icon'></i>
							<i class='bx bxs-star icon'></i>
							<i class='bx bxs-star icon'></i>
							<i class='bx bxs-star-half icon'></i>
						</div>
					</div>
						
					<div class="d-flex flex-row align-items-center" style="gap: 8px; width: 100%;">
						<div class="pg-rating pg13">PG13</div>
						<p class="pg-description">Some frightening scenes & coarse language</p>
					</div>

					<button class="btn-primary btn-md" style="background-color: var(--primary-color-purple); color: var(--off-white);">Book Now</button>
				</div>
			</div>

			<div class="d-flex flex-column movie-card">
				<div class="test">img</div>

				<div class="d-flex flex-column movie-details">
					<div class="d-flex flex-column" style="gap: 4px; width: 100%; flex-grow: 1;"> 
						<p class="movie-title">Marvel Studios' Deadpool & Wolverine</p>
						<div class="d-flex flex-row" style="gap: 16px;">
							<p><span>Action</span> | <span>Comedy</span></p>
							<p>•</p>
							<p>2h 7min</p>
						</div>
						<div class="d-flex flex-row" style="gap: 2px;">
							<i class='bx bxs-star icon'></i>
							<i class='bx bxs-star icon'></i>
							<i class='bx bxs-star icon'></i>
							<i class='bx bxs-star icon'></i>
							<i class='bx bxs-star-half icon'></i>
						</div>
					</div>
						
					<div class="d-flex flex-row align-items-center" style="gap: 8px; width: 100%;">
						<div class="pg-rating m18">M18</div>
						<p class="pg-description">Violence & coarse language</p>
					</div>

					<button class="btn-primary btn-md" style="background-color: var(--primary-color-purple); color: var(--off-white);">Book Now</button>
				</div>
			</div>
			
			<div class="test">test</div>
			<div class="test">test</div>
			<div class="test">test</div>
			<div class="test">test</div>

		</div> -->

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