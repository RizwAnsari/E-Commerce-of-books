<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 50px;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 608px;
        }
        .style4
        {
            height: 50px;
            width: 608px;
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
                        <td align="center" style="font-size:xx-large; font-family:Algerian">
                            ABOUT BOOKSHELF</td>
                        <td align="center" style="font-size:xx-large; font-family:Algerian">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" 
                            style="font-size:x-large; font-family:Constantia; font-weight: bold">
                            TheBookshelf is a leading online Book store in India.
                            <br />
                            We believe in customer satisfaction and authenticity.
                            <br />
                            We provide 100% genuine products.
                            <br />
                            TheBookshelf guarantees product delivery within the specified time.
                            <br />
                            We believe in ourselves and make our customers believe in us.
                        </td>
                        <td align="center" 
                            style="font-size:x-large; font-family:Constantia; font-weight: bold">
                            <asp:Image ID="Image1" runat="server" ImageUrl="Images/Logo/seclogo.png" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td align="right">
                            &nbsp;</td>
                    </tr>
                </table>
                <hr />
                <br />
                <br />
                <div id="DvComment" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="right" style="font-size:x-large; font-family:Andalus" class="style3">
                                Name :
                            </td>
                            <td>
                                &nbsp;&nbsp;
                                <asp:TextBox ID="txtName" runat="server" MaxLength="30"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtName" ErrorMessage="*Enter your name" 
                                    Font-Names="Agency FB" Font-Size="Large" ForeColor="Red" 
                                    style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="txtName" ErrorMessage="Use only English alphabets" 
                                    Font-Bold="True" ForeColor="Red" 
                                    style="font-size: large; font-family: 'Agency FB'" 
                                    ValidationExpression="[a-zA-Z]*$">Use only English alphabets</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style4" 
                                style="font-size:x-large; font-family:Andalus">
                                EmailID :
                            </td>
                            <td class="auto-style1">
                                &nbsp;&nbsp;&nbsp;<asp:TextBox 
                                    ID="txtEmailID" runat="server" MaxLength="40"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtEmailID" ErrorMessage="*Enter you email address" 
                                    Font-Names="Agency FB" Font-Size="Large" ForeColor="Red" 
                                    style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                                &nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtEmailID" ErrorMessage="*Invalid email address" 
                                    Font-Names="Agency FB" Font-Size="Large" ForeColor="Red" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    style="font-size: large" Font-Bold="True"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-size:x-large; font-family:Andalus" class="style3">
                                Place your Comment here :
                            </td>
                            <td style="font-size:large; font-family:'Agency FB'">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Width="167px" 
                                    MaxLength="200"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtComments" ErrorMessage="*Enter your review" 
                                    Font-Names="Agency FB" Font-Size="Large" ForeColor="Red" 
                                    style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                                &nbsp;
                                <asp:Label ID="LblCommentStatus" runat="server" ForeColor="Red" 
                                    style="font-size: large" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style3">
                                <asp:ImageButton ID="btnComment" OnClick="btnComment_Click" runat="server" Height="60px" 
                                    ImageUrl="~/Images/Buttons/comment.jpg" Width="120px" />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="btnCancel" OnClick="btnCancel_Click" runat="server" Height="60px" 
                                    ImageUrl="~/Images/Buttons/Cancel.png" Width="120px" CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <table width="100%">
                    <tr>
                        <td style="font-size:x-large; font-family:'Agency FB'; color:red">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <asp:Label ID="LogInStatus" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Login to comment your Review!" style="font-size: x-large"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" 
                            style="font-size:x-large; font-family:Algerian; color:#000080">
                            <b><u>ALL COMMENTS</u> :</b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <table style="width: 100%; background-color: #8C92AC;" align="center">
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="lblName" runat="server" Font-Bold="true" Font-Names="Andalus" 
                                                    Font-Size="X-Large" Font-Underline="False" ForeColor="Indigo" 
                                                    Text='<%# Eval("UserName")%>'></asp:Label>
                                            </td>
                                            <td style="text-align: right; font-family:'Baskerville Old Face'">
                                                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("AddedOn") %>'></asp:Label>
                                            </td>
                                            <tr>
                                                <td colspan="3" style="font-size:large; font-family:'Arial Rounded MT'">
                                                    <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <SeparatorTemplate>
                        <hr />
                                </SeparatorTemplate>
                                <AlternatingItemTemplate>
                                    <table style="width: 100%; background-color: #8C92AC" align="center">
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="lblName0" runat="server" Font-Bold="true" Font-Names="Andalus" 
                                                    Font-Size="X-Large" Font-Underline="False" ForeColor="Indigo" 
                                                    Text='<%# Eval("UserName")%>'></asp:Label>
                                            </td>
                                            <td style="text-align: right; font-family:'Baskerville Old Face'">
                                                <asp:Label ID="lblDate0" runat="server" Text='<%# Eval("AddedOn") %>'></asp:Label>
                                            </td>
                                            <tr>
                                                <td colspan="3" style="font-size:large; font-family:'Comic Sans MS'">
                                                    <asp:Label ID="lblComments0" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </tr>
                                    </table>
                                </AlternatingItemTemplate>
                            </asp:Repeater>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>


    
</asp:Content>

