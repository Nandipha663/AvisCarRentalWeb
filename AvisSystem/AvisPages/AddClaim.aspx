<%@ Page Title="Add Claim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddClaim.aspx.cs" Inherits="AvisSystem.AvisPages.AddClaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .form-page { padding: 30px; background: #f7f7f7; min-height: calc(100vh - 70px); }
        .form-card { background: white; padding: 30px; border-radius: 12px; border: 1px solid #e5e5e5; max-width: 1000px; box-shadow: 0 3px 10px rgba(0,0,0,0.05); margin: 0 auto; }
        .form-group { margin-bottom: 20px; }
        .form-label { font-weight: 600; display: block; margin-bottom: 8px; color: #333; }
        .modern-input, .modern-select, .modern-textarea { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 8px; font-size: 14px; box-sizing: border-box; }
        .modern-input:focus, .modern-select:focus, .modern-textarea:focus { outline: none; border-color: #c8102e; }
        .btn-submit { background: #c8102e; color: white; border: none; padding: 12px 24px; border-radius: 8px; font-weight: bold; cursor: pointer; float: right; }
        .btn-submit:hover { background: #a90d27; }
        
        /* SEARCH & GRID STYLES */
        .search-row { display: flex; gap: 10px; margin-bottom: 20px; }
        .search-btn { background: #c8102e; color: white; border: none; padding: 0 20px; border-radius: 8px; font-weight: bold; cursor: pointer; }
        
        .booking-table { width: 100%; border-collapse: collapse; margin-bottom: 20px; font-size: 13px; }
        .booking-table th { background: #fafafa; color: #555; padding: 10px; text-align: left; border-bottom: 2px solid #ddd; }
        .booking-table td { padding: 10px; border-bottom: 1px solid #eee; }
        .booking-table tr:hover { background: #fff5f6; }
        
        .selected-banner { background: #e8f7ed; color: #218838; padding: 15px; border-radius: 8px; font-weight: bold; margin-bottom: 20px; border: 1px solid #c3e6cb; }
    </style>

    <div class="form-page">
        <div class="page-title" style="font-size: 30px; font-weight: 700; margin-bottom: 5px;">File a Claim<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>" SelectCommand="SELECT BookingID, CustomerFullName, Vehicle_make, Vehicle_model, VehicleVinNo FROM BOOKING WHERE (CustomerFullName LIKE @CustomerFullName + '%') ORDER BY CustomerFullName">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearchName" Name="CustomerFullName" PropertyName="Text" />
            </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="page-subtitle" style="color: #777; margin-bottom: 25px;">Search for a customer's booking to file a new claim.</div>

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
                <asp:TextBox ID="txtSearchName" runat="server" CssClass="modern-input" placeholder="Type part of a customer's name (e.g. 'Joh')..." style="flex: 1;"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearch_Click" />
            </div>

            <!-- RESULTS GRID (Only shows if search finds results) -->
            <asp:GridView ID="GVSearchResults" runat="server" AutoGenerateColumns="False" CssClass="booking-table" 
                OnSelectedIndexChanged="GVSearchResults_SelectedIndexChanged" DataKeyNames="BookingID" GridLines="None" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="BookingID" HeaderText="BookingID" InsertVisible="False" ReadOnly="True" SortExpression="BookingID" />
                    <asp:BoundField DataField="CustomerFullName" HeaderText="CustomerFullName" SortExpression="CustomerFullName" />
                    <asp:BoundField DataField="Vehicle_make" HeaderText="Vehicle_make" SortExpression="Vehicle_make" />
                    <asp:BoundField DataField="Vehicle_model" HeaderText="Vehicle_model" SortExpression="Vehicle_model" />
                    <asp:BoundField DataField="VehicleVinNo" HeaderText="VehicleVinNo" SortExpression="VehicleVinNo" />
                </Columns>
            </asp:GridView>

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
                </div>
            </asp:Panel>

        </div>
    </div>
</asp:Content>