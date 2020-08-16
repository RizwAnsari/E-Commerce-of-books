<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="AddSubCategory.aspx.cs" Inherits="AddSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 685px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GvSubCategory" runat="server" DataKeyNames="SubCategoryId" 
                    onrowdeleting="GvSubCategory_RowDeleting1" 
                    onselectedindexchanged="GvSubCategory_SelectedIndexChanged" 
                    Font-Names="Andalus" Font-Size="Large" ForeColor="#333333" 
                    Caption="Add Sub-Category" CellPadding="4" GridLines="Horizontal" 
                    BorderColor="White" BorderStyle="Outset" BorderWidth="5px" 
                    HorizontalAlign="Center" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ControlStyle-ForeColor="Navy">
<ControlStyle ForeColor="Navy"></ControlStyle>
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True" DeleteText="Remove" ControlStyle-ForeColor="Red">
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
        <tr>
            <td>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnAddSubCategory" runat="server" Text="Add New Sub-Category" 
                    onclick="BtnAddSubCategory_Click" Font-Names="Andalus" Font-Size="Large" CausesValidation="False"/>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <div id="divSubCategory" runat="server">
        <table width="100%">
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">
                    Select Category :
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="drpCategory" runat="server" 
                        onselectedindexchanged="drpCategory_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">
                    Sub-Category :
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TxtSubCategory" runat="server" MaxLength="50"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*Enter a Sub-Category" ControlToValidate="TxtSubCategory" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnNewSubCategory" runat="server" Text="Add" 
                        onclick="BtnNewSubCategory_Click" Font-Names="Andalus" Font-Size="Large"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" Font-Names="Andalus" 
                        Font-Size="Large" onclick="BtnCancel_Click" CausesValidation="False"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>