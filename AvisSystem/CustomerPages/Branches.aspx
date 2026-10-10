<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Branches.aspx.cs" Inherits="AvisSystem.CustomerPages.Branches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>

        /* =========================================================
           BRANCH PAGE
           ========================================================= */

        .branches-page {
            background: #fbf6f2;
            color: #1c1512;
            font-family: 'Arial', sans-serif;
            margin-left: -15px;
            margin-right: -15px;
        }

        .branches-page * {
            box-sizing: border-box;
        }


        /* =========================================================
           HERO
           ========================================================= */

        .branch-hero {
            position: relative;
            background: #1c1512;
            color: #fbf6f2;
            padding: 5rem 6vw 4rem;
            overflow: hidden;
        }

        .branch-hero::before {
            content: "";
            position: absolute;
            top: 0;
            right: -10%;
            width: 60%;
            height: 100%;

            background: linear-gradient(
                115deg,
                transparent 0%,
                transparent 48%,
                #c81d25 48%,
                #c81d25 52%,
                transparent 52%
            );

            opacity: 0.9;
        }

        .branch-hero::after {
            content: "";
            position: absolute;
            top: 0;
            right: -6%;
            width: 60%;
            height: 100%;

            background: linear-gradient(
                115deg,
                transparent 0%,
                transparent 58%,
                #7a1015 58%,
                #7a1015 60%,
                transparent 60%
            );
        }

        .branch-hero-inner {
            position: relative;
            z-index: 2;
            max-width: 1180px;
            margin: 0 auto;
        }

        .branch-kicker {
            font-weight: 700;
            font-size: 0.85rem;
            letter-spacing: 0.02em;
            color: #e6373f;
            margin-bottom: 1.4rem;
        }

        .branch-hero h1 {
            font-weight: 800;
            font-size: clamp(2.6rem, 6vw, 5rem);
            line-height: 0.98;
            letter-spacing: -0.01em;
            max-width: 11ch;
            margin: 0;
        }

        .branch-hero-sub {
            margin-top: 1.6rem;
            max-width: 46ch;
            font-style: italic;
            font-size: 1.2rem;
            color: #d8cdc8;
            line-height: 1.6;
        }


        /* =========================================================
           HERO STATISTICS
           ========================================================= */

        .branch-hero-stats {
            display: flex;
            gap: 3.5rem;
            margin-top: 3.2rem;
            flex-wrap: wrap;
        }

        .branch-stat-num {
            font-weight: 800;
            font-size: 2.4rem;
            color: #fbf6f2;
            line-height: 1;
        }

        .branch-stat-label {
            margin-top: 0.4rem;
            font-size: 0.85rem;
            color: #b8a9a3;
        }


        /* =========================================================
           BRANCH SECTION
           ========================================================= */

        .branches-section {
            max-width: 1180px;
            margin: 0 auto;
            padding: 5rem 6vw 6rem;
        }

        .branches-head {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            gap: 2rem;
            margin-bottom: 3rem;

            border-bottom: 2px solid #1c1512;
            padding-bottom: 1.4rem;
        }

        .branches-head h2 {
            font-weight: 800;
            font-size: clamp(1.8rem, 3vw, 2.6rem);
            margin: 0;
        }

        .branches-head p {
            color: #6b5d57;
            max-width: 32ch;
            font-size: 0.95rem;
            line-height: 1.6;
            margin: 0;
        }


        /* =========================================================
           BRANCH ROUTE
           ========================================================= */

        .branch-route {
            position: relative;
        }

        .branch-route::before {
            content: "";

            position: absolute;
            left: 2.1rem;
            top: 0.6rem;
            bottom: 0.6rem;

            width: 2px;

            background-image: linear-gradient(
                #e6373f 60%,
                transparent 0%
            );

            background-size: 2px 14px;
            background-repeat: repeat-y;
        }


        /* =========================================================
           BRANCH
           ========================================================= */

        .branch-stop {
            position: relative;

            display: grid;
            grid-template-columns: 4.3rem 1fr auto;

            gap: 0 2.2rem;

            align-items: start;

            padding: 2.1rem 0;

            border-bottom: 1px solid #e3d5cd;
        }

        .branch-stop:last-child {
            border-bottom: none;
        }


        /* =========================================================
           BRANCH NUMBER
           ========================================================= */

        .branch-marker {
            position: relative;
            z-index: 2;

            width: 2.6rem;
            height: 2.6rem;

            border-radius: 50%;

            background: #c81d25;
            color: #fbf6f2;

            display: flex;
            align-items: center;
            justify-content: center;

            font-weight: 800;
            font-size: 0.95rem;

            box-shadow: 0 0 0 6px #fbf6f2;
        }


        /* =========================================================
           BRANCH INFORMATION
           ========================================================= */

        .branch-body h3 {
            font-weight: 800;
            font-size: 1.5rem;

            margin: 0 0 0.3rem 0;
        }

        .branch-region {
            color: #c81d25;
            font-weight: 600;
            font-size: 0.85rem;

            margin-bottom: 0.9rem;
        }


        /* =========================================================
           DETAILS
           ========================================================= */

        .branch-details {
            display: grid;

            grid-template-columns:
                repeat(2, minmax(150px, 1fr));

            gap: 0.55rem 2rem;

            font-size: 0.92rem;

            color: #6b5d57;

            max-width: 520px;
        }

        .branch-details dt {
            font-weight: 600;
            color: #1c1512;
        }

        .branch-details dd {
            margin-top: 0.1rem;
        }


        /* =========================================================
           OPENING HOURS
           ========================================================= */

        .branch-hours {
            text-align: right;
            white-space: nowrap;
            padding-top: 0.3rem;
        }

        .branch-hours-label {
            font-size: 0.75rem;
            color: #6b5d57;
            margin-bottom: 0.3rem;
        }

        .branch-hours-value {
            font-weight: 700;
            font-size: 1.05rem;
        }

        .branch-status {
            display: inline-block;

            margin-top: 0.6rem;

            font-size: 0.78rem;
            font-weight: 600;

            color: #7a1015;

            background: #f5dcd6;

            padding: 0.25rem 0.6rem;

            border-radius: 2px;
        }


        /* =========================================================
           RESPONSIVE DESIGN
           ========================================================= */

        @media (max-width: 720px) {

            .branch-stop {
                grid-template-columns: 2.8rem 1fr;
            }

            .branch-hours {
                grid-column: 1 / -1;

                text-align: left;

                padding-top: 0.8rem;

                padding-left: 2.8rem;
            }

            .branch-details {
                grid-template-columns: 1fr;
            }

            .branch-route::before {
                left: 1.5rem;
            }

            .branch-marker {
                width: 2.2rem;
                height: 2.2rem;
                font-size: 0.8rem;
            }

            .branches-head {
                flex-direction: column;
                align-items: flex-start;
            }

            .branch-hero {
                padding: 4rem 7vw 3rem;
            }

        }

        /* =========================================================
   CONTINUE BUTTON
   ========================================================= */

.continue-button {
    display: inline-block;

    background: #c81d25;
    color: #ffffff !important;

    padding: 14px 32px;

    border-radius: 4px;

    font-size: 15px;
    font-weight: 700;

    text-decoration: none !important;

    transition: all 0.2s ease;
}

.continue-button:hover {
    background: #7a1015;
    color: #ffffff !important;

    text-decoration: none !important;

    transform: translateY(-2px);
}

    </style>


    <!-- =========================================================
         BRANCH PAGE WRAPPER
         ========================================================= -->

    <div class="branches-page">


        <!-- =====================================================
             HERO
             ===================================================== -->

        <section class="branch-hero">

            <div class="branch-hero-inner">

                <div class="branch-kicker">
                    AVIS CAR RENTAL — BRANCH DIRECTORY
                </div>

                <h1>
                    Six cities. One line to follow.
                </h1>

                <p class="branch-hero-sub">
                    Every branch keeps the same standard of service —
                    pick a branch below and you'll have a confirmed
                    contact before you close the tab.
                </p>


                <!-- HERO STATISTICS -->

                <div class="branch-hero-stats">

                    <div>

                        <div class="branch-stat-num">
                            06
                        </div>

                        <div class="branch-stat-label">
                            Branches nationwide
                        </div>

                    </div>


                    <div>

                        <div class="branch-stat-num">
                            24/7
                        </div>

                        <div class="branch-stat-label">
                            Roadside support line
                        </div>

                    </div>


                    <div>

                        <div class="branch-stat-num">
                            3
                        </div>

                        <div class="branch-stat-label">
                            Airport counters
                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- =====================================================
             BRANCHES
             ===================================================== -->

        <section class="branches-section">


            <div class="branches-head">

                <h2>
                    Find your branch
                </h2>

                <p>
                    Our branches are available to assist with
                    reservations, vehicle collection, returns,
                    and general enquiries.
                </p>

            </div>


            <!-- =================================================
                 BRANCH ROUTE
                 ================================================= -->

            <div class="branch-route">


    <!-- =================================================
         BRANCH 01
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            01
        </div>

        <div class="branch-body">

            <h3>
                Bloemfontein Airport
            </h3>

            <div class="branch-region">
                Bloemfontein Airport
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    Bram Fischer International Airport,
                    Bloemfontein
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 51 555 0101
                </dd>

                <dt>Email</dt>
                <dd>
                    bloemfontein.airport@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                7:00 – 19:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 02
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            02
        </div>

        <div class="branch-body">

            <h3>
                Cape Town Downtown
            </h3>

            <div class="branch-region">
                Cape Town City Centre
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    12 Long Street,
                    Cape Town, 8001
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 21 555 0202
                </dd>

                <dt>Email</dt>
                <dd>
                    capetown.downtown@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                8:00 – 18:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 03
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            03
        </div>

        <div class="branch-body">

            <h3>
                East London Airport
            </h3>

            <div class="branch-region">
                Airport Terminal
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    East London Airport,
                    East London, 5201
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 43 555 0303
                </dd>

                <dt>Email</dt>
                <dd>
                    eastlondon.airport@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                7:00 – 19:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 04
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            04
        </div>

        <div class="branch-body">

            <h3>
                George Airport
            </h3>

            <div class="branch-region">
                Airport Terminal
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    George Airport,
                    George, 6529
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 44 555 0404
                </dd>

                <dt>Email</dt>
                <dd>
                    george.airport@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                7:00 – 19:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 05
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            05
        </div>

        <div class="branch-body">

            <h3>
                Kimberley Airport
            </h3>

            <div class="branch-region">
                Kimberley Airport
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    Kimberley Airport,
                    Kimberley, 8301
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 53 555 0505
                </dd>

                <dt>Email</dt>
                <dd>
                    kimberley.airport@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                7:00 – 18:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 06
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            06
        </div>

        <div class="branch-body">

            <h3>
                King Shaka Int
            </h3>

            <div class="branch-region">
                King Shaka International Airport
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    King Shaka International Airport,
                    La Mercy, 4407
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 32 555 0606
                </dd>

                <dt>Email</dt>
                <dd>
                    kingshaka.int@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                24 hours
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 07
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            07
        </div>

        <div class="branch-body">

            <h3>
                Kruger Mpumalanga Int
            </h3>

            <div class="branch-region">
                Kruger Mpumalanga International Airport
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    Kruger Mpumalanga International Airport,
                    Nelspruit, 1200
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 13 555 0707
                </dd>

                <dt>Email</dt>
                <dd>
                    kruger.mpumalanga@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                7:00 – 19:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 08
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            08
        </div>

        <div class="branch-body">

            <h3>
                OR Tambo Int Airport
            </h3>

            <div class="branch-region">
                OR Tambo International Airport
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    OR Tambo International Airport,
                    Johannesburg, 1627
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 11 555 0808
                </dd>

                <dt>Email</dt>
                <dd>
                    ortambo.airport@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                24 hours
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 09
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            09
        </div>

        <div class="branch-body">

            <h3>
                Pietermaritzburg Airport
            </h3>

            <div class="branch-region">
                Pietermaritzburg Airport
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    Pietermaritzburg Airport,
                    Pietermaritzburg, 3201
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 33 555 0909
                </dd>

                <dt>Email</dt>
                <dd>
                    pietermaritzburg.airport@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                7:00 – 18:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 10
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            10
        </div>

        <div class="branch-body">

            <h3>
                Polokwane Airport
            </h3>

            <div class="branch-region">
                Polokwane International Airport
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    Polokwane Airport,
                    Polokwane, 0700
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 15 555 1010
                </dd>

                <dt>Email</dt>
                <dd>
                    polokwane.airport@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                7:00 – 18:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 11
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            11
        </div>

        <div class="branch-body">

            <h3>
                Port Elizabeth Airport
            </h3>

            <div class="branch-region">
                Chief Dawid Stuurman International Airport
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    Chief Dawid Stuurman International Airport,
                    Gqeberha, 6001
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 41 555 1111
                </dd>

                <dt>Email</dt>
                <dd>
                    portelizabeth.airport@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                7:00 – 19:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 12
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            12
        </div>

        <div class="branch-body">

            <h3>
                Rustenburg
            </h3>

            <div class="branch-region">
                Rustenburg City Centre
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    45 Nelson Mandela Drive,
                    Rustenburg, 2999
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 14 555 1212
                </dd>

                <dt>Email</dt>
                <dd>
                    rustenburg@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                8:00 – 17:00
            </div>

            <span class="branch-status">
                Closing soon
            </span>

        </div>

    </div>


    <!-- =================================================
         BRANCH 13
         ================================================= -->

    <div class="branch-stop">

        <div class="branch-marker">
            13
        </div>

        <div class="branch-body">

            <h3>
                Umhlanga
            </h3>

            <div class="branch-region">
                Umhlanga / Durban North
            </div>

            <dl class="branch-details">

                <dt>Address</dt>
                <dd>
                    12 Lagoon Drive,
                    Umhlanga, 4320
                </dd>

                <dt>Phone</dt>
                <dd>
                    +27 31 555 1313
                </dd>

                <dt>Email</dt>
                <dd>
                    umhlanga@avis.example
                </dd>

            </dl>

        </div>

        <div class="branch-hours">

            <div class="branch-hours-label">
                Open today
            </div>

            <div class="branch-hours-value">
                8:00 – 18:00
            </div>

            <span class="branch-status">
                Open now
            </span>

        </div>

    </div>


    <!-- =================================================
         CONTINUE TO CONTACT
         ================================================= -->

    <div style="text-align:center; margin-top:3.5rem;">

        <asp:HyperLink
            ID="lnkContinueContact"
            runat="server"
            NavigateUrl="~/Contact.aspx"
            CssClass="continue-button">

            Continue to Contact

        </asp:HyperLink>

    </div>


</div>

        </section>


    </div>

</asp:Content>
