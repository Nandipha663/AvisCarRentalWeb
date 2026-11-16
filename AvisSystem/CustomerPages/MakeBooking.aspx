<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeBooking.aspx.cs" Inherits="AvisSystem.CustomerPages.MakeBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   
    <div class="booking-page">

        <!-- ==============================
             PAGE HEADING
             ============================== -->

        <div class="booking-heading">

            <h1>Let's find your perfect car</h1>

            <p>Search for availability and the best rates</p>

        </div>


        <!-- ==============================
             BOOKING CARD
             ============================== -->

        <div class="booking-card">


            <!-- PICK UP LOCATION -->

            <div class="booking-section">

                <label class="booking-label">
                    <i class="fa-solid fa-location-dot"></i>
                    Pick up location
                </label>

                <asp:DropDownList
                    ID="ddlPickupLocation"
                    runat="server"
                    CssClass="booking-dropdown">

                    <asp:ListItem Text="Mhlanga" Value="Mhlanga"></asp:ListItem>
                    <asp:ListItem Text="Bloemfontein Airport" Value="Bloemfontein Airport"></asp:ListItem>
                    <asp:ListItem Text="East London Airport" Value="East London Airport"></asp:ListItem>
                    <asp:ListItem Text="George Airport" Value="George Airport"></asp:ListItem>
                    <asp:ListItem Text="Kimberley Airport" Value="Kimberley Airport"></asp:ListItem>
                    <asp:ListItem Text="King Shaka Int" Value="King Shaka Int"></asp:ListItem>
                    <asp:ListItem Text="Kruger Mpumalanga Int" Value="Kruger Mpumalanga Int"></asp:ListItem>
                    <asp:ListItem Text="OR Tambo Int Airport" Value="OR Tambo Int Airport"></asp:ListItem>
                    <asp:ListItem Text="Pietermaritzburg Airport" Value="Pietermaritzburg Airport"></asp:ListItem>
                    <asp:ListItem Text="Polokwane Airport" Value="Polokwane Airport"></asp:ListItem>
                    <asp:ListItem Text="Port Elizabeth Airport" Value="Port Elizabeth Airport"></asp:ListItem>
                    <asp:ListItem Text="Rustenburg" Value="Rustenburg"></asp:ListItem>

                </asp:DropDownList>

                <asp:Label
                    ID="lblPickupLocationError"
                    runat="server"
                    CssClass="validation-message"
                    Visible="false">
                </asp:Label>

            </div>


            <!-- RETURN TO DIFFERENT LOCATION -->

            <div class="different-location">

                <asp:CheckBox
                    ID="chkDifferentLocation"
                    runat="server"
                    ClientIDMode="Static"
                    CssClass="different-checkbox"
                    Text="Return to a different location"
                    onclick="toggleReturnLocation()" />

            </div>


            <!-- RETURN LOCATION -->

            <div id="returnLocationSection" class="booking-section return-location">

                <label class="booking-label">

                    <i class="fa-solid fa-location-dot"></i>

                    Return location

                </label>

                <asp:DropDownList
                    ID="ddlReturnLocation"
                    runat="server"
                    CssClass="booking-dropdown">

                    <asp:ListItem
                        Text="Select return location"
                        Value="">
                    </asp:ListItem>

                    <asp:ListItem Text="Mhlanga" Value="Mhlanga"></asp:ListItem>
                    <asp:ListItem Text="Cape Town Downtown" Value="Cape Town Downtown"></asp:ListItem>
                    <asp:ListItem Text="Bloemfontein Airport" Value="Bloemfontein Airport"></asp:ListItem>
                    <asp:ListItem Text="East London Airport" Value="East London Airport"></asp:ListItem>
                    <asp:ListItem Text="George Airport" Value="George Airport"></asp:ListItem>
                    <asp:ListItem Text="Kimberley Airport" Value="Kimberley Airport"></asp:ListItem>
                    <asp:ListItem Text="King Shaka Int" Value="King Shaka Int"></asp:ListItem>
                    <asp:ListItem Text="Kruger Mpumalanga Int" Value="Kruger Mpumalanga Int"></asp:ListItem>
                    <asp:ListItem Text="OR Tambo Int Airport" Value="OR Tambo Int Airport"></asp:ListItem>
                    <asp:ListItem Text="Pietermaritzburg Airport" Value="Pietermaritzburg Airport"></asp:ListItem>
                    <asp:ListItem Text="Polokwane Airport" Value="Polokwane Airport"></asp:ListItem>
                    <asp:ListItem Text="Port Elizabeth Airport" Value="Port Elizabeth Airport"></asp:ListItem>
                    <asp:ListItem Text="Rustenburg" Value="Rustenburg"></asp:ListItem>

                </asp:DropDownList>

                <asp:Label
                    ID="lblReturnLocationError"
                    runat="server"
                    CssClass="validation-message"
                    Visible="false">
                </asp:Label>

            </div>


            <!-- ==============================
                 DATE AND TIME
                 ============================== -->

            <div class="booking-date-time">


                <!-- PICK UP -->

                <div class="date-time-column">

                    <h3>
                        Pick Up Date &amp; Time
                    </h3>


                    <!-- PICKUP DATE -->

                    <div class="input-with-icon">

                        <i class="fa-solid fa-calendar-days"></i>

                        <asp:TextBox
                            ID="txtPickupDate"
                            runat="server"
                            CssClass="booking-input"
                            TextMode="Date">
                        </asp:TextBox>

                    </div>

                    <asp:Label
                        ID="lblPickupDateError"
                        runat="server"
                        CssClass="validation-message"
                        Visible="false">
                    </asp:Label>


                    <!-- PICKUP TIME -->

                    <div class="input-with-icon">

                        <i class="fa-solid fa-clock"></i>

                        <asp:DropDownList
                            ID="ddlPickupTime"
                            runat="server"
                            CssClass="booking-input">

                            <asp:ListItem Text="08:00" Value="08:00"></asp:ListItem>
                            <asp:ListItem Text="08:30" Value="08:30"></asp:ListItem>
                            <asp:ListItem Text="09:00" Value="09:00"></asp:ListItem>
                            <asp:ListItem Text="09:30" Value="09:30"></asp:ListItem>
                            <asp:ListItem Text="10:00" Value="10:00"></asp:ListItem>
                            <asp:ListItem Text="10:30" Value="10:30"></asp:ListItem>
                            <asp:ListItem Text="11:00" Value="11:00"></asp:ListItem>
                            <asp:ListItem Text="11:30" Value="11:30"></asp:ListItem>
                            <asp:ListItem Text="12:00" Value="12:00"></asp:ListItem>
                            <asp:ListItem Text="12:30" Value="12:30"></asp:ListItem>
                            <asp:ListItem Text="13:00" Value="13:00"></asp:ListItem>
                            <asp:ListItem Text="13:30" Value="13:30"></asp:ListItem>
                            <asp:ListItem Text="14:00" Value="14:00"></asp:ListItem>
                            <asp:ListItem Text="14:30" Value="14:30"></asp:ListItem>
                            <asp:ListItem Text="15:00" Value="15:00"></asp:ListItem>
                            <asp:ListItem Text="15:30" Value="15:30"></asp:ListItem>
                            <asp:ListItem Text="16:00" Value="16:00"></asp:ListItem>
                            <asp:ListItem Text="16:30" Value="16:30"></asp:ListItem>

                        </asp:DropDownList>

                    </div>

                    <asp:Label
                        ID="lblPickupTimeError"
                        runat="server"
                        CssClass="validation-message"
                        Visible="false">
                    </asp:Label>

                </div>


                <!-- RETURN -->

                <div class="date-time-column">

                    <h3>
                        Return Date &amp; Time
                    </h3>


                    <!-- RETURN DATE -->

                    <div class="input-with-icon">

                        <i class="fa-solid fa-calendar-days"></i>

                        <asp:TextBox
                            ID="txtReturnDate"
                            runat="server"
                            CssClass="booking-input"
                            TextMode="Date">
                        </asp:TextBox>

                    </div>

                    <asp:Label
                        ID="lblReturnDateError"
                        runat="server"
                        CssClass="validation-message"
                        Visible="false">
                    </asp:Label>


                    <!-- RETURN TIME -->

                    <div class="input-with-icon">

                        <i class="fa-solid fa-clock"></i>

                        <asp:DropDownList
                            ID="ddlReturnTime"
                            runat="server"
                            CssClass="booking-input">

                            <asp:ListItem Text="08:00" Value="08:00"></asp:ListItem>
                            <asp:ListItem Text="08:30" Value="08:30"></asp:ListItem>
                            <asp:ListItem Text="09:00" Value="09:00"></asp:ListItem>
                            <asp:ListItem Text="09:30" Value="09:30"></asp:ListItem>
                            <asp:ListItem Text="10:00" Value="10:00"></asp:ListItem>
                            <asp:ListItem Text="10:30" Value="10:30"></asp:ListItem>
                            <asp:ListItem Text="11:00" Value="11:00"></asp:ListItem>
                            <asp:ListItem Text="11:30" Value="11:30"></asp:ListItem>
                            <asp:ListItem Text="12:00" Value="12:00"></asp:ListItem>
                            <asp:ListItem Text="12:30" Value="12:30"></asp:ListItem>
                            <asp:ListItem Text="13:00" Value="13:00"></asp:ListItem>
                            <asp:ListItem Text="13:30" Value="13:30"></asp:ListItem>
                            <asp:ListItem Text="14:00" Value="14:00"></asp:ListItem>
                            <asp:ListItem Text="14:30" Value="14:30"></asp:ListItem>
                            <asp:ListItem Text="15:00" Value="15:00"></asp:ListItem>
                            <asp:ListItem Text="15:30" Value="15:30"></asp:ListItem>
                            <asp:ListItem Text="16:00" Value="16:00"></asp:ListItem>
                            <asp:ListItem Text="16:30" Value="16:30"></asp:ListItem>

                        </asp:DropDownList>

                    </div>

                    <asp:Label
                        ID="lblReturnTimeError"
                        runat="server"
                        CssClass="validation-message"
                        Visible="false">
                    </asp:Label>

                </div>

            </div>


            <!-- ==============================
                 SEARCH VEHICLES
                 ============================== -->

            <div class="search-button-container">

                <asp:Button
                    ID="btnSearchVehicles"
                    runat="server"
                    Text="Search Vehicles"
                    CssClass="search-vehicles-button"
                    OnClick="btnSearchVehicles_Click" />

            </div>

        </div>


        <!-- ==============================
             AVIS BENEFITS
             ============================== -->

        <div class="booking-benefits">


            <!-- BENEFIT 1 -->

            <div class="benefit-item">

                <div class="benefit-icon">
                    <i class="fa-solid fa-calendar-check"></i>
                </div>

                <h2>Flexible Cancellation Policy</h2>

                <p>
                    Changes and cancellation made easier
                </p>

            </div>


            <!-- BENEFIT 2 -->

            <div class="benefit-item">

                <div class="benefit-icon">
                    <i class="fa-solid fa-pen-to-square"></i>
                </div>

                <h2>Easy Booking Changes</h2>

                <p>
                    Modify your booking whenever you need to
                </p>

            </div>


            <!-- BENEFIT 3 -->

            <div class="benefit-item">

                <div class="benefit-icon">
                    <i class="fa-solid fa-car"></i>
                </div>

                <h2>Wide Range of Vehicles</h2>

                <p>
                    Choose the vehicle that suits your journey
                </p>

            </div>


            <!-- BENEFIT 4 -->

            <div class="benefit-item">

                <div class="benefit-icon">
                    <i class="fa-solid fa-shield-halved"></i>
                </div>

                <h2>Trusted Service</h2>

                <p>
                    Book your vehicle with confidence
                </p>

            </div>

        </div>


        <!-- ==============================
             WIDE IMAGE
             ============================== -->

        <div class="booking-banner">

            <img
                src="../Content/images/BookingAvisImage.png"
                alt="Avis car rental" />

        </div>


    </div>


    <!-- ==============================
         JAVASCRIPT
         ============================== -->

    <script>

        function toggleReturnLocation() {

            var checkbox =
                document.getElementById("chkDifferentLocation");

            var returnSection =
                document.getElementById("returnLocationSection");

            if (checkbox.checked) {

                returnSection.style.display = "block";

            } else {

                returnSection.style.display = "none";

            }
        }


        // Hide return location when page loads

        window.onload = function () {

            toggleReturnLocation();

        };

    </script>



</asp:Content>
