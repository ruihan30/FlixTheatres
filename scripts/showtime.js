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
