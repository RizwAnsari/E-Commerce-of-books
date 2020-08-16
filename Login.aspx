<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
        <style type="text/css">
            .style2
        {
            text-align: left;
            font-family: Algerian;
            font-size: 50px;
            height: 40px;
            width: 1025px;
            }
            .style4
            {
                width: 181px;
            }
            .style5
            {
                width: 181px;
                font-size: x-large;
            }
            .style8
            {
                width: 584px;
            }
            .style9
            {
                width: 259px;
            }
            .style10
            {
                font-size: x-large;
            }
    </style>
</head>
<body>
    <form id="form1" action="">
    <div style="height: 500px">
    
        <table style="width:100%;" height="500px">
            <tr>
                <td class="style2" bgcolor="#CACFD2" colspan="2">
                <span style="font-size: 50px"><center class="style12">
                <asp:Image ID="Image1" runat="server" Height="40px" ImageAlign="AbsMiddle" 
                            ImageUrl="~/Images/Buttons/Login Now.png"/>
                    Login</span></td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td style="text-align: left" valign="top" class="style8">
                    <table style="width: 100%; height: 175px;">                   
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="Label6" runat="server" ForeColor="#FF3300" Font-Bold="True" 
                                    style="font-size: x-large"></asp:Label>
                            </td>
                        </tr>
                        <div id="loginPageStatus" runat="server">
                        <tr>
                            <td class="style5">
                                <strong>User Name:</strong></td>
                            <td>
                                <asp:TextBox ID="TextBoxUN" runat="server" Width="270px" MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBoxUN" ErrorMessage="Invalid User Name" Font-Size="20px" 
                                    ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                <strong>Password:</strong></td>
                            <td>
                                <asp:TextBox ID="TextBoxPass" runat="server" Width="270px" TextMode="Password" 
                                    MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBoxPass" ErrorMessage="Invalid Password" Font-Size="20px" 
                                    ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td>
                                <asp:ImageButton ID="ImageButtonLogIn" runat="server" Height="60px" 
                                    ImageUrl="~/Images/Buttons/Login.jpg" Width="130px" 
                                    onclick="ImageButtonLogIn_Click" />
                                <asp:ImageButton ID="ImageButtonCancel" runat="server" Height="60px" 
                                    ImageUrl="~/Images/Buttons/Cancel.png" onclick="ImageButtonCancel_Click" 
                                    Width="120px" CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>                               
                        </tr>
                        <tr>
                            <td class="style5">
                                <em>New User?</em></td>
                            <td>
                                <asp:HyperLink ID="NewUserHperLink" runat="server" BorderColor="White" 
                                    BorderStyle="Outset" Font-Italic="True" ForeColor="Black" Height="25px" 
                                    NavigateUrl="Register.aspx" Width="150px">Register Here</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                <em>Forget Password?</em></td>
                            <td>
                                <asp:HyperLink ID="NewUserHperLink0" runat="server" BorderColor="White" 
                                    BorderStyle="Outset" Font-Italic="True" ForeColor="Black" Height="25px" 
                                    NavigateUrl="ForgotPassword.aspx" Width="150px">Help !</asp:HyperLink>
                            </td>
                        </tr>
                        </div>
                        <tr>
                            <td class="style5">
                                <em>Change Password</em></td>
                            <td>
                                <asp:HyperLink ID="NewUserHperLink1" runat="server" BorderColor="White" 
                                    BorderStyle="Outset" Font-Italic="True" ForeColor="Black" Height="25px" 
                                    NavigateUrl="~/ChangePassword.aspx" Width="150px">Click Here</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                &nbsp;</td>
                            <td class="style11">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    DisplayMode="List" Font-Size="20px" ForeColor="Red" Height="61px" 
                                    Width="534px" Font-Bold="True" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

</asp:Content>

