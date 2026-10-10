<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrivacyPolicy.aspx.cs" Inherits="AvisSystem.PrivacyPolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <style>

        /* =========================================
           PRIVACY POLICY PAGE
           ========================================= */

        .privacy-page {
            max-width: 1000px;
            width: 100%;
            margin: 0 auto;
            padding: 50px 20px;
            box-sizing: border-box;
        }


        /* =========================================
           PAGE HEADER
           ========================================= */

        .privacy-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .privacy-header h1 {
            font-size: 48px !important;
            font-weight: 800 !important;
            color: #000000 !important;
            margin-bottom: 15px;
        }

        .privacy-header p {
            font-size: 17px;
            color: #666666;
            line-height: 1.6;
        }


        /* =========================================
           PRIVACY CARDS
           ========================================= */

        .privacy-card {
            width: 100%;
            background: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 25px;
            box-sizing: border-box;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }


        /* =========================================
           SECTION HEADINGS
           ========================================= */

        .privacy-card h2 {
            color: #c8102e !important;
            font-size: 27px !important;
            font-weight: 700 !important;
            margin-top: 0;
            margin-bottom: 15px;
        }


        /* =========================================
           TEXT
           ========================================= */

        .privacy-card p {
            color: #333333;
            font-size: 15px;
            line-height: 1.7;
            margin-bottom: 15px;
        }


        /* =========================================
           IMPORTANT RED TEXT
           ========================================= */

        .important {
            color: #c8102e;
            font-weight: 700;
        }


        /* =========================================
           LISTS
           ========================================= */

        .privacy-card ul {
            margin-top: 10px;
            margin-bottom: 15px;
            padding-left: 25px;
        }

        .privacy-card li {
            color: #333333;
            font-size: 15px;
            line-height: 1.7;
            margin-bottom: 8px;
        }

        /* =========================================
           CONTACT LINK
           ========================================= */

        .privacy-contact {
            color: #c8102e !important;
            font-weight: 700;
            text-decoration: none;
        }

        .privacy-contact:hover {
            text-decoration: underline;
        }


        /* =========================================
           LAST UPDATED
           ========================================= */

        .last-updated {
            text-align: center;
            color: #777777;
            font-size: 14px;
            margin-top: 35px;
        }


        /* =========================================
           MOBILE
           ========================================= */

        @media (max-width: 768px) {

            .privacy-page {
                padding: 30px 15px;
            }

            .privacy-header h1 {
                font-size: 38px !important;
            }

            .privacy-card {
                padding: 22px;
            }

            .privacy-card h2 {
                font-size: 24px !important;
            }

        }

    </style>


    <main class="privacy-page">


        <!-- =========================================
             PAGE HEADER
             ========================================= -->

        <div class="privacy-header">

            <h1>Privacy Policy</h1>

            <p>
                Your privacy is important to us. This Privacy Policy explains
                how our car rental system collects, uses and protects your
                information when you use our website and services.
            </p>

        </div>

        <!-- =========================================
             1. INFORMATION WE COLLECT
             ========================================= -->

        <section class="privacy-card">

            <h2>1. Information We Collect</h2>

            <p>
                When you create an account, make a booking or use our
                car rental services, the system may collect
                <span class="important">personal information</span>
                that is required to provide the requested services.
            </p>

            <p>This information may include:</p>

            <ul>

                <li>
                    <span class="important">Full Name</span>
                </li>

                <li>
                    <span class="important">Address</span>
                </li>

                <li>
                    <span class="important">Contact Number</span>
                </li>

                <li>
                    <span class="important">Email Address</span>
                </li>

                <li>
                    Identification or passport information where required
                </li>

                <li>
                    <span class="important">Driver's Licence Number</span>
                </li>

                <li>
                    <span class="important">Licence Code</span>
                </li>

                <li>
                    <span class="important">Username and Password</span>
                </li>

                <li>
                    Vehicle booking and rental information
                </li>

                <li>
                    Payment-related information required to process a booking
                </li>

            </ul>

        </section>


        <!-- =========================================
             2. HOW WE USE INFORMATION
             ========================================= -->

        <section class="privacy-card">

            <h2>2. How We Use Your Information</h2>

            <p>
                The information collected by the system is used to provide
                and manage car rental services.
            </p>

            <p>This may include:</p>

            <ul>

                <li>Creating and managing your customer account.</li>

                <li>Processing vehicle bookings.</li>

                <li>Confirming rental information.</li>

                <li>Processing payments associated with bookings.</li>

                <li>Managing vehicle collection and returns.</li>

                <li>Contacting customers about their bookings.</li>

                <li>Providing customer support.</li>

                <li>Maintaining accurate rental records.</li>

            </ul>

            <p>
                Your information is intended to be used for
                <span class="important">legitimate system and rental purposes</span>
                only.
            </p>

        </section>


        <!-- =========================================
             3. CUSTOMER ACCOUNTS
             ========================================= -->

        <section class="privacy-card">

            <h2>3. Customer Accounts</h2>

            <p>
                Customers may create an account using a username and password.
                Account information allows the system to identify customers
                and manage their bookings and rental information.
            </p>

            <p>
                Customers are responsible for keeping their
                <span class="important">login credentials confidential</span>
                and should not share their password with other people.
            </p>

        </section>


        <!-- =========================================
             4. BOOKING INFORMATION
             ========================================= -->

        <section class="privacy-card">

            <h2>4. Booking and Rental Information</h2>

            <p>
                When you make a vehicle booking, the system may store
                information relating to your reservation, including the
                selected vehicle, pickup location, return location,
                rental dates and payment status.
            </p>

            <p>
                This information is used to
                <span class="important">manage and maintain your rental</span>
                throughout the booking process.
            </p>

        </section>


        <!-- =========================================
             5. PAYMENT INFORMATION
             ========================================= -->

        <section class="privacy-card">

            <h2>5. Payment Information</h2>

            <p>
                Payment information may be requested when completing a
                vehicle booking.
            </p>

            <p>
                <span class="important">Payment information must be handled securely</span>
                and should only be used for processing the customer's
                rental transaction.
            </p>

            <p>
                This academic system does not represent a live payment
                processing service. Any payment functionality included
                in the project is for demonstration and academic purposes.
            </p>

        </section>


        <!-- =========================================
             6. SECURITY
             ========================================= -->

        <section class="privacy-card">

            <h2>6. Security of Your Information</h2>

            <p>
                We take reasonable steps to protect the information
                stored within the system from unauthorized access,
                alteration or misuse.
            </p>

            <p>
                Users should also take appropriate precautions by keeping
                their <span class="important">username and password secure</span>
                and by logging out of their account when using a shared
                computer.
            </p>

        </section>


        <!-- =========================================
             7. COOKIES
             ========================================= -->

        <section class="privacy-card">

            <h2>7. Cookies and Website Data</h2>

            <p>
                The system may use cookies or similar browser technologies
                to support website functionality and improve the user
                experience.
            </p>

            <p>
                Cookies may help the system remember certain information
                during a user's visit.
            </p>

        </section>


        <!-- =========================================
             8. SHARING INFORMATION
             ========================================= -->

        <section class="privacy-card">

            <h2>8. Sharing of Information</h2>

            <p>
                Personal information collected through the system should
                only be accessible to authorized users who require the
                information to perform their responsibilities within the
                car rental system.
            </p>

            <p>
                <span class="important">
                    Personal information should not be disclosed to
                    unauthorized individuals.
                </span>
            </p>

        </section>


        <!-- =========================================
             9. DATA RETENTION
             ========================================= -->

        <section class="privacy-card">

            <h2>9. Retention of Information</h2>

            <p>
                Customer information may be retained in the system for as
                long as it is required for managing accounts, bookings,
                rentals, payments and related records.
            </p>

            <p>
                Information that is no longer required may be removed
                according to the system's data management procedures.
            </p>

        </section>


        <!-- =========================================
             10. YOUR PRIVACY
             ========================================= -->

        <section class="privacy-card">

            <h2>10. Your Privacy</h2>

            <p>
                Customers should be able to understand what information
                the system collects and why that information is required.
            </p>

            <p>
                If you have questions about the information stored about
                you, you may contact the system administrators using the
                contact details provided on the
                <a href="Contact.aspx" class="important">Contact Us</a> page.
            </p>

        </section>


        <!-- =========================================
             11. THIRD-PARTY LINKS
             ========================================= -->

        <section class="privacy-card">

            <h2>11. Third-Party Websites</h2>

            <p>
                Our website may contain links to external websites or
                services. These websites are independent from our system
                and may have their own privacy policies and terms.
            </p>

            <p>
                We are not responsible for the privacy practices or
                content of external websites.
            </p>

        </section>


        <!-- =========================================
             12. CHANGES TO PRIVACY POLICY
             ========================================= -->

        <section class="privacy-card">

            <h2>12. Changes to This Privacy Policy</h2>

            <p>
                This Privacy Policy may be updated when changes are made
                to the system or its functionality.
            </p>

            <p>
                Any important changes should be communicated to users
                where appropriate.
            </p>

        </section>


        <!-- =========================================
             13. CONTACT
             ========================================= -->

        <section class="privacy-card">

            <h2>13. Contact Us</h2>

            <p>
                If you have any questions about this Privacy Policy or
                how information is handled within the system, please
                contact us through the
                <a href="Contact.aspx" class="important">Contact Us</a> page.
            </p>

        </section>


        <!-- =========================================
             LAST UPDATED
             ========================================= -->

        <div class="last-updated">

            <span class="important">Privacy Policy</span>
            &nbsp;|&nbsp;
            Last Updated: 2026

        </div>


    </main>

</asp:Content>
