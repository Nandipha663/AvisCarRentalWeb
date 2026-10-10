<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AvisSystem.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <link rel="stylesheet"
      href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />


    <style>

        /* MAIN PAGE */

        .contact-page {
            max-width: 1000px;
            width: 100%;
            margin: 0 auto;
            padding: 40px 20px;
            box-sizing: border-box;
        }


        /* MAIN HEADING */

        .contact-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .contact-header h1 {
            font-size: 52px !important;
            font-weight: 800 !important;
            color: #000000 !important;
            margin-bottom: 15px;
        }

        .contact-header p {
            color: #666666;
            font-size: 17px;
        }


        /* EACH LARGE SECTION */

        .contact-section {
            width: 100%;
            background: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 25px;
            box-sizing: border-box;
            box-shadow: 0 3px 10px rgba(0,0,0,0.10);
        }


        /* RED SECTION TITLES */

        .section-title h2 {
            color: #c8102e !important;
            font-size: 30px !important;
            font-weight: 700 !important;
            margin-top: 0;
            margin-bottom: 8px;
        }

        .section-title p {
            color: #666666;
            margin-bottom: 20px;
        }


        /* SMALL CARDS INSIDE */

        .contact-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            width: 100%;
        }

        .contact-card {
            flex: 1 1 250px;
            min-width: 0;
            padding: 20px;
            background: #f7f7f7;
            border: 1px solid #dddddd;
            border-radius: 7px;
            box-sizing: border-box;
        }

        .contact-card h3 {
            font-size: 19px;
            font-weight: 600;
            color: #222222;
            margin-top: 0;
        }

        .contact-card p {
            color: #666666;
            line-height: 1.5;
        }

        .contact-card a {
            color: #c8102e !important;
            font-weight: 600;
            text-decoration: none;
        }


        /* OTHER ENQUIRIES */

        .general-contact {
            width: 100%;
            background: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 25px;
            box-sizing: border-box;
            box-shadow: 0 3px 10px rgba(0,0,0,0.10);
            text-align: center;
        }

        .general-contact h2 {
            color: #c8102e !important;
            font-size: 30px !important;
            font-weight: 700 !important;
            margin-top: 0;
        }


        /* MOBILE */

        @media (max-width: 768px) {

            .contact-page {
                padding: 30px 15px;
            }

            .contact-header h1 {
                font-size: 38px !important;
            }

            .contact-cards {
                flex-direction: column;
            }

            .contact-card {
                width: 100%;
            }
        }

        .contact-highlight {
            color: #c8102e !important;
            font-weight: 600;
        }

    </style>

    <main class="contact-page">

    <!-- MAIN HEADING -->
    <div class="contact-header">
        <h1>We're Here to Help</h1>

        <p>
            Whether you're planning your rental, currently on the road,
            or have a question after returning your vehicle, we're here to assist.
        </p>
    </div>

        <!-- AVIS LOCATIONS MAP -->

    <section class="contact-section">

        <div class="section-title">

            <h2>Find an Avis Location</h2>

            <p>
                Visit one of our Avis branches across South Africa.
            </p>

        </div>

        <div class="contact-map-container">

            <div id="avisMap"></div>

        </div>

        </section>


    <!-- BEFORE YOUR RENTAL -->
    <section class="contact-section">

        <div class="section-title">
            <h2>Before Your Rental</h2>

            <p>
                Need help before picking up your vehicle?
            </p>
        </div>

        <div class="contact-cards">

            <div class="contact-card">
                <h3>Make a Booking</h3>

                <p>
                    Need to make a new vehicle reservation?
                    Contact our reservations team for assistance.
                </p>

                <p class="contact-highlight">reservations@avis.co.za</p>
            </div>


            <div class="contact-card">
                <h3>Amend a Booking</h3>

                <p>
                    Need to change your pickup time, return date,
                    vehicle or other booking details?
                </p>

                <p class="contact-highlight">Contact Reservations</p>
                <p class="contact-highlight">Contact: 0800 674 223</p>
            </div>


            <div class="contact-card">
                <h3>Cancel a Booking</h3>

                <p>
                    If you no longer require your rental,
                    contact Reservations to cancel your booking.
                </p>

                <p class="contact-highlight">Cancel Your Booking</p>
                <p class="contact-highlight">Contact: 0800 674 335</p>
            </div>

        </div>

    </section>


    <!-- DURING YOUR RENTAL -->
    <section class="contact-section">

        <div class="section-title">
            <h2>During Your Rental</h2>

            <p>
                Already on the road? We're here when you need us.
            </p>
        </div>

        <div class="contact-cards">

            <div class="contact-card">
                <h3>Roadside Assistance</h3>

                <p>
                    If your rental vehicle breaks down or you
                    experience an emergency, contact our assistance team.
                </p>

                <p class="contact-highlight">0800 001 118</p>
            </div>


            <div class="contact-card">
                <h3>Extend Your Rental</h3>

                <p>
                    Need to keep your vehicle for longer?
                    Contact Reservations about extending your rental.
                </p>

                <p class="contact-highlight">0861 021 556</p>
            </div>


            <div class="contact-card">
                <h3>Contact Your Branch</h3>

                <p>
                    Contact the branch where you collected
                    your rental vehicle.
                </p>

                <a href="../CustomerPages/Branches.aspx">
                    Find Your Branch
                </a>
            </div>

        </div>

    </section>


    <!-- AFTER YOUR RENTAL -->
    <section class="contact-section">

        <div class="section-title">
            <h2>After Your Rental</h2>

            <p>
                Have a question after returning your vehicle?
            </p>
        </div>

        <div class="contact-cards">

            <div class="contact-card">
                <h3>Invoices & Billing</h3>

                <p>
                    Have a question about your invoice,
                    charges or payment?
                </p>

                <p class="contact-highlight">Contact Customer Service</p>
                <p class="contact-highlight">Contact: 0800 675 443</p>
            </div>


            <div class="contact-card">
                <h3>Refunds & Deposits</h3>

                <p>
                    Have a question about your deposit,
                    refund or an additional charge?
                </p>

                <p class="contact-highlight">Contact Customer Service</p>
                <p class="contact-highlight">Contact: 0800 675 443</p>
            </div>


            <div class="contact-card">
                <h3>Customer Service</h3>

                <p>
                    For post-rental queries, complaints
                    or feedback, we're here to assist.
                </p>

                <p class="contact-highlight">customerservices@avis.co.za</p>
            </div>

        </div>

    </section>


    <!-- OTHER ENQUIRIES -->
    <section class="general-contact">

        <h2>Other Enquiries</h2>

        <p>
            Can't find what you're looking for?
            Our team can help with general enquiries.
        </p>

        <p class="contact-highlight">Contact Us</p>
        <p class="contact-highlight">0800 465 773</p>
        

    </section>

</main>

    
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<script>

    window.addEventListener("load", function () {

        // =========================================
        // CHECK IF LEAFLET LOADED
        // =========================================

        if (typeof L === "undefined") {

            alert("Leaflet could not be loaded.");

            return;
        }


        // =========================================
        // CREATE MAP
        // =========================================

        var map = L.map("avisMap").setView(
            [-30.5595, 22.9375],
            5
        );


        // =========================================
        // OPEN STREET MAP
        // =========================================

        L.tileLayer(
            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            {
                attribution: "&copy; OpenStreetMap contributors"
            }
        ).addTo(map);


        // =========================================
        // RED AVIS ICON
        // =========================================

        var redIcon = L.divIcon({

            className: "avis-red-marker",

            html: '<div class="red-dot"></div>',

            iconSize: [24, 24],

            iconAnchor: [12, 12]

        });


        // =========================================
        // AVIS BRANCHES
        // =========================================

        var locations = [

            {
                name: "Avis Bloemfontein Airport",
                latitude: -29.0927,
                longitude: 26.3024,
                address: "Bram Fischer International Airport, Bloemfontein"
            },

            {
                name: "Avis Cape Town Downtown",
                latitude: -33.9249,
                longitude: 18.4241,
                address: "Cape Town Downtown, Western Cape"
            },

            {
                name: "Avis East London Airport",
                latitude: -33.0356,
                longitude: 27.8259,
                address: "East London Airport, Eastern Cape"
            },

            {
                name: "Avis George Airport",
                latitude: -34.0056,
                longitude: 22.3789,
                address: "George Airport, Western Cape"
            },

            {
                name: "Avis Kimberley Airport",
                latitude: -28.8028,
                longitude: 24.7656,
                address: "Kimberley Airport, Northern Cape"
            },

            {
                name: "Avis King Shaka International",
                latitude: -29.6144,
                longitude: 31.1197,
                address: "King Shaka International Airport, KwaZulu-Natal"
            },

            {
                name: "Avis Kruger Mpumalanga International",
                latitude: -25.3833,
                longitude: 31.1056,
                address: "Kruger Mpumalanga International Airport, Mpumalanga"
            },

            {
                name: "Avis OR Tambo International Airport",
                latitude: -26.1367,
                longitude: 28.2411,
                address: "OR Tambo International Airport, Gauteng"
            },

            {
                name: "Avis Pietermaritzburg Airport",
                latitude: -29.6490,
                longitude: 30.3987,
                address: "Pietermaritzburg Airport, KwaZulu-Natal"
            },

            {
                name: "Avis Polokwane Airport",
                latitude: -23.8453,
                longitude: 29.4586,
                address: "Polokwane Airport, Limpopo"
            },

            {
                name: "Avis Port Elizabeth Airport",
                latitude: -33.9849,
                longitude: 25.6173,
                address: "Port Elizabeth Airport, Eastern Cape"
            },

            {
                name: "Avis Rustenburg",
                latitude: -25.6676,
                longitude: 27.2421,
                address: "Rustenburg, North West"
            },

            {
                name: "Avis Umhlanga",
                latitude: -29.7268,
                longitude: 31.0866,
                address: "Umhlanga, KwaZulu-Natal"
            }

        ];


        // =========================================
        // ADD MARKERS
        // =========================================

        locations.forEach(function (location) {

            var marker = L.marker(
                [
                    location.latitude,
                    location.longitude
                ],
                {
                    icon: redIcon
                }
            ).addTo(map);


            // =========================================
            // POPUP
            // =========================================

            marker.bindPopup(

                "<strong style='color:#c8102e;'>" +
                location.name +
                "</strong>" +

                "<br><br>" +

                location.address

            );

        });


        // =========================================
        // FIX MAP DISPLAY
        // =========================================

        setTimeout(function () {

            map.invalidateSize();

        }, 500);

    });

</script>

</asp:Content>
