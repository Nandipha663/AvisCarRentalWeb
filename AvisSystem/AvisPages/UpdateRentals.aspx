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


        /* MAIN CONTENT */
        .content-layout {
            display: grid;
            grid-template-columns: 1fr 330px;
            gap: 22px;
            align-items: start;
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
                <asp:TextBox ID="TxtSearch" runat="server" placeholder="Search rentals by customer's name"></asp:TextBox>
                
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
            <asp:ListItem Value="Active">Active</asp:ListItem>
        <asp:ListItem Value="Late">Late</asp:ListItem>
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

        
        <!-- TABLE + SUMMARY -->
        <asp:SqlDataSource ID="SqlDSRental" runat="server" CancelSelectOnNullParameter="False" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT RentalID, BookingID, CustomerID, CustomerName, VehicleVinNo, EmployeeID, EmployeeName, PickupDate, StartDate, ExpectedReturnDate, RentalStatus, DepositAmount, VehicleMakeModel FROM RENTAL WHERE (CustomerName LIKE @CustName + '%') AND (@FromDate IS NULL OR PickupDate >= @FromDate) AND (@ToDate IS NULL OR PickupDate < DATEADD(DAY, 1, @ToDate)) AND (@Status = 'AllStatuses' OR RentalStatus = @Status)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TxtSearch" PropertyName="Text" Name="CustName" Type="String" ConvertEmptyStringToNull="False" DefaultValue=""></asp:ControlParameter>
                <asp:ControlParameter ControlID="txtFromDate" PropertyName="Text" Name="FromDate" Type="DateTime" ConvertEmptyStringToNull="True"></asp:ControlParameter>
                <asp:ControlParameter ControlID="txtToDate" PropertyName="Text" Name="ToDate" Type="DateTime" ConvertEmptyStringToNull="True"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DDLStatuses" PropertyName="SelectedValue" Name="Status" Type="String" DefaultValue="AllStatuses"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:GridView ID="GVRental" runat="server" DataSourceID="SqlDSRental" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="RentalID" OnSelectedIndexChanged="GVRental_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="RentalID" HeaderText="RentalID" ReadOnly="True" InsertVisible="False" SortExpression="RentalID"></asp:BoundField>
                    <asp:BoundField DataField="BookingID" HeaderText="BookingID" SortExpression="BookingID"></asp:BoundField>
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID"></asp:BoundField>
                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName"></asp:BoundField>
                    <asp:BoundField DataField="VehicleVinNo" HeaderText="VehicleVinNo" SortExpression="VehicleVinNo"></asp:BoundField>
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID"></asp:BoundField>
                    <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName"></asp:BoundField>
                    <asp:BoundField DataField="PickupDate" HeaderText="PickupDate" SortExpression="PickupDate"></asp:BoundField>
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate"></asp:BoundField>
                    <asp:BoundField DataField="ExpectedReturnDate" HeaderText="ExpectedReturnDate" SortExpression="ExpectedReturnDate"></asp:BoundField>
                    <asp:BoundField DataField="RentalStatus" HeaderText="RentalStatus" SortExpression="RentalStatus"></asp:BoundField>
                    <asp:BoundField DataField="DepositAmount" HeaderText="DepositAmount" SortExpression="DepositAmount"></asp:BoundField>
                    <asp:BoundField DataField="VehicleMakeModel" HeaderText="VehicleMakeModel" SortExpression="VehicleMakeModel"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <div class="booking-content"> 
                <!-- RENTALS TABLE -->
    <div class="table-card"> 
        <div class="table-wrapper">
            </div>
        </div>
            </div>


            <!-- RENTAL SUMMARY -->
            <div class="summary-card">

                <div class="summary-header">

                    <div class="rental-id">
                        RentalID: &nbsp; &nbsp<asp:Label ID="LblID" runat="server" Text="ID"></asp:Label>; 
                    </div>

                    <span class="status status-active">
                        <asp:Label ID="LblStatus" runat="server" Text="Status"></asp:Label>
                    </span>

                </div>


                <div class="summary-label">
                    Customer Name
                </div>

                <div class="summary-value">
                    <asp:Label ID="LblCust" runat="server" Text="Customer's Name"></asp:Label>
                </div>


                <div class="summary-label">
                    Vehicle
                </div>

                <div class="summary-value">
                    <asp:Label ID="LblVehicle" runat="server" Text="Vehicle"></asp:Label>
                </div>


                <div class="summary-buttons">

                    <asp:Button ID="BtnClear" runat="server" Text="Clear" class="cancel-btn" OnClick="BtnClear_Click"/>

                    <asp:SqlDataSource ID="SqlDSDeleteRental" runat="server" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" DeleteCommand="DELETE FROM [RENTAL] WHERE [RentalID] = @RentalID AND [BookingID] = @original_BookingID AND [CustomerID] = @original_CustomerID AND (([CustomerName] = @original_CustomerName) OR ([CustomerName] IS NULL AND @original_CustomerName IS NULL)) AND [VehicleVinNo] = @original_VehicleVinNo AND [EmployeeID] = @original_EmployeeID AND (([EmployeeName] = @original_EmployeeName) OR ([EmployeeName] IS NULL AND @original_EmployeeName IS NULL)) AND (([PickupDate] = @original_PickupDate) OR ([PickupDate] IS NULL AND @original_PickupDate IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([ExpectedReturnDate] = @original_ExpectedReturnDate) OR ([ExpectedReturnDate] IS NULL AND @original_ExpectedReturnDate IS NULL)) AND (([RentalStatus] = @original_RentalStatus) OR ([RentalStatus] IS NULL AND @original_RentalStatus IS NULL)) AND (([DepositAmount] = @original_DepositAmount) OR ([DepositAmount] IS NULL AND @original_DepositAmount IS NULL)) AND (([VehicleMakeModel] = @original_VehicleMakeModel) OR ([VehicleMakeModel] IS NULL AND @original_VehicleMakeModel IS NULL))" InsertCommand="INSERT INTO [RENTAL] ([BookingID], [CustomerID], [CustomerName], [VehicleVinNo], [EmployeeID], [EmployeeName], [PickupDate], [StartDate], [ExpectedReturnDate], [RentalStatus], [DepositAmount], [VehicleMakeModel]) VALUES (@BookingID, @CustomerID, @CustomerName, @VehicleVinNo, @EmployeeID, @EmployeeName, @PickupDate, @StartDate, @ExpectedReturnDate, @RentalStatus, @DepositAmount, @VehicleMakeModel)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [RENTAL]" UpdateCommand="UPDATE [RENTAL] SET [BookingID] = @BookingID, [CustomerID] = @CustomerID, [CustomerName] = @CustomerName, [VehicleVinNo] = @VehicleVinNo, [EmployeeID] = @EmployeeID, [EmployeeName] = @EmployeeName, [PickupDate] = @PickupDate, [StartDate] = @StartDate, [ExpectedReturnDate] = @ExpectedReturnDate, [RentalStatus] = @RentalStatus, [DepositAmount] = @DepositAmount, [VehicleMakeModel] = @VehicleMakeModel WHERE [RentalID] = @original_RentalID AND [BookingID] = @original_BookingID AND [CustomerID] = @original_CustomerID AND (([CustomerName] = @original_CustomerName) OR ([CustomerName] IS NULL AND @original_CustomerName IS NULL)) AND [VehicleVinNo] = @original_VehicleVinNo AND [EmployeeID] = @original_EmployeeID AND (([EmployeeName] = @original_EmployeeName) OR ([EmployeeName] IS NULL AND @original_EmployeeName IS NULL)) AND (([PickupDate] = @original_PickupDate) OR ([PickupDate] IS NULL AND @original_PickupDate IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([ExpectedReturnDate] = @original_ExpectedReturnDate) OR ([ExpectedReturnDate] IS NULL AND @original_ExpectedReturnDate IS NULL)) AND (([RentalStatus] = @original_RentalStatus) OR ([RentalStatus] IS NULL AND @original_RentalStatus IS NULL)) AND (([DepositAmount] = @original_DepositAmount) OR ([DepositAmount] IS NULL AND @original_DepositAmount IS NULL)) AND (([VehicleMakeModel] = @original_VehicleMakeModel) OR ([VehicleMakeModel] IS NULL AND @original_VehicleMakeModel IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="RentalID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="BookingID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="CustomerID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="CustomerName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="VehicleVinNo" Type="String"></asp:Parameter>
                            <asp:Parameter Name="EmployeeID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="EmployeeName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="PickupDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="StartDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="ExpectedReturnDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="RentalStatus" Type="String"></asp:Parameter>
                            <asp:Parameter Name="DepositAmount" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="VehicleMakeModel" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="BookingID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="CustomerID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="CustomerName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="VehicleVinNo" Type="String"></asp:Parameter>
                            <asp:Parameter Name="EmployeeID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="EmployeeName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="PickupDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="StartDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="ExpectedReturnDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="RentalStatus" Type="String"></asp:Parameter>
                            <asp:Parameter Name="DepositAmount" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="VehicleMakeModel" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_RentalID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_BookingID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_CustomerID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_CustomerName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_VehicleVinNo" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_EmployeeID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="original_EmployeeName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_PickupDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="original_StartDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="original_ExpectedReturnDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="original_RentalStatus" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_DepositAmount" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="original_VehicleMakeModel" Type="String"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="BtnDelete" runat="server" Text="Delete" class="delete-btn" OnClick="BtnDelete_Click" />
                    

                </div>

            </div>

        </div>

</asp:Content>
