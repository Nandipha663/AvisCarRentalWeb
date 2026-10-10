<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vehicles.aspx.cs" Inherits="AvisSystem.CustomerPages.Vehicles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="vehicle-page">

        <!-- PAGE HEADING -->

        <div class="vehicle-heading">

            <h1>Choose Your Vehicle</h1>

            <p class="vehicle-subtitle">
                Select the vehicle that best suits your journey.
            </p>

        </div>


        <!-- CUSTOMER BOOKING INFORMATION -->

        <div class="booking-summary">

            <div class="summary-item">

                <i class="fa-solid fa-location-dot"></i>

                <div>
                    <span>Pick Up Location</span>

                    <strong>
                        <asp:Label 
                            ID="lblPickupLocation"
                            runat="server">
                        </asp:Label>
                    </strong>
                </div>

            </div>


            <div class="summary-item">

                <i class="fa-solid fa-calendar-days"></i>

                <div>
                    <span>Pick Up</span>

                    <strong>
                        <asp:Label 
                            ID="lblPickupDate"
                            runat="server">
                        </asp:Label>
                    </strong>
                </div>

            </div>


            <div class="summary-item">

                <i class="fa-solid fa-calendar-check"></i>

                <div>
                    <span>Return</span>

                    <strong>
                        <asp:Label 
                            ID="lblReturnDate"
                            runat="server">
                        </asp:Label>
                    </strong>
                </div>

            </div>

        </div>



        <!-- ========================= -->
        <!-- HATCHBACK -->
        <!-- ========================= -->

        <div class="vehicle-category">

            <div class="category-header">

                <div>
                    <h2>Hatchback</h2>

                    <h3>
                        For example: Toyota Starlet
                    </h3>
                </div>

                <asp:Button
                    ID="btnHatchbackDetails" 
    runat="server" 
    Text="View more details" 
    CssClass="details-button"
    PostBackUrl="HatchbackVehicles.aspx" />

            </div>


            <!-- CARS -->

            <asp:Panel 
                ID="pnlHatchback"
                runat="server"
                CssClass="vehicle-list">

                <!-- CAR 1 -->

                <div class="vehicle-card">

                    <div class="vehicle-image">

                        <img 
                            src="../Content/images/ToyotaStarlet2.png"
                            alt="Toyota Starlet" />

                    </div>


                    <div class="vehicle-info">

                        <h3>Toyota Starlet</h3>

                        <p class="vehicle-category-name">
                            Hatchback
                        </p>

                        <div class="vehicle-features">

                            <span>
                                <i class="fa-solid fa-user"></i>
                                5 Seats
                            </span>

                            <span>
                                <i class="fa-solid fa-suitcase"></i>
                                2 Bags
                            </span>

                            <span>
                                <i class="fa-solid fa-gears"></i>
                                Automatic
                            </span>

                        </div>

                    </div>


                    <div class="vehicle-price">

                        <strong>R450/day</strong>

                        <asp:Button
                            ID="btnSelectStarlet"
                            runat="server"
                            Text="Select"
                            CssClass="select-vehicle-button"
                            CommandArgument="Toyota Starlet"
                            OnClick="btnSelectVehicle_Click" />

                    </div>

                </div>

            </asp:Panel>

        </div>



        <!-- ========================= -->
        <!-- SUV -->
        <!-- ========================= -->

        <div class="vehicle-category">

            <div class="category-header">

                <div>

                    <h2>SUV</h2>

                    <h3>
                        For example: Mercedes-Benz GLE Coupe
                    </h3>

                </div>

                <asp:Button
                    ID="btnSUVDetails" 
    runat="server" 
    Text="View more details" 
    CssClass="details-button"
    PostBackUrl="SUVVehicles.aspx" />

            </div>


            <asp:Panel
                ID="pnlSUV"
                runat="server"
                CssClass="vehicle-list">

                <div class="vehicle-card">

                    <div class="vehicle-image">

                        <img
                            src="../Content/images/Mercedes-benz.png"
                            alt="Mercedes-Benz GLE Coupe" />

                    </div>


                    <div class="vehicle-info">

                        <h3>Mercedes-Benz GLE Coupe</h3>

                        <p class="vehicle-category-name">
                            SUV
                        </p>

                        <div class="vehicle-features">

                            <span>
                                <i class="fa-solid fa-user"></i>
                                5 Seats
                            </span>

                            <span>
                                <i class="fa-solid fa-suitcase"></i>
                                4 Bags
                            </span>

                            <span>
                                <i class="fa-solid fa-gears"></i>
                                Automatic
                            </span>

                        </div>

                    </div>


                    <div class="vehicle-price">

                        <strong>R1000/day</strong>

                        <asp:Button
                            ID="btnSelectGLE"
                            runat="server"
                            Text="Select"
                            CssClass="select-vehicle-button"
                            CommandArgument="Mercedes-Benz GLE Coupe"
                            OnClick="btnSelectVehicle_Click" />

                    </div>

                </div>

            </asp:Panel>

        </div>



        <!-- ========================= -->
        <!-- STANDARD -->
        <!-- ========================= -->

        <div class="vehicle-category">

            <div class="category-header">

                <div>

                    <h2>Standard</h2>

                    <h3>
                        For example: BMW XM
                    </h3>

                </div>

                <asp:Button
                    ID="btnStandardDetails" 
    runat="server" 
    Text="View more details" 
    CssClass="details-button"
    PostBackUrl="StandardVehicles.aspx" />

            </div>


            <asp:Panel
                ID="pnlStandard"
                runat="server"
                CssClass="vehicle-list">

                <div class="vehicle-card">

                    <div class="vehicle-image">

                        <img
                            src="../Content/images/BMWXM.png"
                            alt="BMW XM" />

                    </div>


                    <div class="vehicle-info">

                        <h3>BMW XM</h3>

                        <p class="vehicle-category-name">
                            Standard
                        </p>

                        <div class="vehicle-features">

                            <span>
                                <i class="fa-solid fa-user"></i>
                                5 Seats
                            </span>

                            <span>
                                <i class="fa-solid fa-suitcase"></i>
                                4 Bags
                            </span>

                            <span>
                                <i class="fa-solid fa-gears"></i>
                                Automatic
                            </span>

                        </div>

                    </div>


                    <div class="vehicle-price">

                        <strong>R950/day</strong>

                        <asp:Button
                            ID="btnSelectBMW"
                            runat="server"
                            Text="Select"
                            CssClass="select-vehicle-button"
                            CommandArgument="BMW XM"
                            OnClick="btnSelectVehicle_Click" />

                    </div>

                </div>

            </asp:Panel>

        </div>



        <!-- ========================= -->
        <!-- VAN -->
        <!-- ========================= -->

        <div class="vehicle-category">

            <div class="category-header">

                <div>

                    <h2>Van</h2>

                    <h3>
                        For example: Hyundai H1
                    </h3>

                </div>

                <asp:Button
                    ID="btnVanDetails" 
    runat="server" 
    Text="View more details" 
    CssClass="details-button"
    PostBackUrl="VanVehicles.aspx" />

            </div>


            <asp:Panel
                ID="pnlVan"
                runat="server"
                CssClass="vehicle-list">

                <div class="vehicle-card">

                    <div class="vehicle-image">

                        <img
                            src="../Content/images/HyundaiH1.png"
                            alt="Hyundai H1" />

                    </div>


                    <div class="vehicle-info">

                        <h3>Hyundai H1</h3>

                        <p class="vehicle-category-name">
                            Van
                        </p>

                        <div class="vehicle-features">

                            <span>
                                <i class="fa-solid fa-user"></i>
                                8 Seats
                            </span>

                            <span>
                                <i class="fa-solid fa-suitcase"></i>
                                6 Bags
                            </span>

                            <span>
                                <i class="fa-solid fa-gears"></i>
                                Automatic
                            </span>

                        </div>

                    </div>


                    <div class="vehicle-price">

                        <strong>R650/day</strong>

                        <asp:Button
                            ID="btnSelectH1"
                            runat="server"
                            Text="Select"
                            CssClass="select-vehicle-button"
                            CommandArgument="Hyundai H1"
                            OnClick="btnSelectVehicle_Click" />

                    </div>

                </div>

            </asp:Panel>

        </div>



        <!-- ========================= -->
        <!-- SEDAN -->
        <!-- ========================= -->

        <div class="vehicle-category">

            <div class="category-header">

                <div>

                    <h2>Sedan</h2>

                    <h3>
                        For example: Suzuki Dzire
                    </h3>

                </div>

                <asp:Button
                    ID="btnSedanDetails" 
    runat="server" 
    Text="View more details" 
    CssClass="details-button"
    PostBackUrl="SedanVehicles.aspx" />

            </div>


            <asp:Panel
                ID="pnlSedan"
                runat="server"
                CssClass="vehicle-list">

                <div class="vehicle-card">

                    <div class="vehicle-image">

                        <img
                            src="../Content/images/SuzukiDzire2.png"
                            alt="Suzuki Dzire" />

                    </div>


                    <div class="vehicle-info">

                        <h3>Suzuki Dzire</h3>

                        <p class="vehicle-category-name">
                            Sedan
                        </p>

                        <div class="vehicle-features">

                            <span>
                                <i class="fa-solid fa-user"></i>
                                5 Seats
                            </span>

                            <span>
                                <i class="fa-solid fa-suitcase"></i>
                                2 Bags
                            </span>

                            <span>
                                <i class="fa-solid fa-gears"></i>
                                Manual
                            </span>

                        </div>

                    </div>


                    <div class="vehicle-price">

                        <strong>R550/day</strong>

                        <asp:Button
                            ID="btnSelectDzire"
                            runat="server"
                            Text="Select"
                            CssClass="select-vehicle-button"
                            CommandArgument="Suzuki Dzire"
                            OnClick="btnSelectVehicle_Click" />

                    </div>

                </div>

            </asp:Panel>

        </div>



        <!-- ========================= -->
        <!-- LUXURY -->
        <!-- ========================= -->

        <div class="vehicle-category">

            <div class="category-header">

                <div>

                    <h2>Luxury</h2>

                    <h3>
                        For example: Range Rover Sport
                    </h3>

                </div>

                <asp:Button
                    ID="btnLuxuryDetails" 
    runat="server" 
    Text="View more details" 
    CssClass="details-button"
    PostBackUrl="LuxuryVehicles.aspx" />

            </div>


            <asp:Panel
                ID="pnlLuxury"
                runat="server"
                CssClass="vehicle-list">

                <div class="vehicle-card">

                    <div class="vehicle-image">

                        <img
                            src="../Content/images/RangeRoverSport2.png"
                            alt="Range Rover Sport" />

                    </div>


                    <div class="vehicle-info">

                        <h3>Range Rover Sport</h3>

                        <p class="vehicle-category-name">
                            Luxury
                        </p>

                        <div class="vehicle-features">

                            <span>
                                <i class="fa-solid fa-user"></i>
                                5 Seats
                            </span>

                            <span>
                                <i class="fa-solid fa-suitcase"></i>
                                4 Bags
                            </span>

                            <span>
                                <i class="fa-solid fa-gears"></i>
                                Automatic
                            </span>

                        </div>

                    </div>


                    <div class="vehicle-price">

                        <strong>R1,800/day</strong>

                        <asp:Button
                            ID="btnSelectRange"
                            runat="server"
                            Text="Select"
                            CssClass="select-vehicle-button"
                            CommandArgument="Range Rover Sport"
                            OnClick="btnSelectVehicle_Click" />

                    </div>

                </div>

            </asp:Panel>

        </div>



        <!-- ========================= -->
        <!-- PREMIUM -->
        <!-- ========================= -->

        <div class="vehicle-category">

            <div class="category-header">

                <div>

                    <h2>Premium</h2>

                    <h3>
                        For example: BMW 2 Series Gran Coupe
                    </h3>

                </div>

                <asp:Button
                   ID="btnPremiumDetails" 
    runat="server" 
    Text="View more details" 
    CssClass="details-button"
    PostBackUrl="PremiumVehicles.aspx" />

            </div>


            <asp:Panel
                ID="pnlPremium"
                runat="server"
                CssClass="vehicle-list">

                <div class="vehicle-card">

                    <div class="vehicle-image">

                        <img
                            src="../Content/images/BMW2SeriesGranCopue2.png"
                            alt="BMW 2 Series Gran Coupe" />

                    </div>


                    <div class="vehicle-info">

                        <h3>BMW 2 Series Gran Coupe</h3>

                        <p class="vehicle-category-name">
                            Premium
                        </p>

                        <div class="vehicle-features">

                            <span>
                                <i class="fa-solid fa-user"></i>
                                5 Seats
                            </span>

                            <span>
                                <i class="fa-solid fa-suitcase"></i>
                                3 Bags
                            </span>

                            <span>
                                <i class="fa-solid fa-gears"></i>
                                Automatic
                            </span>

                        </div>

                    </div>


                    <div class="vehicle-price">

                        <strong>R1,200/day</strong>

                        <asp:Button
                            ID="btnSelectBMW2"
                            runat="server"
                            Text="Select"
                            CssClass="select-vehicle-button"
                            CommandArgument="BMW 2 Series Gran Coupe"
                            OnClick="btnSelectVehicle_Click" />

                    </div>

                </div>

            </asp:Panel>

        </div>



        <!-- ========================= -->
        <!-- COMPACT -->
        <!-- ========================= -->

        <div class="vehicle-category">

            <div class="category-header">

                <div>

                    <h2>Compact</h2>

                    <h3>
                        For example: Volkswagen Polo Vivo
                    </h3>

                </div>

                <asp:Button
                    ID="btnCompactDetails" 
    runat="server" 
    Text="View more details" 
    CssClass="details-button"
    PostBackUrl="CompactVehicles.aspx" />

            </div>


            <asp:Panel
                ID="pnlCompact"
                runat="server"
                CssClass="vehicle-list">

                <div class="vehicle-card">

                    <div class="vehicle-image">

                        <img
                            src="../Content/images/VolkswagenPoloVivo.png"
                            alt="Volkswagen Polo Vivo" />

                    </div>


                    <div class="vehicle-info">

                        <h3>Volkswagen Polo Vivo</h3>

                        <p class="vehicle-category-name">
                            Compact
                        </p>

                        <div class="vehicle-features">

                            <span>
                                <i class="fa-solid fa-user"></i>
                                5 Seats
                            </span>

                            <span>
                                <i class="fa-solid fa-suitcase"></i>
                                2 Bags
                            </span>

                            <span>
                                <i class="fa-solid fa-gears"></i>
                                Manual
                            </span>

                        </div>

                    </div>


                    <div class="vehicle-price">

                        <strong>R350/day</strong>

                        <asp:Button
                            ID="btnSelectPolo"
                            runat="server"
                            Text="Select"
                            CssClass="select-vehicle-button"
                            CommandArgument="Volkswagen Polo Vivo"
                            OnClick="btnSelectVehicle_Click" />

                    </div>

                </div>

            </asp:Panel>

        </div>
       <div class="booking-total-section">

    <div class="total-amount">
        <span>Total Amount:</span>

        <asp:Label
            ID="lblTotalAmount"
            runat="server"
            Text="R0.00">
        </asp:Label>
    </div>

    <div class="payment-buttons">

        <asp:Button
            ID="btnPayNow"
            runat="server"
            Text="Pay Now"
            CssClass="pay-now-button"
            PostBackUrl="MakePayment.aspx" />

        <asp:Button
            ID="btnPayLater"
            runat="server"
            Text="Pay Later"
            CssClass="pay-later-button" />

    </div>

</div>

    </div>
</asp:Content>
