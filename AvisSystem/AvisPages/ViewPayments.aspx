<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewPayments.aspx.cs" Inherits="AvisSystem.AvisPages.ViewPayments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
        <h2>Payments</h2>
        <p>All payments recorded for bookings.</p>

        <p>
            <asp:HyperLink ID="lnkAddPayment" runat="server"
                NavigateUrl="~/AvisPages/AddPayment.aspx"
                Text="+ Record a payment (Pay later bookings)"
                CssClass="btn" BackColor="#C8102E" ForeColor="White"
                Style="display:inline-block; padding:10px 18px; text-decoration:none; border-radius:4px;" />
        </p>

        <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>

        <div style="margin-bottom:16px;">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"
                placeholder="Search by booking, invoice, customer or type"
                Style="display:inline-block; width:340px;"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn"
                BackColor="#C8102E" ForeColor="White" OnClick="btnSearch_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn"
                OnClick="btnClear_Click" />
        </div>

        <asp:Label ID="lblSummary" runat="server" Font-Bold="true"></asp:Label>

        <asp:GridView ID="gvPayments" runat="server" AutoGenerateColumns="False"
            CssClass="table table-striped" GridLines="None" Width="100%"
            AllowPaging="True" PageSize="15" OnPageIndexChanging="gvPayments_PageIndexChanging"
            EmptyDataText="No payments have been recorded yet.">
            <Columns>
                <asp:BoundField DataField="PaymentID"          HeaderText="Payment No." />
                <asp:BoundField DataField="InvoiceID"          HeaderText="Invoice" />
                <asp:BoundField DataField="BookingID"          HeaderText="Booking No." />
                <asp:BoundField DataField="CustomerName"       HeaderText="Customer" />
                <asp:BoundField DataField="Vehicle"            HeaderText="Vehicle" />
                <asp:BoundField DataField="PaymentType"        HeaderText="Type" />
                <asp:BoundField DataField="PaymentAmount"      HeaderText="Amount (R)"
                                DataFormatString="{0:N2}" />
                <asp:BoundField DataField="PaymentDate"        HeaderText="Date paid"
                                DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="PaymentStatus"      HeaderText="Status" />
                <asp:BoundField DataField="PaymentDescription" HeaderText="Description" />
            </Columns>
            <HeaderStyle BackColor="#C8102E" ForeColor="White" Font-Bold="True" />
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
