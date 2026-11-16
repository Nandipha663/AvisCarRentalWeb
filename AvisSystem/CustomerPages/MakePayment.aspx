<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakePayment.aspx.cs" Inherits="AvisSystem.CustomerPages.MakePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="payment-page">

        <h3>You're Almost There!</h3>
        <h1>Please review your booking and confirm payment</h1>

    <!-- =========================================
         CARD 1: BOOKING SUMMARY
         ========================================= -->
    <div class="payment-card booking-card">

        <h2>Booking Summary</h2>

        <div class="booking-content">

            <!-- Vehicle Picture -->
            <div class="vehicle-image-container">
                <img src="../Content/images/BMWXM.png"
                     alt="Selected Vehicle"
                     class="selected-vehicle-image" />
            </div>

            <!-- Vehicle / Booking Information -->
            <div class="booking-information">

                <div class="summary-item">
                    <i class="fas fa-car"></i>
                    <div>
                        <span>Vehicle</span>
                        <strong>Vehicle Name</strong>
                    </div>
                </div>

                <div class="summary-item">
                    <i class="fas fa-calendar-alt"></i>
                    <div>
                        <span>Pick-up Date</span>
                        <strong>22 August 2026</strong>
                    </div>
                </div>

                <div class="summary-item">
                    <i class="fas fa-calendar-check"></i>
                    <div>
                        <span>Return Date</span>
                        <strong>25 August 2026</strong>
                    </div>
                </div>

                <div class="summary-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <div>
                        <span>Pick-up Location</span>
                        <strong>Pietermaritzburg</strong>
                    </div>
                </div>

                <div class="summary-item">
                    <i class="fas fa-map-marker"></i>
                    <div>
                        <span>Return Location</span>
                        <strong>Pietermaritzburg</strong>
                    </div>
                </div>

                <div class="summary-item">
                    <i class="fas fa-money-bill-wave"></i>
                    <div>
                        <span>Amount Due</span>
                        <strong>R1,850.00</strong>
                    </div>
                </div>

            </div>

        </div>

    </div>


    <!-- =========================================
     CARD 2: PERSONAL DETAILS
     ========================================= -->

<div class="payment-card">

<h2>Personal Details</h2>

<p class="card-description">
    Please enter your personal information below.
</p>

<div class="details-form">

    <!-- FULL NAME -->
    <div class="form-group">
        <label>Full Name</label>
        <input type="text"
               placeholder="Enter your full name" />
    </div>

    <!-- ADDRESS -->
    <div class="form-group">
        <label>Address</label>
        <input type="text"
               placeholder="Enter your address" />
    </div>

    <!-- CONTACT NUMBER -->
    <div class="form-group">
        <label>Contact Number</label>
        <input type="tel"
               placeholder="Enter your contact number" />
    </div>

    <!-- EMAIL -->
    <div class="form-group">
        <label>Email Address</label>
        <input type="email"
               placeholder="Enter your email address" />
    </div>


    <!-- =========================================
         DRIVER INFORMATION
         ========================================= -->

    <div class="form-section-title">
        <h3>Driver Information</h3>
        <p>Please provide your driver's licence details.</p>
    </div>

    <!-- LICENCE NUMBER -->
    <div class="form-group">
        <label>Licence Number</label>
        <input type="text"
               placeholder="Enter your licence number" />
    </div>

    <!-- LICENCE CODE -->
    <div class="form-group">
        <label>Licence Code</label>
        <input type="text"
               placeholder="Enter your licence code" />
    </div>


    <!-- =========================================
         ACCOUNT INFORMATION
         ========================================= -->

    <div class="form-section-title">
        <h3>Account Information</h3>
        <p>Create your login details.</p>
    </div>

    <!-- USERNAME -->
    <div class="form-group">
        <label>Username</label>
        <input type="text"
               placeholder="Enter your username" />
    </div>

    <!-- PASSWORD -->
    <div class="form-group">
        <label>Password</label>
        <input type="password"
               placeholder="Enter your password" />
    </div>

</div>

</div>



    <!-- =========================================
         CARD 3: PAYMENT
         ========================================= -->
    <div class="payment-card">

        <h2>Payment</h2>

        <p class="card-description">
            Select your preferred payment method.
        </p>


        <!-- Payment Method -->
        <div class="payment-methods">

            <label class="payment-option">
                <input type="radio"
                       name="paymentMethod"
                       value="card"
                       onclick="showPayment('card')" />

                <span class="radio-circle"></span>

                <span>
                    <i class="fas fa-credit-card"></i>
                    Credit / Debit Card
                </span>
            </label>


            <label class="payment-option">
                <input type="radio"
                       name="paymentMethod"
                       value="eft"
                       onclick="showPayment('eft')" />

                <span class="radio-circle"></span>

                <span>
                    <i class="fas fa-university"></i>
                    EFT
                </span>
            </label>


            <label class="payment-option">
                <input type="radio"
                       name="paymentMethod"
                       value="cash"
                       onclick="showPayment('cash')" />

                <span class="radio-circle"></span>

                <span>
                    <i class="fas fa-money-bill-wave"></i>
                    Cash
                </span>
            </label>

        </div>


        <!-- =========================================
             CREDIT / DEBIT CARD DETAILS
             ========================================= -->
        <div id="cardPayment" class="payment-method-box">

            <h3>Card Details</h3>

            <div class="form-group">
                <label>Cardholder Name</label>
                <input type="text"
                       placeholder="Enter cardholder name" />
            </div>

            <div class="form-group">
                <label>Card Number</label>
                <input type="text"
                       placeholder="1234 5678 9012 3456" />
            </div>

            <div class="payment-row">

                <div class="form-group">
                    <label>Expiry Date</label>
                    <input type="text"
                           placeholder="MM/YY" />
                </div>

                <div class="form-group">
                    <label>CVV</label>
                    <input type="password"
                           placeholder="CVV" />
                </div>

            </div>

        </div>


        <!-- =========================================
             EFT DETAILS
             ========================================= -->
        <div id="eftPayment" class="payment-method-box">

            <h3>AVIS Banking Details</h3>

            <div class="bank-details">

                <div>
                    <span>Account Name</span>
                    <strong>AVIS</strong>
                </div>

                <div>
                    <span>Bank</span>
                    <strong>Standard Bank</strong>
                </div>

                <div>
                    <span>Account Number</span>
                    <strong>051234567</strong>
                </div>

                <div>
                    <span>Reference</span>
                    <strong>Booking #12345</strong>
                </div>

            </div>

            <p class="eft-note">
                Please use your booking number as the payment reference.
            </p>

        </div>


        <!-- =========================================
             CASH DETAILS
             ========================================= -->
        <div id="cashPayment" class="payment-method-box">

            <h3>Cash Payment</h3>

            <div class="amount-due">

                <span>Amount Due</span>

                <strong>R1,850.00</strong>

            </div>

        </div>


        <!-- =========================================
             CONFIRM PAYMENT BUTTON
             ========================================= -->
        <button type="button"
                class="confirm-payment-btn">
            Confirm Payment
        </button>

    </div>
</div>

    <script>
        function showPayment(method) {

            // Hide everything first
            document.getElementById("cardPayment").style.display = "none";
            document.getElementById("eftPayment").style.display = "none";
            document.getElementById("cashPayment").style.display = "none";


            // Show selected payment section
            if (method === "card") {

                document.getElementById("cardPayment").style.display = "block";

            }

            else if (method === "eft") {

                document.getElementById("eftPayment").style.display = "block";

            }

            else if (method === "cash") {

                document.getElementById("cashPayment").style.display = "block";

            }
        }

    </script>

</asp:Content>
