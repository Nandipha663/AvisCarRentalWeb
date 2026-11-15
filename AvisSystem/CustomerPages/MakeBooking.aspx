<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeBooking.aspx.cs" Inherits="AvisSystem.CustomerPages.MakeBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .bk-page   { max-width: 760px; margin: 30px auto; padding: 0 15px; }
    .bk-card   { border: 1px solid #ddd; border-radius: 10px; overflow: hidden; background: #fff;
                 box-shadow: 0 2px 8px rgba(0,0,0,.06); }
    .bk-head   { background: #C8102E; color: #fff; padding: 14px 24px; font-size: 20px; font-weight: 700; }
    .bk-body   { padding: 8px 24px 26px; }
    .bk-sub    { color: #666; margin: 16px 0 0; }
    .bk-grid   { display: grid; grid-template-columns: 1fr 1fr; gap: 0 20px; }
    .bk-body label { display: block; font-weight: 700; margin: 18px 0 6px; }
    .bk-input  { width: 100%; padding: 11px 12px; border: 1px solid #ccc; border-radius: 6px;
                 font-size: 15px; background: #fff; box-sizing: border-box; }
    .bk-input:focus { border-color: #C8102E; outline: none; box-shadow: 0 0 0 3px rgba(200,16,46,.15); }
    .bk-section { margin-top: 22px; padding-top: 6px; border-top: 1px solid #eee;
                  color: #C8102E; font-weight: 700; text-transform: uppercase; font-size: 13px; letter-spacing: .5px; }
    .bk-msg    { display: block; color: #C8102E; font-weight: 700; margin-top: 14px; }
    .btn-search { background: #C8102E; color: #fff; border: 0; border-radius: 6px; padding: 13px 34px;
                  font-weight: 700; font-size: 16px; cursor: pointer; margin-top: 26px; }
    .btn-search:hover { background: #a00d25; }
    .bk-note { background: #fff3cd; border: 1px solid #ffe08a; border-radius: 8px;
           padding: 12px 16px; margin-top: 18px; font-size: 14px; }
    @media (max-width: 600px) { .bk-grid { grid-template-columns: 1fr; } }
</style>

<div class="bk-page">
  <div class="bk-card">
    <div class="bk-head">Make Booking</div>
    <div class="bk-body">
      <p class="bk-sub">Choose your branches and dates to see the vehicles available.</p>
      <asp:Label ID="lblMsg" runat="server" CssClass="bk-msg" />

      <div class="bk-section">Branches</div>
      <div class="bk-grid">
        <div>
          <label>Pick-up branch</label>
          <asp:DropDownList ID="ddlPickupBranch" runat="server" CssClass="bk-input" />
        </div>
        <div>
          <label>Drop-off branch</label>
          <asp:DropDownList ID="ddlReturnBranch" runat="server" CssClass="bk-input" />
        </div>
      </div>

      <div class="bk-section">Pick-up</div>
      <div class="bk-grid">
        <div>
          <label>Date</label>
          <asp:TextBox ID="txtPickupDate" runat="server" TextMode="Date" CssClass="bk-input" />
        </div>
        <div>
          <label>Time</label>
          <asp:TextBox ID="txtPickupTime" runat="server" TextMode="Time" Text="10:00" CssClass="bk-input" />
        </div>
      </div>

      <div class="bk-section">Return</div>
      <div class="bk-grid">
        <div>
          <label>Date</label>
          <asp:TextBox ID="txtReturnDate" runat="server" TextMode="Date" CssClass="bk-input" />
        </div>
        <div>
          <label>Time</label>
          <asp:TextBox ID="txtReturnTime" runat="server" TextMode="Time" Text="10:00" CssClass="bk-input" />
        </div>
      </div>

      <asp:Button ID="btnSearch" runat="server" Text="Search vehicles"
          CssClass="btn-search" OnClick="btnSearch_Click" />
    </div>
<div class="bk-note">
        <b>Please note:</b> Unpaid bookings are held for 24 hours. If payment is not made in time, the booking is cancelled automatically and the vehicle is released.
      </div>
  </div>
</div>
</asp:Content>
   

  
