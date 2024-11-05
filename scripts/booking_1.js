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


// Gather booking_1 details to send to booking_2 page
function gatherSelections() {
	// Gather active seat IDs
	const selectedSeats = [];
	const seats = document.querySelectorAll('.seat.active'); 
	seats.forEach(seat => {
		selectedSeats.push(seat.dataset.seatId);
	});

	// Gather food combo selections
	const selectedCombos = [];
	const foodCombos = document.querySelectorAll('.number-field');
	foodCombos.forEach(combo => {
		const quantity = parseInt(combo.value);
		if (quantity > 0) {
			const comboName = combo.id.replace(/_/g, ' '); 
			selectedCombos.push({
					name: comboName,
					quantity: quantity
			});
		}
	});

	// Send data to server 
	sendDataToServer(selectedSeats, selectedCombos);
}

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