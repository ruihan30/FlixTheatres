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
