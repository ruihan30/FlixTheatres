const cinemasByArea = {
    North: {
        locationName1: "Flix Theatres Bishan",
        cinemaAddress1: "9 Bishan Pl, #06-01, Junction 8, Singapore 579837",
        cinemaHalls1: "5 Halls",
        nearestMRT1: "Bishan (CC15)/(NS17)",
        busServices1: "13, 52, 54, 55, 58, 88, 128, 156",
        locationImage1: "assets/mall-images/junction8.jpg",
        cinemaTypeIMAX1: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE1: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE1: "assets/cinema-types/premiere-white.svg",

        locationName2: "Flix Theatres Sembawang",
        cinemaAddress2: "30 Sembawang Dr, #04-01, Sun Plaza, Singapore 757713",
        cinemaHalls2: "4 Halls",
        nearestMRT2: "Sembawang (NS11)",
        busServices2: "117, 858, 859, 859A, 859B, 962, 882, 883, 980, 981",
        locationImage2: "assets/mall-images/sunPlaza.jpg",
        cinemaTypeIMAX2: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE2: "assets/cinema-types/lumiere-white.svg",
        // cinemaTypePREMIERE2: "assets/cinema-types/premiere-white.svg",

        locationName3: "Flix Theatres Yishun",
        cinemaAddress3: "930 Yishun Ave 2, #03-50, Northpoint City North Wing, Singapore 769098",
        cinemaHalls3: "7 Halls",
        nearestMRT3: "Yishun (NS13)",
        busServices3: "39, 85, 85A, 103, 171, 800, 801, 803, 804, 805, 806, 807, 807A, 807B, 811/811T, 811A, 812/812T, 851, 851e, 852, 853, 853M, 854, 854e, 855, 856, 857, 857A, 857B, 859, 860, AC7, KTPH",
        locationImage3: "assets/mall-images/northpoint.jpg",
        cinemaTypeIMAX3: "assets/cinema-types/imax-white.svg",
        // cinemaTypeLUMIERE3: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE3: "assets/cinema-types/premiere-white.svg",

        locationName4: "",
        cinemaAddress4: "",
        cinemaHalls4: "",
        nearestMRT4: "",
        busServices4: "",
        locationImage4: "",
        // cinemaTypeIMAX4: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE4: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE4: "assets/cinema-types/premiere-white.svg",
    },

    South: {
        locationName1: "Flix Theatres Cineleisure",
        cinemaAddress1: "8 Grange Rd, #06-02, Cathay Cineleisure Orchard, Singapore 239695",
        cinemaHalls1: "8 Halls",
        nearestMRT1: "Somerset (NS23)",
        busServices1: "36, 36B, 36T, 77, 124, 143, 167, 174, 174E, 190, 190A, 518, 518A, 972, 972A, 972M",
        locationImage1: "assets/mall-images/cineleisure.jpg",
        // cinemaTypeIMAX1: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE1: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE1: "assets/cinema-types/premiere-white.svg",
        
        locationName2: "Flix Theatres City Square",
        cinemaAddress2: "180 Kitchener Road, #09-11, City Square Mall, Singapore 208539",
        cinemaHalls2: "6 Halls",
        nearestMRT2: "Farrer Park (NE8)",
        busServices2: "21, 23, 64, 65, 66, 67, 125, 130, 139, 141, 147, 857, NR6",
        locationImage2: "assets/mall-images/citySquare.jpg",
        cinemaTypeIMAX2: "assets/cinema-types/imax-white.svg",
        // cinemaTypeLUMIERE2: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE2: "assets/cinema-types/premiere-white.svg",
        
        locationName3: "Flix Theatres Funan",
        cinemaAddress3: "107 North Bridge Rd, #05-01, Funan, Singapore 179105",
        cinemaHalls3: "7 Halls",
        nearestMRT3: "City Hall (EW13)/(NS25)",
        busServices3: "1N, 2N, 3N, 4N, 5N, 6N, 32, 51, 61, 63, 80, 124, 145, 166, 174, 174E, 195, 195A, 197, 851, 851E, 851e, 961, 961C, NR1, NR2, NR5, NR6, NR7, NR8",
        locationImage3: "assets/mall-images/funan.png",
        cinemaTypeIMAX3: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE3: "assets/cinema-types/lumiere-white.svg",
        // cinemaTypePREMIERE3: "assets/cinema-types/premiere-white.svg",

        locationName4: "Flix Theatres Grand, Great World",
        cinemaAddress4: "1 Kim Seng Promenade, #03-125, Great World, Singapore 237994",
        cinemaHalls4: "4 Halls",
        nearestMRT4: "Great World (TE15)",
        busServices4: "5, 16, 75, 175, 195, 970",
        locationImage4: "assets/mall-images/greatWorld.jpg",
        cinemaTypeIMAX4: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE4: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE4: "assets/cinema-types/premiere-white.svg",
    },

    East: {
        locationName1: "Flix Theatres Bedok",
        cinemaAddress1: "445 Bedok North Street 1, #04-01, Djitsun Mall Bedok, Singapore 469661",
        cinemaHalls1: "6 Halls",
        nearestMRT1: "Bedok (EW5)",
        busServices1: "7, 9, 14, 16, 17, 17A, 18, 30, 30e, 32, 33, 35, 35M, 40, 60, 66, 69, 87, 155, 168, 196, 197, 222 , 225G, 225W, 228, 229, 401, 854, 854E",
        locationImage1: "assets/mall-images/djitsun.jpeg",
        cinemaTypeIMAX1: "assets/cinema-types/imax-white.svg",
        // cinemaTypeLUMIERE1: "assets/cinema-types/lumiere-white.svg",
        // cinemaTypePREMIERE1: "assets/cinema-types/premiere-white.svg",

        locationName2: "Flix Theatres Bugis+",
        cinemaAddress2: "201 Victoria St, #05-01 , Bugis+, Singapore 188067",
        cinemaHalls2: "5 Halls",
        nearestMRT2: "Bugis (DT14)/(EW12)",
        busServices2: "2, 12, 32, 51, 61, 63, 80, 124, 142, 145, 166, 174, 174E, 197, 851, 960, 980, NR7",
        locationImage2: "assets/mall-images/bugis+.jpg",
        cinemaTypeIMAX2: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE2: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE2: "assets/cinema-types/premiere-white.svg",
        
        locationName3: "Flix Theatres Katong",
        cinemaAddress3: "112 E Coast Rd, #05-01/02, i12 Katong, Singapore 428802",
        cinemaHalls3: "8 Halls",
        nearestMRT3: "Marine Parade (TE26)",
        busServices3: "10, 10e, 12, 14, 14A, 14e, 16, 16M, 32, 40, 47",
        locationImage3: "assets/mall-images/i12.jpg",
        cinemaTypeIMAX3: "assets/cinema-types/imax-white.svg",
        // cinemaTypeLUMIERE3: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE3: "assets/cinema-types/premiere-white.svg",

        locationName4: "Flix Theatres Paya Lebar",
        cinemaAddress4: "10 Eunos Road 8, #03-107, SingPost Centre, Singapore 408600",
        cinemaHalls4: "8 Halls",
        nearestMRT4: "Paya Lebar (EW8)/(CC9)",
        busServices4: "24, 28, 43, 70, 70M, 76, 134, 135A, 135, 154, 155",
        locationImage4: "assets/mall-images/singpost.jpg",
        cinemaTypeIMAX4: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE4: "assets/cinema-types/lumiere-white.svg",
        // cinemaTypePREMIERE4: "assets/cinema-types/premiere-white.svg",
    },

    West: {
        locationName1: "Flix Theatres JCube",
        cinemaAddress1: "2 Jurong East Central 1, #03-01, JCube, Singapore 609731",
        cinemaHalls1: "7 Halls",
        nearestMRT1: "Jurong East (NS1)/(EW24)",
        busServices1: "41, 97, 105, 197, 198",
        locationImage1: "assets/mall-images/jcube.jpg",
        cinemaTypeIMAX1: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE1: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE1: "assets/cinema-types/premiere-white.svg",

        locationName2: "Flix Theatres Jurong Point",
        cinemaAddress2: "1 Jurong West Central 1, #03 - 26 26A, Jurong Point, Singapore 648886",
        cinemaHalls2: "6 Halls",
        nearestMRT2: "Boon Lay (EW27)",
        busServices2: "30, 79, 154, 157, 172, 174, 174e, 178, 179, 179A, 180, 181, 182, 182M, 187, 192, 193, 194, 198, 199, 240, 241, 242, 243W/G, 246, 249, 251, 252, 254, 255, 257, 405",
        locationImage2: "assets/mall-images/jurongPoint.jpg",
        cinemaTypeIMAX2: "assets/cinema-types/imax-white.svg",
        // cinemaTypeLUMIERE2: "assets/cinema-types/lumiere-white.svg",
        // cinemaTypePREMIERE2: "assets/cinema-types/premiere-white.svg",

        locationName3: "Flix Theatres TheRailMall",
        cinemaAddress3: "380 Upper Bukit Timah Rd, 462, TheRailMall, Singapore 678040",
        cinemaHalls3: "4 Halls",
        nearestMRT3: "Hillview (DT3)",
        busServices3: "67, 75, 178, 184, 963",
        locationImage3: "assets/mall-images/theRailMall.jpg",
        cinemaTypeIMAX3: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE3: "assets/cinema-types/lumiere-white.svg",
        // cinemaTypePREMIERE3: "assets/cinema-types/premiere-white.svg",
        
        locationName4: "",
        cinemaAddress4: "",
        cinemaHalls4: "",
        nearestMRT4: "",
        busServices4: "",
        locationImage4: "",
        cinemaTypeIMAX4: "assets/cinema-types/imax-white.svg",
        cinemaTypeLUMIERE4: "assets/cinema-types/lumiere-white.svg",
        cinemaTypePREMIERE4: "assets/cinema-types/premiere-white.svg",
    }
};

function cinemasInArea(){
    const selectedArea = document.getElementById("cinemasFilter").value;

	const default_cinemas = document.getElementById("default-cinemas");
	default_cinemas.style.display = 'none';

    if (cinemasByArea[selectedArea]) {
        const cinemaDetails = cinemasByArea[selectedArea];

        for (let i = 1; i <= 4; i++) {
            const locationName = cinemaDetails[`locationName${i}`];
            const cinemaAddress = cinemaDetails[`cinemaAddress${i}`];
            const cinemaHalls = cinemaDetails[`cinemaHalls${i}`];
            const nearestMRT = cinemaDetails[`nearestMRT${i}`];
            const busServices = cinemaDetails[`busServices${i}`];
            const locationImage = cinemaDetails[`locationImage${i}`];
            const cinemaTypeIMAX = cinemaDetails[`cinemaTypeIMAX${i}`];
            const cinemaTypeLUMIERE = cinemaDetails[`cinemaTypeLUMIERE${i}`];
            const cinemaTypePREMIERE = cinemaDetails[`cinemaTypePREMIERE${i}`];

            const cinemaCard = document.getElementById(`cinemaCard${i}`);

			const button = document.getElementsByClassName('cinema-showtime-btn')[i-1];
			button.href = 'all_movies.php?cinema=' + encodeURIComponent(locationName).replace(/%20/g, "+");

            if (locationName && cinemaAddress && cinemaHalls && nearestMRT && busServices && locationImage) {
                document.getElementById(`locationName${i}`).innerHTML = locationName;
                document.getElementById(`cinemaAddress${i}`).innerHTML = cinemaAddress;
                document.getElementById(`cinemaHalls${i}`).innerHTML = cinemaHalls;
                document.getElementById(`nearestMRT${i}`).innerHTML = nearestMRT;
                document.getElementById(`busServices${i}`).innerHTML = busServices;
                document.getElementById(`locationImage${i}`).src = locationImage;


                 // Set the IMAX image and hide if empty
                 const imaxImg = document.getElementById(`cinemaTypeIMAX${i}`);
                 if (cinemaTypeIMAX) {
                     imaxImg.src = cinemaTypeIMAX;
                     imaxImg.style.display = 'flex'; // Show the image
                 } else {
                     imaxImg.style.display = 'none'; // Hide the image
                 }
 
                 // Set the LUMIERE image and hide if empty
                 const lumiereImg = document.getElementById(`cinemaTypeLUMIERE${i}`);
                 if (cinemaTypeLUMIERE) {
                     lumiereImg.src = cinemaTypeLUMIERE;
                     lumiereImg.style.display = 'flex'; // Show the image
                 } else {
                     lumiereImg.style.display = 'none'; // Hide the image
                 }
 
                 // Set the PREMIERE image and hide if empty
                 const premiereImg = document.getElementById(`cinemaTypePREMIERE${i}`);
                 if (cinemaTypePREMIERE) {
                     premiereImg.src = cinemaTypePREMIERE;
                     premiereImg.style.display = 'flex'; // Show the image
                 } else {
                     premiereImg.style.display = 'none'; // Hide the image
                 }

                cinemaCard.style.display = 'flex';
            } else {
                cinemaCard.style.display = 'none';
            }
        }
    }
}