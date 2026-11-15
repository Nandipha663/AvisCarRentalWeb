<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPayment.aspx.cs" Inherits="AvisSystem.AvisPages.AddPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .ap-page { max-width: 1000px; margin: 30px auto; padding: 0 15px; }
    .ap-search { display: flex; gap: 10px; margin: 14px 0 20px; }
    .ap-search input[type=text] { flex: 1; padding: 11px; border: 1px solid #ccc; border-radius: 6px; }
    .ap-btn { background: #C8102E; color: #fff; border: 0; border-radius: 6px; padding: 11px 26px;
        font-weight: 700; cursor: pointer; }
    .ap-btn:hover { background: #a00d25; }
    .ap-card { border: 1px solid #ddd; border-radius: 10px; overflow: hidden; background: #fff;
        box-shadow: 0 2px 8px rgba(0,0,0,.06); margin: 24px 0; }
    .ap-head { background: #C8102E; color: #fff; padding: 12px 22px; font-size: 19px; font-weight: 700; }
    .ap-row { display: flex; justify-content: space-between; padding: 10px 22px; border-bottom: 1px solid #eee; }
    .ap-row span { color: #777; }
    .ap-form { padding: 6px 22px 22px; }
    .ap-form label { font-weight: 700; display: block; margin: 14px 0 6px; }
    .ap-form select, .ap-form input[type=text] { width: 100%; padding: 11px; border: 1px solid #ccc; border-radius: 6px; }
    .ap-ok  { background: #d7f0dd; border: 1px solid #8fd19e; border-radius: 8px; padding: 14px 18px; margin: 16px 0; font-weight: 600; }
    .ap-err { background: #fde2e4; border: 1px solid #f5a3ab; border-radius: 8px; padding: 14px 18px; margin: 16px 0; font-weight: 600; }
</style>

<div class="ap-page">
    <h1>Record a payment</h1>
    <p style="color:#666;">Bookings waiting for payment. Select one to record its payment.</p>

    <asp:Panel ID="pnlMessage" runat="server" Visible="false">
        <asp:Label ID="lblMessage" runat="server" />
    </asp:Panel>

    <div class="ap-search">
        <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by booking number or customer name" />
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="ap-btn"
            OnClick="btnSearch_Click" CausesValidation="false" />
    </div>

    <asp:GridView ID="GVPending" runat="server" AutoGenerateColumns="False"
        DataKeyNames="BookingID" AutoGenerateSelectButton="True" SelectText="Select"
        OnSelectedIndexChanged="GVPending_SelectedIndexChanged"
        EmptyDataText="There are no bookings waiting for payment."
        CssClass="table table-striped" GridLines="None" CellPadding="8">
        <Columns>
            <asp:BoundField DataField="BookingID"        HeaderText="Booking No." />
            <asp:BoundField DataField="CustomerFullName" HeaderText="Customer" />
            <asp:BoundField DataField="Vehicle"          HeaderText="Vehicle" />
            <asp:BoundField DataField="Amount"           HeaderText="Amount (R)" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="PayBy"            HeaderText="Pay before"
                            DataFormatString="{0:dd MMM yyyy HH:mm}" NullDisplayText="—" />
            <asp:BoundField DataField="TimeLeft"         HeaderText="Time left" />
        </Columns>
        <HeaderStyle BackColor="#C8102E" ForeColor="White" Font-Bold="True" />
        <SelectedRowStyle BackColor="#fde2e4" />
    </asp:GridView>

    <asp:Panel ID="pnlPay" runat="server" Visible="false" CssClass="ap-card">
        <div class="ap-head">Payment for booking <asp:Label ID="lblBookingNo" runat="server" /></div>
        <div class="ap-row"><span>Customer</span><b><asp:Label ID="lblCustomer" runat="server" /></b></div>
        <div class="ap-row"><span>Vehicle</span><b><asp:Label ID="lblVehicle" runat="server" /></b></div>
        <div class="ap-row"><span>Amount to pay</span><b><asp:Label ID="lblAmount" runat="server" /></b></div>

        <div class="ap-form">
            <label for="<%= ddlPaymentType.ClientID %>">Payment method *</label>
            <asp:DropDownList ID="ddlPaymentType" runat="server">
                <asp:ListItem Value="">-- Select payment method --</asp:ListItem>
                <asp:ListItem>Cash</asp:ListItem>
                <asp:ListItem>Credit Card</asp:ListItem>
                <asp:ListItem>Debit Card</asp:ListItem>
                <asp:ListItem>EFT</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvType" runat="server" ControlToValidate="ddlPaymentType"
                InitialValue="" ErrorMessage="Please choose a payment method." ForeColor="#C8102E" Display="Dynamic" />

            <label for="<%= txtDescription.ClientID %>">Description (optional)</label>
            <asp:TextBox ID="txtDescription" runat="server" MaxLength="255" />

            <asp:Button ID="btnSave" runat="server" Text="Record payment" CssClass="ap-btn"
                Style="margin-top:18px;" OnClick="btnSave_Click" />
        </div>
    </asp:Panel>
</div>

    <h3>This is Add payment form</h3>
</asp:Content>
