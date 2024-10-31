// Showtime filter according to day
const tabs = document.querySelectorAll('.day-tab');

tabs.forEach(button => {
  button.addEventListener('click', function() {
    tabs.forEach(btn => btn.classList.remove('active'));
    this.classList.add('active');

    const filter_date = this.dataset.date;

		const reset_elements = document.getElementsByClassName('movieList');
		for (var i = 0; i < reset_elements.length; i++) {
			reset_elements[i].style.display = 'none';
      if (reset_elements[i].dataset.date == filter_date) {
        reset_elements[i].style.display = 'grid';
      }
		}

  });
});