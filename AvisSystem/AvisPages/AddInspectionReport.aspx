<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddInspectionReport.aspx.cs" Inherits="AvisSystem.AvisPages.AddInspectionReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <style>

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

            <!-- =================================
             ACTIVE RENTALS
        ================================== -->
        <div class="rentals-section">

    <div class="rentals-section-title">
        Select Rental to Add Inspection For
    </div>

    <div class="rentals-section-subtitle">
        Select a rental from the grid below to create a vehicle inspection report.
    </div>


                <!-- SEARCH -->
<div class="search-row">

    <div class="search-box">
        <i class="fas fa-search"></i>
        <asp:TextBox ID="TxtSearch" runat="server" placeholder="Search rentals by customer's name"></asp:TextBox>
        
    </div>  
</div>

    <div class="rentals-table-card">

         <div class="booking-content"> 
     <!-- RENTAL GRIDVIEW --> 
     <div class="table-card"> 
         <div class="table-wrapper">
             <asp:GridView ID="GVRentals" runat="server" CssClass="booking-table" AutoGenerateColumns="False" DataKeyNames="RentalID,VehicleVinNo" DataSourceID="SqlDSRentals" AllowPaging="True" OnSelectedIndexChanged="GVRentals_SelectedIndexChanged">
                 <Columns>
                     <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="RentalID" HeaderText="RentalID" SortExpression="RentalID" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                     <asp:BoundField DataField="BookingID" HeaderText="BookingID" SortExpression="BookingID"></asp:BoundField>
                     <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID"></asp:BoundField>
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
<asp:SqlDataSource ID="SqlDSRentals" runat="server"  ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT RentalID, BookingID, CustomerID, VehicleVinNo, EmployeeID, EmployeeName, PickupDate, StartDate, ExpectedReturnDate, RentalStatus, DepositAmount, VehicleMakeModel FROM RENTAL WHERE (RentalStatus = 'Active') AND (CustomerName LIKE @CustName + '%' OR CustomerName = '')">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="TxtSearch" PropertyName="Text" Name="CustName" ConvertEmptyStringToNull="False"></asp:ControlParameter>
                 </SelectParameters>
             </asp:SqlDataSource>

             <asp:SqlDataSource ID="SqlDSGetVVN" runat="server" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT VehicleVinNo, OdometerReading FROM VEHICLE WHERE (VehicleVinNo = @VehicleVinNo)">
                 <SelectParameters>
                     <asp:Parameter Name="VehicleVinNo"> </asp:Parameter>
                 </SelectParameters>
             </asp:SqlDataSource>
</div> </div> </div>
  </div>

</div>



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
            <asp:TextBox ID="TxtRentalID" runat="server" ReadOnly="True"></asp:TextBox>

        </div>


        <!-- VEHICLE -->

        <div class="form-group">

            <label class="form-label">
                Vehicle
            </label>
            <asp:TextBox ID="TxtVehicle" runat="server" ReadOnly="True"></asp:TextBox>
        </div>


        <!-- BRANCH NAME -->

        <div class="form-group">

            <label class="form-label">
                BranchName
            </label>

            <asp:DropDownList ID="DDLBranchNames" runat="server" CssClass="modern-select" DataSourceID="SqlDataSource1" DataTextField="branchName" DataValueField="BranchID" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BRANCH]"></asp:SqlDataSource>
        </div>

        <!--Odometer Reading -->
        <div class="form-group">
            <label class="form-label">
                Odometer Reading
            </label>

            <asp:TextBox ID="TxtOdometerR" runat="server" ReadOnly="True"></asp:TextBox>

        </div>


        <asp:SqlDataSource ID="SqlDSEmployee" runat="server" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [EMPLOYEE] WHERE ([EmailAddress] = @EmailAddress)">
            <SelectParameters>
                <asp:Parameter Name="EmailAddress" Type="String"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DVEmployees" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="EmployeeID" DataSourceID="SqlDSEmployee" Visible="False">
            <Fields>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" InsertVisible="False" SortExpression="EmployeeID"></asp:BoundField>
                <asp:BoundField DataField="Fullname" HeaderText="Fullname" SortExpression="Fullname"></asp:BoundField>
                <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress"></asp:BoundField>
                <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position"></asp:BoundField>
                <asp:BoundField DataField="ContactNumber" HeaderText="ContactNumber" SortExpression="ContactNumber"></asp:BoundField>
                <asp:BoundField DataField="EmploymentStatus" HeaderText="EmploymentStatus" SortExpression="EmploymentStatus"></asp:BoundField>
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"></asp:BoundField>
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                <asp:BoundField DataField="BranchName" HeaderText="BranchName" SortExpression="BranchName"></asp:BoundField>
            </Fields>
        </asp:DetailsView>
         <!--EmployeeID -->
 <div class="form-group">
     <label class="form-label">
         Employee ID
     </label>

     <asp:TextBox ID="TxtEmpID" runat="server" ReadOnly="True"></asp:TextBox>

 </div>

         <!--Employee Name -->
 <div class="form-group">
     <label class="form-label">
         Employee name
     </label>

     <asp:TextBox ID="TxtEmpName" runat="server" ReadOnly="True"></asp:TextBox>

 </div>

    </div>

</div>

           <!--Inspection Type -->
                <div class="form-group">

                    <label class="form-label">
                        Inspection Type <span class="required">*</span>
                    </label>

                    <asp:DropDownList ID="DDLInspectionType"
    runat="server"
    CssClass="modern-select"
    AutoPostBack="True"
    OnSelectedIndexChanged="DDLInspectionType_SelectedIndexChanged">

    <asp:ListItem>Pick Up</asp:ListItem>
    <asp:ListItem>Return</asp:ListItem>

</asp:DropDownList>

                </div>

            </div>


            <hr class="form-divider" />


            <!-- FUEL LEVEL -->

            <div class="full-width">

    <label class="form-label">
        Fuel Level <span class="required">*</span>
    </label>

    <asp:RadioButtonList ID="RBLFuelLevel"
        runat="server"
        RepeatDirection="Horizontal"
        RepeatLayout="Flow"
        CssClass="selection-group">

        <asp:ListItem Value="Empty">Empty</asp:ListItem>
        <asp:ListItem Value="1/4">1/4</asp:ListItem>
        <asp:ListItem Value="Half">Half</asp:ListItem>
        <asp:ListItem Value="3/4">3/4</asp:ListItem>
        <asp:ListItem Value="Full">Full</asp:ListItem>
        <asp:ListItem Value="Unknown">Unknown</asp:ListItem>

    </asp:RadioButtonList>

</div>


            <!-- DAMAGE FOUND -->
<div class="full-width">

    <label class="form-label">
        Damage Found <span class="required">*</span>
    </label>

    <asp:RadioButtonList ID="RBLDamageFound"
        runat="server"
        RepeatDirection="Horizontal"
        RepeatLayout="Flow"
        CssClass="damage-options"
        AutoPostBack="True"
        OnSelectedIndexChanged="RBLDamageFound_SelectedIndexChanged">

        <asp:ListItem Value="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="No">No</asp:ListItem>

    </asp:RadioButtonList>

</div>


<!-- DAMAGE TYPE -->
<div class="full-width" id="DamageTypeSection" runat="server" visible="false">

    <label class="form-label">
        Damage Type <span class="required">*</span>
    </label>

    <asp:DropDownList ID="DDLDamageType"
    runat="server"
    CssClass="modern-select"
    AutoPostBack="True"
    OnSelectedIndexChanged="DDLDamageType_SelectedIndexChanged">

    <asp:ListItem Value="">-- Select Damage --</asp:ListItem>
    <asp:ListItem Value="500">Scratch</asp:ListItem>
    <asp:ListItem Value="1000">Large Scratch</asp:ListItem>
    <asp:ListItem Value="1500">Dent</asp:ListItem>
    <asp:ListItem Value="2500">Broken Mirror</asp:ListItem>
    <asp:ListItem Value="3000">Broken Headlight</asp:ListItem>

</asp:DropDownList>

</div>


<!-- DAMAGE CHARGES -->
<div class="full-width" id="DamageChargeSection" runat="server" visible="false">

    <label class="form-label">
        Damage Charges
    </label>

    <div style="display:flex; align-items:center;">

        <span style="margin-right:8px;">R</span>

        <asp:TextBox ID="TxtDamageCharges"
            runat="server"
            CssClass="modern-input readonly-input"
            ReadOnly="True">
        </asp:TextBox>

    </div>

</div>


            <!-- INSPECTION NOTES -->

            <div class="full-width">

                <label class="form-label">
                    Inspection Notes
                </label>

                <asp:TextBox ID="TxtInspectionN" runat="server" class="modern-textarea"></asp:TextBox>
                
            </div>


            <!-- INSPECTION DATE -->

            <div class="full-width">

                <label class="form-label">
                    Inspection Date <span class="required">*</span>
                </label>

                <div class="date-input">

                    <asp:TextBox ID="TxtDateTime" runat="server"  CssClass="modern-input readonly-input"
    ReadOnly="True" ></asp:TextBox>  

                </div>

            </div>


            <hr class="form-divider" />


            <!-- BUTTONS -->

            <div class="button-area">

                <asp:Button ID="BtnClear" runat="server" class="action-btn clear-btn" Text="Clear" OnClick="BtnClear_Click" />


                <asp:SqlDataSource ID="SqlDSAddInspection" runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" DeleteCommand="DELETE FROM [VEHICLE INSPECTION] WHERE [InspectionCode] = @original_InspectionCode AND [EmployeeID] = @original_EmployeeID AND [RentalID] = @original_RentalID AND [OdometerReading] = @original_OdometerReading AND [InspectionType] = @original_InspectionType AND [InspectionDateTime] = @original_InspectionDateTime AND [FuelLevel] = @original_FuelLevel AND [DamageFound] = @original_DamageFound AND (([Damage Type] = @original_Damage_Type) OR ([Damage Type] IS NULL AND @original_Damage_Type IS NULL)) AND [InspectionNotes] = @original_InspectionNotes AND (([BranchName] = @original_BranchName) OR ([BranchName] IS NULL AND @original_BranchName IS NULL)) AND (([EmployeeName] = @original_EmployeeName) OR ([EmployeeName] IS NULL AND @original_EmployeeName IS NULL)) AND (([VehicleMakeModel] = @original_VehicleMakeModel) OR ([VehicleMakeModel] IS NULL AND @original_VehicleMakeModel IS NULL)) AND (([DamageCharges] = @original_DamageCharges) OR ([DamageCharges] IS NULL AND @original_DamageCharges IS NULL))" InsertCommand="INSERT INTO [VEHICLE INSPECTION] ([EmployeeID], [RentalID], [OdometerReading], [InspectionType], [InspectionDateTime], [FuelLevel], [DamageFound], [Damage Type], [InspectionNotes], [BranchName], [EmployeeName], [VehicleMakeModel], [DamageCharges]) VALUES (@EmployeeID, @RentalID, @OdometerReading, @InspectionType, @InspectionDateTime, @FuelLevel, @DamageFound, @Damage_Type, @InspectionNotes, @BranchName, @EmployeeName, @VehicleMakeModel, @DamageCharges)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [VEHICLE INSPECTION]" UpdateCommand="UPDATE [VEHICLE INSPECTION] SET [EmployeeID] = @EmployeeID, [RentalID] = @RentalID, [OdometerReading] = @OdometerReading, [InspectionType] = @InspectionType, [InspectionDateTime] = @InspectionDateTime, [FuelLevel] = @FuelLevel, [DamageFound] = @DamageFound, [Damage Type] = @Damage_Type, [InspectionNotes] = @InspectionNotes, [BranchName] = @BranchName, [EmployeeName] = @EmployeeName, [VehicleMakeModel] = @VehicleMakeModel, [DamageCharges] = @DamageCharges WHERE [InspectionCode] = @original_InspectionCode AND [EmployeeID] = @original_EmployeeID AND [RentalID] = @original_RentalID AND [OdometerReading] = @original_OdometerReading AND [InspectionType] = @original_InspectionType AND [InspectionDateTime] = @original_InspectionDateTime AND [FuelLevel] = @original_FuelLevel AND [DamageFound] = @original_DamageFound AND (([Damage Type] = @original_Damage_Type) OR ([Damage Type] IS NULL AND @original_Damage_Type IS NULL)) AND [InspectionNotes] = @original_InspectionNotes AND (([BranchName] = @original_BranchName) OR ([BranchName] IS NULL AND @original_BranchName IS NULL)) AND (([EmployeeName] = @original_EmployeeName) OR ([EmployeeName] IS NULL AND @original_EmployeeName IS NULL)) AND (([VehicleMakeModel] = @original_VehicleMakeModel) OR ([VehicleMakeModel] IS NULL AND @original_VehicleMakeModel IS NULL)) AND (([DamageCharges] = @original_DamageCharges) OR ([DamageCharges] IS NULL AND @original_DamageCharges IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_InspectionCode" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_EmployeeID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_RentalID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_OdometerReading" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="original_InspectionType" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_InspectionDateTime" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="original_FuelLevel" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_DamageFound" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Damage_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_InspectionNotes" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_BranchName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_EmployeeName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_VehicleMakeModel" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_DamageCharges" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TxtEmpID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="TxtRentalID" Name="RentalID" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="TxtOdometerR" Name="OdometerReading" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="DDLInspectionType" Name="InspectionType" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="TxtDateTime" Name="InspectionDateTime" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="RBLFuelLevel" Name="FuelLevel" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="RBLDamageFound" Name="DamageFound" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="DDLDamageType" Name="Damage_Type" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="TxtInspectionN" Name="InspectionNotes" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="DDLBranchNames" Name="BranchName" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="TxtEmpName" Name="EmployeeName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtVehicle" Name="VehicleMakeModel" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtDamageCharges" Name="DamageCharges" PropertyName="Text" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EmployeeID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="RentalID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="OdometerReading" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="InspectionType" Type="String"></asp:Parameter>
                        <asp:Parameter Name="InspectionDateTime" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="FuelLevel" Type="String"></asp:Parameter>
                        <asp:Parameter Name="DamageFound" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Damage_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="InspectionNotes" Type="String"></asp:Parameter>
                        <asp:Parameter Name="BranchName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="EmployeeName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="VehicleMakeModel" Type="String"></asp:Parameter>
                        <asp:Parameter Name="DamageCharges" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="original_InspectionCode" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_EmployeeID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_RentalID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_OdometerReading" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="original_InspectionType" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_InspectionDateTime" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="original_FuelLevel" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_DamageFound" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Damage_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_InspectionNotes" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_BranchName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_EmployeeName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_VehicleMakeModel" Type="String" />
                        <asp:Parameter Name="original_DamageCharges" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Button ID="BtnAddInspection" runat="server" class="action-btn add-btn" Text="Add Inspection" OnClick="BtnAddInspection_Click" />

                <asp:Label ID="LblMessage" runat="server" Text="Feedback" Visible="False"></asp:Label>

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
