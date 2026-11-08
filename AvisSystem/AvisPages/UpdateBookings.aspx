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
width: 100%;
}

.filter-group {
flex: 1;
min-width: 0;
}

.filter-group label {
display: block;
font-size: 13px;
font-weight: 600;
color: #555555;
margin-bottom: 7px;
}

.filter-group input,
.filter-group select {
width: 100%;
height: 43px;
border: 1px solid #d8d8d8;
border-radius: 7px;
padding: 0 13px;
box-sizing: border-box;
color: #444444;
font-size: 14px;
background: #ffffff;
outline: none;
}

.filter-group input:focus,
.filter-group select:focus {
border-color: #c8102e;
}

.filter-button-group {
flex-shrink: 0;
flex-direction: column;
align-items: stretch;
}

.clear-filters {
    height: 43px;
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
           MAIN CONTENT :  GRIDVIEW + SUMMARY
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

        .table-card { min-width: 0; 
                      background: #ffffff; 
                      border: 1px solid #e1e1e1; 
                      border-radius: 10px; 
                      box-shadow: 0 3px 12px rgba(0, 0, 0, 0.06); 
                      overflow: hidden; 

        } 
        .table-wrapper { width: 100%; 
                         overflow-x: auto; 

        }

        .booking-table { width: 100%; 
                         min-width: 1250px; 
                         border-collapse: collapse; 
                         font-family: Arial, sans-serif; 
                         font-size: 13px; 

        } 
        /* Red headers with white text */ 
        .booking-table th { background-color: #c8102e; 
                            color: #ffffff; 
                            font-size: 12px; 
                            font-weight: 700; 
                            text-align: left; 
                            padding: 15px 13px; 
                            border: none; 
                            white-space: nowrap; 

        } 
        /* Booking details */ 
          .booking-table td { padding: 13px; 
                              border-bottom: 1px solid #eeeeee; 
                              color: #333333; 
                              white-space: nowrap; 

          } 
          /* Alternating light-pink rows */ 
          .booking-table tr:nth-child(even) td { background-color: #fff5f6; } 
          
          /* Light-pink hover effect */ 
          .booking-table tr:hover td { background-color: #ffe5e9; }


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

        .summary-card { min-width: 0; 
                        background: #ffffff; 
                        border: 1px solid #e1e1e1; 
                        border-radius: 10px; 
                        padding: 25px; 
                        box-sizing: border-box; 
                        box-shadow: 0 3px 12px rgba(0, 0, 0, 0.06); 
                         

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
                grid-template-columns: minmax(0, 1fr); 

            } 
            .summary-card { 
                position: static; 

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
                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" placeholder="Search bookings by customer's name"></asp:TextBox>
            </div>
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
        <asp:TextBox TextMode="Date" ID="txtFromDate" runat="server"></asp:TextBox>
        
    </div>
    
    <!-- TO DATE -->
    <div class="filter-group">
        <label>To Date</label>
        <asp:TextBox TextMode="Date" ID="txtToDate" runat="server"></asp:TextBox>
        
    </div>

    <!-- STATUS -->
    <div class="filter-group">
        <label>Status</label>

        <asp:DropDownList ID="DDLStatuses" runat="server" AutoPostBack="True" >
            <asp:ListItem Value="AllStatuses">All Statuses</asp:ListItem>
        <asp:ListItem Value="Pending">Pending</asp:ListItem>
        <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>
        <asp:ListItem Value="Checked Out">Checked Out</asp:ListItem>
        <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
        <asp:ListItem Value="Completed">Completed</asp:ListItem>

        </asp:DropDownList>
        
    </div>

    <!-- CLEAR FILTERS BUTTON -->
    <div class="filter-button-group">

    <asp:Button ID="btnFilter"
        runat="server"
        Text="Filter"
        style="border-style: none; border-color: inherit; border-width: medium; background-color:#c8102e; color:white; border-radius:8px; padding:0 20px; 
               cursor:pointer;" OnClick="btnFilter_Click" Width="170px" Height="43px"/>

    <asp:Button ID="btnClearFilters"
        runat="server"
        Text="Clear Filters"
        CssClass="clear-filters"
        OnClick="btnClearFilters_Click" />

</div>


</div>


</div>




        <!-- =========================================
             TABLE + SUMMARY
        ========================================= -->
        <asp:SqlDataSource ID="SqlDSBookingSearch" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>" SelectCommand="SELECT BookingID, CustomerID, VehicleVinNo, [Booking Date], [PickUp Date], ExpectedReturnDate, Status, [Invoice Amount], EmployeeID, FullName, Position, PickUpBranchName, DropOffBranchName, BranchName, CustomerFullName, LastUpdated, RefundStatus, Vehicle_make, Vehicle_model FROM BOOKING WHERE (CustomerFullName LIKE @CustName + '%' OR @CustName = '') AND (@FromDate IS NULL OR [PickUp Date] >= @FromDate) AND (@ToDate IS NULL OR [PickUp Date] < DATEADD(DAY, 1, @ToDate)) AND (@Status = 'AllStatuses' OR Status = @Status)">
            <SelectParameters>
                <asp:ControlParameter 
        ControlID="TextBox1" 
        Name="CustName" 
        PropertyName="Text" 
        Type="String"
        ConvertEmptyStringToNull="False"
        DefaultValue="" />

    <asp:ControlParameter 
        ControlID="txtFromDate" 
        Name="FromDate" 
        PropertyName="Text" 
        Type="DateTime"
        ConvertEmptyStringToNull="True" />

    <asp:ControlParameter 
        ControlID="txtToDate" 
        Name="ToDate" 
        PropertyName="Text" 
        Type="DateTime"
        ConvertEmptyStringToNull="True" />

    <asp:ControlParameter 
        ControlID="DDLStatuses" 
        Name="Status" 
        PropertyName="SelectedValue" 
        Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>

        <div class="booking-content"> 
            <!-- BOOKING GRIDVIEW --> 
            <div class="table-card"> 
                <div class="table-wrapper">

        <asp:GridView ID="GVBooking" runat="server"
    CssClass="booking-table"
    DataSourceID="SqlDSBookingSearch"
    AutoGenerateColumns="False"
    DataKeyNames="BookingID"
    AllowPaging="True"
    ShowHeaderWhenEmpty="True"
    EmptyDataText="No bookings found." OnSelectedIndexChanged="GVBooking_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="BookingID" HeaderText="BookingID" InsertVisible="False" ReadOnly="True" SortExpression="BookingID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:BoundField DataField="VehicleVinNo" HeaderText="VehicleVinNo" SortExpression="VehicleVinNo" />
                <asp:BoundField DataField="Booking Date" HeaderText="Booking Date" SortExpression="Booking Date" />
                <asp:BoundField DataField="PickUp Date" HeaderText="PickUp Date" SortExpression="PickUp Date" />
                <asp:BoundField DataField="ExpectedReturnDate" HeaderText="ExpectedReturnDate" SortExpression="ExpectedReturnDate" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Invoice Amount" HeaderText="Invoice Amount" SortExpression="Invoice Amount" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
                <asp:BoundField DataField="PickUpBranchName" HeaderText="PickUpBranchName" SortExpression="PickUpBranchName" />
                <asp:BoundField DataField="DropOffBranchName" HeaderText="DropOffBranchName" SortExpression="DropOffBranchName" />
                <asp:BoundField DataField="BranchName" HeaderText="BranchName" SortExpression="BranchName" />
                <asp:BoundField DataField="CustomerFullName" HeaderText="CustomerFullName" SortExpression="CustomerFullName" />
                <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated" />
                <asp:BoundField DataField="RefundStatus" HeaderText="RefundStatus" SortExpression="RefundStatus" />
                <asp:BoundField DataField="Vehicle_make" HeaderText="Vehicle_make" SortExpression="Vehicle_make" />
                <asp:BoundField DataField="Vehicle_model" HeaderText="Vehicle_model" SortExpression="Vehicle_model" />
            </Columns>
    </asp:GridView>
  </div> 
</div>


            <!-- =====================================
                 BOOKING SUMMARY
            ====================================== -->

            <aside class="summary-card">


                <!-- SUMMARY HEADER -->

                <div class="summary-heading">

                    <span class="summary-booking-id">
                        <!--BookingID-->
                        <asp:Label ID="Label1" runat="server" Text="BKID:"></asp:Label>
                        
                        <asp:Label ID="LblBID" runat="server" Text="BookingID"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span>

                    <span class="summary-status">
                        <!--Booking Summary-->
                        <asp:Label ID="LblStatus" runat="server" Text="Booking Status"></asp:Label>
                    </span>

                </div>



                <!-- CUSTOMER -->

                <div class="summary-details">

                    <div class="summary-detail">

                        <span class="summary-label">
                            Customer Name
                        </span>

                        <span class="summary-value">
                            <!-- Customer's name -->
                            <asp:Label ID="LblCustN" runat="server" Text="Customer's Name"></asp:Label>
                        </span>

                    </div>



                    <!-- VEHICLE -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Vehicle
                        </span>

                        <span class="summary-value">
                            <!--Vehicle -->
                            <asp:Label ID="LblVehicle_make" runat="server" Text="Make  "></asp:Label>
                            <asp:Label ID="LblVehicle_model" runat="server" Text="Model"></asp:Label>
                        </span>

                    </div>



                    <!-- DATES -->

                    <div class="summary-dates">

                        <div class="summary-detail">

                            <span class="summary-label">
                                Booking Date
                            </span>

                            <span class="summary-value">
                                <!-- Booking Date-->
                                <asp:Label ID="LblBDate" runat="server" Text="Booking Date"></asp:Label>
                            </span>

                        </div>


                        <div class="summary-detail">

                            <span class="summary-label">
                                Pick Up Date
                            </span>

                            <span class="summary-value">
                                <!--Pick Up Date-->
                                <asp:Label ID="LblPDate" runat="server" Text="Pick Up Date"></asp:Label>
                            </span>

                        </div>

                    </div>



                    <div class="summary-detail">

                        <span class="summary-label">
                            Expected Return Date
                        </span>

                        <span class="summary-value">
                            <!--Expected return date-->
                            <asp:Label ID="LblRDate" runat="server" Text="Expected Return Date"></asp:Label>
                        </span>

                    </div>



                    <!-- PICKUP BRANCH -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Pickup Branch
                        </span>

                        <span class="summary-value">
                            <!--PickUp Branch-->
                            <asp:Label ID="LblPBranch" runat="server" Text="Pickup Branch"></asp:Label>
                        </span>

                    </div>



                    <!-- DROPOFF BRANCH -->

                    <div class="summary-detail">

                        <span class="summary-label">
                            Dropoff Branch
                        </span>

                        <span class="summary-value">
                            <!--Dropoff Branch-->
                            <asp:Label ID="LblDBranch" runat="server" Text="Dropoff Branch"></asp:Label>
                        </span>

                    </div>

                </div>



                <!-- TOTAL -->

                <div class="summary-total">

                    <span class="summary-total-label">
                        Total Amount
                    </span>

                    <span class="summary-total-amount">
                        <!--Total Amount-->
                        <asp:Label ID="LblTotAmt" runat="server" Text="Total Amount"></asp:Label>
                    </span>

                </div>



                <!-- ACTION BUTTONS -->

                <asp:SqlDataSource ID="SqlDSCancelBooking" runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" DeleteCommand="DELETE FROM [BOOKING] WHERE [BookingID] = @original_BookingID AND [CustomerID] = @original_CustomerID AND [VehicleVinNo] = @original_VehicleVinNo AND [Booking Date] = @original_Booking_Date AND [PickUp Date] = @original_PickUp_Date AND [ExpectedReturnDate] = @original_ExpectedReturnDate AND [Status] = @original_Status AND (([Invoice Amount] = @original_Invoice_Amount) OR ([Invoice Amount] IS NULL AND @original_Invoice_Amount IS NULL)) AND (([EmployeeID] = @original_EmployeeID) OR ([EmployeeID] IS NULL AND @original_EmployeeID IS NULL)) AND (([FullName] = @original_FullName) OR ([FullName] IS NULL AND @original_FullName IS NULL)) AND (([Position] = @original_Position) OR ([Position] IS NULL AND @original_Position IS NULL)) AND (([PickUpBranchName] = @original_PickUpBranchName) OR ([PickUpBranchName] IS NULL AND @original_PickUpBranchName IS NULL)) AND (([DropOffBranchName] = @original_DropOffBranchName) OR ([DropOffBranchName] IS NULL AND @original_DropOffBranchName IS NULL)) AND (([BranchName] = @original_BranchName) OR ([BranchName] IS NULL AND @original_BranchName IS NULL)) AND (([CustomerFullName] = @original_CustomerFullName) OR ([CustomerFullName] IS NULL AND @original_CustomerFullName IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND [RefundStatus] = @original_RefundStatus AND (([Vehicle_make] = @original_Vehicle_make) OR ([Vehicle_make] IS NULL AND @original_Vehicle_make IS NULL)) AND (([Vehicle_model] = @original_Vehicle_model) OR ([Vehicle_model] IS NULL AND @original_Vehicle_model IS NULL))" InsertCommand="INSERT INTO [BOOKING] ([CustomerID], [VehicleVinNo], [Booking Date], [PickUp Date], [ExpectedReturnDate], [Status], [Invoice Amount], [EmployeeID], [FullName], [Position], [PickUpBranchName], [DropOffBranchName], [BranchName], [CustomerFullName], [LastUpdated], [RefundStatus], [Vehicle_make], [Vehicle_model]) VALUES (@CustomerID, @VehicleVinNo, @Booking_Date, @PickUp_Date, @ExpectedReturnDate, @Status, @Invoice_Amount, @EmployeeID, @FullName, @Position, @PickUpBranchName, @DropOffBranchName, @BranchName, @CustomerFullName, @LastUpdated, @RefundStatus, @Vehicle_make, @Vehicle_model)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BOOKING]" UpdateCommand="UPDATE [BOOKING] SET Status = 'Cancelled'
        
WHERE BookingID = @BookingID
   AND Status NOT IN ('Checked Out', 'Completed', 'Cancelled')">
                    <DeleteParameters>
                        <asp:Parameter Name="original_BookingID" Type="Int32" />
                        <asp:Parameter Name="original_CustomerID" Type="Int32" />
                        <asp:Parameter Name="original_VehicleVinNo" Type="String" />
                        <asp:Parameter Name="original_Booking_Date" Type="DateTime" />
                        <asp:Parameter Name="original_PickUp_Date" Type="DateTime" />
                        <asp:Parameter Name="original_ExpectedReturnDate" Type="DateTime" />
                        <asp:Parameter Name="original_Status" Type="String" />
                        <asp:Parameter Name="original_Invoice_Amount" Type="Decimal" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_FullName" Type="String" />
                        <asp:Parameter Name="original_Position" Type="String" />
                        <asp:Parameter Name="original_PickUpBranchName" Type="String" />
                        <asp:Parameter Name="original_DropOffBranchName" Type="String" />
                        <asp:Parameter Name="original_BranchName" Type="String" />
                        <asp:Parameter Name="original_CustomerFullName" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_RefundStatus" Type="String" />
                        <asp:Parameter Name="original_Vehicle_make" Type="String" />
                        <asp:Parameter Name="original_Vehicle_model" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="VehicleVinNo" Type="String" />
                        <asp:Parameter Name="Booking_Date" Type="DateTime" />
                        <asp:Parameter Name="PickUp_Date" Type="DateTime" />
                        <asp:Parameter Name="ExpectedReturnDate" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="Invoice_Amount" Type="Decimal" />
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="Position" Type="String" />
                        <asp:Parameter Name="PickUpBranchName" Type="String" />
                        <asp:Parameter Name="DropOffBranchName" Type="String" />
                        <asp:Parameter Name="BranchName" Type="String" />
                        <asp:Parameter Name="CustomerFullName" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="RefundStatus" Type="String" />
                        <asp:Parameter Name="Vehicle_make" Type="String" />
                        <asp:Parameter Name="Vehicle_model" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BookingID" Type="Int32" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="VehicleVinNo" Type="String" />
                        <asp:Parameter Name="Booking_Date" Type="DateTime" />
                        <asp:Parameter Name="PickUp_Date" Type="DateTime" />
                        <asp:Parameter Name="ExpectedReturnDate" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="Invoice_Amount" Type="Decimal" />
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="Position" Type="String" />
                        <asp:Parameter Name="PickUpBranchName" Type="String" />
                        <asp:Parameter Name="DropOffBranchName" Type="String" />
                        <asp:Parameter Name="BranchName" Type="String" />
                        <asp:Parameter Name="CustomerFullName" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="RefundStatus" Type="String" />
                        <asp:Parameter Name="Vehicle_make" Type="String" />
                        <asp:Parameter Name="Vehicle_model" Type="String" />
                        <asp:Parameter Name="original_BookingID" Type="Int32" />
                        <asp:Parameter Name="original_CustomerID" Type="Int32" />
                        <asp:Parameter Name="original_VehicleVinNo" Type="String" />
                        <asp:Parameter Name="original_Booking_Date" Type="DateTime" />
                        <asp:Parameter Name="original_PickUp_Date" Type="DateTime" />
                        <asp:Parameter Name="original_ExpectedReturnDate" Type="DateTime" />
                        <asp:Parameter Name="original_Status" Type="String" />
                        <asp:Parameter Name="original_Invoice_Amount" Type="Decimal" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_FullName" Type="String" />
                        <asp:Parameter Name="original_Position" Type="String" />
                        <asp:Parameter Name="original_PickUpBranchName" Type="String" />
                        <asp:Parameter Name="original_DropOffBranchName" Type="String" />
                        <asp:Parameter Name="original_BranchName" Type="String" />
                        <asp:Parameter Name="original_CustomerFullName" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_RefundStatus" Type="String" />
                        <asp:Parameter Name="original_Vehicle_make" Type="String" />
                        <asp:Parameter Name="original_Vehicle_model" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <div class="summary-actions">

                    <!-- <button type="button" class="cancel-btn">
                        Cancel Booking
                    </button> -->
                    <asp:Button ID="BtnCancelBooking" runat="server" Text="Cancel Booking" class="cancel-btn" CssClass="clear-filters"   OnClick="btnCancelBooking_Click"  OnClientClick ="return confirm('Are you sure you want to cancel this booking?');" ForeColor="Red" Width="368px" Height="49px" />
                    <asp:Button ID="BtnClear" runat="server" Text="Clear" OnClick="BtnClear_Click" Width="368px" Height="49px"  class="delete-btn"   />
                    <!-- <button type="button" class="delete-btn">
                        Delete Booking
                    </button> -->

                </div>
            </aside>
            <asp:Label ID="lblCancelMessage" runat="server" Text="Label" Visible="False"></asp:Label>

        </div>


    </main>
</asp:Content>
