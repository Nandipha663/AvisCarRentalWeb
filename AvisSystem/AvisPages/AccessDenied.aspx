<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="AvisSystem.AvisPages.AccessDenied" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <div style="max-width:600px; margin:60px auto; text-align:center;">
        <h2 style="color:#C8102E;">Access denied</h2>
        <p>Your account does not have permission to open that page.</p>
        <p><a runat="server" href="~/Default.aspx">Back to home</a></p>
    </div>
</asp:Content>
