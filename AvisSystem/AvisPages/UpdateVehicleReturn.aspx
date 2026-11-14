<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateVehicleReturn.aspx.cs" Inherits="AvisSystem.AvisPages.UpdateVehicleReturn" %>
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
            .summary-card input[type=text],
            .summary-card select {
             width: 100%;
             padding: 8px;
             border: 1px solid #e1e1e1;
             border-radius: 7px;
             box-sizing: border-box;
            }
        }

    </style>
   <main class="booking-page">

    <!-- PAGE HEADER -->
    <div class="booking-header">
        <h1>Vehicle Returns</h1>
        <p>Search, filter and update vehicle returns.</p>
    </div>

    <!-- SEARCH -->
    <div class="search-row">
        <div class="search-box">
            <i class="fas fa-search"></i>
            <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" placeholder="Search returns by VIN, vehicle or booking ID"></asp:TextBox>
        </div>
    </div>

    <!-- FILTERS -->
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

            <!-- BUTTONS -->
            <div class="filter-button-group">

                <asp:Button ID="btnFilter"
                    runat="server"
                    Text="Filter"
                    style="border-style: none; background-color:#c8102e; color:white; border-radius:8px; padding:0 20px; cursor:pointer;"
                    OnClick="btnFilter_Click" Width="170px" Height="43px" />

                <asp:Button ID="btnClearFilters"
                    runat="server"
                    Text="Clear Filters"
                    CssClass="clear-filters"
                    OnClick="btnClearFilters_Click" />

            </div>

        </div>
    </div>

    <!-- DATA SOURCES -->
    <asp:SqlDataSource ID="SqlDSReturn" runat="server" CancelSelectOnNullParameter="False"
        ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
        SelectCommand="SELECT ReturnID, BookingID, VehicleVinNo, VehicleDescription, ReturnDate, [Inspection Report], Charges, BranchName
                       FROM [VEHICLE RETURN]
                       WHERE (VehicleVinNo LIKE '%' + @Search + '%'
                              OR VehicleDescription LIKE '%' + @Search + '%'
                              OR CAST(BookingID AS VARCHAR(20)) LIKE '%' + @Search + '%')
                         AND (@FromDate IS NULL OR ReturnDate >= @FromDate)
                         AND (@ToDate IS NULL OR ReturnDate < DATEADD(DAY, 1, @ToDate))
                       ORDER BY ReturnID DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="Search" PropertyName="Text" Type="String"
                DefaultValue="" ConvertEmptyStringToNull="False" />
            <asp:ControlParameter ControlID="txtFromDate" Name="FromDate" PropertyName="Text" Type="DateTime"
                ConvertEmptyStringToNull="True" />
            <asp:ControlParameter ControlID="txtToDate" Name="ToDate" PropertyName="Text" Type="DateTime"
                ConvertEmptyStringToNull="True" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDSBranch" runat="server"
        ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
        SelectCommand="SELECT DISTINCT DropOffBranchName FROM BOOKING ORDER BY DropOffBranchName" />

    <asp:SqlDataSource ID="SqlDSUpdateReturn" runat="server"
        ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
        UpdateCommand="UPDATE [VEHICLE RETURN]
                       SET [Inspection Report] = @InspectionReport, Charges = @Charges, BranchName = @BranchName, LastUpdated = GETDATE()
                       WHERE ReturnID = @ReturnID">
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtInspection" Name="InspectionReport" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCharges" Name="Charges" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="ddlBranch" Name="BranchName" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="hfReturnID" Name="ReturnID" PropertyName="Value" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- TABLE + SUMMARY -->
    <div class="booking-content">

        <!-- RETURNS TABLE -->
        <div class="table-card">
            <div class="table-wrapper">
                <asp:GridView ID="GVReturn" runat="server" CssClass="booking-table"
                    DataSourceID="SqlDSReturn" AutoGenerateColumns="False" DataKeyNames="ReturnID"
                    AllowPaging="True" PageSize="8" ShowHeaderWhenEmpty="True"
                    EmptyDataText="No returns found." OnSelectedIndexChanged="GVReturn_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="ReturnID" HeaderText="ReturnID" ReadOnly="True" SortExpression="ReturnID" />
                        <asp:BoundField DataField="BookingID" HeaderText="BookingID" SortExpression="BookingID" />
                        <asp:BoundField DataField="VehicleVinNo" HeaderText="VehicleVinNo" SortExpression="VehicleVinNo" />
                        <asp:BoundField DataField="VehicleDescription" HeaderText="VehicleDescription" SortExpression="VehicleDescription" />
                        <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ReturnDate" />
                        <asp:BoundField DataField="Inspection Report" HeaderText="Inspection Report" SortExpression="Inspection Report" />
                        <asp:BoundField DataField="Charges" HeaderText="Charges" DataFormatString="{0:0.00}" SortExpression="Charges" />
                        <asp:BoundField DataField="BranchName" HeaderText="BranchName" SortExpression="BranchName" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- RETURN SUMMARY -->
        <aside class="summary-card">

            <asp:HiddenField ID="hfReturnID" runat="server" Value="0" />

            <div class="summary-header">
                <div class="rental-id">
                    <asp:Label ID="lblReturnID" runat="server" Text="Return #"></asp:Label>
                </div>
                <span class="status status-completed">Returned</span>
            </div>

            <div class="summary-label">Booking ID</div>
            <div class="summary-value">
                <asp:Label ID="lblBookingID" runat="server" Text="-"></asp:Label>
            </div>

            <div class="summary-label">Vehicle VIN</div>
            <div class="summary-value">
                <asp:Label ID="lblVehicleVinNo" runat="server" Text="-"></asp:Label>
            </div>

            <div class="summary-label">Vehicle</div>
            <div class="summary-value">
                <asp:Label ID="lblVehicle" runat="server" Text="-"></asp:Label>
            </div>

            <div class="summary-label">Return Date</div>
            <div class="summary-value">
                <asp:Label ID="lblReturnDate" runat="server" Text="-"></asp:Label>
            </div>

            <div class="summary-label">Inspection Report</div>
            <div class="summary-value">
                <asp:TextBox ID="txtInspection" runat="server" MaxLength="200"></asp:TextBox>
            </div>

            <div class="summary-label">Additional Charges (R)</div>
            <div class="summary-value">
                <asp:TextBox ID="txtCharges" runat="server"></asp:TextBox>
            </div>

            <div class="summary-label">Return Branch</div>
            <div class="summary-value">
                <asp:DropDownList ID="ddlBranch" runat="server" DataSourceID="SqlDSBranch"
                    DataTextField="DropOffBranchName" DataValueField="DropOffBranchName">
                </asp:DropDownList>
            </div>

            <div class="summary-buttons">
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="cancel-btn" OnClick="btnClear_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="delete-btn" OnClick="btnUpdate_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server"></asp:Label>

        </aside>

    </div>

</main>
</asp:Content>
