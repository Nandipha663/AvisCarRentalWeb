<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateBookings.aspx.cs" Inherits="AvisSystem.AvisPages.UpdateBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>

        /* =========================================
           MAIN BOOKING PAGE
        ========================================= */

        .booking-page {
            max-width: 1400px;
            width: 100%;
            margin: 0 auto;
            padding: 35px 25px 60px;
            box-sizing: border-box;
        }


        /* =========================================
           PAGE HEADER
        ========================================= */

        .booking-header {
            margin-bottom: 25px;
        }

        .booking-header h1 {
            font-size: 40px !important;
            font-weight: 800 !important;
            color: #111111 !important;
            margin: 0 0 7px 0;
        }

        .booking-header p {
            color: #777777;
            font-size: 16px;
            margin: 0;
        }


        /* =========================================
           SEARCH AREA
        ========================================= */

        .search-row {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 18px;
            width: 100%;
        }


        .search-box {
            position: relative;
            flex: 0 0 80%;
        }

        .search-box i {
            position: absolute;
            left: 17px;
            top: 50%;
            transform: translateY(-50%);
            color: #777777;
            font-size: 16px;
        }

        .search-box input {
            width: 100%;
            height: 46px;
            padding: 0 18px 0 45px;
            border: 1px solid #d8d8d8;
            border-radius: 8px;
            font-size: 14px;
            color: #333333;
            box-sizing: border-box;
            outline: none;
            background: #ffffff;
        }

        .search-box input:focus {
            border-color: #c8102e;
            box-shadow: 0 0 0 2px rgba(200,16,46,0.08);
        }


        /* =========================================
           CLEAR FILTERS
        ========================================= */

        .clear-filters {
            height: 46px;
            padding: 0 20px;
            background: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 8px;
            color: #444444;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s ease;
            white-space: nowrap;
        }

        .clear-filters:hover {
            border-color: #c8102e;
            color: #c8102e;
        }


        /* =========================================
           FILTER CARD
        ========================================= */

        .filter-card {
            background: #ffffff;
            border: 1px solid #e1e1e1;
            border-radius: 10px;
            padding: 22px 25px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.06);
        }


        .filter-title {
            display: flex;
            align-items: center;
            gap: 9px;
            margin-bottom: 18px;
        }

        .filter-title i {
            color: #c8102e;
            font-size: 18px;
        }

        .filter-title h2 {
            margin: 0;
            font-size: 18px;
            font-weight: 700;
            color: #222222;
        }


        .filters {
            display: flex;
            gap: 20px;
            align-items: flex-end;
        }


        .filter-group {
            flex: 1;
        }

        .filter-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #555555;
            margin-bottom: 7px;
        }


        .date-input {
            position: relative;
        }

        .date-input i {
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #c8102e;
            pointer-events: none;
        }

        .filter-group input,
        .filter-group select {
            width: 100%;
            height: 43px;
            border: 1px solid #d8d8d8;
            border-radius: 7px;
            padding: 0 40px 0 13px;
            box-sizing: border-box;
            color: #444444;
            font-size: 14px;
            background: #ffffff;
            outline: none;
        }

        .filter-group select {
            padding: 0 13px;
        }

        .filter-group input:focus,
        .filter-group select:focus {
            border-color: #c8102e;
        }


        /* =========================================
           MAIN CONTENT
        ========================================= */

        .booking-content {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 360px;
            gap: 22px;
            align-items: start;
        }


        /* =========================================
           TABLE CARD
        ========================================= */

        .table-card {
            background: #ffffff;
            border: 1px solid #e1e1e1;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.06);
            overflow: hidden;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .booking-table {
            width: 100%;
            min-width: 1250px;
            border-collapse: collapse;
        }


        .booking-table th {
            background: #f7f7f7;
            color: #555555;
            font-size: 12px;
            font-weight: 700;
            text-align: left;
            padding: 15px 13px;
            border-bottom: 1px solid #dddddd;
            white-space: nowrap;
        }


        .booking-table td {
            padding: 15px 13px;
            border-bottom: 1px solid #eeeeee;
            color: #555555;
            font-size: 13px;
            white-space: nowrap;
        }


        .booking-table tbody tr:hover {
            background: #fafafa;
        }


        .booking-id {
            color: #c8102e;
            font-weight: 700;
        }


        .amount {
            font-weight: 700;
            color: #222222;
        }


        /* =========================================
           STATUS BADGES
        ========================================= */

        .status {
            display: inline-block;
            padding: 5px 11px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }


        .status-pending {
            background: #fff4cc;
            color: #9a7200;
        }


        .status-confirmed {
            background: #e7f0ff;
            color: #2563a8;
        }


        .status-checkedout {
            background: #efffc7;
            color: #5c8500;
        }


        .status-cancelled {
            background: #ffe5e8;
            color: #c8102e;
        }


        .status-completed {
            background: #e5f7eb;
            color: #218838;
        }


        /* =========================================
           REFUND STATUS
        ========================================= */

        .refund-eligible {
            color: #218838;
            font-weight: 600;
        }

        .refund-not-eligible {
            color: #c8102e;
            font-weight: 600;
        }


        /* =========================================
           BOOKING SUMMARY
        ========================================= */

        .summary-card {
            background: #ffffff;
            border: 1px solid #e1e1e1;
            border-radius: 10px;
            padding: 25px;
            box-sizing: border-box;
            box-shadow: 0 3px 12px rgba(0,0,0,0.06);
            position: sticky;
            top: 20px;
        }


        .summary-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
            padding-bottom: 18px;
            margin-bottom: 20px;
            border-bottom: 1px solid #eeeeee;
        }


        .summary-booking-id {
            color: #c8102e;
            font-size: 20px;
            font-weight: 800;
        }


        .summary-status {
            display: inline-block;
            background: #e7f0ff;
            color: #2563a8;
            padding: 5px 11px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
        }


        /* =========================================
           SUMMARY DETAILS
        ========================================= */

        .summary-details {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }


        .summary-detail {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }


        .summary-label {
            color: #888888;
            font-size: 12px;
            font-weight: 600;
        }


        .summary-value {
            color: #222222;
            font-size: 14px;
            font-weight: 600;
        }


        .summary-dates {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }


        /* =========================================
           TOTAL
        ========================================= */

        .summary-total {
            margin-top: 20px;
            padding-top: 18px;
            border-top: 1px solid #eeeeee;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }


        .summary-total-label {
            color: #555555;
            font-size: 14px;
            font-weight: 600;
        }


        .summary-total-amount {
            color: #c8102e;
            font-size: 22px;
            font-weight: 800;
        }


        /* =========================================
           SUMMARY BUTTONS
        ========================================= */

        .summary-actions {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }


        .cancel-btn,
        .delete-btn {
            flex: 1;
            height: 42px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s ease;
        }


        .cancel-btn {
            background: #ffffff;
            border: 1px solid #c8102e;
            color: #c8102e;
        }

        .cancel-btn:hover {
            background: #fff1f3;
        }


        .delete-btn {
            background: #c8102e;
            border: 1px solid #c8102e;
            color: #ffffff;
        }

        .delete-btn:hover {
            background: #a80d25;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1100px) {

            .booking-content {
                grid-template-columns: 1fr;
            }

            .summary-card {
                position: static;
            }

        }


        @media (max-width: 700px) {

            .booking-page {
                padding: 30px 15px 50px;
            }

            .booking-header h1 {
                font-size: 34px !important;
            }

            .search-row {
                flex-direction: column;
                align-items: stretch;
            }

            .clear-filters {
                width: 100%;
            }

            .filters {
                flex-direction: column;
                align-items: stretch;
            }

            .summary-dates {
                grid-template-columns: 1fr;
            }

            .summary-actions {
                flex-direction: column;
            }

        }

    </style>


    <main class="booking-page">


        <!-- =========================================
             PAGE HEADER
        ========================================= -->

        <div class="booking-header">

            <h1>Bookings</h1>

            <p>
                Search, filter and manage customer vehicle bookings.
            </p>

        </div>



        <!-- =========================================
             SEARCH
        ========================================= -->

        <div class="search-row">

            <div class="search-box">

                <i class="fas fa-search"></i>

                <input
                    type="text"
                    placeholder="Search bookings by customer's name" />

            </div>


            <button type="button" class="clear-filters">
                Clear Filters
            </button>

        </div>



        <!-- =========================================
             FILTERS
        ========================================= -->

        <div class="filter-card">

            <div class="filter-title">

                <i class="fas fa-filter"></i>

                <h2>Filters</h2>

            </div>


            <div class="filters">


                <!-- FROM DATE -->

                <div class="filter-group">

                    <label>From Date</label>

                    <div class="date-input">

                        <input type="date" />

                        

                    </div>

                </div>



                <!-- TO DATE -->

                <div class="filter-group">

                    <label>To Date</label>

                    <div class="date-input">

                        <input type="date" />

                        

                    </div>

                </div>



                <!-- STATUS -->

                <div class="filter-group">

                    <label>Status</label>

                    <select>

                        <option>All Statuses</option>
                        <option>Pending</option>
                        <option>Confirmed</option>
                        <option>Checked Out</option>
                        <option>Cancelled</option>
                        <option>Completed</option>

                    </select>

                </div>


            </div>

        </div>



        <!-- =========================================
             TABLE + SUMMARY
        ========================================= -->

        <div class="booking-content">


            <!-- =====================================
                 BOOKINGS TABLE
            ====================================== -->

            <div class="table-card">

                <div class="table-wrapper">

                    <table class="booking-table">

                        <thead>

                            <tr>

                                <th>BookingID</th>
                                <th>CustomerName</th>
                                <th>Vehicle</th>
                                <th>BookingDate</th>
                                <th>PickUpDate</th>
                                <th>ExpectedReturnDate</th>
                                <th>Status</th>
                                <th>PickupBranch</th>
                                <th>DropoffBranch</th>
                                <th>Refund Status</th>
                                <th>Invoice Amount</th>

                            </tr>

                        </thead>


                        <tbody>


                            <!-- BOOKING 1 -->

                            <tr>

                                <td class="booking-id">BK001</td>

                                <td>John Smith</td>

                                <td>Toyota Corolla</td>

                                <td>28/08/2026</td>

                                <td>01/09/2026</td>

                                <td>05/09/2026</td>

                                <td>
                                    <span class="status status-confirmed">
                                        Confirmed
                                    </span>
                                </td>

                                <td>King Shaka Airport</td>

                                <td>Umhlanga</td>

                                <td>
                                    <span class="refund-eligible">
                                        Eligible
                                    </span>
                                </td>

                                <td class="amount">R 2,450.00</td>

                            </tr>



                            <!-- BOOKING 2 -->

                            <tr>

                                <td class="booking-id">BK002</td>

                                <td>Sarah Williams</td>

                                <td>Volkswagen Polo</td>

                                <td>30/08/2026</td>

                                <td>01/09/2026</td>

                                <td>03/09/2026</td>

                                <td>
                                    <span class="status status-pending">
                                        Pending
                                    </span>
                                </td>

                                <td>Durban Downtown</td>

                                <td>King Shaka Airport</td>

                                <td>
                                    <span class="refund-eligible">
                                        Eligible
                                    </span>
                                </td>

                                <td class="amount">R 1,650.00</td>

                            </tr>



                            <!-- BOOKING 3 -->

                            <tr>

                                <td class="booking-id">BK003</td>

                                <td>David Johnson</td>

                                <td>BMW 3 Series</td>

                                <td>25/08/2026</td>

                                <td>27/08/2026</td>

                                <td>01/09/2026</td>

                                <td>
                                    <span class="status status-checkedout">
                                        Checked Out
                                    </span>
                                </td>

                                <td>OR Tambo Airport</td>

                                <td>OR Tambo Airport</td>

                                <td>
                                    <span class="refund-not-eligible">
                                        Not Eligible
                                    </span>
                                </td>

                                <td class="amount">R 4,850.00</td>

                            </tr>



                            <!-- BOOKING 4 -->

                            <tr>

                                <td class="booking-id">BK004</td>

                                <td>Emily Brown</td>

                                <td>Hyundai i20</td>

                                <td>22/08/2026</td>

                                <td>24/08/2026</td>

                                <td>28/08/2026</td>

                                <td>
                                    <span class="status status-cancelled">
                                        Cancelled
                                    </span>
                                </td>

                                <td>Cape Town Airport</td>

                                <td>Cape Town Airport</td>

                                <td>
                                    <span class="refund-eligible">
                                        Eligible
                                    </span>
                                </td>

                                <td class="amount">R 2,100.00</td>

                            </tr>



                            <!-- BOOKING 5 -->

                            <tr>

                                <td class="booking-id">BK005</td>

                                <td>Michael Adams</td>

                                <td>Mercedes-Benz A-Class</td>

                                <td>15/08/2026</td>

                                <td>17/08/2026</td>

                                <td>22/08/2026</td>

                                <td>
                                    <span class="status status-completed">
                                        Completed
                                    </span>
                                </td>

                                <td>George Airport</td>

                                <td>George Airport</td>

                                <td>
                                    <span class="refund-not-eligible">
                                        Not Eligible
                                    </span>
                                </td>

                                <td class="amount">R 5,250.00</td>

                            </tr>


                        </tbody>

                    </table>

                </div>

            </div>



            <!-- =====================================
                 BOOKING SUMMARY
            ====================================== -->

            <aside class="summary-card">


                <!-- SUMMARY HEADER -->

                <div class="summary-heading">

                    <span class="summary-booking-id">
                        BK001
                    </span>

                    <span class="summary-status">
                        Confirmed
                    </span>

                </div>



                <!-- CUSTOMER -->

                <div class="summary-details">

                    <div class="summary-detail">

                        <span class="summary-label">
                            Customer Name
                        </span>

                        <span class="summary-value">
                            John Smith
                        </span>

                    </div>



                    <!-- VEHICLE -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Vehicle
                        </span>

                        <span class="summary-value">
                            Toyota Corolla
                        </span>

                    </div>



                    <!-- DATES -->

                    <div class="summary-dates">

                        <div class="summary-detail">

                            <span class="summary-label">
                                Booking Date
                            </span>

                            <span class="summary-value">
                                28/08/2026
                            </span>

                        </div>


                        <div class="summary-detail">

                            <span class="summary-label">
                                Pick Up Date
                            </span>

                            <span class="summary-value">
                                01/09/2026
                            </span>

                        </div>

                    </div>



                    <div class="summary-detail">

                        <span class="summary-label">
                            Expected Return Date
                        </span>

                        <span class="summary-value">
                            05/09/2026
                        </span>

                    </div>



                    <!-- PICKUP BRANCH -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Pickup Branch
                        </span>

                        <span class="summary-value">
                            King Shaka Airport
                        </span>

                    </div>



                    <!-- DROPOFF BRANCH -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Dropoff Branch
                        </span>

                        <span class="summary-value">
                            Umhlanga
                        </span>

                    </div>

                </div>



                <!-- TOTAL -->

                <div class="summary-total">

                    <span class="summary-total-label">
                        Total Amount
                    </span>

                    <span class="summary-total-amount">
                        R 2,450.00
                    </span>

                </div>



                <!-- ACTION BUTTONS -->

                <div class="summary-actions">

                    <button type="button" class="cancel-btn">
                        Cancel Booking
                    </button>

                    <button type="button" class="delete-btn">
                        Delete Booking
                    </button>

                </div>


            </aside>


        </div>


    </main>
</asp:Content>
