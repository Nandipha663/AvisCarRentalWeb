<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AvisSystem.AvisPages.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>

        /* ================================
           DASHBOARD PAGE
        ================================= */

        .dashboard-page {
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
            padding: 40px 25px 60px;
            box-sizing: border-box;
        }


        /* ================================
           HEADER
        ================================= */

        .dashboard-header {
            margin-bottom: 35px;
        }

        .dashboard-header h1 {
            font-size: 42px !important;
            font-weight: 800 !important;
            color: #111111 !important;
            margin: 0 0 8px 0;
        }

        .dashboard-header p {
            margin: 0;
            color: #777777;
            font-size: 16px;
        }


        /* ================================
           SUMMARY CARDS
        ================================= */

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 40px;
        }

        .dashboard-card {
            background: #ffffff;
            border: 1px solid #e3e3e3;
            border-radius: 12px;
            padding: 25px;
            min-height: 145px;
            box-sizing: border-box;
            box-shadow: 0 3px 12px rgba(0,0,0,0.07);

            display: flex;
            align-items: center;
            gap: 18px;
        }


        /* RED ICON CIRCLE */

        .dashboard-icon {
            width: 55px;
            height: 55px;
            min-width: 55px;
            border-radius: 50%;
            background: #fff1f3;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #c8102e;
            font-size: 24px;
        }


        /* CARD TEXT */

        .dashboard-card-text h3 {
            margin: 0 0 7px 0;
            font-size: 15px;
            font-weight: 600;
            color: #777777;
        }

        .dashboard-number {
            margin: 0;
            font-size: 30px;
            font-weight: 800;
            color: #111111;
        }


        /* ================================
           RETURN SECTION
        ================================= */

        .return-section {
            background: #ffffff;
            border: 1px solid #e3e3e3;
            border-radius: 12px;
            padding: 30px;
            box-sizing: border-box;
            box-shadow: 0 3px 12px rgba(0,0,0,0.07);
        }


        /* SECTION HEADER */

        .return-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .return-title {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .return-title i {
            color: #c8102e;
            font-size: 22px;
        }

        .return-title h2 {
            margin: 0;
            font-size: 23px;
            font-weight: 700;
            color: #222222;
        }


        /* VIEW ALL BUTTON */

        .view-all-btn {
            display: inline-block;
            background: #ffffff;
            color: #c8102e;
            border: 1px solid #c8102e;
            padding: 9px 20px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .view-all-btn:hover {
            background: #c8102e;
            color: #ffffff;
            text-decoration: none;
        }


        /* ================================
           TABLE
        ================================= */

        .rental-table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .rental-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        .rental-table th {
            background: #f7f7f7;
            color: #555555;
            font-size: 13px;
            font-weight: 700;
            text-align: left;
            padding: 15px 14px;
            border-bottom: 1px solid #dddddd;
            white-space: nowrap;
        }

        .rental-table td {
            padding: 16px 14px;
            border-bottom: 1px solid #eeeeee;
            color: #555555;
            font-size: 14px;
            white-space: nowrap;
        }

        .rental-table tbody tr:hover {
            background: #fafafa;
        }


        /* ================================
           STATUS
        ================================= */

        .status-active {
            display: inline-block;
            background: #e8f7ed;
            color: #218838;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }


        /* ================================
           MOBILE
        ================================= */

        @media (max-width: 1000px) {

            .dashboard-cards {
                grid-template-columns: repeat(2, 1fr);
            }

        }


        @media (max-width: 600px) {

            .dashboard-page {
                padding: 30px 15px 50px;
            }

            .dashboard-header h1 {
                font-size: 34px !important;
            }

            .dashboard-cards {
                grid-template-columns: 1fr;
            }

            .dashboard-card {
                min-height: 120px;
            }

            .return-section {
                padding: 20px;
            }

            .return-header {
                align-items: flex-start;
                gap: 15px;
            }

        }

    </style>


    <main class="dashboard-page">


        <!-- ================================
             DASHBOARD HEADER
        ================================= -->

        <div class="dashboard-header">

            <h1>Dashboard</h1>

            <p>
                Here's an overview of today's rental activity and vehicle status.
            </p>

        </div>



        <!-- ================================
             SUMMARY CARDS
        ================================= -->

        <div class="dashboard-cards">


            <!-- AVAILABLE CARS -->

            <div class="dashboard-card">

                <div class="dashboard-icon">
                    <i class="fas fa-car"></i>
                </div>

                <div class="dashboard-card-text">

                    <h3>Available Cars</h3>

                    <p class="dashboard-number">24</p>

                </div>

            </div>



            <!-- BOOKINGS TODAY -->

            <div class="dashboard-card">

                <div class="dashboard-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>

                <div class="dashboard-card-text">

                    <h3>Bookings Today</h3>

                    <p class="dashboard-number">12</p>

                </div>

            </div>



            <!-- ACTIVE RENTALS -->

            <div class="dashboard-card">

                <div class="dashboard-icon">
                    <i class="fas fa-key"></i>
                </div>

                <div class="dashboard-card-text">

                    <h3>Active Rentals</h3>

                    <p class="dashboard-number">18</p>

                </div>

            </div>



            <!-- RENTALS DUE TODAY -->

            <div class="dashboard-card">

                <div class="dashboard-icon">
                    <i class="fas fa-calendar-day"></i>
                </div>

                <div class="dashboard-card-text">

                    <h3>Rentals Due Today</h3>

                    <p class="dashboard-number">7</p>

                </div>

            </div>


        </div>



        <!-- ================================
             VEHICLES DUE FOR RETURN
        ================================= -->

        <section class="return-section">


            <!-- SECTION HEADER -->

            <div class="return-header">

                <div class="return-title">

                    <i class="fas fa-clock"></i>

                    <h2>Vehicle Due for Return</h2>

                </div>


                <!-- VIEW ALL -->

                <a href="UpdateRentals.aspx" class="view-all-btn">
                    View All
                </a>

            </div>



            <!-- ================================
                 RENTAL TABLE
            ================================= -->

            <div class="rental-table-wrapper">

                <table class="rental-table">

                    <thead>

                        <tr>

                            <th>RentalID</th>

                            <th>CustomerName</th>

                            <th>StartDate</th>

                            <th>PickUpDate</th>

                            <th>ExpectedReturnDate</th>

                            <th>RentalStatus</th>

                        </tr>

                    </thead>


                    <tbody>


                        <!-- RENTAL 1 -->

                        <tr>

                            <td>RNT001</td>

                            <td>John Smith</td>

                            <td>01/09/2026</td>

                            <td>01/09/2026</td>

                            <td>02/09/2026</td>

                            <td>
                                <span class="status-active">
                                    Active
                                </span>
                            </td>

                        </tr>


                        <!-- RENTAL 2 -->

                        <tr>

                            <td>RNT002</td>

                            <td>Sarah Williams</td>

                            <td>30/08/2026</td>

                            <td>30/08/2026</td>

                            <td>02/09/2026</td>

                            <td>
                                <span class="status-active">
                                    Active
                                </span>
                            </td>

                        </tr>


                        <!-- RENTAL 3 -->

                        <tr>

                            <td>RNT003</td>

                            <td>David Johnson</td>

                            <td>31/08/2026</td>

                            <td>31/08/2026</td>

                            <td>02/09/2026</td>

                            <td>
                                <span class="status-active">
                                    Active
                                </span>
                            </td>

                        </tr>


                        <!-- RENTAL 4 -->

                        <tr>

                            <td>RNT004</td>

                            <td>Emily Brown</td>

                            <td>29/08/2026</td>

                            <td>29/08/2026</td>

                            <td>02/09/2026</td>

                            <td>
                                <span class="status-active">
                                    Active
                                </span>
                            </td>

                        </tr>


                        <!-- RENTAL 5 -->

                        <tr>

                            <td>RNT005</td>

                            <td>Michael Adams</td>

                            <td>28/08/2026</td>

                            <td>28/08/2026</td>

                            <td>02/09/2026</td>

                            <td>
                                <span class="status-active">
                                    Active
                                </span>
                            </td>

                        </tr>


                    </tbody>

                </table>

            </div>

        </section>


    </main>

</asp:Content>
