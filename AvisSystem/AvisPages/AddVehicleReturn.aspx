<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddVehicleReturn.aspx.cs" Inherits="AvisSystem.AvisPages.AddVehicleReturn" %>
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

        <h2 class="section-title">Select Active Rental</h2>

        <asp:SqlDataSource ID="SqlDSRentals" runat="server"
            ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
           SelectCommand="SELECT r.RentalID, r.BookingID, r.CustomerName, r.VehicleVinNo, r.VehicleMakeModel, r.EmployeeName, r.ExpectedReturnDate, v.DailyRate
               FROM RENTAL r INNER JOIN VEHICLE v ON r.VehicleVinNo = v.VehicleVinNo
               WHERE r.RentalStatus = 'Active' AND r.CustomerName LIKE '%' + @Search + '%'
               ORDER BY r.ExpectedReturnDate">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="Search" PropertyName="Text"
                    Type="String" DefaultValue="" ConvertEmptyStringToNull="False" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="form-row">
            <div class="form-group">
                <label>Customer Name</label>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="modern-input" />
            </div>
        </div>

        <div class="button-area">
            <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="action-btn add-btn" OnClick="btnSearch_Click" />
            <asp:Button ID="BtnClearSearch" runat="server" Text="Clear" CssClass="action-btn clear-btn" OnClick="btnClearSearch_Click" />
        </div>

        <div class="booking-content">
            <div class="table-card">
                <div class="table-wrapper">
                    <asp:GridView ID="GVRentals" runat="server" CssClass="booking-table" AllowPaging="True" PageSize="8"
                        AutoGenerateColumns="False" DataKeyNames="RentalID" DataSourceID="SqlDSRentals"
                        EmptyDataText="No active rentals found." OnSelectedIndexChanged="GVRentals_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="RentalID" HeaderText="RentalID" />
                            <asp:BoundField DataField="BookingID" HeaderText="BookingID" />
                            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" />
                            <asp:BoundField DataField="VehicleVinNo" HeaderText="VehicleVinNo" />
                            <asp:BoundField DataField="VehicleMakeModel" HeaderText="VehicleMakeModel" />
                            <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" />
                            <asp:BoundField DataField="ExpectedReturnDate" HeaderText="ExpectedReturnDate" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                            <asp:BoundField DataField="DailyRate" HeaderText="DailyRate" DataFormatString="{0:0.00}" />

                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

    </div>

    <div class="selected-rental-card" id="selectedRental">

        <h3 class="section-title">Selected Rental Details</h3>

        <div class="form-row">

            <div class="form-group">
                <label>Rental ID</label>
                <asp:TextBox ID="txtRentalID" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Booking ID</label>
                <asp:TextBox ID="txtBookingID" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Customer Name</label>
                <asp:TextBox ID="txtCustomerName" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Vehicle VIN Number</label>
                <asp:TextBox ID="txtVehicleVinNo" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Vehicle Make and Model</label>
                <asp:TextBox ID="txtVehicleMakeModel" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Employee Name</label>
                <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Expected Return Date</label>
                <asp:TextBox ID="txtExpectedReturnDate" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" />
            </div>
            <div class="form-group">
                 <label>Daily Rate (R)</label>
                 <asp:TextBox ID="txtDailyRate" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" />
             </div>

        </div>

    </div>

    <div class="selected-rental-card">

        <h3 class="section-title">Return Details</h3>

        <div class="form-row">

            <div class="form-group">
                <label>Return Date</label>
                <asp:TextBox ID="txtReturnDate" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" />
            </div>

            <asp:DropDownList ID="ddlBranch" runat="server" CssClass="modern-input"
    DataSourceID="SqlDSBranch" DataTextField="BranchName" DataValueField="BranchName" />

            <div class="form-group">
                <label>Days Charged</label>
                <asp:TextBox ID="txtDaysCharged" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" Text="0" />
             </div>

            <div class="form-group">
        <label>Additional Charges (R)</label>
        <asp:TextBox ID="txtCharges" runat="server" CssClass="modern-input readonly-input" ReadOnly="True" Text="0.00" />
              </div>
            <div class="form-group">
    <label>Payment Method</label>
    <asp:DropDownList ID="ddlPaymentType" runat="server" CssClass="modern-input">
        <asp:ListItem>Cash</asp:ListItem>
        <asp:ListItem>Debit Card</asp:ListItem>
        <asp:ListItem>EFT</asp:ListItem>
    </asp:DropDownList>
</div>

            <div class="form-group">
                <label>Inspection Report</label>
                <asp:TextBox ID="txtInspectionReport" runat="server" CssClass="modern-input" MaxLength="200" />
            </div>

        </div>

    </div>

    <div class="button-area">

        <asp:Button ID="BtnClear" runat="server" Text="Clear" CssClass="action-btn clear-btn" OnClick="btnClear_Click" />

        <asp:Button ID="BtnAddReturn" runat="server" Text="Add Return" CssClass="action-btn add-btn" OnClick="btnAddReturn_Click" />

    </div>

   <asp:SqlDataSource ID="SqlDSBranch" runat="server"
    ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
    SelectCommand="SELECT DISTINCT BranchName FROM VEHICLE ORDER BY BranchName" />

   <asp:SqlDataSource ID="SqlDSAddReturn" runat="server"
    ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
 InsertCommand="SET XACT_ABORT ON;
               BEGIN TRAN;

               UPDATE VEHICLE
               SET Status = 'Available', BranchName = @BranchName, LastUpdated = GETDATE()
               WHERE VehicleVinNo = @VehicleVinNo;
               IF @@ROWCOUNT = 0 THROW 50001, 'Vehicle not found.', 1;

               INSERT INTO [VEHICLE RETURN] (BookingID, ReturnDate, [Inspection Report], Charges, VehicleVinNo, BranchName, VehicleDescription)
               VALUES (@BookingID, @ReturnDate, @InspectionReport, @Charges, @VehicleVinNo, @BranchName, @VehicleDescription);

               UPDATE RENTAL SET RentalStatus = 'Completed' WHERE RentalID = @RentalID;

               UPDATE BOOKING SET Status = 'Completed', LastUpdated = GETDATE() WHERE BookingID = @BookingID;

               COMMIT;">
    <InsertParameters>
        <asp:ControlParameter ControlID="txtRentalID" Name="RentalID" PropertyName="Text" Type="Int32" />
        <asp:ControlParameter ControlID="txtBookingID" Name="BookingID" PropertyName="Text" Type="Int32" />
        <asp:ControlParameter ControlID="txtReturnDate" Name="ReturnDate" PropertyName="Text" Type="DateTime" />
        <asp:ControlParameter ControlID="txtInspectionReport" Name="InspectionReport" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txtCharges" Name="Charges" PropertyName="Text" Type="Decimal" />
        <asp:ControlParameter ControlID="txtVehicleVinNo" Name="VehicleVinNo" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="ddlBranch" Name="BranchName" PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="txtVehicleMakeModel" Name="VehicleDescription" PropertyName="Text" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>

   <asp:SqlDataSource ID="SqlDSAddPayment" runat="server"
    ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
    InsertCommand="INSERT INTO PAYMENT (InvoiceID, BookingID, PaymentType, PaymentDate, PaymentAmount, PaymentStatus, PaymentDescription, CustomerName)
                   SELECT 'INV' + CAST(ISNULL(MAX(TRY_CAST(SUBSTRING(InvoiceID, 4, 20) AS INT)), 1000) + 1 AS VARCHAR(20)),
                          @BookingID, @PaymentType, @PaymentDate, @PaymentAmount, 'Completed', @PaymentDescription, @CustomerName
                   FROM PAYMENT WITH (UPDLOCK, HOLDLOCK)">
    <InsertParameters>
        <asp:ControlParameter ControlID="txtBookingID" Name="BookingID" PropertyName="Text" Type="Int32" />
        <asp:ControlParameter ControlID="ddlPaymentType" Name="PaymentType" PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="txtReturnDate" Name="PaymentDate" PropertyName="Text" Type="DateTime" />
        <asp:ControlParameter ControlID="txtCharges" Name="PaymentAmount" PropertyName="Text" Type="Decimal" />
        <asp:ControlParameter ControlID="txtCustomerName" Name="CustomerName" PropertyName="Text" Type="String" />
        <asp:Parameter Name="PaymentDescription" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>

    <asp:Label ID="lblMessage" runat="server" CssClass="message" />

</div>
</asp:Content>
