<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="AvisSystem.CustomerPages.MyBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <style>

        /* =========================================
           MAIN PAGE
        ========================================= */

        .my-bookings-page {
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
           SUMMARY + TABLE
        ========================================= */

        .booking-content {
            display: flex;
            flex-direction: column;
            gap: 22px;
            width: 100%;
        }


        /* =========================================
           TABLE CARD
        ========================================= */

        .table-card {
            min-width: 0;
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


        /* =========================================
           GRIDVIEW
        ========================================= */

        .booking-table {
            width: 100%;
            min-width: 1000px;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
            font-size: 13px;
        }

        .booking-table th {
            background-color: #c8102e;
            color: #ffffff;
            font-size: 12px;
            font-weight: 700;
            text-align: left;
            padding: 15px 13px;
            border: none;
            white-space: nowrap;
        }

        .booking-table td {
            padding: 13px;
            border-bottom: 1px solid #eeeeee;
            color: #333333;
            white-space: nowrap;
        }

        .booking-table tr:nth-child(even) td {
            background-color: #fff5f6;
        }

        .booking-table tr:hover td {
            background-color: #ffe5e9;
        }


        /* =========================================
           BOOKING SUMMARY
        ========================================= */

        .summary-card {
            min-width: 0;
            background: #ffffff;
            border: 1px solid #e1e1e1;
            border-radius: 10px;
            padding: 25px;
            box-sizing: border-box;
            box-shadow: 0 3px 12px rgba(0,0,0,0.06);
        }


        /* =========================================
           SUMMARY HEADER
        ========================================= */

        .summary-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 18px;
            border-bottom: 1px solid #eeeeee;
        }

        .summary-booking-id {
            color: #222222;
            font-size: 18px;
            font-weight: 800;
        }

        .summary-status {
            color: #c8102e;
            font-size: 14px;
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


        /* =========================================
           DATES
        ========================================= */

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
           ACTION BUTTONS
        ========================================= */

        .summary-actions {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }

        .cancel-btn,
        .clear-btn {
            flex: 1;
            height: 42px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s ease;
        }


        /* CANCEL */

        .cancel-btn {
            background: #ffffff;
            border: 1px solid #c8102e;
            color: #c8102e;
        }

        .cancel-btn:hover {
            background: #fff1f3;
        }


        /* CLEAR */

        .clear-btn {
            background: #c8102e;
            border: 1px solid #c8102e;
            color: #ffffff;
        }

        .clear-btn:hover {
            background: #a80d25;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 700px) {

            .my-bookings-page {
                padding: 25px 15px 40px;
            }

            .booking-header h1 {
                font-size: 32px !important;
            }

            .summary-dates {
                grid-template-columns: 1fr;
            }

            .summary-actions {
                flex-direction: column;
            }

        }

    </style>



     <main class="my-bookings-page">

        <!-- =========================================
             PAGE HEADER
        ========================================= -->

        <div class="booking-header">

            <h1>My Bookings</h1>

            <p>
                View your reservations and their current status.
            </p>

        </div>
        
         <!-- =========================================
             BOOKINGS TABLE
        ========================================= -->
<asp:Label ID="lblSummary" runat="server" Text="Label"></asp:Label>
        <div class="booking-content">

            <div class="table-card">

                <div class="table-wrapper">

        <asp:GridView ID="GVMyBookings" runat="server" AutoGenerateColumns="False"   DataKeyNames="BookingID,VehicleVinNo"
            OnRowDataBound="GVMyBookings_RowDataBound"
            EmptyDataText="You have not made any bookings yet."
            CssClass="table table-striped" GridLines="None" CellPadding="8" OnSelectedIndexChanged="GVMyBookings_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Select" />

                <asp:BoundField DataField="BookingID"          HeaderText="Booking No." />
                <asp:BoundField DataField="Vehicle"            HeaderText="Vehicle" />
                <asp:BoundField DataField="RegistrationNo"     HeaderText="Registration" />
                <asp:BoundField DataField="PickUpBranchName"   HeaderText="Pick-up branch" />
                <asp:BoundField DataField="DropOffBranchName"  HeaderText="Drop-off branch" />
                <asp:BoundField DataField="PickUpDate"         HeaderText="Pick-up date"
                                DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="ExpectedReturnDate" HeaderText="Return date"
                                DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="InvoiceAmount"      HeaderText="Amount (R)"
                                DataFormatString="{0:N2}" />
                <asp:BoundField DataField="Status"             HeaderText="Status" />
            </Columns>
            <HeaderStyle BackColor="#C8102E" ForeColor="White" Font-Bold="True" />
        </asp:GridView>
                    </div> </div>


     <!-- =========================================
                 BOOKING SUMMARY
            ========================================= -->

            <aside class="summary-card">

                <!-- SUMMARY HEADER -->

                <div class="summary-heading">

                    <span class="summary-booking-id">

                        <asp:Label ID="Label1"
                            runat="server"
                            Text="BKID:">
                        </asp:Label>

                        <asp:Label ID="LblBID"
                            runat="server"
                            Text="BookingID">
                        </asp:Label>

                    </span>


                    <span class="summary-status">

                        <asp:Label ID="LblStatus"
                            runat="server"
                            Text="Booking Status">
                        </asp:Label>

                    </span>

                </div>


                <!-- CUSTOMER + VEHICLE + DETAILS -->

                <div class="summary-details">


                    


                    <!-- VEHICLE -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Vehicle
                        </span>

                        <span class="summary-value">

                            <asp:Label ID="LblVehicle_make"
                                runat="server"
                                Text="Vehicle">
                            </asp:Label>

                        </span>

                    </div>


                    <!-- DATES -->

                    <div class="summary-dates">


                        <!-- PICKUP DATE -->

                        <div class="summary-detail">

                            <span class="summary-label">
                                Pick Up Date
                            </span>

                            <span class="summary-value">

                                <asp:Label ID="LblPDate"
                                    runat="server"
                                    Text="Pick Up Date">
                                </asp:Label>

                            </span>

                        </div>

                    </div>


                    <!-- RETURN DATE -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Expected Return Date
                        </span>

                        <span class="summary-value">

                            <asp:Label ID="LblRDate"
                                runat="server"
                                Text="Expected Return Date">
                            </asp:Label>

                        </span>

                    </div>


                    <!-- PICKUP BRANCH -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Pickup Branch
                        </span>

                        <span class="summary-value">

                            <asp:Label ID="LblPBranch"
                                runat="server"
                                Text="Pickup Branch">
                            </asp:Label>

                        </span>

                    </div>


                    <!-- DROPOFF BRANCH -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Dropoff Branch
                        </span>

                        <span class="summary-value">

                            <asp:Label ID="LblDBranch"
                                runat="server"
                                Text="Dropoff Branch">
                            </asp:Label>

                        </span>

                    </div>

                </div>


                <!-- TOTAL -->

                <div class="summary-total">

                    <span class="summary-total-label">
                        Total Amount
                    </span>

                    <span class="summary-total-amount">

                        <asp:Label ID="LblTotAmt"
                            runat="server"
                            Text="Total Amount">
                        </asp:Label>

                    </span>

                </div>


                <asp:SqlDataSource
    ID="SqlDSCancelBooking"
    runat="server"
    ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True"
    UpdateCommand="CancelBooking"
    UpdateCommandType="StoredProcedure">

    <UpdateParameters>
        <asp:Parameter Name="BookingID" Type="Int32" />
        <asp:Parameter Name="VehicleVinNo" Type="String" />
    </UpdateParameters>

</asp:SqlDataSource>

                <!-- =========================================
                     ACTION BUTTONS
                ========================================= -->

                <div class="summary-actions">

                    <asp:Button ID="BtnCancelBooking"
                        runat="server"
                        Text="Cancel Booking"
                        CssClass="cancel-btn"
                        OnClick="btnCancelBooking_Click"
                        OnClientClick="return confirm('Are you sure you want to cancel this booking?');" />

                    <asp:Button ID="BtnClear"
                        runat="server"
                        Text="Clear"
                        CssClass="clear-btn"
                        OnClick="BtnClear_Click" />

                </div>


                <!-- CANCEL MESSAGE -->

                <asp:Label ID="lblCancelMessage"
                    runat="server"
                    Visible="False">
                </asp:Label>

            </aside>

        </div>

    </main>
</asp:Content>
