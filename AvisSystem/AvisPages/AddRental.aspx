<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRental.aspx.cs" Inherits="AvisSystem.AvisPages.AddRental" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .rental-page {
        background: #f7f7f7;
        padding: 30px;
    }

    .rental-card {
        background: white;
        padding: 30px;
        border-radius: 12px;
        border: 1px solid #e5e5e5;
        box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        max-width: 1100px;
        margin: auto;
    }

    .section-title {
        font-size: 21px;
        font-weight: 600;
        margin-bottom: 20px;
    }

    .booking-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 25px;
    }

    .booking-table th {
        background: #c8102e;
        color: white;
        padding: 12px;
        text-align: left;
    }

    .booking-table td {
        padding: 12px;
        border-bottom: 1px solid #eee;
    }

    .booking-table tr:hover {
        background: #f8f8f8;
    }

    .selected-rental-card {
        background: #f7f7f7;
        border: 1px solid #e5e5e5;
        border-radius: 10px;
        padding: 20px;
        margin-top: 25px;
    }

    .form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 18px;
    }

    .form-group label {
        display: block;
        font-weight: 600;
        margin-bottom: 7px;
    }

    .modern-input {
        width: 100%;
        height: 45px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 7px;
        box-sizing: border-box;
    }

    .readonly-input {
        background: #eee;
        cursor: not-allowed;
    }

    .button-area {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 12px;
        margin-top: 30px;
    }

    .action-btn {
        height: 45px;
        padding: 0 22px;
        border: none;
        border-radius: 7px;
        cursor: pointer;
        font-weight: 600;
    }

    .add-btn {
        background: #c8102e;
        color: white;
    }

    .clear-btn {
        background: #e5e5e5;
        color: #333;
    }

    .delete-btn {
        background: #c8102e;
        color: white;
        margin-right: auto;
    }

    .message {
        display: block;
        margin-top: 15px;
        font-weight: 600;
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

</style>

<div class="rental-page">

<div class="rental-card">

    <h2 class="section-title">Select Booking</h2>
    <!-- Confirmed SqlDSBookings -->
    <asp:SqlDataSource ID="SqlDSBookings" runat="server" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT BookingID, CustomerID, VehicleVinNo, [Booking Date], [PickUp Date], ExpectedReturnDate, [Invoice Amount], Status, EmployeeID, FullName, Position, PickUpBranchName, DropOffBranchName, BranchName, CustomerFullName, LastUpdated, RefundStatus, Vehicle_make, Vehicle_model FROM BOOKING WHERE (Status = 'Confirmed')"></asp:SqlDataSource>

    <!--Booking GridView -->
<div class="booking-content">
    <div class="table-card"> 
    <div class="table-wrapper">
    <asp:GridView ID="GVBookings" runat="server" CssClass="booking-table" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="BookingID" DataSourceID="SqlDSBookings" OnSelectedIndexChanged="GVBookings_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="BookingID" HeaderText="BookingID" InsertVisible="False" ReadOnly="True" SortExpression="BookingID" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="VehicleVinNo" HeaderText="VehicleVinNo" SortExpression="VehicleVinNo" />
            <asp:BoundField DataField="PickUp Date" HeaderText="PickUp Date" SortExpression="PickUp Date" />
            <asp:BoundField DataField="ExpectedReturnDate" HeaderText="ExpectedReturnDate" SortExpression="ExpectedReturnDate" />
            <asp:BoundField DataField="CustomerFullName" HeaderText="CustomerFullName" SortExpression="CustomerFullName" />
            <asp:BoundField DataField="Vehicle_make" HeaderText="Vehicle_make" SortExpression="Vehicle_make" />
            <asp:BoundField DataField="Vehicle_model" HeaderText="Vehicle_model" SortExpression="Vehicle_model" />
        </Columns>
    </asp:GridView>
        </div>
</div>
        </div>
    


    <div class="selected-rental-card">

        <h3 class="section-title">Selected Booking Details</h3>

        <div class="form-row">

            <div class="form-group">
                <label>Customer ID</label>
                <asp:TextBox ID="txtCustomerID"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Customer Name</label>
                <asp:TextBox ID="txtCustomerName"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Booking ID</label>
                <asp:TextBox ID="txtBookingID"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Vehicle VIN Number</label>
                <asp:TextBox ID="txtVehicleVinNo"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Vehicle Make and Model</label>
                <asp:TextBox ID="txtVehicleMakeModel"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Pick-up Date</label>
                <asp:TextBox ID="txtPickUpDate"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Expected Return Date</label>
                <asp:TextBox ID="txtExpectedReturnDate"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

        </div>

    </div>


    <div class="selected-rental-card">

        <h3 class="section-title">Rental Details</h3>

        <div class="form-row">

            <div class="form-group">
                <label>Rental Start Date</label>
                <asp:TextBox ID="txtStartDate"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Employee ID</label>
                <asp:TextBox ID="txtEmployeeID"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Employee Name</label>
                <asp:TextBox ID="txtEmployeeName"
                    runat="server"
                    CssClass="modern-input readonly-input"
                    ReadOnly="True" />
            </div>

        </div>

    </div>


    <div class="button-area">

        <asp:Button ID="BtnClear" runat="server" Text="🧹Clear" CssClass="action-btn clear-btn" OnClick="btnClear_Click" />
        <asp:SqlDataSource ID="SqlDSAddRental" runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True" DeleteCommand="DELETE FROM [RENTAL] WHERE [RentalID] = @original_RentalID AND [BookingID] = @original_BookingID AND [CustomerID] = @original_CustomerID AND (([CustomerName] = @original_CustomerName) OR ([CustomerName] IS NULL AND @original_CustomerName IS NULL)) AND [VehicleVinNo] = @original_VehicleVinNo AND [EmployeeID] = @original_EmployeeID AND (([EmployeeName] = @original_EmployeeName) OR ([EmployeeName] IS NULL AND @original_EmployeeName IS NULL)) AND (([PickupDate] = @original_PickupDate) OR ([PickupDate] IS NULL AND @original_PickupDate IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([ExpectedReturnDate] = @original_ExpectedReturnDate) OR ([ExpectedReturnDate] IS NULL AND @original_ExpectedReturnDate IS NULL)) AND (([RentalStatus] = @original_RentalStatus) OR ([RentalStatus] IS NULL AND @original_RentalStatus IS NULL)) AND (([DepositAmount] = @original_DepositAmount) OR ([DepositAmount] IS NULL AND @original_DepositAmount IS NULL)) AND (([VehicleMakeModel] = @original_VehicleMakeModel) OR ([VehicleMakeModel] IS NULL AND @original_VehicleMakeModel IS NULL))" InsertCommand="INSERT INTO [RENTAL] ([BookingID], [CustomerID], [CustomerName], [VehicleVinNo], [EmployeeID], [EmployeeName], [PickupDate], [StartDate], [ExpectedReturnDate], [RentalStatus], [DepositAmount], [VehicleMakeModel]) VALUES (@BookingID, @CustomerID, @CustomerName, @VehicleVinNo, @EmployeeID, @EmployeeName, @PickupDate, @StartDate, @ExpectedReturnDate, @RentalStatus, @DepositAmount, @VehicleMakeModel)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [RENTAL]" UpdateCommand="UPDATE [RENTAL] SET [BookingID] = @BookingID, [CustomerID] = @CustomerID, [CustomerName] = @CustomerName, [VehicleVinNo] = @VehicleVinNo, [EmployeeID] = @EmployeeID, [EmployeeName] = @EmployeeName, [PickupDate] = @PickupDate, [StartDate] = @StartDate, [ExpectedReturnDate] = @ExpectedReturnDate, [RentalStatus] = @RentalStatus, [DepositAmount] = @DepositAmount, [VehicleMakeModel] = @VehicleMakeModel WHERE [RentalID] = @original_RentalID AND [BookingID] = @original_BookingID AND [CustomerID] = @original_CustomerID AND (([CustomerName] = @original_CustomerName) OR ([CustomerName] IS NULL AND @original_CustomerName IS NULL)) AND [VehicleVinNo] = @original_VehicleVinNo AND [EmployeeID] = @original_EmployeeID AND (([EmployeeName] = @original_EmployeeName) OR ([EmployeeName] IS NULL AND @original_EmployeeName IS NULL)) AND (([PickupDate] = @original_PickupDate) OR ([PickupDate] IS NULL AND @original_PickupDate IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([ExpectedReturnDate] = @original_ExpectedReturnDate) OR ([ExpectedReturnDate] IS NULL AND @original_ExpectedReturnDate IS NULL)) AND (([RentalStatus] = @original_RentalStatus) OR ([RentalStatus] IS NULL AND @original_RentalStatus IS NULL)) AND (([DepositAmount] = @original_DepositAmount) OR ([DepositAmount] IS NULL AND @original_DepositAmount IS NULL)) AND (([VehicleMakeModel] = @original_VehicleMakeModel) OR ([VehicleMakeModel] IS NULL AND @original_VehicleMakeModel IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_RentalID" Type="Int32" />
                <asp:Parameter Name="original_BookingID" Type="Int32" />
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_CustomerName" Type="String" />
                <asp:Parameter Name="original_VehicleVinNo" Type="String" />
                <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                <asp:Parameter Name="original_EmployeeName" Type="String" />
                <asp:Parameter Name="original_PickupDate" Type="DateTime" />
                <asp:Parameter Name="original_StartDate" Type="DateTime" />
                <asp:Parameter Name="original_ExpectedReturnDate" Type="DateTime" />
                <asp:Parameter Name="original_RentalStatus" Type="String" />
                <asp:Parameter Name="original_DepositAmount" Type="Decimal" />
                <asp:Parameter Name="original_VehicleMakeModel" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtBookingID" Name="BookingID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtCustomerName" Name="CustomerName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtVehicleVinNo" Name="VehicleVinNo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtEmployeeName" Name="EmployeeName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtPickUpDate" Name="PickupDate" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtStartDate" Name="StartDate" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtExpectedReturnDate" Name="ExpectedReturnDate" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter Name="RentalStatus" Type="String" />
                <asp:Parameter Name="DepositAmount" Type="Decimal" />
                <asp:ControlParameter ControlID="txtVehicleMakeModel" Name="VehicleMakeModel" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BookingID" Type="Int32" />
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="VehicleVinNo" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
                <asp:Parameter Name="EmployeeName" Type="String" />
                <asp:Parameter Name="PickupDate" Type="DateTime" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="ExpectedReturnDate" Type="DateTime" />
                <asp:Parameter Name="RentalStatus" Type="String" />
                <asp:Parameter Name="DepositAmount" Type="Decimal" />
                <asp:Parameter Name="VehicleMakeModel" Type="String" />
                <asp:Parameter Name="original_RentalID" Type="Int32" />
                <asp:Parameter Name="original_BookingID" Type="Int32" />
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_CustomerName" Type="String" />
                <asp:Parameter Name="original_VehicleVinNo" Type="String" />
                <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                <asp:Parameter Name="original_EmployeeName" Type="String" />
                <asp:Parameter Name="original_PickupDate" Type="DateTime" />
                <asp:Parameter Name="original_StartDate" Type="DateTime" />
                <asp:Parameter Name="original_ExpectedReturnDate" Type="DateTime" />
                <asp:Parameter Name="original_RentalStatus" Type="String" />
                <asp:Parameter Name="original_DepositAmount" Type="Decimal" />
                <asp:Parameter Name="original_VehicleMakeModel" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <!-- Add Rental SqlDS -->
        <asp:Button ID="BtnAddRental" runat="server" Text="✔Add Rental"  CssClass="action-btn add-btn" OnClick="btnAddRental_Click"  />
        
    </div>


    <asp:Label ID="lblMessage"
        runat="server"
        CssClass="message" />


</div>
</div>

</asp:Content>
