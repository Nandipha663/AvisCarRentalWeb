<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateVehicles.aspx.cs" Inherits="AvisSystem.AvisPages.UpdateVehicles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>

        /* =========================================
           PAGE
        ========================================= */

        .vehicles-page {
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
            font-size: 14px;
            margin-bottom: 25px;
        }


        /* =========================================
           SEARCH
        ========================================= */

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
            box-sizing: border-box;
        }

        .search-box input:focus {
            border-color: #c8102e;
            box-shadow: 0 0 0 3px rgba(200, 16, 46, 0.08);
        }

        .search-box i {
            position: absolute;
            left: 18px;
            top: 16px;
            color: #888;
        }

        .clear-filters {
            height: 48px;
            padding: 0 22px;
            border: 1px solid #c8102e;
            background: white;
            color: #c8102e;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }

        .clear-filters:hover {
            background: #c8102e;
            color: white;
        }


        /* =========================================
           FILTER CARD
        ========================================= */

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
            color: #333;
            margin-bottom: 18px;
        }

        .filter-title i {
            color: #c8102e;
            margin-right: 8px;
        }

        .filters {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1.5fr;
            gap: 18px;
        }

        .filter-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #555;
            margin-bottom: 7px;
        }

        .filter-group select,
        .rate-input {
            width: 100%;
            height: 42px;
            border: 1px solid #ddd;
            border-radius: 7px;
            padding: 0 12px;
            font-size: 13px;
            background: white;
            box-sizing: border-box;
        }

        .filter-group select:focus,
        .rate-input:focus {
            outline: none;
            border-color: #c8102e;
        }

        .rate-range {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .rate-range .rate-input {
            flex: 1;
        }

        .rate-dash {
            color: #888;
        }


        /* =========================================
           MAIN CONTENT
        ========================================= */

        .content-layout {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 330px;
            gap: 22px;
            align-items: start;
        }


        /* =========================================
           VEHICLE TABLE
        ========================================= */

        .table-card {
            background: white;
            border: 1px solid #e5e5e5;
            border-radius: 10px;
            overflow-x: auto;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }

        .vehicle-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1250px;
        }

        .vehicle-table th {
            background: #fafafa;
            color: #555;
            font-size: 12px;
            font-weight: 700;
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #e5e5e5;
            white-space: nowrap;
        }

        .vehicle-table td {
            padding: 14px;
            font-size: 13px;
            color: #444;
            border-bottom: 1px solid #eee;
            white-space: nowrap;
        }

        .vehicle-row {
            cursor: pointer;
            transition: background 0.2s ease;
        }

        .vehicle-row:hover td {
            background: #fff5f6;
        }

        .vehicle-row.selected td {
            background: #fff1f3;
        }

        .vehicle-id {
            color: #c8102e;
            font-weight: 700;
        }


        /* =========================================
           STATUS BADGES
        ========================================= */

        .status {
            display: inline-block;
            padding: 5px 11px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
        }

        .status-available {
            background: #e8f7d8;
            color: #4b8b16;
        }

        .status-rented {
            background: #e8f0ff;
            color: #3265b7;
        }

        .status-maintenance {
            background: #fff3cd;
            color: #996c00;
        }

        .status-out {
            background: #ffe3e6;
            color: #c8102e;
        }


        /* =========================================
           SUMMARY CARD
        ========================================= */

        .summary-card {
            background: white;
            border: 1px solid #e5e5e5;
            border-radius: 10px;
            padding: 22px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }

        .summary-status-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .summary-status-title {
            color: #c8102e;
            font-size: 20px;
            font-weight: 700;
        }


        /* =========================================
           VEHICLE IMAGE
        ========================================= */

        .vehicle-image-container {
            width: 100%;
            height: 175px;
            border-radius: 9px;
            overflow: hidden;
            margin-bottom: 22px;
            background: #f1f1f1;
        }

        .vehicle-image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }


        /* =========================================
           SUMMARY INFORMATION
        ========================================= */

        .summary-item {
            margin-bottom: 17px;
        }

        .summary-label {
            font-size: 11px;
            color: #888;
            text-transform: uppercase;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .summary-value {
            font-size: 14px;
            color: #333;
            font-weight: 600;
        }

        .daily-rate {
            font-size: 21px;
            font-weight: 700;
            color: #222;
        }


        /* =========================================
           CHANGE STATUS
        ========================================= */

        .change-status {
            margin-top: 5px;
            margin-bottom: 20px;
        }

        .change-status label {
            display: block;
            font-size: 11px;
            color: #888;
            text-transform: uppercase;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .status-select {
            width: 100%;
            height: 43px;
            border: 1px solid #ddd;
            border-radius: 7px;
            padding: 0 12px;
            font-size: 13px;
            color: #333;
            background: white;
            cursor: pointer;
        }

        .status-select:focus {
            outline: none;
            border-color: #c8102e;
            box-shadow: 0 0 0 3px rgba(200,16,46,0.08);
        }


        /* =========================================
           BOTTOM BUTTONS
        ========================================= */

        .bottom-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 20px;
        }

        .action-btn {
            height: 44px;
            padding: 0 20px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .cancel-btn {
            background: white;
            border: 1px solid #c8102e;
            color: #c8102e;
        }

        .cancel-btn:hover {
            background: #fff3f4;
        }

        .add-vehicle-btn {
            background: #c8102e;
            border: 1px solid #c8102e;
            color: white;
        }

        .add-vehicle-btn:hover {
            background: #a90e27;
            border-color: #a90e27;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1100px) {

            .search-box {
                flex: 1;
            }

            .filters {
                grid-template-columns: 1fr 1fr;
            }

            .content-layout {
                grid-template-columns: 1fr;
            }

            .summary-card {
                width: 100%;
                box-sizing: border-box;
            }

        }

        @media (max-width: 650px) {

            .vehicles-page {
                padding: 20px;
            }

            .search-row {
                flex-direction: column;
                align-items: stretch;
            }

            .search-box {
                width: 100%;
            }

            .clear-filters {
                width: 100%;
            }

            .filters {
                grid-template-columns: 1fr;
            }

            .bottom-buttons {
                flex-direction: column;
            }

            .action-btn {
                width: 100%;
            }

        }

    </style>


    <div class="vehicles-page">

        <!-- PAGE HEADER -->

        <div class="page-title">
            Vehicles
        </div>

        <div class="page-subtitle">
            View and manage the vehicle fleet
        </div>


        <!-- SEARCH -->

        <div class="search-row">

            <div class="search-box">

                <i class="fas fa-search"></i>

                <input type="text"
                       placeholder="Search vehicles by their make" />

            </div>

            <button type="button"
                    class="clear-filters">

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


                <!-- MODEL -->

                <div class="filter-group">

                    <label>
                        Model
                    </label>

                    <select>

                        <option>
                            All Models
                        </option>

                        <option>
                            Corolla
                        </option>

                        <option>
                            3 Series
                        </option>

                        <option>
                            Polo
                        </option>

                        <option>
                            A-Class
                        </option>

                        <option>
                            i20
                        </option>

                    </select>

                </div>


                <!-- CATEGORY -->

                <div class="filter-group">

                    <label>
                        Category
                    </label>

                    <select>

                        <option>
                            All Categories
                        </option>

                        <option>
                            Economy
                        </option>

                        <option>
                            Compact
                        </option>

                        <option>
                            Sedan
                        </option>

                        <option>
                            SUV
                        </option>

                        <option>
                            Luxury
                        </option>

                    </select>

                </div>


                <!-- STATUS -->

                <div class="filter-group">

                    <label>
                        Status
                    </label>

                    <select>

                        <option>
                            All Statuses
                        </option>

                        <option>
                            Available
                        </option>

                        <option>
                            Rented
                        </option>

                        <option>
                            In Maintenance
                        </option>

                        <option>
                            Out Of Service
                        </option>

                    </select>

                </div>


                <!-- DAILY RATE -->

                <div class="filter-group">

                    <label>
                        Daily Rate
                    </label>

                    <div class="rate-range">

                        <input type="number"
                               class="rate-input"
                               placeholder="Min" />

                        <span class="rate-dash">
                            –
                        </span>

                        <input type="number"
                               class="rate-input"
                               placeholder="Max" />

                    </div>

                </div>

            </div>

        </div>


        <!-- TABLE + SUMMARY -->

        <div class="content-layout">


            <!-- VEHICLE TABLE -->

            <div class="table-card">

                <table class="vehicle-table">

                    <thead>

                        <tr>

                            <th>VehicleInNo</th>
                            <th>RegistrationNo</th>
                            <th>Make</th>
                            <th>Model</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th>BranchName</th>
                            <th>DailyRate</th>
                            <th>VehicleDescription</th>
                            <th>OdemeterReading</th>
                            <th>Image</th>

                        </tr>

                    </thead>


                    <tbody>


                        <!-- VEHICLE 1 -->

                        <tr class="vehicle-row selected"
                            onclick="selectVehicle(
                                'V001',
                                'ND 123 456',
                                'Toyota',
                                'Corolla',
                                'Sedan',
                                'Available',
                                'King Shaka Airport',
                                '850',
                                'Reliable automatic sedan suitable for everyday travel.',
                                '45 820',
                                '/Content/images/toyota-corolla.jpg'
                            )">

                            <td class="vehicle-id">
                                V001
                            </td>

                            <td>
                                ND 123 456
                            </td>

                            <td>
                                Toyota
                            </td>

                            <td>
                                Corolla
                            </td>

                            <td>
                                Sedan
                            </td>

                            <td>

                                <span class="status status-available">
                                    Available
                                </span>

                            </td>

                            <td>
                                King Shaka Airport
                            </td>

                            <td>
                                R850.00
                            </td>

                            <td>
                                Reliable automatic sedan
                            </td>

                            <td>
                                45 820 km
                            </td>

                            <td>
                                Toyota Corolla
                            </td>

                        </tr>


                        <!-- VEHICLE 2 -->

                        <tr class="vehicle-row"
                            onclick="selectVehicle(
                                'V002',
                                'ND 456 789',
                                'BMW',
                                '3 Series',
                                'Luxury',
                                'Rented',
                                'Durban Downtown',
                                '1 450',
                                'Premium automatic vehicle.',
                                '32 610',
                                '/Content/images/bmw-3-series.jpg'
                            )">

                            <td class="vehicle-id">
                                V002
                            </td>

                            <td>
                                ND 456 789
                            </td>

                            <td>
                                BMW
                            </td>

                            <td>
                                3 Series
                            </td>

                            <td>
                                Luxury
                            </td>

                            <td>

                                <span class="status status-rented">
                                    Rented
                                </span>

                            </td>

                            <td>
                                Durban Downtown
                            </td>

                            <td>
                                R1 450.00
                            </td>

                            <td>
                                Premium automatic vehicle
                            </td>

                            <td>
                                32 610 km
                            </td>

                            <td>
                                BMW 3 Series
                            </td>

                        </tr>


                        <!-- VEHICLE 3 -->

                        <tr class="vehicle-row"
                            onclick="selectVehicle(
                                'V003',
                                'ND 789 123',
                                'Volkswagen',
                                'Polo',
                                'Economy',
                                'In Maintenance',
                                'Umhlanga Branch',
                                '650',
                                'Compact fuel-efficient hatchback.',
                                '58 430',
                                '/Content/images/vw-polo.jpg'
                            )">

                            <td class="vehicle-id">
                                V003
                            </td>

                            <td>
                                ND 789 123
                            </td>

                            <td>
                                Volkswagen
                            </td>

                            <td>
                                Polo
                            </td>

                            <td>
                                Economy
                            </td>

                            <td>

                                <span class="status status-maintenance">
                                    In Maintenance
                                </span>

                            </td>

                            <td>
                                Umhlanga Branch
                            </td>

                            <td>
                                R650.00
                            </td>

                            <td>
                                Compact fuel-efficient hatchback
                            </td>

                            <td>
                                58 430 km
                            </td>

                            <td>
                                Volkswagen Polo
                            </td>

                        </tr>


                        <!-- VEHICLE 4 -->

                        <tr class="vehicle-row"
                            onclick="selectVehicle(
                                'V004',
                                'CA 321 654',
                                'Mercedes-Benz',
                                'A-Class',
                                'Luxury',
                                'Available',
                                'Cape Town Airport',
                                '1 650',
                                'Luxury compact automatic vehicle.',
                                '27 540',
                                '/Content/images/mercedes-a-class.jpg'
                            )">

                            <td class="vehicle-id">
                                V004
                            </td>

                            <td>
                                CA 321 654
                            </td>

                            <td>
                                Mercedes-Benz
                            </td>

                            <td>
                                A-Class
                            </td>

                            <td>
                                Luxury
                            </td>

                            <td>

                                <span class="status status-available">
                                    Available
                                </span>

                            </td>

                            <td>
                                Cape Town Airport
                            </td>

                            <td>
                                R1 650.00
                            </td>

                            <td>
                                Luxury compact automatic vehicle
                            </td>

                            <td>
                                27 540 km
                            </td>

                            <td>
                                Mercedes-Benz A-Class
                            </td>

                        </tr>


                        <!-- VEHICLE 5 -->

                        <tr class="vehicle-row"
                            onclick="selectVehicle(
                                'V005',
                                'GP 654 987',
                                'Hyundai',
                                'i20',
                                'Compact',
                                'Out Of Service',
                                'OR Tambo Airport',
                                '720',
                                'Compact hatchback for city travel.',
                                '61 220',
                                '/Content/images/hyundai-i20.jpg'
                            )">

                            <td class="vehicle-id">
                                V005
                            </td>

                            <td>
                                GP 654 987
                            </td>

                            <td>
                                Hyundai
                            </td>

                            <td>
                                i20
                            </td>

                            <td>
                                Compact
                            </td>

                            <td>

                                <span class="status status-out">
                                    Out Of Service
                                </span>

                            </td>

                            <td>
                                OR Tambo Airport
                            </td>

                            <td>
                                R720.00
                            </td>

                            <td>
                                Compact hatchback for city travel
                            </td>

                            <td>
                                61 220 km
                            </td>

                            <td>
                                Hyundai i20
                            </td>

                        </tr>

                    </tbody>

                </table>

            </div>


            <!-- =========================================
                 VEHICLE SUMMARY
            ========================================== -->

            <div class="summary-card">


                <!-- STATUS HEADER -->

                <div class="summary-status-header">

                    <div class="summary-status-title">
                        Status
                    </div>

                    <span id="summaryStatus"
                          class="status status-available">

                        Available

                    </span>

                </div>


                <!-- VEHICLE IMAGE -->

                <div class="vehicle-image-container">

                    <img id="summaryImage"
                         src="/Content/images/BMWXM.png"
                         alt="Vehicle Image" />

                </div>


                <!-- VIN -->

                <div class="summary-item">

                    <div class="summary-label">
                        VIN No
                    </div>

                    <div class="summary-value"
                         id="summaryVin">

                        V001

                    </div>

                </div>


                <!-- CATEGORY -->

                <div class="summary-item">

                    <div class="summary-label">
                        Category
                    </div>

                    <div class="summary-value"
                         id="summaryCategory">

                        Sedan

                    </div>

                </div>


                <!-- MAKE -->

                <div class="summary-item">

                    <div class="summary-label">
                        Make
                    </div>

                    <div class="summary-value"
                         id="summaryMake">

                        Toyota

                    </div>

                </div>


                <!-- MODEL -->

                <div class="summary-item">

                    <div class="summary-label">
                        Model
                    </div>

                    <div class="summary-value"
                         id="summaryModel">

                        Corolla

                    </div>

                </div>


                <!-- DAILY RATE -->

                <div class="summary-item">

                    <div class="summary-label">
                        Daily Rate
                    </div>

                    <div class="daily-rate"
                         id="summaryRate">

                        R850.00

                    </div>

                </div>


                <!-- CHANGE STATUS -->

                <div class="change-status">

                    <label>
                        Change Status
                    </label>

                    <select id="changeStatus"
                            class="status-select">

                        <option>
                            Available
                        </option>

                        <option>
                            Rented
                        </option>

                        <option>
                            In Maintenance
                        </option>

                        <option>
                            Out Of Service
                        </option>

                    </select>

                </div>

            </div>

        </div>


        <!-- =========================================
             BOTTOM BUTTONS
        ========================================== -->

        <div class="bottom-buttons">

            <button type="button"
                    class="action-btn cancel-btn">

                <i class="fas fa-times"></i>

                Cancel

            </button>


            <a href="../ManagerPages/AddVehicle.aspx" class="action-btn add-vehicle-btn">
                <i class="fas fa-plus"></i>
                    Add New Vehicle
           </a>

            <%--<button type="button"
                    class="action-btn add-vehicle-btn">

                <i class="fas fa-plus"></i>

                Add New Vehicle

            </button>--%>

        </div>

    </div>


    <!-- =========================================
         JAVASCRIPT
    ========================================== -->

    <script>

        function selectVehicle(
            vehicleInNo,
            registrationNo,
            make,
            model,
            category,
            status,
            branchName,
            dailyRate,
            description,
            odometer,
            image
        ) {

            /* Update summary */

            document.getElementById("summaryStatus").innerText = status;

            document.getElementById("summaryVin").innerText = vehicleInNo;

            document.getElementById("summaryCategory").innerText = category;

            document.getElementById("summaryMake").innerText = make;

            document.getElementById("summaryModel").innerText = model;

            document.getElementById("summaryRate").innerText =
                "R" + Number(dailyRate).toLocaleString("en-ZA") + ".00";

            document.getElementById("summaryImage").src = image;


            /* Update Change Status dropdown */

            document.getElementById("changeStatus").value = status;


            /* Remove selected row */

            var rows = document.querySelectorAll(".vehicle-row");

            rows.forEach(function (row) {

                row.classList.remove("selected");

            });


            /* Highlight selected row */

            event.currentTarget.classList.add("selected");

        }

    </script>

</asp:Content>
