<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="AvisSystem.CustomerPages.MyBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-width:1100px; margin:30px auto;">
        <h2>My Bookings</h2>
        <p style="color:#666;">Your reservations and their current status.</p>

        <asp:Label ID="lblSummary" runat="server" Font-Bold="true" />

        <asp:GridView ID="GVMyBookings" runat="server" AutoGenerateColumns="False"
            OnRowDataBound="GVMyBookings_RowDataBound"
            EmptyDataText="You have not made any bookings yet."
            CssClass="table table-striped" GridLines="None" CellPadding="8">
            <Columns>
                <asp:BoundField DataField="BookingID"          HeaderText="Booking No." />
                <asp:BoundField DataField="Vehicle"            HeaderText="Vehicle" />
                <asp:BoundField DataField="RegistrationNo"     HeaderText="Registration" />
                <asp:BoundField DataField="PickUpBranchName"   HeaderText="Pick-up branch" />
                <asp:BoundField DataField="DropOffBranchName"  HeaderText="Drop-off branch" />
                <asp:BoundField DataField="PickUpDate"         HeaderText="Pick-up date"
                                DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="ExpectedReturnDate" HeaderText="Return date"
                                DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="InvoiceAmount"      HeaderText="Amount (R)"
                                DataFormatString="{0:N2}" />
                <asp:BoundField DataField="Status"             HeaderText="Status" />
            </Columns>
            <HeaderStyle BackColor="#C8102E" ForeColor="White" Font-Bold="True" />
        </asp:GridView>
    </div>
</asp:Content>
