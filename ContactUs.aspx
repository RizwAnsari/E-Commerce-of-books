<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            font-family: "Bookman Old Style";
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
           
            <td align="left" style="font-size:x-large; font-family:Constantia; text-align: center; font-weight: bold;">
                <asp:Image ID="Image1" runat="server" Height="91px" 
                    ImageUrl="~/Images/Icons/ContactUs.png" />
            </td>
        </tr>
        <tr>
           
            <td align="left" style="font-size:x-large; font-family:Constantia; text-align: center; font-weight: bold;">
                <img src="Images/Icons/CallUs.png" style="height: 130px; width: 350px" alt=""/>
                <br />
                <span class="style2">We are only a phone call away
                <br />
                Pick up the phone and call us at +91-7506571489
                <br />
                We're available 24 hours a day, 7 days a week.</font></span>
                <hr align="center" width="75%"/>
            </td>
        </tr>
        <tr>            
            <td align="center" style="font-size:larger; font-family:Constantia; text-align: center; font-weight: bold;">
                <img src="Images/Icons/MailUs.png" style="height: 105px; width: 350px" />                
                <br />
                <font face="Constantia" size="5px">
                <u><span class="style2">thebookshelf.in@gmail.com </span> </u>
                <span class="style2">
                <br />
                TheBookShelf Internet Private Limited,
                <br />
                Premier Exotica,
                <br />
                101/10 & 104/10, 1st Floor, Kohinoor,
                <br />
                Kirol Road,
                <br />
                Mumbai - 4000-70,
                <br />
                Maharashtra, India.</span></font>
            </td>
        </tr>
    </table>
</asp:Content>
