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
