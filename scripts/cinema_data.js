// Uses array from query in PHP

// Function to handle changes in cinema selection
function handleCinemaChange() {
  const cinemaSelect = document.getElementById('cinemaSelect');
  const dateSelect = document.getElementById('dateSelect');
  const timeSelect = document.getElementById('timeSelect');

  // Clear previous values in date and time selects
  dateSelect.innerHTML = '<option value="">Select Date</option>';
  timeSelect.innerHTML = '<option value="">Select Time</option>';

  // Get selected cinema
  const selectedCinema = cinemaSelect.value;

  if (selectedCinema) {
    // Get available dates for the selected cinema
    const availableDates = Object.keys(cinemaData[selectedCinema].dates);

    availableDates.forEach(date => {
      const dateOption = document.createElement('option');
      dateOption.value = date;
      dateOption.textContent = date;
      dateSelect.appendChild(dateOption);
    });

    // Add event listener for date selection to populate time options
    dateSelect.addEventListener('change', function() {
      // Clear previous time options
      timeSelect.innerHTML = '<option value="">Select Time</option>';
      const selectedDate = dateSelect.value;

      if (selectedDate) {
        // Get available times for the selected cinema and date
        const availableTimes = cinemaData[selectedCinema].dates[selectedDate];

        availableTimes.forEach(time => {
          const timeOption = document.createElement('option');
          timeOption.value = time;
          timeOption.textContent = time;
          timeSelect.appendChild(timeOption);
        });
      }
    });
  }
}

// Attach the event listener to the cinema select
document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('cinemaSelect').addEventListener('change', handleCinemaChange);
});