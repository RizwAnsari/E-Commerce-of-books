<%@ Page Title="" Language="C#" MasterPageFile="Main.master" AutoEventWireup="true" CodeFile="AddToCart.aspx.cs" Inherits="AddToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    &nbsp;
    <asp:HyperLink ID="HLlogin" runat="server" Font-Underline="True" ForeColor="#000099" NavigateUrl="~/Login.aspx" Font-Names="Arial" Font-Size="Large">Login</asp:HyperLink>
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="LblCartStatus" runat="server" Font-Names="Agency FB" 
        Font-Size="Large" ForeColor="Red" Font-Bold="True" 
        style="font-size: x-large"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="ImgbtnBack" runat="server" BorderColor="White" 
                BorderStyle="Outset" ForeColor="Black" 
        NavigateUrl="~/Products.aspx">Back</asp:HyperLink>
            &nbsp;&nbsp;<asp:DataList ID="DataList1" runat="server" 
        BorderColor="White" BorderStyle="Outset" BorderWidth="5px" CellPadding="4" 
        ForeColor="#333333" HorizontalAlign="Center">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <ItemTemplate>
            <table width="100%">
                <tr>
                    <td style="width: 140px; padding: 10px 10px">
                        <img src="Images/Upload/<%#Eval("Image")%>" width="300px" height="300px" alt="" />
                    </td>
                    <td align="left" style="padding: 10px 10px; vertical-align: top; font-size: large; font-family: Andalus">
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    <br />
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="lbltitle" runat="server" Text='<%#Eval("Title") %>' Font-Underline="true" Font-Bold="true" Font-Names="Algerian" Font-Size="X-Large"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" runat="server" Text="Author :" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="Label20" runat="server" Text='<%#Eval("Author") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label12" runat="server" Text="Description :" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("Description") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label13" runat="server" Text="Publisher :" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("Publisher") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label14" runat="server" Text="Published Year :" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("PublishedYear") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label15" runat="server" Text="ISBN-13 :" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text='<%#Eval("ISBN13") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label16" runat="server" Text="ISBN-10 :" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text='<%#Eval("ISBN10") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label17" runat="server" Text="Language :" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text='<%#Eval("Language") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label18" runat="server" Text="Binding :" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="Label9" runat="server" Text='<%#Eval("Binding") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label19" runat="server" Text="Number of Pages :" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="Label10" runat="server" Text='<%#Eval("NumberOfPages") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label21" runat="server" Text="Price ₹:" Font-Bold="true"></asp:Label>
                                    <br />
                                </td>
                                <td>
                                    <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>' Font-Size="Medium"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="BtnAddToCart" runat="server" Text="Add to Cart" CommandArgument='<%#Eval("BookId") %>' OnClick="BtnAddToCart_Click" OnCommand="BtnAddToCart_Command" Font-Names="Andalus" Font-Size="Large"/>
                                </td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>

</asp:Content>

