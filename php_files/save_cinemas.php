<?php 
session_start(); // Start the session

// Define the cinemas array
$cinemas = [
    'Bishan' => [
        'locationName' => "Flix Theatres Bishan",
        'address' => "9 Bishan Pl, #06-01, Junction 8, Singapore 579837",
        'img' => "assets/mall-images/junction8.jpg",
        'halls' => "5 Halls",
        'mrt' => "Bishan (CC15)/(NS17)",
        'bus' => "13, 52, 54, 55, 58, 88, 128, 156",
        'IMAX' => true,
        'LUMIERE' => true,
        'PREMIERE' => true,
    ],

    'Sembawang' => [
        'locationName' => "Flix Theatres Sembawang",
        'address' => "30 Sembawang Dr, #04-01, Sun Plaza, Singapore 757713",
        'img' => "assets/mall-images/sunPlaza.jpg",
        'halls' => "4 Halls",
        'mrt' => "Sembawang (NS11)",
        'bus' => "117, 858, 859, 859A, 859B, 962, 882, 883, 980, 981",
        'IMAX' => true,
        'LUMIERE' => true,
        'PREMIERE' => false,
    ],

    'Yishun' => [
        'locationName' => "Flix Theatres Yishun",
        'address' => "930 Yishun Ave 2, #03-50, Northpoint City North Wing, Singapore 769098",
        'img' => "assets/mall-images/northpoint.jpg",
        'halls' => "7 Halls",
        'mrt' => "Yishun (NS13)",
        'bus' => "39, 85, 85A, 103, 171, 800, 801, 803, 804, 805, 806, 807, 807A, 807B, 811/811T, 811A, 812/812T, 851, 851e, 852, 853, 853M, 854, 854e, 855, 856, 857, 857A, 857B, 859, 860, AC7, KTPH",
        'IMAX' => true,
        'LUMIERE' => false,
        'PREMIERE' => true,
    ],

    'Cineleisure' => [
        'locationName' => "Flix Theatres Cineleisure",
        'address' => "8 Grange Rd, #06-02, Cathay Cineleisure Orchard, Singapore 239695",
        'img' => "assets/mall-images/cineleisure.jpg",
        'halls' => "8 Halls",
        'mrt' => "Somerset (NS23)",
        'bus' => "36, 36B, 36T, 77, 124, 143, 167, 174, 174E, 190, 190A, 518, 518A, 972, 972A, 972M",
        'IMAX' => false,
        'LUMIERE' => true,
        'PREMIERE' => true,
    ],

    'City Square' => [
        'locationName' => "Flix Theatres City Square",
        'address' => "180 Kitchener Road, #09-11, City Square Mall, Singapore 208539",
        'img' => "assets/mall-images/citySquare.jpg",
        'halls' => "6 Halls",
        'mrt' => "Farrer Park (NE8)",
        'bus' => "21, 23, 64, 65, 66, 67, 125, 130, 139, 141, 147, 857, NR6",
        'IMAX' => true,
        'LUMIERE' => false,
        'PREMIERE' => true,
    ],

    'Funan' => [
        'locationName' => "Flix Theatres Funan",
        'address' => "107 North Bridge Rd, #05-01, Funan, Singapore 179105",
        'img' => "assets/mall-images/funan.png",
        'halls' => "7 Halls",
        'mrt' => "City Hall (EW13)/(NS25)",
        'bus' => "1N, 2N, 3N, 4N, 5N, 6N, 32, 51, 61, 63, 80, 124, 145, 166, 174, 174E, 195, 195A, 197, 851, 851E, 851e, 961, 961C, NR1, NR2, NR5, NR6, NR7, NR8",
        'IMAX' => true,
        'LUMIERE' => true,
        'PREMIERE' => false,
    ],

    'Grand, Great World' => [
        'locationName' => "Flix Theatres Grand, Great World",
        'address' => "1 Kim Seng Promenade, #03-125, Great World, Singapore 237994",
        'img' => "assets/mall-images/greatWorld.jpg",
        'halls' => "4 Halls",
        'mrt' => "Great World (TE15)",
        'bus' => "5, 16, 75, 175, 195, 970",
        'IMAX' => true,
        'LUMIERE' => true,
        'PREMIERE' => true,
    ],

    'Bedok' => [
        'locationName' => "Flix Theatres Bedok",
        'address' => "45 Bedok North Street 1, #04-01, Djitsun Mall Bedok, Singapore 469661",
        'img' => "assets/mall-images/djitsun.jpeg",
        'halls' => "6 Halls",
        'mrt' => "Bedok (EW5)",
        'bus' => "7, 9, 14, 16, 17, 17A, 18, 30, 30e, 32, 33, 35, 35M, 40, 60, 66, 69, 87, 155, 168, 196, 197, 222 , 225G, 225W, 228, 229, 401, 854, 854E",
        'IMAX' => true,
        'LUMIERE' => false,
        'PREMIERE' => false,
    ],

    'Bugis+' => [
        'locationName' => "Flix Theatres Bugis+",
        'address' => "201 Victoria St, #05-01, Bugis+, Singapore 188067",
        'img' => "assets/mall-images/bugis+.jpg",
        'halls' => "5 Halls",
        'mrt' => "Bugis (DT14)/(EW12)",
        'bus' => "2, 12, 32, 51, 61, 63, 80, 124, 142, 145, 166, 174, 174E, 197, 851, 960, 980, NR7",
        'IMAX' => true,
        'LUMIERE' => true,
        'PREMIERE' => true,
    ],

    'Katong' => [
        'locationName' => "Flix Theatres Katong",
        'address' => "112 E Coast Rd, #05-01/02, i12 Katong, Singapore 428802",
        'img' => "assets/mall-images/i12.jpg",
        'halls' => "8 Halls",
        'mrt' => "Marine Parade (TE26)",
        'bus' => "10, 10e, 12, 14, 14A, 14e, 16, 16M, 32, 40, 47",
        'IMAX' => true,
        'LUMIERE' => false,
        'PREMIERE' => true,
    ],

    'Paya Lebar' => [
        'locationName' => "Flix Theatres Paya Lebar",
        'address' => "10 Eunos Road 8, #03-107, SingPost Centre, Singapore 408600",
        'img' => "assets/mall-images/singpost.jpg",
        'halls' => "8 Halls",
        'mrt' => "Paya Lebar (EW8)/(CC9)",
        'bus' => "24, 28, 43, 70, 70M, 76, 134, 135A, 135, 154, 155",
        'IMAX' => true,
        'LUMIERE' => true,
        'PREMIERE' => false,
    ],

    'JCube' => [
        'locationName' => "Flix Theatres JCube",
        'address' => "2 Jurong East Central 1, #03-01, JCube, Singapore 609731",
        'img' => "assets/mall-images/jcube.jpg",
        'halls' => "5 Halls",
        'mrt' => "Jurong East (EW24)/(NS1)",
        'bus' => "51, 61, 65, 66, 143, 154, 157, 196, 502, 502A",
        'IMAX' => false,
        'LUMIERE' => false,
        'PREMIERE' => true,
    ],

    'Jurong Point' => [
        'locationName' => "Flix Theatres Jurong Point",
        'address' => "1 Jurong West Central 1, #03 - 26 26A, Jurong Point, Singapore 648886",
        'img' => "assets/mall-images/jurongPoint.jpg",
        'halls' => "6 Halls",
        'mrt' => "Boon Lay (EW27)",
        'bus' => "30, 79, 154, 157, 172, 174, 174e, 178, 179, 179A, 180, 181, 182, 182M, 187, 192, 193, 194, 198, 199, 240, 241, 242, 243W/G, 246, 249, 251, 252, 254, 255, 257, 405",
        'IMAX' => true,
        'LUMIERE' => false,
        'PREMIERE' => false,
    ],

    'TheRailMall' => [
        'locationName' => "Flix Theatres TheRailMall",
        'address' => "380 Upper Bukit Timah Rd, 462, TheRailMall, Singapore 678040",
        'img' => "assets/mall-images/theRailMall.jpg",
        'halls' => "4 Halls",
        'mrt' => "Hillview (DT3)",
        'bus' => "67, 75, 178, 184, 963",
        'IMAX' => true,
        'LUMIERE' => true,
        'PREMIERE' => false,
    ],
];

// Store the cinemas array in the session
$_SESSION['cinemas'] = $cinemas;


?>