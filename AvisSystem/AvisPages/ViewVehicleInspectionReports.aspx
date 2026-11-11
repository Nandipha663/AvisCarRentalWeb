<%@ Page Title="View Inspections" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewVehicleInspectionReports.aspx.cs" Inherits="AvisSystem.AvisPages.ViewVehicleInspectionReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .inspection-page { padding: 30px; background: #f7f7f7; min-height: calc(100vh - 70px); }
        .table-card { background: white; padding: 30px; border-radius: 12px; border: 1px solid #e5e5e5; max-width: 1400px; box-shadow: 0 3px 10px rgba(0,0,0,0.05); margin: 0 auto; overflow-x: auto; }
        
        /* FILTER STYLES */
        .filter-card { background: white; border: 1px solid #e5e5e5; border-radius: 10px; padding: 20px; margin-bottom: 20px; max-width: 1400px; margin-left: auto; margin-right: auto; box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
        .filter-row { display: flex; gap: 15px; align-items: flex-end; flex-wrap: wrap; }
        .filter-group { flex: 1; min-width: 150px; }
        .filter-group label { display: block; font-size: 12px; font-weight: 700; color: #555; margin-bottom: 5px; text-transform: uppercase; }
        .filter-input { width: 100%; height: 42px; padding: 0 12px; border: 1px solid #ddd; border-radius: 7px; font-size: 13px; box-sizing: border-box; outline: none; }
        .filter-input:focus { border-color: #c8102e; }
        .filter-btn { height: 42px; background: #c8102e; color: white; border: none; padding: 0 20px; border-radius: 7px; font-weight: bold; cursor: pointer; }
        .clear-btn { height: 42px; background: #fff; color: #555; border: 1px solid #ddd; padding: 0 20px; border-radius: 7px; font-weight: bold; cursor: pointer; }
        
        /* TABLE STYLES */
        .inspection-table { width: 100%; border-collapse: collapse; font-size: 13px; }
        .inspection-table th { background: #c8102e; color: white; padding: 15px 10px; text-align: left; font-weight: 600; }
        .inspection-table td { padding: 12px 10px; border-bottom: 1px solid #eee; color: #333; }
        .inspection-table tr:hover { background: #fff5f6; }
        
        .inspection-table input[type="submit"], .inspection-table a { padding: 5px 10px; border-radius: 4px; font-weight: bold; text-decoration: none; font-size: 12px; cursor: pointer; }
        .inspection-table input[value="Update"] { background: #28a745; color: white; border: none; }
        .inspection-table input[value="Cancel"] { background: #6c757d; color: white; border: none; margin-left: 5px; }
        .inspection-table a[href*="Edit"] { color: #007bff; margin-right: 10px; }
        .inspection-table a[href*="Delete"] { color: #dc3545; }
    </style>

    <div class="inspection-page">
        <div style="max-width: 1400px; margin: 0 auto 20px auto;">
            <h2 style="font-weight: 700; margin: 0 0 5px 0;">Vehicle Inspection Reports</h2>
            <p style="color: #777; margin: 0;">Search, filter, edit, or delete inspection records.<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>" DeleteCommand="DELETE FROM [VEHICLE INSPECTION] WHERE (InspectionCode = @InspectionCode)" SelectCommand="SELECT InspectionCode, RentalID, EmployeeName, InspectionType, OdometerReading, FuelLevel, DamageFound, DamageDescription, BranchName, InspectionDateTime FROM [VEHICLE INSPECTION] WHERE (@FromDate IS NULL OR InspectionDateTime &gt;= @FromDate) AND (@ToDate IS NULL OR InspectionDateTime &lt; DATEADD(day, 1, @ToDate)) AND (@EmpName = '' OR EmployeeName LIKE '%' + @EmpName + '%') AND (@Type = 'All' OR InspectionType = @Type) AND (@Branch = 'All' OR BranchName = @Branch) ORDER BY InspectionDateTime" UpdateCommand="UPDATE [VEHICLE INSPECTION] SET OdometerReading = @OdometerReading, InspectionType = @InspectionType, FuelLevel = @FuelLevel, DamageFound = @DamageFound, DamageDescription = @DamageDescription WHERE (InspectionCode = @InspectionCode)">
                <DeleteParameters>
                    <asp:Parameter Name="InspectionCode" />
                </DeleteParameters>
                <SelectParameters>
    <asp:ControlParameter ControlID="txtFromDate" Name="FromDate" PropertyName="Text" Type="DateTime" ConvertEmptyStringToNull="true" />
    <asp:ControlParameter ControlID="txtToDate" Name="ToDate" PropertyName="Text" Type="DateTime" ConvertEmptyStringToNull="true" />
                       <asp:ControlParameter ControlID="txtSearchEmp" Name="EmpName" PropertyName="Text" Type="String" DefaultValue="%" />
    <asp:ControlParameter ControlID="ddlType" Name="Type" PropertyName="SelectedValue" Type="String" DefaultValue="All" />
    <asp:ControlParameter ControlID="ddlBranch" Name="Branch" PropertyName="SelectedValue" Type="String" DefaultValue="All" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="OdometerReading" />
                    <asp:Parameter Name="InspectionType" />
                    <asp:Parameter Name="FuelLevel" />
                    <asp:Parameter Name="DamageFound" />
                    <asp:Parameter Name="DamageDescription" />
                    <asp:Parameter Name="InspectionCode" />
                </UpdateParameters>
                </asp:SqlDataSource>
            </p>
        </div>

     
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
                <!-- FILTERS -->
                <div class="filter-card">
                    <div class="filter-row">
                        
                        <!-- Textbox Search for Employee -->
                        <div class="filter-group" style="flex: 2;">
                            <label>Employee Name (Filed By)</label>
                            <asp:TextBox ID="txtSearchEmp" runat="server" CssClass="filter-input" placeholder="Type a partial name (e.g. 'Than')..."></asp:TextBox>
                        </div>

                      <!-- DropDown Filter for Branch -->
<asp:DropDownList ID="ddlBranch" runat="server" CssClass="filter-input">
</asp:DropDownList>

                        <!-- Dropdown Filter for Inspection Type -->
                        <div class="filter-group">
                            <label>Inspection Type</label>
                            <asp:DropDownList ID="ddlType" runat="server" CssClass="filter-input">
                                <asp:ListItem Text="-- All Types --" Value="All"></asp:ListItem>
                                <asp:ListItem Text="Pickup" Value="Pickup"></asp:ListItem>
                                <asp:ListItem Text="Return" Value="Return"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Date Filters -->
                        <div class="filter-group">
                            <label>From Date</label>
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="filter-input" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="filter-group">
                            <label>To Date</label>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="filter-input" TextMode="Date"></asp:TextBox>
                        </div>

                        <div style="display: flex; gap: 10px; margin-top: 15px;">
                            <asp:Button ID="btnFilter" runat="server" Text="Filter" CssClass="filter-btn" OnClick="btnFilter_Click" />
                            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="clear-btn" OnClick="btnClear_Click" />
                        </div>
                    </div>
                </div>

                <div class="table-card">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="true" style="display:block; margin-bottom:15px;"></asp:Label>
                           <asp:GridView ID="GVInspections" runat="server" 
                        DataSourceID="SqlDataSource1" 
                        AutoGenerateColumns="False"
                        CssClass="inspection-table" 
                        GridLines="None" 
                        AutoGenerateEditButton="True" 
                        AutoGenerateDeleteButton="True"
                        OnRowUpdating="GVInspections_RowUpdating"
                        OnRowDeleting="GVInspections_RowDeleting" AllowPaging="True" DataKeyNames="InspectionCode">
                               <Columns>
                                   <asp:BoundField DataField="InspectionCode" HeaderText="InspectionCode" InsertVisible="False" ReadOnly="True" SortExpression="InspectionCode" />
                                   <asp:BoundField DataField="RentalID" HeaderText="RentalID" SortExpression="RentalID" />
                                   <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                                   <asp:BoundField DataField="InspectionType" HeaderText="InspectionType" SortExpression="InspectionType" />
                                   <asp:BoundField DataField="OdometerReading" HeaderText="OdometerReading" SortExpression="OdometerReading" />
                                   <asp:BoundField DataField="FuelLevel" HeaderText="FuelLevel" SortExpression="FuelLevel" />
                                   <asp:BoundField DataField="DamageFound" HeaderText="DamageFound" SortExpression="DamageFound" />
                                   <asp:BoundField DataField="DamageDescription" HeaderText="DamageDescription" SortExpression="DamageDescription" />
                                   <asp:BoundField DataField="BranchName" HeaderText="BranchName" SortExpression="BranchName" />
                                   <asp:BoundField DataField="InspectionDateTime" HeaderText="InspectionDateTime" SortExpression="InspectionDateTime" />
                               </Columns>
                    </asp:GridView>
                       </div>
                </div>
                 </ContentTemplate>
            </asp:UpdatePanel>
        </div>
 
</asp:Content>