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
    <asp:ListItem Value="" Text="-- Select payment method --" />
    <asp:ListItem Value="Credit Card" Text="Credit Card" />
    <asp:ListItem Value="Debit Card" Text="Debit Card" />
    <asp:ListItem Value="EFT" Text="EFT" />
    <asp:ListItem Value="Cash" Text="Cash" />
</asp:DropDownList>
<style>
            
    .pm-panel { margin: 16px 0; padding: 18px 20px; background: #fafafa; border: 1px solid #e2e2e2; border-radius: 12px; }
    .pm-panel[hidden] { display: none; }
    .pm-panel h4 { margin: 0 0 14px; font-size: 18px; }
    .pm-field { margin-bottom: 14px; }
    .pm-field label { display: block; margin-bottom: 6px; font-size: 13px; font-weight: 700; }
    .pm-field input {
        width: 100%; padding: 12px 14px; font: inherit; background: #fff;
        border: 1px solid #d6d6d6; border-radius: 10px;
    }
    .pm-field input:focus { outline: 3px solid #1b1b1b; outline-offset: 1px; }
    .pm-two { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
    @media (max-width: 520px) { .pm-two { grid-template-columns: 1fr; } }
 
    .pm-bank { background: #fff; border: 1px solid #e2e2e2; border-radius: 10px; padding: 4px 18px; }
    .pm-bank .row { display: flex; justify-content: space-between; gap: 16px; padding: 12px 0; border-bottom: 1px solid #ececec; }
    .pm-bank .row:last-child { border-bottom: 0; }
    .pm-bank .k { color: #6b6b6b; }
    .pm-bank .v { font-weight: 700; text-align: right; }
    .pm-note { margin: 12px 0 0; font-size: 13px; color: #6b6b6b; }
</style>
 
<%-- Card details (Credit Card / Debit Card) --%>
<div id="pmCard" class="pm-panel" hidden>
    <h4>Card details</h4>
 
    <div class="pm-field">
        <label for="<%= txtCardName.ClientID %>">Cardholder name</label>
        <asp:TextBox ID="txtCardName" runat="server" MaxLength="60" placeholder="Enter cardholder name"
            autocomplete="cc-name" />
    </div>
 
    <div class="pm-field">
        <label for="<%= txtCardNumber.ClientID %>">Card number</label>
        <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="23" placeholder="1234 5678 9012 3456"
            autocomplete="cc-number" inputmode="numeric" />
    </div>
 
    <div class="pm-two">
        <div class="pm-field">
            <label for="<%= txtExpiry.ClientID %>">Expiry date</label>
            <asp:TextBox ID="txtExpiry" runat="server" MaxLength="5" placeholder="MM/YY"
                autocomplete="cc-exp" inputmode="numeric" />
        </div>
        <div class="pm-field">
            <label for="<%= txtCvv.ClientID %>">CVV</label>
            <asp:TextBox ID="txtCvv" runat="server" MaxLength="4" placeholder="CVV" TextMode="Password"
                autocomplete="cc-csc" inputmode="numeric" />
        </div>
    </div>
</div>
 
<%-- AVIS banking details (EFT) --%>
<div id="pmEft" class="pm-panel" hidden>
    <h4>AVIS banking details</h4>
    <div class="pm-bank">
        <div class="row"><span class="k">Account name</span><span class="v">AVIS</span></div>
        <div class="row"><span class="k">Bank</span><span class="v">Standard Bank</span></div>
        <div class="row"><span class="k">Account number</span><span class="v">051234567</span></div>
        <div class="row"><span class="k">Reference</span><span class="v"><asp:Label ID="lblBankRef" runat="server" /></span></div>
    </div>
    <p class="pm-note">Please use your booking number as the payment reference.</p>
</div>
 
<%-- Cash --%>
<div id="pmCash" class="pm-panel" hidden>
    <h4>Pay with cash</h4>
    <p class="pm-note" style="margin:0">Pay in cash at the AVIS counter when you collect the vehicle.</p>
</div>
 
<script>
(function () {
    var method = document.getElementById('<%= ddlPaymentType.ClientID %>');
    var card = document.getElementById('pmCard');
    var eft  = document.getElementById('pmEft');
    var cash = document.getElementById('pmCash');
    var num  = document.getElementById('<%= txtCardNumber.ClientID %>');
    var exp  = document.getElementById('<%= txtExpiry.ClientID %>');
    var cvv  = document.getElementById('<%= txtCvv.ClientID %>');

        function sync() {
            var v = method.value;
            card.hidden = !(v === 'Credit Card' || v === 'Debit Card');
            eft.hidden = v !== 'EFT';
            cash.hidden = v !== 'Cash';
        }

        num.addEventListener('input', function () {
            var d = num.value.replace(/\D/g, '').slice(0, 19);
            num.value = d.replace(/(.{4})/g, '$1 ').trim();
        });
        exp.addEventListener('input', function () {
            var d = exp.value.replace(/\D/g, '').slice(0, 4);
            exp.value = d.length > 2 ? d.slice(0, 2) + '/' + d.slice(2) : d;
        });
        cvv.addEventListener('input', function () {
            cvv.value = cvv.value.replace(/\D/g, '').slice(0, 4);
        });

        method.addEventListener('change', sync);
        sync(); // also runs after a postback so the right panel stays open
    })();
</script>
 


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
