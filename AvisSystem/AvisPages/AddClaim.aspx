<%@ Page Title="Add Claim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddClaim.aspx.cs" Inherits="AvisSystem.AvisPages.AddClaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .form-page { padding: 30px; background: #f7f7f7; min-height: calc(100vh - 70px); }
    .form-card { background: #fff; padding: 30px; border-radius: 12px; border: 1px solid #e5e5e5;
                 max-width: 1200px; box-shadow: 0 3px 10px rgba(0,0,0,0.05); margin: 0 auto; }

    .form-group { margin-bottom: 20px; }
    .form-label { font-weight: 600; display: block; margin-bottom: 8px; color: #333; }
    .modern-input, .modern-select, .modern-textarea { width: 100%; padding: 12px; border: 1px solid #ddd;
                 border-radius: 8px; font-size: 14px; box-sizing: border-box; background: #fff; }
    .modern-input:focus, .modern-select:focus, .modern-textarea:focus { outline: none; border-color: #c8102e; }
    .modern-select { max-width: 400px; }
    .modern-textarea { resize: vertical; }

    .btn-submit { background: #c8102e; color: #fff; border: none; padding: 12px 24px; border-radius: 8px;
                  font-weight: bold; cursor: pointer; float: right; }
    .btn-submit:hover { background: #a90d27; }

    .search-row { display: flex; gap: 10px; margin-bottom: 20px; }
    .search-btn { background: #c8102e; color: #fff; border: none; padding: 0 24px; border-radius: 8px;
                  font-weight: bold; cursor: pointer; }
    .search-btn:hover { background: #a90d27; }

    .table-wrap { overflow-x: auto; border: 1px solid #eee; border-radius: 10px; margin-bottom: 20px; }
    .booking-table { width: 100%; border-collapse: collapse; font-size: 13px; }
    .booking-table th { background: #fafafa; color: #555; padding: 10px 12px; text-align: left;
                        border-bottom: 2px solid #ddd; white-space: nowrap; font-weight: 600; }
    .booking-table td { padding: 10px 12px; border-bottom: 1px solid #f0f0f0; vertical-align: middle; }
    .booking-table tr:hover td { background: #fff5f6; }
    .booking-table .col-nowrap { white-space: nowrap; }
    .booking-table .col-wrap { min-width: 140px; max-width: 200px; }
    .booking-table a { color: #c8102e; font-weight: 600; text-decoration: none; }
    .booking-table a:hover { text-decoration: underline; }
    .booking-table .pager td { padding: 12px; text-align: center; border-bottom: none; background: #fafafa; }
    .booking-table .pager a, .booking-table .pager span { display: inline-block; padding: 4px 10px; margin: 0 2px; border-radius: 6px; }
    .booking-table .pager span { background: #c8102e; color: #fff; }

    .search-row { display: flex; gap: 10px; margin-bottom: 20px; align-items: stretch; }
.search-row .modern-input { flex: 1; }
.search-row .search-btn,
.search-row .btn-clear { padding: 0 24px; white-space: nowrap; }

.btn-clear { background: #f0f0f0; color: #333; border: 1px solid #ddd; border-radius: 8px;
             font-weight: bold; cursor: pointer; }
.btn-clear:hover { background: #e4e4e4; }
.btn-submit + .btn-clear { float: right; margin-right: 10px; padding: 12px 24px; }
</style>

    <div class="form-page">
        <div class="page-title" style="font-size: 30px; font-weight: 700; margin-bottom: 5px;">File a Claim
           <asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>"
    SelectCommand="SELECT i.InspectionCode, i.RentalID, rt.BookingID AS BookingID, b.CustomerFullName,
                          b.Vehicle_make, b.Vehicle_model, b.VehicleVinNo,
                          i.InspectionType, i.InspectionDateTime, i.DamageFound,
                          i.[Damage Type] AS DamageType, i.DamageCharges
                   FROM [VEHICLE INSPECTION] AS i
                   INNER JOIN RENTAL AS rt ON rt.RentalID = i.RentalID
                   INNER JOIN BOOKING AS b ON b.BookingID = rt.BookingID
                   WHERE (@Search IS NULL
                          OR CAST(i.InspectionCode AS varchar(20)) LIKE @Search + '%'
                          OR CAST(i.RentalID AS varchar(20)) LIKE @Search + '%'
                          OR b.CustomerFullName LIKE @Search + '%'
                          OR b.VehicleVinNo LIKE @Search + '%')
                   ORDER BY i.InspectionDateTime DESC">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtSearchName" Name="Search" PropertyName="Text"
            Type="String" ConvertEmptyStringToNull="true" />
    </SelectParameters>
</asp:SqlDataSource>
        </div>
        <div class="page-subtitle" style="color: #777; margin-bottom: 25px;">Select an inspection report to file a claim against.</div>

        <div class="form-card">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" style="display:block; margin-bottom:15px;"></asp:Label>
          <!-- SQL DATASOURCE FOR INSERT (UPDATED TO CONTROLPARAMETERS) -->
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>" 
                InsertCommand="INSERT INTO CLAIM(BookingID, ClaimDescription, ClaimDate, ClaimType, ClaimStatus, ResponsibleParty, LastUpdated, VehicleVinNo, VehicleMake, VehicleModel) VALUES (@BookingID, @Desc , GETDATE(), @Type, @Status, @Party, GETDATE(), @VehicleVinNo, @VehicleMake, @VehicleModel)" SelectCommand="SELECT ClaimID, BookingID, ClaimDescription, ClaimDate, ClaimType, ClaimStatus, ResponsibleParty, VehicleVinNo, VehicleMake, VehicleModel, LastUpdated FROM CLAIM">
                <InsertParameters>
                    <asp:ControlParameter ControlID="hfSelectedBookingID" Name="BookingID" PropertyName="Value" Type="Int32" />
                    <asp:ControlParameter ControlID="txtDescription" Name="Desc" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddlClaimType" Name="Type" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ddlStatus" Name="Status" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ddlResponsibleParty" Name="Party" PropertyName="SelectedValue" Type="String" />
                     <asp:ControlParameter ControlID="hfVehicleVinNo" Name="VehicleVinNo" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="hfVehicleMake" Name="VehicleMake" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="hfVehicleModel" Name="VehicleModel" PropertyName="Value" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>

            <!-- SEARCH SECTION -->
            <div class="search-row">
    <asp:TextBox ID="txtSearchName" runat="server" CssClass="modern-input"
        placeholder="Search by Customer name"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearch_Click" />
    <asp:Button ID="btnClearSearch" runat="server" Text="Clear" CssClass="btn-clear"
        OnClick="btnClear_Click" CausesValidation="false" />
</div>
            <div class="table-wrap">
<asp:GridView ID="GVSearchResults" runat="server" AutoGenerateColumns="False" CssClass="booking-table"
    OnSelectedIndexChanged="GVSearchResults_SelectedIndexChanged"
    DataKeyNames="InspectionCode,BookingID,CustomerFullName,Vehicle_make,Vehicle_model,VehicleVinNo"
    GridLines="None" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="10"
    PagerStyle-CssClass="pager" EmptyDataText="No inspection reports found.">
    <Columns>
        <asp:CommandField ShowSelectButton="True" SelectText="Select" />
        <asp:BoundField DataField="InspectionCode" HeaderText="Insp. #" ItemStyle-CssClass="col-nowrap" />
        <asp:BoundField DataField="RentalID" HeaderText="Rental #" ItemStyle-CssClass="col-nowrap" />
        <asp:BoundField DataField="BookingID" HeaderText="Booking #" ItemStyle-CssClass="col-nowrap" />
        <asp:BoundField DataField="CustomerFullName" HeaderText="Customer" ItemStyle-CssClass="col-nowrap" />
        <asp:TemplateField HeaderText="Vehicle">
            <ItemTemplate><%# Eval("Vehicle_make") + " " + Eval("Vehicle_model") %></ItemTemplate>
            <ItemStyle CssClass="col-nowrap" />
        </asp:TemplateField>
        <asp:BoundField DataField="VehicleVinNo" HeaderText="VIN" ItemStyle-CssClass="col-nowrap" />
        <asp:BoundField DataField="InspectionType" HeaderText="Type" ItemStyle-CssClass="col-nowrap" />
        <asp:BoundField DataField="InspectionDateTime" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd HH:mm}" ItemStyle-CssClass="col-nowrap" />
        <asp:BoundField DataField="DamageType" HeaderText="Damage" ItemStyle-CssClass="col-wrap" />
        <asp:BoundField DataField="DamageCharges" HeaderText="Charges" DataFormatString="R {0:N2}" ItemStyle-CssClass="col-nowrap" />
    </Columns>
</asp:GridView>
</div>

            <!-- SELECTED BOOKING BANNER -->
            <asp:Panel ID="pnlSelectedBooking" runat="server" Visible="false" CssClass="selected-banner">
                <i class="fas fa-check-circle"></i> Selected Booking: <asp:Label ID="lblSelectedBooking" runat="server"></asp:Label>
                <asp:HiddenField ID="hfSelectedBookingID" runat="server" />
                 <asp:HiddenField ID="hfVehicleVinNo" runat="server" />
                 <asp:HiddenField ID="hfVehicleMake" runat="server" />
    <asp:HiddenField ID="hfVehicleModel" runat="server" />
            </asp:Panel>

            <!-- CLAIM FORM (Hidden until a booking is selected) -->
            <asp:Panel ID="pnlClaimForm" runat="server" Visible="false">
                <hr style="border-top: 1px solid #eee; margin: 20px 0;" />
                
                <div class="form-group">
                    <label class="form-label">Responsible Party</label>
                    <asp:DropDownList ID="ddlResponsibleParty" runat="server" CssClass="modern-select">
                        <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
                        <asp:ListItem Text="Insurance" Value="Insurance"></asp:ListItem>
                        <asp:ListItem Text="Third Party" Value="Third Party"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label">Claim Type</label>
                    <asp:DropDownList ID="ddlClaimType" runat="server" CssClass="modern-select">
                        <asp:ListItem Text="Vehicle Damage" Value="Vehicle Damage"></asp:ListItem>
                        <asp:ListItem Text="Theft & Hijacking" Value="Theft & Hijacking"></asp:ListItem>
                        <asp:ListItem Text="Collision" Value="Collision"></asp:ListItem>
                        <asp:ListItem Text="Bodywork" Value="Bodywork"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label">Claim Description *</label>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="modern-textarea" placeholder="Describe the incident..."></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Claim Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="modern-select">
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                        <asp:ListItem Text="Under Review" Value="Under Review"></asp:ListItem>
                        <asp:ListItem Text="Approved" Value="Approved"></asp:ListItem>
                        <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div style="overflow: hidden; margin-top: 20px;">
                    <asp:Button ID="btnSubmitClaim" runat="server" Text="Submit Claim" CssClass="btn-submit" OnClick="btnSubmitClaim_Click" />
                    <asp:Button ID="btnClearForm" runat="server" Text="Clear" CssClass="btn-clear"
    OnClick="btnClear_Click" CausesValidation="false" />
                </div>
            </asp:Panel>

        </div>
    </div>
</asp:Content>