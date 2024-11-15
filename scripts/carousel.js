// Carousel 

const track = document.querySelector('.carousel-track');
const slides = Array.from(track.children);
const nextButton = document.getElementById('nextButton');
const prevButton = document.getElementById('prevButton');
let currentIndex = 0;

// Update the slide position
function updateSlidePosition() {
    const slideWidth = slides[0].getBoundingClientRect().width;
    track.style.transform = `translateX(-${currentIndex * slideWidth}px)`;

    if (currentIndex === 0) {
        prevButton.style.display = 'none';
    } else {
        prevButton.style.display = 'block';
    }

    if (currentIndex === slides.length - 1) {
        nextButton.style.display = 'none';
    } else {
        nextButton.style.display = 'block';
    }
}

// Move to the next slide
nextButton.addEventListener('click', () => {
    if (currentIndex < slides.length - 1) {
        currentIndex++;
    } else {
        currentIndex = 0;
    }
    updateSlidePosition();
});

// Move to the previous slide
prevButton.addEventListener('click', () => {
    if (currentIndex > 0) {
        currentIndex--;
    } else {
        currentIndex = slides.length - 1;
    }
    updateSlidePosition();
});

// Auto-scroll functionality
function autoScroll() {
    if (currentIndex < slides.length - 1) {
        currentIndex++;
    } else {
        currentIndex = 0; // Loop back to the first slide
    }
    updateSlidePosition();
}

// Start auto-scrolling every 3 seconds
let autoScrollInterval = setInterval(autoScroll, 3000);

// Pause auto-scrolling when hovering over the carousel
track.addEventListener('mouseenter', () => {
    clearInterval(autoScrollInterval);
});

// Resume auto-scrolling when not hovering over the carousel
track.addEventListener('mouseleave', () => {
    autoScrollInterval = setInterval(autoScroll, 3000);
});

// Initial slide setup
window.addEventListener('resize', updateSlidePosition);
updateSlidePosition();