<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TermsAndConditions.aspx.cs" Inherits="AvisSystem.TermsAndConditions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <style>

        /* =========================================
           TERMS AND CONDITIONS PAGE
           ========================================= */

        .terms-page {
            max-width: 1000px;
            width: 100%;
            margin: 0 auto;
            padding: 40px 20px;
            box-sizing: border-box;
        }


        /* =========================================
           HEADER
           ========================================= */

        .terms-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .terms-header h1 {
            font-size: 48px !important;
            font-weight: 800 !important;
            color: #000000 !important;
            margin-bottom: 15px;
        }

        .terms-header p {
            color: #666666;
            font-size: 17px;
            line-height: 1.6;
            max-width: 750px;
            margin: 0 auto;
        }


        /* =========================================
           INTRODUCTION
           ========================================= */

        .terms-introduction {
            background: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 25px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .terms-introduction p {
            color: #333333;
            font-size: 15px;
            line-height: 1.7;
            margin: 0;
        }


        /* =========================================
           TERMS CARD
           ========================================= */

        .terms-card {
            width: 100%;
            background: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-sizing: border-box;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }


        /* =========================================
           SECTION HEADINGS
           ========================================= */

        .terms-card h2 {
            color: #c8102e !important;
            font-size: 25px !important;
            font-weight: 700 !important;
            margin-top: 0;
            margin-bottom: 15px;
        }


        /* =========================================
           NORMAL TEXT
           ========================================= */

        .terms-card p {
            color: #333333;
            font-size: 15px;
            line-height: 1.7;
            margin-bottom: 12px;
        }


        /* =========================================
           LISTS
           ========================================= */

        .terms-card ul {
            margin-top: 10px;
            margin-bottom: 10px;
            padding-left: 25px;
        }

        .terms-card li {
            color: #333333;
            font-size: 15px;
            line-height: 1.7;
            margin-bottom: 8px;
        }


        /* =========================================
           IMPORTANT INFORMATION
           ========================================= */

        .important {
            color: #c8102e;
            font-weight: 700;
        }


        /* =========================================
           SMALL RED LABEL
           ========================================= */

        .red-label {
            color: #c8102e;
            font-weight: 700;
        }


        /* =========================================
           AGREEMENT CARD
           ========================================= */

        .agreement-card {
            background: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 12px;
            padding: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .agreement-card h2 {
            color: #c8102e !important;
            font-size: 25px !important;
            font-weight: 700 !important;
            margin-top: 0;
            margin-bottom: 15px;
        }


        /* =========================================
           CHECKBOX
           ========================================= */

        .agreement-checkbox {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            margin-top: 20px;
            margin-bottom: 25px;
        }

        .agreement-checkbox input {
            width: 19px;
            height: 19px;
            margin-top: 3px;
            accent-color: #c8102e;
            cursor: pointer;
        }

        .agreement-checkbox label {
            color: #333333;
            font-size: 15px;
            line-height: 1.6;
            cursor: pointer;
        }


        /* =========================================
           AGREE BUTTON
           ========================================= */

        .agree-button {
            display: block;
            width: 100%;
            max-width: 300px;
            height: 52px;
            margin: 0 auto;
            border: none;
            border-radius: 10px;
            background: #c8102e;
            color: #ffffff;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .agree-button:hover {
            background: #a80d27;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(200,16,46,0.25);
        }


        /* =========================================
           FOOTER NOTE
           ========================================= */

        .terms-footer-note {
            text-align: center;
            color: #777777;
            font-size: 13px;
            margin-top: 25px;
        }

        .terms-footer-note span {
            color: #c8102e;
            font-weight: 600;
        }


        /* =========================================
           MOBILE
           ========================================= */

        @media (max-width: 768px) {

            .terms-page {
                padding: 30px 15px;
            }

            .terms-header h1 {
                font-size: 36px !important;
            }

            .terms-card,
            .terms-introduction,
            .agreement-card {
                padding: 22px;
            }

            .terms-card h2,
            .agreement-card h2 {
                font-size: 22px !important;
            }

        }

    </style>


    <main class="terms-page">


        <!-- =========================================
             PAGE HEADER
             ========================================= -->

        <div class="terms-header">

            <h1>Terms & Conditions</h1>

            <p>
                Please read these terms and conditions carefully before
                making a booking or renting a vehicle through our system.
            </p>

        </div>


        <!-- =========================================
             INTRODUCTION
             ========================================= -->

        <div class="terms-introduction">

            <p>
                These Terms & Conditions explain the rules and responsibilities
                that apply when using the Avis rental system. By making a booking,
                collecting a vehicle, or using our rental services, you agree to
                follow these terms.
            </p>

        </div>


        <!-- =========================================
             1. ACCEPTANCE OF TERMS
             ========================================= -->

        <section class="terms-card">

            <h2>1. Acceptance of Terms</h2>

            <p>
                By creating an account, making a booking, or renting a vehicle
                through this system, you confirm that you have read and agreed
                to these Terms & Conditions.
            </p>

            <p>
                If you do not agree with these terms, you should not continue
                with the booking or rental process.
            </p>

        </section>


        <!-- =========================================
             2. CUSTOMER REQUIREMENTS
             ========================================= -->

        <section class="terms-card">

            <h2>2. Customer & Driver Requirements</h2>

            <p>
                Customers must provide accurate and complete information when
                creating an account and making a booking.
            </p>

            <p class="red-label">
                The customer must provide:
            </p>

            <ul>
                <li>Full name</li>
                <li>Residential address</li>
                <li>Contact number</li>
                <li>Email address</li>
                <li>Valid driver's licence information</li>
                <li>Licence number and licence code</li>
                <li>Valid username and password for the customer account</li>
            </ul>

            <p>
                The information provided must be accurate and belong to the
                customer making the booking.
            </p>

            <p>
                <span class="important">
                    Only authorised drivers may drive the rental vehicle.
                </span>
            </p>

        </section>


        <!-- =========================================
             3. BOOKINGS
             ========================================= -->

        <section class="terms-card">

            <h2>3. Bookings & Vehicle Availability</h2>

            <p>
                Customers can make a vehicle reservation by selecting their
                required pickup location, return location, rental dates and
                available vehicle.
            </p>

            <ul>
                <li>
                    A booking is subject to vehicle availability.
                </li>

                <li>
                    Customers are responsible for checking their booking
                    information before confirming the reservation.
                </li>

                <li>
                    The pickup and return dates must be entered correctly.
                </li>

                <li>
                    The selected vehicle is subject to availability at the
                    selected branch.
                </li>
            </ul>

            <p>
                <span class="important">
                    Customers should review all booking information carefully
                    before completing the booking.
                </span>
            </p>

        </section>


        <!-- =========================================
             4. PAYMENT
             ========================================= -->

        <section class="terms-card">

            <h2>4. Payment</h2>

            <p>
                Customers may be required to make payment according to the
                payment option selected during the booking process.
            </p>

            <p class="red-label">
                Pay Now
            </p>

            <p>
                When the Pay Now option is selected, the customer is required
                to make payment for the rental during the booking process.
            </p>

            <p class="red-label">
                Pay Later
            </p>

            <p>
                When the Pay Later option is selected, the customer may reserve
                the vehicle and complete payment according to the payment
                requirements provided by the system.
            </p>

            <p>
                <span class="important">
                    Additional charges may apply where applicable, including
                    charges related to damage, late returns or other rental
                    requirements.
                </span>
            </p>

        </section>


        <!-- =========================================
             5. CANCELLATION & CHANGES
             ========================================= -->

        <section class="terms-card">

            <h2>5. Cancellation & Booking Changes</h2>

            <p>
                Customers may request changes or cancellation of their booking
                before collecting the vehicle.
            </p>

            <ul>
                <li>
                    Changes are subject to vehicle and branch availability.
                </li>

                <li>
                    The pickup or return date may be changed where the system
                    allows it.
                </li>

                <li>
                    Cancellation requests should be made as soon as possible.
                </li>
            </ul>

            <p>
                <span class="important">
                    Any refund or additional charge will depend on the booking
                    and payment information recorded in the system.
                </span>
            </p>

        </section>


        <!-- =========================================
             6. VEHICLE COLLECTION
             ========================================= -->

        <section class="terms-card">

            <h2>6. Vehicle Collection</h2>

            <p>
                The customer must arrive at the selected pickup branch on the
                agreed date and time.
            </p>

            <ul>
                <li>
                    The customer must provide the required identification and
                    driver's licence information.
                </li>

                <li>
                    The customer should inspect the vehicle before leaving
                    the branch.
                </li>

                <li>
                    Any existing damage should be reported before the vehicle
                    is used.
                </li>
            </ul>

            <p>
                <span class="important">
                    The customer is responsible for taking reasonable care of
                    the vehicle after collection.
                </span>
            </p>

        </section>


        <!-- =========================================
             7. USE OF VEHICLE
             ========================================= -->

        <section class="terms-card">

            <h2>7. Use of the Rental Vehicle</h2>

            <p>
                The rental vehicle must be used responsibly and in accordance
                with applicable laws and the rental agreement.
            </p>

            <p class="red-label">
                Customers must:
            </p>

            <ul>
                <li>Drive the vehicle responsibly.</li>
                <li>Follow all traffic laws and regulations.</li>
                <li>Take reasonable care of the vehicle.</li>
                <li>Only allow authorised drivers to operate the vehicle.</li>
                <li>Keep the vehicle secure when it is not being used.</li>
            </ul>

            <p>
                <span class="important">
                    Reckless, illegal or unauthorised use of the vehicle is
                    not permitted.
                </span>
            </p>

        </section>


        <!-- =========================================
             8. DAMAGE, LOSS & THEFT
             ========================================= -->

        <section class="terms-card">

            <h2>8. Damage, Loss & Theft</h2>

            <p>
                Customers are responsible for taking reasonable care of the
                rental vehicle during the rental period.
            </p>

            <ul>
                <li>
                    Damage to the vehicle may be recorded during the return
                    inspection.
                </li>

                <li>
                    Lost keys or vehicle accessories may result in additional
                    charges.
                </li>

                <li>
                    Theft or serious damage should be reported immediately.
                </li>
            </ul>

            <p>
                <span class="important">
                    Where applicable, charges for damage or loss may be added
                    after the vehicle inspection.
                </span>
            </p>

        </section>


        <!-- =========================================
             9. VEHICLE RETURN
             ========================================= -->

        <section class="terms-card">

            <h2>9. Returning the Vehicle</h2>

            <p>
                The vehicle must be returned to the agreed return branch on
                or before the agreed return date and time.
            </p>

            <ul>
                <li>
                    The vehicle must be returned with the keys and required
                    accessories.
                </li>

                <li>
                    The vehicle will be inspected when it is returned.
                </li>

                <li>
                    The vehicle's condition may be compared with its condition
                    at the beginning of the rental.
                </li>
            </ul>

            <p>
                <span class="important">
                    Late returns may result in additional rental charges.
                </span>
            </p>

        </section>


        <!-- =========================================
             10. VEHICLE INSPECTION
             ========================================= -->

        <section class="terms-card">

            <h2>10. Vehicle Inspection</h2>

            <p>
                A vehicle inspection may be completed when the customer
                collects and returns the vehicle.
            </p>

            <p>
                The inspection records the vehicle's condition and may identify
                new damage that occurred during the rental period.
            </p>

            <p>
                <span class="important">
                    Customers should be present during the return inspection
                    where possible so that the vehicle condition can be
                    reviewed.
                </span>
            </p>

        </section>


        <!-- =========================================
             11. FUEL
             ========================================= -->

        <section class="terms-card">

            <h2>11. Fuel</h2>

            <p>
                The vehicle should be returned with the same fuel level as
                recorded when the vehicle was collected.
            </p>

            <p>
                <span class="important">
                    Additional fuel charges may apply if the vehicle is returned
                    with less fuel than the recorded collection level.
                </span>
            </p>

        </section>


        <!-- =========================================
             12. LATE RETURN & EXTENSION
             ========================================= -->

        <section class="terms-card">

            <h2>12. Late Returns & Rental Extensions</h2>

            <p>
                Customers who need to keep the vehicle for longer than the
                original rental period should request an extension before the
                agreed return time.
            </p>

            <ul>
                <li>
                    Rental extensions are subject to vehicle availability.
                </li>

                <li>
                    Additional rental charges may apply.
                </li>

                <li>
                    Customers should contact the relevant branch or
                    reservations team to request an extension.
                </li>
            </ul>

            <p>
                <span class="important">
                    Keeping the vehicle beyond the agreed return time without
                    approval may result in additional charges.
                </span>
            </p>

        </section>


        <!-- =========================================
             13. CUSTOMER RESPONSIBILITIES
             ========================================= -->

        <section class="terms-card">

            <h2>13. Customer Responsibilities</h2>

            <p>
                By renting a vehicle through the system, the customer agrees to:
            </p>

            <ul>
                <li>Provide correct and truthful information.</li>
                <li>Provide valid driver's licence information.</li>
                <li>Make the required payments.</li>
                <li>Use the vehicle responsibly.</li>
                <li>Take reasonable care of the vehicle.</li>
                <li>Report accidents, damage or theft as soon as possible.</li>
                <li>Return the vehicle on time.</li>
                <li>Return the vehicle in an appropriate condition.</li>
            </ul>

        </section>


        <!-- =========================================
             14. AVIS SYSTEM RESPONSIBILITIES
             ========================================= -->

        <section class="terms-card">

            <h2>14. System Responsibilities</h2>

            <p>
                The Avis rental system is designed to assist customers with
                vehicle bookings, payments, rental information and vehicle
                returns.
            </p>

            <ul>
                <li>
                    The system will record customer and booking information.
                </li>

                <li>
                    The system will display available vehicles and rental
                    information.
                </li>

                <li>
                    The system will record applicable payments.
                </li>

                <li>
                    The system will support vehicle inspection and return
                    records.
                </li>
            </ul>

            <p>
                <span class="important">
                    Vehicle availability and bookings remain subject to the
                    information and availability recorded in the system.
                </span>
            </p>

        </section>


        <!-- =========================================
             15. PRIVACY
             ========================================= -->

        <section class="terms-card">

            <h2>15. Privacy & Personal Information</h2>

            <p>
                Customer information is collected and processed in connection
                with account creation, bookings, rentals and other services
                provided through the system.
            </p>

            <p>
                For more information about how personal information is
                collected, used and protected, please refer to our
                <span class="important">Privacy Policy</span>.
            </p>

        </section>


        <!-- =========================================
             16. CONTACT
             ========================================= -->

        <section class="terms-card">

            <h2>16. Contact & Support</h2>

            <p>
                If you have questions about your booking, payment, vehicle,
                return or these Terms & Conditions, please contact our
                customer support team.
            </p>

            <p>
                <span class="important">
                    Please contact the relevant Avis branch or customer service
                    team for assistance.
                </span>
            </p>

        </section>


        <!-- =========================================
             AGREEMENT
             ========================================= -->

        <div class="agreement-card">

            <h2>Agreement</h2>

            <p>
                Before continuing with your booking, please confirm that you
                have read and understood these Terms & Conditions.
            </p>

            <div class="agreement-checkbox">

                <input type="checkbox"
                       id="agreeTerms"
                       onchange="toggleAgreeButton()" />

                <label for="agreeTerms">

                    I have read and agree to the
                    <span class="important">
                        Avis Rental Terms & Conditions
                    </span>.

                </label>

            </div>


            <button type="button"
                    id="agreeButton"
                    class="agree-button"
                    onclick="continueToBooking()"
                    disabled>

                Agree & Continue

            </button>

        </div>


        <div class="terms-footer-note">

            <span>Important:</span>
            Please make sure you understand these terms before completing
            your rental.

        </div>


    </main>


    <!-- =========================================
         JAVASCRIPT
         ========================================= -->

    <script>

        function toggleAgreeButton() {

            var checkbox = document.getElementById("agreeTerms");
            var button = document.getElementById("agreeButton");

            button.disabled = !checkbox.checked;

            if (checkbox.checked) {

                button.style.opacity = "1";
                button.style.cursor = "pointer";

            } else {

                button.style.opacity = "0.5";
                button.style.cursor = "not-allowed";

            }

        }


        function continueToBooking() {

            var checkbox = document.getElementById("agreeTerms");

            if (checkbox.checked) {

                // Change this to the page you want
                // the customer to go to after accepting.

                window.location.href = "Booking.aspx";

            }

        }


        // Make the button look disabled when the page loads

        document.addEventListener("DOMContentLoaded", function () {

            var button = document.getElementById("agreeButton");

            button.style.opacity = "0.5";
            button.style.cursor = "not-allowed";

        });

    </script>

</asp:Content>
