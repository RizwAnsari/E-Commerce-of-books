<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="ReportBillTransaction.aspx.cs" Inherits="ReportBillTransaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="TransactionId" 
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BorderColor="White" 
        BorderStyle="Outset" BorderWidth="5px" Caption="Transaction Details" 
        Font-Names="Andalus" Font-Size="Large" CellPadding="4" ForeColor="#333333" 
        GridLines="Horizontal" HorizontalAlign="Center" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField HeaderText="Transaction Id" DataField="TransactionId" HeaderStyle-Font-Names="Algerian" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="#003366">
<HeaderStyle Font-Names="Algerian" Font-Size="Large" ForeColor="#003366"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="UserName" DataField="AddedBy" HeaderStyle-Font-Names="Algerian" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="#003366">
<HeaderStyle Font-Names="Algerian" Font-Size="Large" ForeColor="#003366"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Title" DataField="Title" HeaderStyle-Font-Names="Algerian" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="#003366">
<HeaderStyle Font-Names="Algerian" Font-Size="Large" ForeColor="#003366"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Author" DataField="Author" HeaderStyle-Font-Names="Algerian" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="#003366" >
<HeaderStyle Font-Names="Algerian" Font-Size="Large" ForeColor="#003366"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Quantity" DataField="Quantity" HeaderStyle-Font-Names="Algerian" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="#003366" >
<HeaderStyle Font-Names="Algerian" Font-Size="Large" ForeColor="#003366"></HeaderStyle>
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle Font-Names="Algerian" BackColor="#5D7B9D" Font-Bold="True" 
            ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>

