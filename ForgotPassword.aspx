<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 576px;
        }
        .style4
        {
            width: 576px;
            height: 23px;
        }
        .style5
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <table class="style2">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td class="style4">
                            </td>
                        <td class="style5">
                            </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblError" runat="server" Font-Names="Agency FB" 
                                Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Aharoni" 
                                Font-Underline="True" ForeColor="Black" NavigateUrl="~/Login.aspx">Back</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2" style="font-size:xx-large; font-family:Algerian">
                            Enter The Following Details :
                            <br />
                            <br />
                        </th>
                    </tr>
                    <tr>
                        <td align="right" style="font-size:x-large; font-family:Andalus" class="style3">
                            UserName:
                        </td>
                        <td>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="TxtUserName" runat="server" MaxLength="20"></asp:TextBox>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TxtUserName" ErrorMessage="*Enter your username" 
                                Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                                Font-Bold="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size:x-large; font-family:Andalus" class="style3">
                            EmailAddress:&nbsp;
                        </td>
                        <td>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="TxtEmail" runat="server" CausesValidation="True" 
                                MaxLength="40"></asp:TextBox>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TxtEmail" ErrorMessage="*Enter your Email Address" 
                                Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                                Font-Bold="True"></asp:RequiredFieldValidator>
                            &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TxtEmail" ErrorMessage="*Invalid Email Address" 
                                Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                Font-Bold="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size:x-large; font-family:Andalus" class="style3">
                            &nbsp;</td>
                        <td>
                            &nbsp;&nbsp;
                            <asp:Button ID="BtnSubmit" runat="server" Font-Names="Andalus" 
                                Font-Size="Large" OnClick="btnSubmit_Click" Text="Submit" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnCancel" runat="server" CausesValidation="False" 
                                Font-Names="Andalus" Font-Size="Large" OnClick="btnCancel_Click" 
                                Text="Cancel" />
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
    </table>
    
</asp:Content>

