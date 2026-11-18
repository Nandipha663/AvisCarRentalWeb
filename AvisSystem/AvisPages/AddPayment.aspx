<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPayment.aspx.cs" Inherits="AvisSystem.AvisPages.AddPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <style>
        .pay-wrap { max-width: 620px; padding-bottom: 48px; }
        .pay-wrap h3 { margin: 0 0 4px; font-size: 32px; }
        .pay-sub { margin: 0 0 22px; color: #6b6b6b; }
        .pay-wrap label { display: block; margin: 18px 0 6px; font-weight: 700; }
        .pay-wrap select {
            width: 100%; padding: 11px 12px; font: inherit;
            border: 1px solid #bdbdbd; border-radius: 3px; background: #fff;
        }
        .pay-wrap select:focus, .pay-btn:focus, .pay-link:focus { outline: 3px solid #1b1b1b; outline-offset: 2px; }

        .pay-summary { margin-top: 22px; border: 1px solid #e2e2e2; border-left: 5px solid #c8102e; border-radius: 3px; }
        .pay-row { display: flex; justify-content: space-between; gap: 16px; padding: 10px 14px; border-bottom: 1px solid #e2e2e2; }
        .pay-row:nth-child(even) { background: #f1f1f1; }
        .pay-row:last-child { border-bottom: 0; }
        .pay-row .k { color: #6b6b6b; }
        .pay-row .v { font-weight: 700; text-align: right; }
        .pay-row .amount { font-size: 26px; color: #c8102e; }

        .pay-actions { display: flex; align-items: center; gap: 18px; margin-top: 26px; }
        .pay-btn {
            display: inline-block; background: #c8102e; color: #fff; border: 0; border-radius: 3px;
            padding: 12px 22px; font: inherit; font-weight: 700; cursor: pointer; text-decoration: none;
        }
        .pay-btn:hover { background: #a00d25; color: #fff; }
        .pay-btn[disabled] { background: #9a9a9a; cursor: default; }
        .pay-link { color: #1b1b1b; text-decoration: none; }
        .pay-link:hover { text-decoration: underline; }

        .pay-msg { margin-top: 22px; padding: 12px 14px; border-radius: 3px; }
        .pay-msg.ok  { background: #e8f5ec; color: #1e7b3a; border: 1px solid #b9dcc3; }
        .pay-msg.err { background: #fdecee; color: #a00d25; border: 1px solid #f2b8c0; }
        .pay-empty { margin-top: 22px; padding: 18px; background: #f1f1f1; border-radius: 3px; }
    </style>

    <div class="pay-wrap">
        <h3>Record a payment</h3>
        <p class="pay-sub">Take payment for a booking that was reserved as pay later.</p>

        <asp:Panel ID="pnlMessage" runat="server" Visible="false" role="alert">
            <asp:Label ID="lblMessage" runat="server" />
        </asp:Panel>

        <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="pay-empty">
            There are no pending bookings to pay.
            <asp:HyperLink runat="server" NavigateUrl="~/AvisPages/ViewPayments" CssClass="pay-link">Back to payments</asp:HyperLink>
        </asp:Panel>

        <asp:Panel ID="pnlForm" runat="server">
            <label for="<%= ddlBooking.ClientID %>">Pending booking</label>
            <asp:DropDownList ID="ddlBooking" runat="server" AutoPostBack="true"
                OnSelectedIndexChanged="ddlBooking_SelectedIndexChanged" />

            <asp:Panel ID="pnlDetails" runat="server" CssClass="pay-summary" Visible="false">
                <div class="pay-row"><span class="k">Customer</span><span class="v"><asp:Label ID="lblCustomer" runat="server" /></span></div>
                <div class="pay-row"><span class="k">Vehicle (VIN)</span><span class="v"><asp:Label ID="lblVin" runat="server" /></span></div>
                <div class="pay-row"><span class="k">Amount due</span><span class="v amount"><asp:Label ID="lblAmount" runat="server" /></span></div>
            </asp:Panel>

            <label for="<%= ddlType.ClientID %>">Payment type</label>
            <asp:DropDownList ID="ddlType" runat="server">
                <asp:ListItem Value="">Select a payment type</asp:ListItem>
                <asp:ListItem>Cash</asp:ListItem>
                <asp:ListItem>EFT</asp:ListItem>
                <asp:ListItem>Debit Card</asp:ListItem>
                <asp:ListItem>Credit Card</asp:ListItem>
            </asp:DropDownList>

            <div class="pay-actions">
                <%-- Disables itself on click so a double click can't pay twice --%>
                <asp:Button ID="btnPay" runat="server" Text="Record payment" CssClass="pay-btn"
                    UseSubmitBehavior="false" OnClientClick="this.disabled = true; this.value = 'Recording...';"
                    OnClick="btnPay_Click" />
                <asp:HyperLink runat="server" NavigateUrl="~/AvisPages/ViewPayments" CssClass="pay-link">Cancel</asp:HyperLink>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlDone" runat="server" Visible="false">
            <div class="pay-actions">
                <asp:HyperLink runat="server" NavigateUrl="~/AvisPages/ViewPayments" CssClass="pay-btn">View payments</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/AvisPages/AddPayment" CssClass="pay-link">Record another payment</asp:HyperLink>
            </div>
        </asp:Panel>
    </div>

    
</asp:Content>
