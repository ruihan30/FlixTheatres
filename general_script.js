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

// Cinema seating
document.addEventListener('DOMContentLoaded', () => {
	const rows = 7;
	const columns = 9;
	const container = document.getElementById('cinema-seating');
	const seatSrc = 'assets/cinema-seating/available-seat.svg';

	if(container) {
		for (let i = 0; i < rows; i++) {
				for (let j = 0; j < columns; j++) {
						const seat = document.createElement('img');
						seat.classList.add('seat');
						seat.src = seatSrc;
						container.appendChild(seat);
				}
		}
	} else {
		console.error('Cinema seating container not found');
	}
});

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
