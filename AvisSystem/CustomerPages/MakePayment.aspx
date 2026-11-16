<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakePayment.aspx.cs" Inherits="AvisSystem.CustomerPages.MakePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .pay-page { max-width: 760px; margin: 30px auto; padding: 0 15px; }
    .pay-card { border: 1px solid #ddd; border-radius: 10px; overflow: hidden; background: #fff;
        box-shadow: 0 2px 8px rgba(0,0,0,.06); margin-bottom: 22px; }
    .pay-head { background: #C8102E; color: #fff; padding: 14px 24px; font-size: 20px; font-weight: 700; }
    .pay-row { display: flex; justify-content: space-between; padding: 12px 24px; border-bottom: 1px solid #eee; }
    .pay-row span { color: #777; }
    .pay-total { font-size: 24px; color: #C8102E; font-weight: 700; padding: 16px 24px; text-align: right; }
    .pay-form { padding: 0 24px 24px; }
    .pay-form label { font-weight: 700; display: block; margin: 16px 0 6px; }
    .pay-form select { width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 6px; }
    .btn-pay { background: #C8102E; color: #fff; border: 0; border-radius: 6px; padding: 13px 34px;
        font-weight: 700; font-size: 16px; cursor: pointer; margin: 18px 12px 0 0; }
    .btn-pay:hover { background: #a00d25; }
    .btn-later { background: #fff; color: #C8102E; border: 2px solid #C8102E; border-radius: 6px;
        padding: 11px 30px; font-weight: 700; font-size: 16px; cursor: pointer; margin-top: 18px; }
    .pay-note { background: #fff3cd; border: 1px solid #ffe08a; border-radius: 8px;
        padding: 12px 16px; margin-top: 18px; font-size: 14px; }
    .pay-msg { background: #fde2e4; border: 1px solid #f5a3ab; border-radius: 8px;
        padding: 14px 18px; margin-bottom: 18px; font-weight: 600; }
</style>

<div class="pay-page">
    <h1>Booking summary and payment</h1>

    <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="pay-msg">
        <asp:Label ID="lblMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlSummary" runat="server" CssClass="pay-card">
        <div class="pay-head">Your booking</div>
        <div class="pay-row"><span>Vehicle</span><b><asp:Label ID="lblVehicle" runat="server" /></b></div>
        <div class="pay-row"><span>Pick-up location</span><b><asp:Label ID="lblPickupLoc" runat="server" /></b></div>
        <div class="pay-row"><span>Pick-up date</span><b><asp:Label ID="lblPickupDate" runat="server" /></b></div>
        <div class="pay-row"><span>Return location</span><b><asp:Label ID="lblReturnLoc" runat="server" /></b></div>
        <div class="pay-row"><span>Return date</span><b><asp:Label ID="lblReturnDate" runat="server" /></b></div>
        <div class="pay-total">Total: <asp:Label ID="lblTotal" runat="server" /></div>
    </asp:Panel>

    <asp:Panel ID="pnlPay" runat="server" CssClass="pay-card">
        <div class="pay-head">Payment</div>
        <div class="pay-form">
            <label for="<%= ddlPaymentType.ClientID %>">Payment method</label>
            <asp:DropDownList ID="ddlPaymentType" runat="server">
                <asp:ListItem Value="">-- Select payment method --</asp:ListItem>
                <asp:ListItem>Credit Card</asp:ListItem>
                <asp:ListItem>Debit Card</asp:ListItem>
                <asp:ListItem>EFT</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="btnPayNow" runat="server" Text="Pay now" CssClass="btn-pay" OnClick="btnPayNow_Click" />
            <asp:Button ID="btnPayLater" runat="server" Text="Pay later" CssClass="btn-later" OnClick="btnPayLater_Click" />

            <asp:Panel ID="pnlLaterNote" runat="server" CssClass="pay-note">
                <b>Pay later:</b> the vehicle is held for you, but you have only <b>24 hours</b>
                to pay. If payment is not made in time, the booking is cancelled automatically
                and the vehicle is released.
            </asp:Panel>
        </div>
    </asp:Panel>
</div>
    
</asp:Content>
