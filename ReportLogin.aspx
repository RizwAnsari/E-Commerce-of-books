<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" Tagprefix="rsweb" %>

<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="ReportLogin.aspx.cs" Inherits="ReportLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:HyperLink ID="HLBack" runat="server" NavigateUrl="~/Report.aspx" Font-Names="Andalus" Font-Size="Large" ForeColor="#660066"><u>Back</u></asp:HyperLink>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="1355px" 
            BorderColor="White" BorderStyle="Outset" Font-Bold="True" Font-Names="Andalus" 
            Font-Size="Large" BackColor="#ffe3e3" BorderWidth="5px" 
            InternalBorderStyle="Outset" InternalBorderWidth="5px" 
            ToolBarItemBorderStyle="Outset" ToolBarItemBorderWidth="5px" 
            Height="260px"></rsweb:ReportViewer >
    </div>
</asp:Content>

