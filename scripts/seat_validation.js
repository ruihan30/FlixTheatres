function validateSeatSelection(event) {
    const selectedSeats = document.querySelectorAll('.seat.active');

    if (selectedSeats.length == 0) {
        alert("Please select at least 1 seat to proceed.");
        event.preventDefault();
        return false;
    }
    return true;
}