<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AvisSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <div class="fleet-page">

    <!-- TOP BOOK NOW -->
    <div class="fleet-booking-top">
        <a href="CustomerPages/MakeBooking.aspx" class="fleet-book-button">
            Book Now
        </a>
    </div>


    <!-- HEADING -->
    <div class="fleet-heading">
        <h1>Our Fleet</h1>

        <p>
            Choose from our range of vehicles to find the right one
            for your journey.
        </p>
    </div>


    <!-- 1. HATCHBACK -->
    <div class="fleet-card">

        <div class="fleet-card-heading">
            <h2>Hatchback</h2>
            <h3 style="color: #c8102e;">For example: Toyota Starlet</h3>
        </div>

        <div class="fleet-details">

            <div class="fleet-image">
                <img src="<%= ResolveUrl("~/Content/images/ToyotaStarlet2.png") %>"
                 alt="Toyota Starlet" />
            </div>

            <div class="fleet-description">
                <p>
                    Looking for a practical vehicle that's easy to drive
                    and perfect for everyday journeys? The Toyota Starlet
                    offers a comfortable interior, excellent fuel efficiency
                    and a compact design that makes it ideal for city driving
                    and everyday travel.
                </p>
            </div>

        </div>

        <hr class="red-line"  style="border: 8px solid #c8102e;">
    </div>


    <!-- 2. SUV -->
    <div class="fleet-card">

        <div class="fleet-card-heading">
            <h2>SUV</h2>
             <h3 style="color: #c8102e;">For example: Mercedes-Benz GLE Coupe</h3>
        </div>

        <div class="fleet-details">

            <div class="fleet-image">
                <img src="Content/images/Mercedes-benz.png"
                     alt="Mercedes-Benz GLE Coupe" />
            </div>

            <div class="fleet-description">
                <p>
                    Need more space and comfort for your journey?
                    The Mercedes-Benz GLE Coupe combines luxury,
                    performance and generous interior space, making
                    it a great choice for family trips and longer journeys.
                </p>
            </div>

        </div>
        <hr class="red-line"  style="border: 8px solid #c8102e;">
    </div>


    <!-- 3. STANDARD -->
    <div class="fleet-card">

        <div class="fleet-card-heading">
            <h2>Standard</h2>
            <h3 style="color: #c8102e;">For example: BMW XM</h3>
        </div>

        <div class="fleet-details">

            <div class="fleet-image">
                <img src="Content/images/BMWXM.png"
                     alt="BMW XM" />
            </div>

            <div class="fleet-description">
                <p>
                    Enjoy a balance of comfort, space and impressive
                    performance with the BMW XM. It is designed for
                    customers who want a refined driving experience
                    while still having plenty of room for their journey.
                </p>
            </div>

        </div>
        <hr class="red-line"  style="border: 8px solid #c8102e;">
    </div>


    <!-- 4. VAN -->
    <div class="fleet-card">

        <div class="fleet-card-heading">
            <h2>Van</h2>
            <h3 style="color: #c8102e;">For example: Hyundai H1</h3>
        </div>

        <div class="fleet-details">

            <div class="fleet-image">
                <img src="Content/images/HyundaiH1.png"
                     alt="Hyundai H1" />
            </div>

            <div class="fleet-description">
                <p>
                    Need a vehicle with plenty of room for passengers,
                    equipment or luggage? The Hyundai H1 provides generous
                    interior space and practical versatility, making it
                    suitable for group travel, work and moving larger loads.
                </p>
            </div>

        </div>
        <hr class="red-line"  style="border: 8px solid #c8102e;">
    </div>


    <!-- 5. SEDAN -->
    <div class="fleet-card">

        <div class="fleet-card-heading">
            <h2>Sedan</h2>
            <h3 style="color: #c8102e;">For example: Suzuki Dzire</h3>
        </div>

        <div class="fleet-details">

            <div class="fleet-image">
                <img src="Content/images/SuzukiDzire2.png"
                     alt="Suzuki Dzire" />
            </div>

            <div class="fleet-description">
                <p>
                    Looking for a comfortable and reliable everyday car?
                    The Suzuki Dzire provides a smooth driving experience,
                    practical space and excellent fuel efficiency, making
                    it a great option for commuting and everyday travel.
                </p>
            </div>

        </div>
        <hr class="red-line"  style="border: 8px solid #c8102e;">
    </div>


    <!-- 6. LUXURY -->
    <div class="fleet-card">

        <div class="fleet-card-heading">
            <h2>Luxury</h2>
            <h3 style="color: #c8102e;">For example: Range Rover Sport</h3>
        </div>

        <div class="fleet-details">

            <div class="fleet-image">
                <img src="Content/images/RangeRoverSport2.png"
                     alt="Range Rover Sport" />
            </div>

            <div class="fleet-description">
                <p>
                    Want to make your journey more special? The Range Rover
                    Sport offers premium comfort, distinctive styling and
                    impressive performance for customers looking for a
                    refined and luxurious driving experience.
                </p>
            </div>

        </div>
        <hr class="red-line"  style="border: 8px solid #c8102e;">
    </div>


    <!-- 7. PREMIUM -->
    <div class="fleet-card">

        <div class="fleet-card-heading">
            <h2>Premium</h2>
            <h3 style="color: #c8102e;">For example: BMW 2 Series Gran Coupe</h3>
        </div>

        <div class="fleet-details">

            <div class="fleet-image">
                <img src="Content/images/BMW2SeriesGranCopue2.png"
                     alt="BMW 2 Series Gran Coupe" />
            </div>

            <div class="fleet-description">
                <p>
                    Looking for a stylish vehicle with a premium feel?
                    The BMW 2 Series Gran Coupe combines sophisticated
                    design, comfortable features and enjoyable performance,
                    making it ideal for business trips and special occasions.
                </p>
            </div>

        </div>
        <hr class="red-line"  style="border: 8px solid #c8102e;">
    </div>


    <!-- 8. COMPACT -->
    <div class="fleet-card">

        <div class="fleet-card-heading">
            <h2>Compact</h2>
            <h3 style="color: #c8102e;">For example: Volkswagen Polo Vivo</h3>

        </div>

        <div class="fleet-details">

            <div class="fleet-image">
                <img src="Content/images/VolkswagenPoloVivo.png"
                     alt="Volkswagen Polo Vivo" />
            </div>

            <div class="fleet-description">
                <p>
                    Need a reliable vehicle that's easy to handle around
                    town? The Volkswagen Polo Vivo offers practical comfort,
                    convenient size and dependable performance, making it
                    a great choice for everyday city driving.
                </p>
            </div>

        </div>
        <hr class="red-line"  style="border: 8px solid #c8102e;">
    </div>


    <!-- BOTTOM BOOK NOW -->
    <div class="fleet-booking-bottom">

        <a href="CustomerPages/MakeBooking.aspx"
           class="fleet-book-button">
            Book Now
        </a>

    </div>




</div>

</asp:Content>
