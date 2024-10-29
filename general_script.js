document.addEventListener("DOMContentLoaded", function () {
    const lenis = new Lenis({
        duration: 1.1, // duration of the scroll effect
        easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)), // easing function
        smooth: true, // enable smooth scrolling
        smoothTouch: true 
    });

    function raf(time) {
        lenis.raf(time);
        requestAnimationFrame(raf);
    }

    requestAnimationFrame(raf);
});

// Navbar
document.addEventListener("scroll", function() {

	const navbar = document.getElementsByClassName("navbar-wrapper")[0];
	const scrollHeight = 20;

	if (window.scrollY > scrollHeight) {
			navbar.classList.add("scrolled");
	} else {
			navbar.classList.remove("scrolled");
	}
	
});

// Toggle seats
let selectedSeats = 0; 

function toggleSeat(seatElement, isAvailable, seatType) {
	// Only toggle if the seat is available
	if (isAvailable === '1') {
		// Toggle the active class
		seatElement.classList.toggle('active');
		const isActive = seatElement.classList.contains('active');

		selectedSeats += isActive ? 1 : -1;

		const img = seatElement.querySelector('img');
		if (isActive) {
			if (seatType === 'Wheelchair') {
				img.src = 'assets/cinema-seating/wheelchair-selected-seat.svg';
			} else {
				img.src = 'assets/cinema-seating/selected-seat.svg';
			}
		} else {
			img.src = img.getAttribute('data-original-src'); // Get the original source
		}
	}

	updateTicketQuantity();
}

// Update ticket quantity
function updateTicketQuantity() {
	const table = document.getElementById("price-table");
	const tickets_qty = document.getElementById("tickets_qty");
	const tickets_price = document.getElementById("tickets_price");

	if (selectedSeats > 0) {
		table.style.display = 'block';
	} else {
		table.style.display = 'none';
	}

	tickets_qty.innerHTML = selectedSeats;
	tickets_price.innerHTML = '$'+ (selectedSeats * 19.50).toFixed(2);
}

// Clear selection button 
function clearSeatSelection() {
	const seats = document.getElementsByClassName("seat");
	
	for (var i = 0; i < seats.length; i++) {
		const isActive = seats[i].classList.contains('active');
		if (isActive) {
			seats[i].classList.remove('active'); 
			const img = seats[i].querySelector('img');
			img.src = img.getAttribute('data-original-src');
		}
	}

	selectedSeats = 0; 
	updateTicketQuantity();
}

// Food combo buttons
function decreaseValue(field_id) {
	const numberField = document.getElementById(field_id);
	const currentValue = parseInt(numberField.value) || 0;
	if (currentValue > 0) {
			numberField.value = currentValue - 1;
	}
}

function increaseValue(field_id) {
	const numberField = document.getElementById(field_id);
	const currentValue = parseInt(numberField.value) || 0;
	numberField.value = currentValue + 1;
}

// Payment method radio buttons
document.querySelectorAll('.custom-radio').forEach(function(radio) {
	radio.addEventListener('change', function() {
		// Get all radio squares
		const radioSquares = document.querySelectorAll('.radio-square i');

		radioSquares.forEach(function(icon) {
			if (radio.checked && radio.id === icon.parentElement.htmlFor) {
				// Change icon when selected
				icon.classList.remove('bx-radio-circle'); 
				icon.classList.add('bx-radio-circle-marked'); 
			} else {
				// Change back to the original icon if not selected
				icon.classList.remove('bx-radio-circle-marked');
				icon.classList.add('bx-radio-circle');
			}
		});
	});
});



function gatherSelections() {
	// Gather active seat IDs
	const selectedSeats = [];
	const seats = document.querySelectorAll('.seat.active'); // Adjust the selector as necessary
	seats.forEach(seat => {
		selectedSeats.push(seat.dataset.seatId);
	});

	// Gather food combo selections
	const selectedCombos = [];
	const foodCombos = document.querySelectorAll('.number-field');
	foodCombos.forEach(combo => {
		const quantity = parseInt(combo.value);
		if (quantity > 0) {
			const comboName = combo.id.replace(/_/g, ' '); // Convert back to original name if necessary
			selectedCombos.push({
					name: comboName,
					quantity: quantity
			});
		}
	});

	// Send data to server (you can use fetch or AJAX)
	sendDataToServer(selectedSeats, selectedCombos);
}

// function sendDataToServer(seats, combos) {
// 	const data = {
// 		seats: seats,
// 		combos: combos
// 	};

// 	console.log('Sending data:', data);

// 	fetch('php_files/send_data.php', {
// 		method: 'POST',
// 		headers: {
// 			'Content-Type': 'application/json',
// 		},
// 		body: JSON.stringify(data)
// 	})
// 	.then(response =>  {
// 		// Log the raw response text
// 		return response.text().then(text => {
// 				console.log('Raw response:', text);
// 				return text; // Return raw text for further processing
// 		});
// 	})
// 	.then(text => {
// 		try {
// 				const data = JSON.parse(text); // Try to parse as JSON
// 				console.log('Success:', data);
// 				// Redirect after successful parsing
// 				window.location.href = `booking_2.php`;
// 		} catch (error) {
// 				console.error('Parsing error:', error);
// 				console.error('Received response:', text); // Log the response that caused the error
// 		}
// 	})
// 	.catch((error) => {
// 			console.error('Error:', error);
// 	});
// }

function sendDataToServer(seats, combos) {
	const data = {
			seats: seats,
			combos: combos
	};

	fetch('php_files/send_data.php', {
			method: 'POST',
			headers: {
					'Content-Type': 'application/json',
			},
			body: JSON.stringify(data)
	})
	.then(response => response.json())
	.then(data => {
			console.log('Success:', data);
			window.location.href = `booking_2.php`;
	})
	.catch((error) => {
			console.error('Error:', error);
	});
}

// Showtime filter according to cinema
const buttons = document.querySelectorAll('.cinema-btn');

// Setting default location for filter
buttons[0].classList.add('active');
const location_name = buttons[0].innerHTML;
document.getElementsByClassName('selected-cinema')[0].innerHTML = location_name;

var elements = document.getElementsByClassName(location_name.replace(/ /g, '_'));
for (var i = 0; i < elements.length; i++) {
	elements[i].style.display = 'flex'; 
}


buttons.forEach(button => {
  button.addEventListener('click', function() {
    buttons.forEach(btn => btn.classList.remove('active'));
    
    this.classList.add('active');
    const buttonText = this.innerHTML;
    
    document.getElementsByClassName('selected-cinema')[0].innerHTML = buttonText;

		const reset_elements = document.getElementsByClassName('showtimes');
		for (var i = 0; i < reset_elements.length; i++) {
			reset_elements[i].style.display = 'none'; 
		}

		const location = buttonText.replace(/ /g, '_');

    const set_element = document.getElementsByClassName(location);
		for (var i = 0; i < set_element.length; i++) {
			set_element[i].style.display = 'flex'; 
		}
  });
});
