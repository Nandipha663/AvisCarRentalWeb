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

        .filter-dropdown {
    width: 100%;
    height: 42px;
    border: 1px solid #ddd;
    border-radius: 7px;
    padding: 0 12px;
    font-size: 13px;
    background: white;
    box-sizing: border-box;
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
                <asp:TextBox ID="TxtSearch" runat="server" placeholder="Search vehicles by their make" AutoPostBack="True"
    OnTextChanged="TxtSearch_TextChanged"></asp:TextBox>

            </div>

            </div>


        <!-- FILTERS -->

        <div class="filter-card">

            <div class="filter-title">

                <i class="fas fa-filter"></i>

                Filters

            </div>

            <div class="filters">

                <!--Status-->
                <div class="filter-group">
    <label>Status</label>
         <asp:DropDownList ID="DDLStatus" runat="server" CssClass="filter-dropdown" AutoPostBack="True">
             <asp:ListItem Text="All Statuses" Value="" />
        <asp:ListItem Text="Available" Value="Available" />
        <asp:ListItem Text="Reserved" Value="Reserved" />
        <asp:ListItem Text="Rented Out" Value="Rented Out" />
        <asp:ListItem Text="Maintenance" Value="Maintenance" />
        <asp:ListItem Text="Out of Service" Value="Out of Service" />

         </asp:DropDownList>
                </div>
    <!-- BRANCH NAME -->


    <div class="filter-group">
        <label>Branch Name</label>

        <asp:DropDownList ID="DDLBranchName"
                    runat="server"
                    CssClass="filter-dropdown" DataSourceID="SqlDSBranchNames" DataTextField="branchName" DataValueField="branchName" AutoPostBack="True"  AppendDataBoundItems="True" OnSelectedIndexChanged="DDLBranchName_SelectedIndexChanged">
                    <asp:ListItem Text="All Branches" Value="" />
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDSBranchNames" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BRANCH]"></asp:SqlDataSource>
            </div>


    <!-- CATEGORY -->
    <div class="filter-group">
        <label>Category</label>

        <asp:DropDownList ID="DDLCategory"
            runat="server"
    CssClass="filter-dropdown"
    AutoPostBack="True">

    <asp:ListItem Text="All Categories" Value="" />
    <asp:ListItem Text="SUV" Value="SUV" />
    <asp:ListItem Text="Standard" Value="Standard" />
    <asp:ListItem Text="Luxury" Value="Luxury" />
    <asp:ListItem Text="Premium" Value="Premium" />
    <asp:ListItem Text="Hatchback" Value="Hatchback" />
    <asp:ListItem Text="Van" Value="Van" />
    <asp:ListItem Text="Sedan" Value="Sedan" />
    <asp:ListItem Text="Compact" Value="Compact" />
        </asp:DropDownList>
    </div>


    <!-- DAILY RATE -->
    <div class="filter-group">
        <label>Daily Rate</label>

        <asp:DropDownList ID="DDLDailyRate"
            runat="server"
            CssClass="filter-dropdown" AutoPostBack="True">

            <asp:ListItem Text="All Rates" Value="" />
            <asp:ListItem Text="Below R500" Value="Below500" />
            <asp:ListItem Text="R500 - R1000" Value="500-1000" />
            <asp:ListItem Text="R1001 - R1500" Value="1001-1500" />
            <asp:ListItem Text="Above R1500" Value="Above1500" />

        </asp:DropDownList>
    </div>

</div>
            <asp:Button ID="BtnFilter"
    runat="server"
    Text="Apply Filters"
    CssClass="action-btn add-vehicle-btn"
    OnClick="BtnFilter_Click" />

            <asp:Button ID="BtnClearFilters"
    runat="server"
    Text="Clear Filters"
    CssClass="clear-filters"
    OnClick="BtnClearFilters_Click" />

            </div>
        <!-- TABLE + SUMMARY -->

        <div class="content-layout">


            <!-- VEHICLE TABLE -->

            <div class="table-card">

                

                    <asp:SqlDataSource ID="SqlDSVehicles"
    runat="server"
    ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True"
    ProviderName="System.Data.SqlClient"
                        CancelSelectOnNullParameter="False"
    SelectCommand="
    SELECT VehicleVinNo, RegistrationNo, Make, Model, Category,
           Status, Image, BranchName, DailyRate, VehicleDescription,
           LastUpdated, OdometerReading
    FROM VEHICLE
    WHERE
        (@Status = '' OR Status = @Status)
        AND (@BranchName = '' OR BranchName = @BranchName)
        AND (@Category = '' OR Category = @Category)
        AND (
            @DailyRate = ''
            OR (@DailyRate = 'Below500' AND DailyRate &lt; 500)
            OR (@DailyRate = '500-1000' AND DailyRate BETWEEN 500 AND 1000)
            OR (@DailyRate = '1001-1500' AND DailyRate BETWEEN 1001 AND 1500)
            OR (@DailyRate = 'Above1500' AND DailyRate &gt; 1500)
        )
        AND (@Make = '' OR Make LIKE @Make + '%')">

    <SelectParameters>

    <asp:ControlParameter Name="Status"
        ControlID="DDLStatus"
        PropertyName="SelectedValue"
        Type="String"
        ConvertEmptyStringToNull="False"
        DefaultValue="" />

    <asp:ControlParameter Name="BranchName"
        ControlID="DDLBranchName"
        PropertyName="SelectedValue"
        Type="String"
        ConvertEmptyStringToNull="False"
        DefaultValue="" />

    <asp:ControlParameter Name="Category"
        ControlID="DDLCategory"
        PropertyName="SelectedValue"
        Type="String"
        ConvertEmptyStringToNull="False"
        DefaultValue="" />

    <asp:ControlParameter Name="DailyRate"
        ControlID="DDLDailyRate"
        PropertyName="SelectedValue"
        Type="String"
        ConvertEmptyStringToNull="False"
        DefaultValue="" />

    <asp:ControlParameter Name="Make"
        ControlID="TxtSearch"
        PropertyName="Text"
        Type="String"
        ConvertEmptyStringToNull="False"
        DefaultValue="" />

</SelectParameters>
</asp:SqlDataSource>
                    <asp:GridView  ID="GVVehicles"
    runat="server"
    CssClass="vehicle-table"
    AutoGenerateColumns="False"
    DataKeyNames="VehicleVinNo"
    DataSourceID="SqlDSVehicles"
    AllowPaging="True"
    EmptyDataText="No vehicles found."
    OnSelectedIndexChanged="GVVehicles_SelectedIndexChanged"><Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="VehicleVinNo" HeaderText="VehicleVinNo" ReadOnly="True" SortExpression="VehicleVinNo"></asp:BoundField>
                            <asp:BoundField DataField="RegistrationNo" HeaderText="RegistrationNo" SortExpression="RegistrationNo"></asp:BoundField>
                            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make"></asp:BoundField>
                            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model"></asp:BoundField>
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category"></asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                            <asp:BoundField DataField="BranchName" HeaderText="BranchName" SortExpression="BranchName"></asp:BoundField>
                            <asp:BoundField DataField="DailyRate" HeaderText="DailyRate" SortExpression="DailyRate"></asp:BoundField>
                            <asp:BoundField DataField="VehicleDescription" HeaderText="VehicleDescription" SortExpression="VehicleDescription"></asp:BoundField>
                            <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated"></asp:BoundField>
                            <asp:BoundField DataField="OdometerReading" HeaderText="OdometerReading" SortExpression="OdometerReading"></asp:BoundField>

                             
                             <asp:TemplateField HeaderText="Vehicle Image">
    <ItemTemplate>
        <asp:Image ID="ImgVehicle" runat="server"
            Width="120px"
            Height="80px"
            ImageUrl='<%# "GetVehicleImage.ashx?vin=" + Eval("VehicleVinNo") %>' />
    </ItemTemplate>
</asp:TemplateField>

                        </Columns>
                    </asp:GridView>

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
                        <asp:Label ID="LblStatus" runat="server" Text="Status"></asp:Label>
                    </span>

                </div>


                <!-- VEHICLE IMAGE -->

                <div class="vehicle-image-container">
                    <asp:Image ID="VehImage" runat="server" />
                </div>


                <!-- VIN -->

                <div class="summary-item">

                    <div class="summary-label">
                        VIN No
                    </div>

                    <div class="summary-value"
                         id="summaryVin">
                        <asp:Label ID="LblVVN" runat="server" Text="VVN"></asp:Label>
                    </div>

                </div>


                <!-- CATEGORY -->

                <div class="summary-item">

                    <div class="summary-label">
                        Category
                    </div>

                    <div class="summary-value"
                         id="summaryCategory">
                        <asp:Label ID="LblCategory" runat="server" Text="Category"></asp:Label>
                    </div>

                </div>


                <!-- MAKE -->

                <div class="summary-item">

                    <div class="summary-label">
                        Make
                    </div>

                    <div class="summary-value"
                         id="summaryMake">
                        <asp:Label ID="LblMake" runat="server" Text="Make"></asp:Label>
                    </div>

                </div>


                <!-- MODEL -->

                <div class="summary-item">

                    <div class="summary-label">
                        Model
                    </div>

                    <div class="summary-value"
                         id="summaryModel">
                        <asp:Label ID="LblModel" runat="server" Text="Model"></asp:Label>
                    </div>

                </div>


                <!-- DAILY RATE -->

                <div class="summary-item">

                    <div class="summary-label">
                        Daily Rate
                    </div>

                    <div class="daily-rate"
                         id="summaryRate">
                        <asp:Label ID="LblDailyRate" runat="server" Text="Daily Rate"></asp:Label>
                    </div>

                </div>

                <!-- =========================================
     BOTTOM BUTTONS
========================================== -->
    <div class="bottom-buttons">
    <asp:Button ID="BtnClear" runat="server" Text="Clear" class="clear-btn" Height="47px" OnClick="BtnClear_Click" Width="316px" />
        </div>
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
