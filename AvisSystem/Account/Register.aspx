<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AvisSystem.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="register-page">

        <div class="register-card"></div>

            <!-- LEFT SIDE -->
            <div class="register-left">

                <div class="register-logo">
                    AVIS
                </div>

                <h2>Join AVIS<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GroupPmb3ConnectionString %>" InsertCommand="INSERT INTO CUSTOMER(FullName, Address, ContactNumber, EmailAddress, LicenceNumber, LicenceCode, CustomerUsername, CustomerPassword, LicenceCountryOfIssue) VALUES (@FullName, @Address, @ContactNumber, @EmailAddress, @LicenceNumber,@LicenceCode, @CustomerUsername, @CustomerPassword, @LicenceCountryOfIssue)" SelectCommand="SELECT * FROM CUSTOMER">
                    <InsertParameters>
                        <asp:Parameter Name="FullName" />
                        <asp:Parameter Name="Address" />
                        <asp:Parameter Name="ContactNumber" />
                        <asp:Parameter Name="EmailAddress" />
                        <asp:Parameter Name="LicenceNumber" />
                        <asp:Parameter Name="LicenceCode" />
                        <asp:Parameter Name="CustomerUsername" />
                        <asp:Parameter Name="CustomerPassword" />
                        <asp:Parameter Name="LicenceCountryOfIssue" />
                    </InsertParameters>
                    </asp:SqlDataSource>
                </h2>

                <p>
                    Create your account to manage
                bookings, rentals, payments and
                vehicle information.
                </p>

                <div class="register-info">
                    <span>AVIS Car Rental Management System</span>
                </div>

            </div>


            <!-- RIGHT SIDE -->
            <div class="register-right">

                <h2>Create Account</h2>

                <p class="register-subtitle">
                    Enter your details to create an account
                </p>


                <!-- ERROR MESSAGE -->
                <asp:PlaceHolder
                    runat="server"
                    ID="ErrorMessage"
                    Visible="false">

                    <div class="alert alert-danger">
                        <asp:Literal
                            runat="server"
                            ID="FailureText" />
                    </div>

                </asp:PlaceHolder>


                <!-- ROW 1 -->
                <div class="form-row">

                    <!-- FULL NAME -->
                    <div class="form-group">

                        <asp:Label
                            runat="server"
                            AssociatedControlID="FullName"
                            Text="Full Name">
                        </asp:Label>

                        <asp:TextBox
                            runat="server"
                            ID="FullName"
                            CssClass="form-control"
                            placeholder="Enter full name">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="FullName"
                            CssClass="text-danger"
                            ErrorMessage="Full name is required."
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- USERNAME -->
                    <div class="form-group">

                        <asp:Label
                            runat="server"
                            AssociatedControlID="Username"
                            Text="Username">
                        </asp:Label>

                        <asp:TextBox
                            runat="server"
                            ID="Username"
                            CssClass="form-control"
                            placeholder="Choose a username">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="Username"
                            CssClass="text-danger"
                            ErrorMessage="Username is required."
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>

                </div>


                <!-- ROW 2 -->
                <div class="form-row">

                    <!-- EMAIL -->
                    <div class="form-group">

                        <asp:Label
                            runat="server"
                            AssociatedControlID="Email"
                            Text="Email">
                        </asp:Label>

                        <asp:TextBox
                            runat="server"
                            ID="Email"
                            CssClass="form-control"
                            TextMode="Email"
                            placeholder="Enter email address">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="Email"
                            CssClass="text-danger"
                            ErrorMessage="Email is required."
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- CONTACT NUMBER -->
                    <div class="form-group">

                        <asp:Label
                            runat="server"
                            AssociatedControlID="ContactNumber"
                            Text="Contact Number">
                        </asp:Label>

                        <asp:TextBox
                            runat="server"
                            ID="ContactNumber"
                            CssClass="form-control"
                            TextMode="Phone"
                            placeholder="Enter contact number">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="ContactNumber"
                            CssClass="text-danger"
                            ErrorMessage="Contact number is required."
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>

                </div>


                <!-- ROW 3 -->
                <div class="form-row">

                    <!-- LICENCE NUMBER -->
                    <div class="form-group">

                        <asp:Label
                            runat="server"
                            AssociatedControlID="TextBox1"
                            Text="Licence Number">
                        </asp:Label>

                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="TextBox1"
                            InitialValue=""
                            CssClass="text-danger"
                            ErrorMessage="Please input licence number."
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- POSITION -->
                    <div class="form-group">

                        <asp:Label
                            runat="server"
                            AssociatedControlID="DropDownList1"
                            Text="Licence Code">
                        </asp:Label>

                        <asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem Value="" Text="-- Select code --" />
    <asp:ListItem>A1</asp:ListItem>
    <asp:ListItem>A</asp:ListItem>
    <asp:ListItem>B</asp:ListItem>
    <asp:ListItem>C1</asp:ListItem>
    <asp:ListItem>C</asp:ListItem>
    <asp:ListItem>EB</asp:ListItem>
    <asp:ListItem>EC1</asp:ListItem>
    <asp:ListItem>EC</asp:ListItem>
</asp:DropDownList>

                        <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="DropDownList1"
                            InitialValue=""
                            CssClass="text-danger"
                            ErrorMessage="Please select licence code."
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>

                </div>
                    <!-- LICENCE COUNTRY OF ISSUE -->
    <div class="form-group">

        <asp:Label
            runat="server"
            AssociatedControlID="LicenceCountry"
            Text="Licence Country of Issue">
        </asp:Label>

        <asp:DropDownList
            runat="server"
            ID="LicenceCountry"
            CssClass="form-control">
            <asp:ListItem Value="" Text="-- Select country --" />
            <asp:ListItem>South Africa</asp:ListItem>
            <asp:ListItem>Botswana</asp:ListItem>
            <asp:ListItem>Eswatini</asp:ListItem>
            <asp:ListItem>Lesotho</asp:ListItem>
            <asp:ListItem>Malawi</asp:ListItem>
            <asp:ListItem>Mozambique</asp:ListItem>
            <asp:ListItem>Namibia</asp:ListItem>
            <asp:ListItem>Zambia</asp:ListItem>
            <asp:ListItem>Zimbabwe</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
        </asp:DropDownList>

        <asp:RequiredFieldValidator
            runat="server"
            ControlToValidate="LicenceCountry"
            InitialValue=""
            CssClass="text-danger"
            ErrorMessage="Please select country of issue."
            Display="Dynamic">
        </asp:RequiredFieldValidator>

    </div>

                <!-- ROW 4 -->
                  <!-- PHYSICAL ADDRESS -->
  <div class="form-group">

      <asp:Label
          runat="server"
          AssociatedControlID="PhysicalAddress"
          Text="Physical Address">
      </asp:Label>

      <asp:TextBox
          runat="server"
          ID="PhysicalAddress"
          CssClass="form-control"
          placeholder="Enter physical address">
      </asp:TextBox>

      <asp:RequiredFieldValidator
          runat="server"
          ControlToValidate="PhysicalAddress"
          CssClass="text-danger"
          ErrorMessage="Physical address is required."
          Display="Dynamic">
      </asp:RequiredFieldValidator>

  </div>

                <div class="form-row">

                    <!-- PASSWORD -->
                    <div class="form-group">

                        <asp:Label
                            runat="server"
                            AssociatedControlID="Password"
                            Text="Password">
                        </asp:Label>

                        <asp:TextBox
                            runat="server"
                            ID="Password"
                            TextMode="Password"
                            CssClass="form-control"
                            placeholder="Create password">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="Password"
                            CssClass="text-danger"
                            ErrorMessage="Password is required."
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- CONFIRM PASSWORD -->
                    <div class="form-group">

                        <asp:Label
                            runat="server"
                            AssociatedControlID="ConfirmPassword"
                            Text="Confirm Password">
                        </asp:Label>

                        <asp:TextBox
                            runat="server"
                            ID="ConfirmPassword"
                            TextMode="Password"
                            CssClass="form-control"
                            placeholder="Confirm password">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="ConfirmPassword"
                            CssClass="text-danger"
                            ErrorMessage="Please confirm your password."
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>

                        <asp:CompareValidator
                            runat="server"
                            ControlToValidate="ConfirmPassword"
                            ControlToCompare="Password"
                            CssClass="text-danger"
                            ErrorMessage="Passwords do not match."
                            Display="Dynamic">
                        </asp:CompareValidator>

                    </div>

                </div>


                <!-- TERMS -->
                <div class="terms">

                    <asp:CheckBox
        runat="server"
        ID="AgreeTerms" />

    <asp:Label
        runat="server"
        AssociatedControlID="AgreeTerms">

        I agree to the
        <a href="#" class="terms-link">
            Terms and Conditions
        </a>

    </asp:Label>

    <asp:Label
        runat="server"
        ID="TermsError"
        CssClass="text-danger"
        Visible="false"
        Text="You must agree to the Terms and Conditions.">
    </asp:Label>
                </div>
                <br />

<asp:Label ID="lblMessage"
    runat="server"
    Visible="false"
    Font-Bold="true">
</asp:Label>


                <!-- BUTTONS -->
                <div class="register-buttons">

                    <asp:Button
                        runat="server"
                        Text="CANCEL"
                        CssClass="cancel-button"
                        CausesValidation="false" />

                    <asp:Button
                        runat="server"
                        Text="SIGN UP"
                        CssClass="signup-button"
                        OnClick="CreateUser_Click" />

                </div>
                



                <!-- LOGIN LINK -->
                <div class="login-link">

                    <span>Already have an account?</span>

                    <asp:HyperLink
                        runat="server"
                        NavigateUrl="~/Account/Login">
                    Log in
                    </asp:HyperLink>

                </div>

            </div>

        </div>

  
</asp:Content>
