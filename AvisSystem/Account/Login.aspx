<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AvisSystem.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     <div class="login-page">

      <style>
    .login-page {
        min-height: calc(100vh - 70px);
        width: 100%;

        background-image: url('/Content/images/AvisBackgroundImage.png');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;

        display: flex;
        justify-content: center;
        align-items: center;

        padding: 50px 20px;
        box-sizing: border-box;

        /* Expand only horizontally */
        margin-left: -50px;
        margin-right: -50px;
    }
</style>

     <div class="login-card">

         <!-- AVIS Logo -->
         <div class="login-logo">
             AVIS
         </div>

         <h2>Welcome Back</h2>

         <p class="login-subtitle">
             Sign in to manage your car rentals
         </p>

         <!-- Error Message -->
         <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
             <div class="alert alert-danger">
                 <asp:Literal runat="server" ID="FailureText" />
             </div>
         </asp:PlaceHolder>

         <!-- Email -->
         <div class="form-group">

             <asp:Label runat="server"
                 AssociatedControlID="Email"
                 Text="Email">
             </asp:Label>

             <asp:TextBox runat="server"
                 ID="Email"
                 CssClass="form-control"
                 TextMode="Email"
                 placeholder="Enter your email">
             </asp:TextBox>

             <asp:RequiredFieldValidator
                 runat="server"
                 ControlToValidate="Email"
                 CssClass="text-danger"
                 ErrorMessage="Email is required."
                 Display="Dynamic">
             </asp:RequiredFieldValidator>

         </div>

         <br />

         <!-- Password -->
         <div class="form-group">

             <asp:Label runat="server"
                 AssociatedControlID="Password"
                 Text="Password">
             </asp:Label>

             <asp:TextBox runat="server"
                 ID="Password"
                 TextMode="Password"
                 CssClass="form-control"
                 placeholder="Enter your password">
             </asp:TextBox>

             <asp:RequiredFieldValidator
                 runat="server"
                 ControlToValidate="Password"
                 CssClass="text-danger"
                 ErrorMessage="Password is required."
                 Display="Dynamic">
             </asp:RequiredFieldValidator>

         </div>

         <br />

         <!-- Remember Me -->
         <div class="remember-me">

             <asp:CheckBox
                 runat="server"
                 ID="RememberMe" />

             <asp:Label
                 runat="server"
                 AssociatedControlID="RememberMe"
                 Text="Remember me">
             </asp:Label>

         </div>

         <br />

         <!-- Login Button -->
         <asp:Button
             runat="server"
             OnClick="LogIn"
             Text="LOGIN"
             CssClass="login-button" />

         <!-- Register -->
         <div class="register-link">

             <span>Don't have an account?</span>

             <asp:HyperLink
                 runat="server"
                 ID="RegisterHyperLink"
                 ViewStateMode="Disabled">
             Register
             </asp:HyperLink>

         </div>

     </div>

 </div>
</asp:Content>
