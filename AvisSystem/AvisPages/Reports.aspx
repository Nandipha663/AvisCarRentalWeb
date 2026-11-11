<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="AvisSystem.AvisPages.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* MATCHING DASHBOARD THEME */
        .reports-page {
            max-width: 1400px;
            width: 100%;
            margin: 0 auto;
            padding: 40px 25px 60px;
            box-sizing: border-box;
        }

        .reports-header {
            margin-bottom: 35px;
        }

        .reports-header h1 {
            font-size: 42px !important;
            font-weight: 800 !important;
            color: #111111 !important;
            margin: 0 0 8px 0;
        }

        .reports-header p {
            margin: 0;
            color: #777777;
            font-size: 16px;
        }

        /* POWER BI CONTAINER */
        .powerbi-container {
            background: #ffffff;
            border: 1px solid #e3e3e3;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 3px 12px rgba(0,0,0,0.07);
            height: 80vh; /* Increased height slightly for a cleaner look */
            position: relative;
        }

        .powerbi-iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>

    <main class="reports-page">

        <!-- HEADER -->
        <div class="reports-header">
            <h1>Avis Management reports</h1>
        
        </div>

        <!-- POWER BI IFRAME -->
        <div class="powerbi-container">
            <iframe 
                class="powerbi-iframe"
                id="powerbiFrame"
                title="Avis Reports"
                src="https://app.powerbi.com/view?r=eyJrIjoiNTZhOTgyYTAtY2ViYy00NDBjLTllYWMtNjY2YjU3MmQyMDVjIiwidCI6IjIyNjgyN2Q2LWE5ZDAtNDcwZC04YzE1LWIxNDZiMDE5MmQ1MSIsImMiOjh9" 
                allowFullScreen="true">
            </iframe>
        </div>

    </main>

</asp:Content>