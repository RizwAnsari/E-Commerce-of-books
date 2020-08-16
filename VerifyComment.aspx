<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="VerifyComment.aspx.cs" Inherits="VerifyComment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 620px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:Label ID="Lblstatus" runat="server" ForeColor="Red" Font-Names="Agency FB" 
                    Font-Size="Large" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GvComment" runat="server" DataKeyNames="CommentsMetaDataID" 
                    OnRowDeleting="GvComment_RowDeleting" 
                    OnSelectedIndexChanged="GvComment_SelectedIndexChanged" Font-Names="Andalus" 
                    Font-Size="Large" ForeColor="#333333" Caption="Verify Comment" CellPadding="4" 
                    GridLines="Horizontal" BorderColor="White" BorderStyle="Outset" 
                    BorderWidth="5px" HorizontalAlign="Center" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ControlStyle-ForeColor="Navy" >
<ControlStyle ForeColor="Navy"></ControlStyle>
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True" DeleteText="Remove" ControlStyle-ForeColor="Red" >
<ControlStyle ForeColor="Red"></ControlStyle>
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle Font-Names="Algerian" Font-Size="Large" BackColor="#5D7B9D" 
                        Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <div>
        <table width="100%">
            <tr>
                <td align="right" style="font-size: x-large; font-family: Andalus" 
                    class="style2">Name :
                </td>
                <td>&nbsp;&nbsp;
                    <asp:TextBox ID="txtName" runat="server" Enabled="false" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size: x-large; font-family: Andalus" 
                    class="style2">EmailID :
                </td>
                <td>&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtEmailID" runat="server" Enabled="false" MaxLength="40"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size: x-large; font-family: Andalus" 
                    class="style2">Comment :
                </td>
                <td>&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" 
                        MaxLength="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size: x-large; font-family: Andalus" 
                    class="style2">Verify :
                </td>
                <td>&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="RbtnYes" runat="server" GroupName="GrpVerify" Text="Yes" Font-Names="Andalus" Font-Size="Large" />
                    &nbsp;
                    <asp:RadioButton ID="RbtnNo" runat="server" GroupName="GrpVerify" Text="No" Font-Names="Andalus" Font-Size="Large" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td>&nbsp;<asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" Font-Names="Andalus" Font-Size="Large" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" Font-Names="Andalus" 
                        Font-Size="Large" onclick="BtnCancel_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

