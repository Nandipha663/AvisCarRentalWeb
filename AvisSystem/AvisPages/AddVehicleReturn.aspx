<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddVehicleReturn.aspx.cs" Inherits="AvisSystem.AvisPages.AddVehicleReturn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .rental-page {
        background: #f7f7f7;
        padding: 30px;
    }

    .rental-card {
        background: white;
        padding: 30px;
        border-radius: 12px;
        border: 1px solid #e5e5e5;
        box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        max-width: 1100px;
        margin: auto;
    }

    .section-title {
        font-size: 21px;
        font-weight: 600;
        margin-bottom: 20px;
    }

    .booking-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 25px;
    }

    .booking-table th {
        background: #c8102e;
        color: white;
        padding: 12px;
        text-align: left;
    }

    .booking-table td {
        padding: 12px;
        border-bottom: 1px solid #eee;
    }

    .booking-table tr:hover {
        background: #f8f8f8;
    }

    .selected-rental-card {
        background: #f7f7f7;
        border: 1px solid #e5e5e5;
        border-radius: 10px;
        padding: 20px;
        margin-top: 25px;
    }

    .form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 18px;
    }

    .form-group label {
        display: block;
        font-weight: 600;
        margin-bottom: 7px;
    }

    .modern-input {
        width: 100%;
        height: 45px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 7px;
        box-sizing: border-box;
    }

    .readonly-input {
        background: #eee;
        cursor: not-allowed;
    }

    .button-area {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 12px;
        margin-top: 30px;
    }

    .action-btn {
        height: 45px;
        padding: 0 22px;
        border: none;
        border-radius: 7px;
        cursor: pointer;
        font-weight: 600;
    }

    .add-btn {
        background: #c8102e;
        color: white;
    }

    .clear-btn {
        background: #e5e5e5;
        color: #333;
    }

    .delete-btn {
        background: #c8102e;
        color: white;
        margin-right: auto;
    }

    .message {
        display: block;
        margin-top: 15px;
        font-weight: 600;
    }

/* =========================================
   TABLE CARD
========================================= */

.table-card { min-width: 0; 
              background: #ffffff; 
              border: 1px solid #e1e1e1; 
              border-radius: 10px; 
              box-shadow: 0 3px 12px rgba(0, 0, 0, 0.06); 
              overflow: hidden; 

} 
.table-wrapper { width: 100%; 
                 overflow-x: auto; 

}

.booking-table { width: 100%; 
                 min-width: 1250px; 
                 border-collapse: collapse; 
                 font-family: Arial, sans-serif; 
                 font-size: 13px; 

} 
/* Red headers with white text */ 
.booking-table th { background-color: #c8102e; 
                    color: #ffffff; 
                    font-size: 12px; 
                    font-weight: 700; 
                    text-align: left; 
                    padding: 15px 13px; 
                    border: none; 
                    white-space: nowrap; 

} 
/* Booking details */ 
  .booking-table td { padding: 13px; 
                      border-bottom: 1px solid #eeeeee; 
                      color: #333333; 
                      white-space: nowrap; 

  } 
  /* Alternating light-pink rows */ 
  .booking-table tr:nth-child(even) td { background-color: #fff5f6; } 
  
  /* Light-pink hover effect */ 
  .booking-table tr:hover td { background-color: #ffe5e9; }

</style>
</asp:Content>
