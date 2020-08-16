<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="Book.aspx.cs" Inherits="Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 50px;
        }
        .style2
        {
            width: 667px;
        }
        .style3
        {
            height: 50px;
            width: 667px;
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
                <asp:GridView ID="GvBook" runat="server" DataKeyNames="BookId" OnRowDeleting="GvBook_RowDeleting"
                    OnSelectedIndexChanged="GvBook_SelectedIndexChanged" 
                    AutoGenerateColumns="False" Font-Names="Andalus" Font-Size="Large" 
                    ForeColor="#333333" Caption="Add Book" CellPadding="4" 
                    GridLines="Horizontal" BorderColor="White" BorderStyle="Outset" 
                    BorderWidth="5px" HorizontalAlign="Center" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ControlStyle-ForeColor="Navy">
<ControlStyle ForeColor="Navy"></ControlStyle>
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True" DeleteText="Remove" ControlStyle-ForeColor="Red">
<ControlStyle ForeColor="Red"></ControlStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src="Images/Upload/<%# Eval("Image") %>" alt="" height="80px" width="80px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnAddBook" runat="server" Text="Add New Book"
                    OnClick="BtnAddBook_Click" Font-Names="Andalus" Font-Size="Large" CausesValidation="False"/>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <div id="divBook" runat="server">
        <table width="100%">
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Select Category :
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="drpCategory" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="drpCategory_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Select Sub-Category :
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="drpSubCategory" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Select Image :
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:FileUpload ID="ImgUpload" runat="server" />
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*Select a Image" ControlToValidate="ImgUpload" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style3">Book :
                </td>
                <td class="auto-style1">
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TxtBook" runat="server" MaxLength="50"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*Enter a Book name" ControlToValidate="TxtBook" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Author :
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TxtAuthor" runat="server" MaxLength="50"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*Enter the Author's name" ControlToValidate="TxtAuthor" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Price 
                    ₹ : 
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TxtPrice" runat="server"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="*Enter a Price" ControlToValidate="TxtPrice" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                    &nbsp;
                    </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Description :
                </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TxtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="*Provide a desciption" ControlToValidate="TxtDescription" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Publisher :
                </td>
                <td>
                   &nbsp;&nbsp;
                    <asp:TextBox ID="TxtPublisher" runat="server" MaxLength="50"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="*Enter the Publisher's name" ControlToValidate="TxtPublisher" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Published Year :
                 </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TxtPublishedYear" runat="server"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="*Enter the year of Publication" 
                        ControlToValidate="TxtPublishedYear" Font-Names="Baskerville Old Face" 
                        Font-Size="Large" ForeColor="Red" style="font-size: large" 
                        Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">ISBN-13 :
                </td>
                <td>
                   &nbsp;&nbsp;
                    <asp:TextBox ID="TxtISBN13" runat="server" MaxLength="13"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="*Enter the ISBN-13 number" ControlToValidate="TxtISBN13" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">ISBN-10 :
                 </td>
                <td>
                   &nbsp;&nbsp;
                    <asp:TextBox ID="TxtISBN10" runat="server" MaxLength="10"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ErrorMessage="*Enter the ISBN-10 number" ControlToValidate="TxtISBN10" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Language :
                 </td>
                <td>
                   &nbsp;&nbsp;
                    <asp:TextBox ID="TxtLanguage" runat="server" MaxLength="50"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ErrorMessage="*Mention the Language" ControlToValidate="TxtLanguage" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Binding :
                 </td>
                <td>
                   &nbsp;&nbsp;
                    <asp:TextBox ID="TxtBinding" runat="server" MaxLength="50"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ErrorMessage="*Enter the Binding type" ControlToValidate="TxtBinding" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="font-size:x-large; font-family:Andalus" class="style2">Number of Pages :
                 </td>
                <td>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TxtNoOfPages" runat="server"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ErrorMessage="*Enter the number of pages" ControlToValidate="TxtNoOfPages" 
                        Font-Names="Baskerville Old Face" Font-Size="Large" ForeColor="Red" 
                        style="font-size: large" Font-Bold="True"></asp:RequiredFieldValidator>
                    &nbsp;
                    </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;<asp:Button ID="BtnNewBook" runat="server" Text="Add"
                        OnClick="BtnNewBook_Click" Font-Names="Andalus" Font-Size="Large"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" Font-Names="Andalus" 
                        Font-Size="Large" onclick="BtnCancel_Click" CausesValidation="False"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
