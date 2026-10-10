<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateRentals.aspx.cs" Inherits="AvisSystem.AvisPages.UpdateRentals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <style>

        /* PAGE */
        .rentals-page {
            padding: 30px;
            background: #f7f7f7;
            min-height: calc(100vh - 70px);
        }

        .page-title {
            font-size: 30px;
            font-weight: 700;
            color: #222;
            margin-bottom: 5px;
        }

        .page-subtitle {
            color: #777;
            margin-bottom: 25px;
        }

        /* SEARCH AREA */
        .search-row {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .search-box {
            position: relative;
            flex: 0 0 80%;
        }

        .search-box input {
            width: 100%;
            height: 48px;
            padding: 0 20px 0 48px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            background: white;
            outline: none;
        }

        .search-box input:focus {
            border-color: #c8102e;
        }

        .search-box i {
            position: absolute;
            left: 18px;
            top: 16px;
            color: #888;
        }

        .clear-btn {
            height: 48px;
            padding: 0 22px;
            border: 1px solid #c8102e;
            background: white;
            color: #c8102e;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }

        .clear-btn:hover {
            background: #c8102e;
            color: white;
        }

        /* FILTER CARD */
        .filter-card {
            background: white;
            border: 1px solid #e5e5e5;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }

        .filter-title {
            font-size: 17px;
            font-weight: 700;
            margin-bottom: 18px;
            color: #333;
        }

        .filter-title i {
            color: #c8102e;
            margin-right: 8px;
        }

        .filters {
            display: flex;
            gap: 20px;
            align-items: end;
        }

        .filter-group {
            flex: 1;
        }

        .filter-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 7px;
            color: #555;
        }

        .filter-group input,
        .filter-group select {
            width: 100%;
            height: 42px;
            border: 1px solid #ddd;
            border-radius: 7px;
            padding: 0 12px;
            font-size: 14px;
            background: white;
        }

        .filter-group input:focus,
        .filter-group select:focus {
            outline: none;
            border-color: #c8102e;
        }

        /* MAIN CONTENT */
        .content-layout {
            display: grid;
            grid-template-columns: 1fr 330px;
            gap: 22px;
            align-items: start;
        }

        /* TABLE CARD */
        .table-card {
            background: white;
            border: 1px solid #e5e5e5;
            border-radius: 10px;
            overflow-x: auto;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1050px;
        }

        th {
            background: #fafafa;
            color: #555;
            font-size: 13px;
            font-weight: 700;
            padding: 15px 14px;
            text-align: left;
            border-bottom: 1px solid #e5e5e5;
            white-space: nowrap;
        }

        td {
            padding: 15px 14px;
            font-size: 13px;
            color: #444;
            border-bottom: 1px solid #eee;
            white-space: nowrap;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background: #fafafa;
        }

        /* RENTAL STATUS */
        .status {
            display: inline-block;
            padding: 5px 11px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-active {
            background: #e8f7d8;
            color: #4b8b16;
        }

        .status-completed {
            background: #dff4e5;
            color: #238443;
        }

        /* VIEW BUTTON */
        .view-btn {
            background: white;
            border: 1px solid #c8102e;
            color: #c8102e;
            padding: 7px 14px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .view-btn:hover {
            background: #c8102e;
            color: white;
        }

        /* SUMMARY CARD */
        .summary-card {
            background: white;
            border: 1px solid #e5e5e5;
            border-radius: 10px;
            padding: 22px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }

        .summary-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 17px;
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
        }

        .rental-id {
            color: #c8102e;
            font-size: 20px;
            font-weight: 700;
        }

        .summary-label {
            font-size: 11px;
            color: #888;
            text-transform: uppercase;
            margin-bottom: 5px;
            font-weight: 600;
        }

        .summary-value {
            font-size: 14px;
            color: #333;
            font-weight: 600;
            margin-bottom: 17px;
        }

        .summary-amount {
            font-size: 21px;
            font-weight: 700;
            color: #222;
            margin-bottom: 22px;
        }

        /* SUMMARY BUTTONS */
        .summary-buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .cancel-btn {
            height: 42px;
            border: 1px solid #c8102e;
            background: white;
            color: #c8102e;
            border-radius: 7px;
            font-weight: 600;
            cursor: pointer;
        }

        .cancel-btn:hover {
            background: #fff2f3;
        }

        .delete-btn {
            height: 42px;
            border: 1px solid #c8102e;
            background: #c8102e;
            color: white;
            border-radius: 7px;
            font-weight: 600;
            cursor: pointer;
        }

        .delete-btn:hover {
            background: #a80d26;
        }

        /* RESPONSIVE */
        @media (max-width: 1000px) {

            .content-layout {
                grid-template-columns: 1fr;
            }

            .summary-card {
                width: 100%;
            }

            .search-box {
                flex: 1;
            }
        }

    </style>


    <div class="rentals-page">

        <!-- PAGE TITLE -->
        <div class="page-title">
            Rentals
        </div>

        <div class="page-subtitle">
            View and manage customer rentals
        </div>


        <!-- SEARCH -->
        <div class="search-row">

            <div class="search-box">
                <i class="fas fa-search"></i>
                <input type="text"
                       placeholder="Search rentals by customer's name" />
            </div>

            <button type="button" class="clear-btn">
                Clear Filters
            </button>

        </div>


        <!-- FILTERS -->
        <div class="filter-card">

            <div class="filter-title">
                <i class="fas fa-filter"></i>
                Filters
            </div>

            <div class="filters">

                <div class="filter-group">
                    <label>From Date</label>
                    <input type="date" />
                </div>

                <div class="filter-group">
                    <label>To Date</label>
                    <input type="date" />
                </div>

                <div class="filter-group">
                    <label>Rental Status</label>
                    <select>
                        <option>All Statuses</option>
                        <option>Active</option>
                        <option>Completed</option>
                    </select>
                </div>

            </div>

        </div>


        <!-- TABLE + SUMMARY -->
        <div class="content-layout">


            <!-- RENTALS TABLE -->
            <div class="table-card">

                <table>

                    <thead>
                        <tr>
                            <th>RentalID</th>
                            <th>BookingID</th>
                            <th>CustomerName</th>
                            <th>Vehicle</th>
                            <th>PickUpDate</th>
                            <th>ExpectedReturnDate</th>
                            <th>Rental Status</th>
                            <th>EmplID</th>
                            <th>EmpName</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>

                        <tr>
                            <td>R001</td>
                            <td>BK001</td>
                            <td>John Smith</td>
                            <td>Toyota Corolla</td>
                            <td>01/09/2026</td>
                            <td>05/09/2026</td>
                            <td>
                                <span class="status status-active">
                                    Active
                                </span>
                            </td>
                            <td>E001</td>
                            <td>Thabo Mokoena</td>
                            <td>
                                <button type="button" class="view-btn">
                                    View
                                </button>
                            </td>
                        </tr>

                        <tr>
                            <td>R002</td>
                            <td>BK003</td>
                            <td>David Johnson</td>
                            <td>BMW 3 Series</td>
                            <td>27/08/2026</td>
                            <td>01/09/2026</td>
                            <td>
                                <span class="status status-active">
                                    Active
                                </span>
                            </td>
                            <td>E002</td>
                            <td>Nomsa Dlamini</td>
                            <td>
                                <button type="button" class="view-btn">
                                    View
                                </button>
                            </td>
                        </tr>

                        <tr>
                            <td>R003</td>
                            <td>BK005</td>
                            <td>Michael Adams</td>
                            <td>Mercedes-Benz A-Class</td>
                            <td>17/08/2026</td>
                            <td>22/08/2026</td>
                            <td>
                                <span class="status status-completed">
                                    Completed
                                </span>
                            </td>
                            <td>E003</td>
                            <td>Sipho Naidoo</td>
                            <td>
                                <button type="button" class="view-btn">
                                    View
                                </button>
                            </td>
                        </tr>

                        <tr>
                            <td>R004</td>
                            <td>BK006</td>
                            <td>Emily Brown</td>
                            <td>Hyundai i20</td>
                            <td>10/08/2026</td>
                            <td>14/08/2026</td>
                            <td>
                                <span class="status status-completed">
                                    Completed
                                </span>
                            </td>
                            <td>E004</td>
                            <td>Lerato Khumalo</td>
                            <td>
                                <button type="button" class="view-btn">
                                    View
                                </button>
                            </td>
                        </tr>

                        <tr>
                            <td>R005</td>
                            <td>BK007</td>
                            <td>Sarah Williams</td>
                            <td>Volkswagen Polo</td>
                            <td>06/08/2026</td>
                            <td>09/08/2026</td>
                            <td>
                                <span class="status status-completed">
                                    Completed
                                </span>
                            </td>
                            <td>E001</td>
                            <td>Thabo Mokoena</td>
                            <td>
                                <button type="button" class="view-btn">
                                    View
                                </button>
                            </td>
                        </tr>

                    </tbody>

                </table>

            </div>


            <!-- RENTAL SUMMARY -->
            <div class="summary-card">

                <div class="summary-header">

                    <div class="rental-id">
                        R001
                    </div>

                    <span class="status status-active">
                        Active
                    </span>

                </div>


                <div class="summary-label">
                    Customer Name
                </div>

                <div class="summary-value">
                    John Smith
                </div>


                <div class="summary-label">
                    Vehicle
                </div>

                <div class="summary-value">
                    Toyota Corolla
                </div>


                <div class="summary-label">
                    Total Amount
                </div>

                <div class="summary-amount">
                    R 2,450.00
                </div>


                <div class="summary-buttons">

                    <button type="button" class="cancel-btn">
                        Cancel
                    </button>

                    <button type="button" class="delete-btn">
                        Delete
                    </button>

                </div>

            </div>

        </div>

    </div>

</asp:Content>
