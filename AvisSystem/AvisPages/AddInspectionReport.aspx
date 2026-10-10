<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddInspectionReport.aspx.cs" Inherits="AvisSystem.AvisPages.AddInspectionReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <style>

        /* ================================
           PAGE
        ================================= */

        .inspection-page {
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


        /* ================================
           FORM CARD
        ================================= */

        .inspection-card {
            background: #ffffff;
            border: 1px solid #e5e5e5;
            border-radius: 12px;
            padding: 30px;
            max-width: 1050px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.05);
        }


        /* ================================
           FORM GRID
        ================================= */

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-bottom: 24px;
        }

        .form-group {
            width: 100%;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            color: #444;
            margin-bottom: 8px;
        }

        .required {
            color: #c8102e;
        }


        /* ================================
           MODERN TEXTBOXES
        ================================= */

        .modern-input,
        .modern-select {
            width: 100%;
            height: 48px;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 0 15px;
            font-size: 14px;
            color: #333;
            background: #ffffff;
            box-sizing: border-box;
            transition: all 0.2s ease;
        }

        .modern-input::placeholder,
        .modern-textarea::placeholder {
            color: #999;
        }

        .modern-input:focus,
        .modern-select:focus,
        .modern-textarea:focus {
            outline: none;
            border-color: #c8102e;
            box-shadow: 0 0 0 3px rgba(200, 16, 46, 0.08);
        }

        .modern-select {
            cursor: pointer;
        }


        /* ================================
           INPUT WITH ICON
        ================================= */

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 16px;
            top: 16px;
            color: #999;
            font-size: 15px;
            pointer-events: none;
        }

        .input-wrapper .modern-input {
            padding-left: 43px;
        }


        /* ================================
           TEXT AREAS
        ================================= */

        .full-width {
            margin-bottom: 24px;
        }

        .modern-textarea {
            width: 100%;
            min-height: 115px;
            resize: vertical;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 14px 15px;
            font-size: 14px;
            color: #333;
            font-family: inherit;
            box-sizing: border-box;
            transition: all 0.2s ease;
        }


        /* ================================
           ROUND SELECTIONS
        ================================= */

        .selection-group {
            display: flex;
            align-items: center;
            gap: 14px;
            flex-wrap: wrap;
        }

        .round-option {
            position: relative;
        }

        .round-option input {
            position: absolute;
            opacity: 0;
            pointer-events: none;
        }

        .round-option label {
            display: flex;
            align-items: center;
            gap: 9px;
            padding: 10px 16px;
            border: 1px solid #dddddd;
            border-radius: 30px;
            background: #ffffff;
            color: #555;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .round-option label:hover {
            border-color: #c8102e;
            color: #c8102e;
        }

        /* Outer circle */
        .round-circle {
            width: 17px;
            height: 17px;
            border: 2px solid #bdbdbd;
            border-radius: 50%;
            position: relative;
            box-sizing: border-box;
            transition: all 0.2s ease;
        }

        /* Selected option */
        .round-option input:checked + label {
            border-color: #c8102e;
            background: #fff5f6;
            color: #c8102e;
        }

        .round-option input:checked + label .round-circle {
            border-color: #c8102e;
        }

        .round-option input:checked + label .round-circle::after {
            content: "";
            position: absolute;
            width: 8px;
            height: 8px;
            background: #c8102e;
            border-radius: 50%;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }


        /* ================================
           DAMAGE YES / NO
        ================================= */

        .damage-options {
            display: flex;
            gap: 12px;
        }


        /* ================================
           DATE
        ================================= */

        .date-input {
            position: relative;
        }

        .date-input input {
            padding-right: 15px;
        }


        /* ================================
           DIVIDER
        ================================= */

        .form-divider {
            border: none;
            border-top: 1px solid #eeeeee;
            margin: 5px 0 25px;
        }


        /* ================================
           BUTTONS
        ================================= */

        .button-area {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 8px;
        }

        .action-btn {
            height: 45px;
            padding: 0 20px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.2s ease;
        }

        /* ADD */
        .add-btn {
            background: #c8102e;
            border: 1px solid #c8102e;
            color: white;
        }

        .add-btn:hover {
            background: #a90e27;
            border-color: #a90e27;
        }

        /* CANCEL */
        .cancel-btn {
            background: white;
            border: 1px solid #c8102e;
            color: #c8102e;
        }

        .cancel-btn:hover {
            background: #fff3f4;
        }

        /* CLEAR */
        .clear-btn {
            background: #f4f4f4;
            border: 1px solid #dddddd;
            color: #555;
        }

        .clear-btn:hover {
            background: #e9e9e9;
        }


        /* ================================
           RESPONSIVE
        ================================= */

        @media (max-width: 750px) {

            .inspection-page {
                padding: 20px;
            }

            .inspection-card {
                padding: 20px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .selection-group {
                gap: 8px;
            }

            .button-area {
                justify-content: stretch;
                flex-direction: column;
            }

            .action-btn {
                width: 100%;
            }
        }

        /* ================================
   SELECTED RENTAL
================================ */

.selected-rental-card {
    background: #fafafa;
    border: 1px solid #e5e5e5;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 25px;
}

.section-title {
    font-size: 16px;
    font-weight: 700;
    color: #333;
    margin-bottom: 18px;
}

.section-title i {
    color: #c8102e;
    margin-right: 8px;
}

.selected-rental-grid {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 18px;
}

.readonly-input {
    background: #f1f1f1 !important;
    color: #555 !important;
    cursor: not-allowed;
}


/* ================================
   ACTIVE RENTALS TABLE
================================ */

.rentals-section {
    margin-top: 35px;
}

.rentals-section-title {
    font-size: 20px;
    font-weight: 700;
    color: #222;
    margin-bottom: 5px;
}

.rentals-section-subtitle {
    color: #777;
    font-size: 13px;
    margin-bottom: 18px;
}

.rentals-table-card {
    background: white;
    border: 1px solid #e5e5e5;
    border-radius: 10px;
    overflow-x: auto;
    box-shadow: 0 2px 8px rgba(0,0,0,0.04);
}

.rentals-table {
    width: 100%;
    border-collapse: collapse;
    min-width: 900px;
}

.rentals-table th {
    background: #fafafa;
    color: #555;
    font-size: 12px;
    font-weight: 700;
    padding: 14px;
    text-align: left;
    border-bottom: 1px solid #e5e5e5;
    white-space: nowrap;
}

.rentals-table td {
    padding: 14px;
    font-size: 13px;
    color: #444;
    border-bottom: 1px solid #eeeeee;
    white-space: nowrap;
}

.rental-row {
    cursor: pointer;
    transition: background 0.2s ease;
}

.rental-row:hover td {
    background: #fff5f6;
}

.rental-row.selected td {
    background: #fff1f3;
}

.rental-id-cell {
    color: #c8102e;
    font-weight: 700;
}

.active-status {
    display: inline-block;
    padding: 5px 11px;
    border-radius: 20px;
    background: #e8f7d8;
    color: #4b8b16;
    font-size: 12px;
    font-weight: 600;
}

    </style>


    <div class="inspection-page">

        <!-- PAGE HEADER -->

        <div class="page-title">
            Add Vehicle Inspection Report
        </div>

        <div class="page-subtitle">
            Record the vehicle condition during pickup or return.
        </div>


        <!-- FORM CARD -->

        <div class="inspection-card">

            <!-- SELECTED RENTAL -->

<div class="selected-rental-card">

    <div class="section-title">
        <i class="fas fa-car"></i>
        Selected Rental
    </div>

    <div class="selected-rental-grid">

        <!-- RENTAL ID -->

        <div class="form-group">

            <label class="form-label">
                RentalID
            </label>

            <input type="text"
                   id="txtRentalID"
                   class="modern-input readonly-input"
                   value="R001"
                   readonly />

        </div>


        <!-- VEHICLE -->

        <div class="form-group">

            <label class="form-label">
                Vehicle
            </label>

            <input type="text"
                   id="txtVehicle"
                   class="modern-input readonly-input"
                   value="Toyota Corolla"
                   readonly />

        </div>


        <!-- BRANCH NAME -->

        <div class="form-group">

            <label class="form-label">
                BranchName
            </label>

            <input type="text"
                   id="txtBranchName"
                   class="modern-input readonly-input"
                   value="King Shaka Airport"
                   readonly />

        </div>

    </div>

</div>

            <!-- ODOMETER + INSPECTION TYPE -->

            <div class="form-row">

                <div class="form-group">

                    <label class="form-label">
                        Odometer Reading <span class="required">*</span>
                    </label>

                    <div class="input-wrapper">

                        <i class="fas fa-tachometer-alt"></i>

                        <input type="number"
                               class="modern-input"
                               placeholder="e.g. 45 820 km" />

                    </div>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Inspection Type <span class="required">*</span>
                    </label>

                    <select class="modern-select">

                        <option value="">
                            Select inspection type
                        </option>

                        <option value="Pickup">
                            Pickup
                        </option>

                        <option value="Return">
                            Return
                        </option>

                    </select>

                </div>

            </div>


            <hr class="form-divider" />


            <!-- FUEL LEVEL -->

            <div class="full-width">

                <label class="form-label">
                    Fuel Level <span class="required">*</span>
                </label>

                <div class="selection-group">


                    <div class="round-option">

                        <input type="radio"
                               id="fuelEmpty"
                               name="fuelLevel" />

                        <label for="fuelEmpty">

                            <span class="round-circle"></span>

                            Empty

                        </label>

                    </div>


                    <div class="round-option">

                        <input type="radio"
                               id="fuelQuarter"
                               name="fuelLevel" />

                        <label for="fuelQuarter">

                            <span class="round-circle"></span>

                            1/4

                        </label>

                    </div>


                    <div class="round-option">

                        <input type="radio"
                               id="fuelHalf"
                               name="fuelLevel" />

                        <label for="fuelHalf">

                            <span class="round-circle"></span>

                            Half

                        </label>

                    </div>


                    <div class="round-option">

                        <input type="radio"
                               id="fuelThreeQuarter"
                               name="fuelLevel" />

                        <label for="fuelThreeQuarter">

                            <span class="round-circle"></span>

                            3/4

                        </label>

                    </div>


                    <div class="round-option">

                        <input type="radio"
                               id="fuelFull"
                               name="fuelLevel"
                               checked />

                        <label for="fuelFull">

                            <span class="round-circle"></span>

                            Full

                        </label>

                    </div>


                    <div class="round-option">

                        <input type="radio"
                               id="fuelUnknown"
                               name="fuelLevel" />

                        <label for="fuelUnknown">

                            <span class="round-circle"></span>

                            Unknown

                        </label>

                    </div>

                </div>

            </div>


            <!-- DAMAGE FOUND -->

            <div class="full-width">

                <label class="form-label">
                    Damage Found <span class="required">*</span>
                </label>

                <div class="damage-options">


                    <div class="round-option">

                        <input type="radio"
                               id="damageYes"
                               name="damageFound" />

                        <label for="damageYes">

                            <span class="round-circle"></span>

                            Yes

                        </label>

                    </div>


                    <div class="round-option">

                        <input type="radio"
                               id="damageNo"
                               name="damageFound"
                               checked />

                        <label for="damageNo">

                            <span class="round-circle"></span>

                            No

                        </label>

                    </div>

                </div>

            </div>


            <!-- DAMAGE DESCRIPTION -->

            <div class="full-width">

                <label class="form-label">
                    Damage Description
                </label>

                <textarea class="modern-textarea"
                          placeholder="Describe any damage found on the vehicle..."></textarea>

            </div>


            <!-- INSPECTION NOTES -->

            <div class="full-width">

                <label class="form-label">
                    Inspection Notes
                </label>

                <textarea class="modern-textarea"
                          placeholder="Add any additional inspection notes..."></textarea>

            </div>


            <!-- INSPECTION DATE -->

            <div class="full-width">

                <label class="form-label">
                    Inspection Date <span class="required">*</span>
                </label>

                <div class="date-input">

                    <input type="date"
                           class="modern-input"
                           value="2026-09-02" />

                </div>

            </div>


            <hr class="form-divider" />


            <!-- BUTTONS -->

            <div class="button-area">

                <button type="button"
                        class="action-btn clear-btn">

                    <i class="fas fa-eraser"></i>

                    Clear

                </button>


                <button type="button"
                        class="action-btn cancel-btn">

                    <i class="fas fa-times"></i>

                    Cancel

                </button>


                <button type="button"
                        class="action-btn add-btn">

                    <i class="fas fa-check"></i>

                    Add Inspection

                </button>

            </div>

             </div>


        <!-- =================================
             ACTIVE RENTALS
        ================================== -->

        <div class="rentals-section">

            <div class="rentals-section-title">
                Active Rentals
            </div>

            <div class="rentals-section-subtitle">
                Select a rental to create a vehicle inspection report.
            </div>


            <div class="rentals-table-card">

                <table class="rentals-table">

                    <thead>

                        <tr>

                            <th>RentalID</th>
                            <th>BookingID</th>
                            <th>CustomerName</th>
                            <th>Vehicle</th>
                            <th>PickUpDate</th>
                            <th>ExpectedReturnDate</th>
                            <th>BranchName</th>
                            <th>Rental Status</th>

                        </tr>

                    </thead>


                    <tbody>

                        <!-- RENTAL 1 -->

                        <tr class="rental-row"
                            onclick="selectRental('R001','Toyota Corolla','King Shaka Airport')">

                            <td class="rental-id-cell">
                                R001
                            </td>

                            <td>
                                BK001
                            </td>

                            <td>
                                John Smith
                            </td>

                            <td>
                                Toyota Corolla
                            </td>

                            <td>
                                02/09/2026
                            </td>

                            <td>
                                06/09/2026
                            </td>

                            <td>
                                King Shaka Airport
                            </td>

                            <td>
                                <span class="active-status">
                                    Active
                                </span>
                            </td>

                        </tr>


                        <!-- RENTAL 2 -->

                        <tr class="rental-row"
                            onclick="selectRental('R002','BMW 3 Series','Durban Downtown')">

                            <td class="rental-id-cell">
                                R002
                            </td>

                            <td>
                                BK003
                            </td>

                            <td>
                                David Johnson
                            </td>

                            <td>
                                BMW 3 Series
                            </td>

                            <td>
                                02/09/2026
                            </td>

                            <td>
                                05/09/2026
                            </td>

                            <td>
                                Durban Downtown
                            </td>

                            <td>
                                <span class="active-status">
                                    Active
                                </span>
                            </td>

                        </tr>


                        <!-- RENTAL 3 -->

                        <tr class="rental-row"
                            onclick="selectRental('R003','Volkswagen Polo','Umhlanga Branch')">

                            <td class="rental-id-cell">
                                R003
                            </td>

                            <td>
                                BK008
                            </td>

                            <td>
                                Sarah Williams
                            </td>

                            <td>
                                Volkswagen Polo
                            </td>

                            <td>
                                01/09/2026
                            </td>

                            <td>
                                04/09/2026
                            </td>

                            <td>
                                Umhlanga Branch
                            </td>

                            <td>
                                <span class="active-status">
                                    Active
                                </span>
                            </td>

                        </tr>


                        <!-- RENTAL 4 -->

                        <tr class="rental-row"
                            onclick="selectRental('R004','Mercedes-Benz A-Class','King Shaka Airport')">

                            <td class="rental-id-cell">
                                R004
                            </td>

                            <td>
                                BK009
                            </td>

                            <td>
                                Emily Brown
                            </td>

                            <td>
                                Mercedes-Benz A-Class
                            </td>

                            <td>
                                01/09/2026
                            </td>

                            <td>
                                07/09/2026
                            </td>

                            <td>
                                King Shaka Airport
                            </td>

                            <td>
                                <span class="active-status">
                                    Active
                                </span>
                            </td>

                        </tr>


                        <!-- RENTAL 5 -->

                        <tr class="rental-row"
                            onclick="selectRental('R005','Hyundai i20','Cape Town Airport')">

                            <td class="rental-id-cell">
                                R005
                            </td>

                            <td>
                                BK010
                            </td>

                            <td>
                                Michael Adams
                            </td>

                            <td>
                                Hyundai i20
                            </td>

                            <td>
                                31/08/2026
                            </td>

                            <td>
                                03/09/2026
                            </td>

                            <td>
                                Cape Town Airport
                            </td>

                            <td>
                                <span class="active-status">
                                    Active
                                </span>
                            </td>

                        </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

    <script>

    function selectRental(rentalID, vehicle, branchName) {

        // Populate the read-only textboxes
        document.getElementById("txtRentalID").value = rentalID;
        document.getElementById("txtVehicle").value = vehicle;
        document.getElementById("txtBranchName").value = branchName;


        // Remove selected style from all rows
        var rows = document.querySelectorAll(".rental-row");

        rows.forEach(function (row) {
            row.classList.remove("selected");
        });


        // Highlight the selected row
        event.currentTarget.classList.add("selected");

    }

</script>
</asp:Content>
