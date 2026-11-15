<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vehicles.aspx.cs" Inherits="AvisSystem.CustomerPages.Vehicles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .veh-page { max-width: 1100px; margin: 30px auto; padding: 0 15px; }
    .veh-page h1 { margin-bottom: 16px; }

    /* summary of the search */
    .search-summary { display: flex; flex-wrap: wrap; gap: 28px; align-items: center;
        background: #f7f7f7; border-left: 5px solid #C8102E; border-radius: 6px;
        padding: 14px 20px; margin-bottom: 26px; }
    .search-summary .k { display: block; font-size: 12px; color: #777; text-transform: uppercase; }
    .search-summary .v { font-weight: 700; }
    .search-summary a { margin-left: auto; color: #C8102E; font-weight: 700; }

    /* one rectangular box per vehicle */
    .veh-card { border: 1px solid #ddd; border-radius: 10px; overflow: hidden;
        margin-bottom: 24px; background: #fff; box-shadow: 0 2px 8px rgba(0,0,0,.06); }
    .veh-head { background: #C8102E; color: #fff; padding: 14px 24px; }
    .veh-head h2 { margin: 0; font-size: 26px; letter-spacing: .5px; }      /* category */
    .veh-head h3 { margin: 4px 0 0; font-size: 18px; font-weight: 400; }    /* model */

    .veh-body { display: flex; }
    .veh-img { width: 50%; min-height: 260px; background: #eee;
        display: flex; align-items: center; justify-content: center; }
    .veh-img img { width: 100%; height: 100%; max-height: 320px; object-fit: cover; display: block; }
    .veh-info { width: 50%; padding: 22px 28px; display: flex; flex-direction: column; justify-content: center; }

    .veh-desc { color: #555; margin-bottom: 10px; }
    .veh-facts { list-style: none; padding: 0; margin: 0 0 14px; color: #444; }
    .veh-facts li { padding: 3px 0; border-bottom: 1px dashed #e5e5e5; }
    .veh-price { font-size: 30px; font-weight: 700; color: #C8102E; }
    .veh-price small { font-size: 14px; color: #777; font-weight: 400; }
    .veh-total { color: #444; margin: 4px 0 16px; }

    .btn-select { background: #C8102E; color: #fff; border: 0; border-radius: 6px;
        padding: 12px 40px; font-weight: 700; font-size: 16px; cursor: pointer; align-self: flex-start; }
    .btn-select:hover { background: #a00d25; }

    .veh-none { background: #fff3cd; border: 1px solid #ffe08a; border-radius: 8px;
        padding: 18px 22px; margin-bottom: 20px; font-weight: 600; }

    @media (max-width: 700px) {
        .veh-body { flex-direction: column; }
        .veh-img, .veh-info { width: 100%; }
    }
</style>

<div class="veh-page">
    <h1>Available vehicles</h1>

    <div class="search-summary">
        <div><span class="k">Pick-up branch</span><span class="v"><asp:Label ID="lblPickupLocation" runat="server" /></span></div>
        <div><span class="k">Pick-up</span><span class="v"><asp:Label ID="lblPickupDate" runat="server" /></span></div>
        <div><span class="k">Return</span><span class="v"><asp:Label ID="lblReturnDate" runat="server" /></span></div>
        <a href="MakeBooking.aspx">Change search</a>
    </div>

    <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="veh-none">
        <asp:Label ID="lblMessage" runat="server" />
    </asp:Panel>

    <asp:Repeater ID="rptVehicles" runat="server" OnItemCommand="rptVehicles_ItemCommand">
        <ItemTemplate>
            <div class="veh-card">

                <div class="veh-head">
                    <h2><%#: Eval("Category") %></h2>
                    <h3><%#: Eval("Make") %> <%#: Eval("Model") %></h3>
                </div>

                <div class="veh-body">
                    <div class="veh-img">
                        <img src='<%# ResolveUrl("~/CustomerPages/VehicleImage.ashx") + "?vin=" + Server.UrlEncode(Eval("VehicleVinNo").ToString()) %>'
                             alt='<%#: Eval("Make") %> <%#: Eval("Model") %>'
                             onerror="this.style.display='none'" />
                    </div>

                    <div class="veh-info">
                        <div class="veh-desc"><%#: Eval("VehicleDescription") %></div>
                        <ul class="veh-facts">
                            <li>Registration: <b><%#: Eval("RegistrationNo") %></b></li>
                            <li>Branch: <b><%#: Eval("BranchName") %></b></li>
                            <li>Odometer: <b><%# Eval("OdometerReading", "{0:N0}") %> km</b></li>
                        </ul>

                        <div class="veh-price">R<%# Eval("DailyRate", "{0:N2}") %> <small>per day</small></div>
                        <div class="veh-total">
                            Estimated total: <b>R<%# Eval("EstTotal", "{0:N2}") %></b>
                            for <%#: Eval("RentalLabel") %>
                        </div>

                        <asp:Button ID="btnSelect" runat="server" Text="Select" CssClass="btn-select"
                            CommandName="Select" CommandArgument='<%# Eval("VehicleVinNo") %>' />
                    </div>
                </div>

            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
</asp:Content>
