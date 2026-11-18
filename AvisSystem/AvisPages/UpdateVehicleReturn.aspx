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
  <div class="booking-header">
    <h1>Update Vehicle Return</h1>
    <p>Search saved returns and correct their details.</p>
  </div>

  <!-- Grid: history of all returns, searchable -->
  <asp:SqlDataSource ID="SqlDSReturns" runat="server"
      ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
      SelectCommand="SELECT ReturnID, BookingID, VehicleVinNo, VehicleDescription, ReturnDate,
                            [Inspection Report], Charges, BranchName
                     FROM [VEHICLE RETURN]
                     WHERE VehicleVinNo LIKE '%' + @Search + '%'
                        OR VehicleDescription LIKE '%' + @Search + '%'
                        OR CAST(BookingID AS VARCHAR(20)) LIKE '%' + @Search + '%'
                     ORDER BY ReturnID DESC">
    <SelectParameters>
      <asp:ControlParameter ControlID="txtSearch" Name="Search" PropertyName="Text"
          Type="String" DefaultValue="" ConvertEmptyStringToNull="False" />
    </SelectParameters>
  </asp:SqlDataSource>

  <!-- One return, loaded into the form when a row is selected -->
  <asp:SqlDataSource ID="SqlDSOneReturn" runat="server"
      ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
      SelectCommand="SELECT ReturnID, BookingID, VehicleVinNo, VehicleDescription,
                            [Inspection Report], Charges, BranchName
                     FROM [VEHICLE RETURN] WHERE ReturnID = @ReturnID">
    <SelectParameters>
      <asp:ControlParameter ControlID="hfReturnID" Name="ReturnID" PropertyName="Value" Type="Int32" />
    </SelectParameters>
  </asp:SqlDataSource>

  <!-- Branch dropdown list -->
  <asp:SqlDataSource ID="SqlDSBranch" runat="server"
      ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
      SelectCommand="SELECT BranchName FROM (
                         SELECT BranchName FROM [VEHICLE RETURN]
                         UNION SELECT DropOffBranchName FROM BOOKING
                         UNION SELECT PickUpBranchName FROM BOOKING) x
                     WHERE BranchName IS NOT NULL ORDER BY BranchName" />

  <!-- Update -->
  <asp:SqlDataSource ID="SqlDSReturnUpdate" runat="server"
      ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
      UpdateCommand="UPDATE [VEHICLE RETURN]
                     SET [Inspection Report] = @Report, Charges = @Charges,
                         BranchName = @Branch, LastUpdated = GETDATE()
                     WHERE ReturnID = @ReturnID">
    <UpdateParameters>
      <asp:Parameter Name="Report" Type="String" />
      <asp:Parameter Name="Charges" Type="Decimal" />
      <asp:Parameter Name="Branch" Type="String" />
      <asp:Parameter Name="ReturnID" Type="Int32" />
    </UpdateParameters>
  </asp:SqlDataSource>

  <div class="search-row">
    <div class="search-box">
      <i class="fas fa-search"></i>
      <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by VIN, vehicle or booking ref"></asp:TextBox>
    </div>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
        CausesValidation="false"
        style="background-color:#c8102e; color:white; border:none; border-radius:8px; padding:0 20px; height:43px; cursor:pointer;" />
    <asp:Button ID="btnClearSearch" runat="server" Text="Clear" CssClass="clear-filters"
        OnClick="btnClearSearch_Click" CausesValidation="false" />
  </div>

  <div class="booking-content">
    <div class="table-card"><div class="table-wrapper">
      <asp:GridView ID="GVReturns" runat="server" CssClass="booking-table"
          DataSourceID="SqlDSReturns" AutoGenerateColumns="False" DataKeyNames="ReturnID"
          AllowPaging="True" PageSize="8" ShowHeaderWhenEmpty="True" EmptyDataText="No returns found."
          OnSelectedIndexChanged="GVReturns_SelectedIndexChanged">
        <Columns>
          <asp:CommandField ShowSelectButton="True" />
          <asp:BoundField DataField="ReturnID" HeaderText="Return #" />
          <asp:BoundField DataField="BookingID" HeaderText="Booking Ref" />
          <asp:BoundField DataField="VehicleVinNo" HeaderText="VIN / Plate" />
          <asp:BoundField DataField="VehicleDescription" HeaderText="Vehicle" />
          <asp:BoundField DataField="ReturnDate" HeaderText="Returned" DataFormatString="{0:yyyy-MM-dd}" />
          <asp:BoundField DataField="Inspection Report" HeaderText="Inspection Report" />
          <asp:BoundField DataField="Charges" HeaderText="Charges" DataFormatString="{0:C}" />
          <asp:BoundField DataField="BranchName" HeaderText="Branch" />
        </Columns>
      </asp:GridView>
    </div></div>

    <aside class="summary-card">
      <div class="summary-heading"><h2>Edit Return</h2></div>
      <asp:HiddenField ID="hfReturnID" runat="server" Value="0" />

      <label>Return #</label><asp:TextBox ID="txtReturnNo" runat="server" ReadOnly="true" /><br />
      <label>Booking reference</label><asp:TextBox ID="txtBookingRef" runat="server" ReadOnly="true" /><br />
      <label>Licence plate / VIN</label><asp:TextBox ID="txtVin" runat="server" ReadOnly="true" /><br />
      <label>Vehicle</label><asp:TextBox ID="txtVehicle" runat="server" ReadOnly="true" /><br />

      <label>Inspection report</label>
      <asp:TextBox ID="txtReport" runat="server" TextMode="MultiLine" Rows="4" MaxLength="200" /><br />

      <label>Additional charges (R)</label>
      <asp:TextBox ID="txtCharges" runat="server" />
      <asp:RangeValidator runat="server" ControlToValidate="txtCharges" Type="Double"
          MinimumValue="0" MaximumValue="1000000" ErrorMessage="Enter a valid amount."
          ForeColor="#c8102e" Display="Dynamic" ValidationGroup="Upd" /><br />

      <label>Return branch</label>
      <asp:DropDownList ID="ddlBranch" runat="server" DataSourceID="SqlDSBranch"
          DataTextField="BranchName" DataValueField="BranchName" />

      <div class="summary-actions">
        <asp:Button ID="btnUpdate" runat="server" Text="Update Return" CssClass="delete-btn"
            ValidationGroup="Upd" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="cancel-btn"
            CausesValidation="false" OnClick="btnClear_Click" />
      </div>
      <asp:Label ID="lblMessage" runat="server" />
    </aside>
  </div>
</main>
</asp:Content>
