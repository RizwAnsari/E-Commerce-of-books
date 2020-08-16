<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TransactionSuccessful.aspx.cs" Inherits="TransactionSuccessful" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td align="center" style="font-size: x-large; font-weight: bold; font-family: Andalus">Your Transaction is Successful !
                <br />
                A confirmation mail has been sent to your email address.
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td align="center" style="font-size: x-large; font-weight: bold; font-family: Andalus">Your Transation ID is :
            <asp:Label ID="LblTransactionID" runat="server" Text="Label" BackColor="#0099CC" 
                    BorderColor="#0099CC" BorderStyle="Outset" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-size: x-large; font-family: Andalus">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: x-large; font-family: Andalus">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: x-large; font-family: Andalus">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

