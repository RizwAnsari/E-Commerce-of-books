<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .autocomplete_completionListElement {
            margin: 0px!important;
            background-color: inherit;
            color: windowtext;
            border: buttonshadow;
            border-width: 3px;
            border-style: outset;
            border-color:#FFFFFF;
            cursor: default;
            overflow: auto;
            height: 200px;
            font-family: Tahoma;
            font-size: small;
            text-align: left;
            list-style-type: disc;
        }
        /* AutoComplete highlighted item */
        .autocomplete_highlightedListItem {
            background-color: #CACFD2;
            color: black;
            font-weight:bold;
            padding: 1px;
        }

        /* AutoComplete item */
        .autocomplete_listItem {
            background-color: window;
            color: windowtext;
            padding: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td align="right" bgcolor="#CACFD2">
                <asp:AutoCompleteExtender ID="AutoCompleteExtender1"
                    EnableCaching="true"
                    BehaviorID="AutoCompleteEx"
                    MinimumPrefixLength="1"
                    TargetControlID="txtSearch"
                    ServicePath="AutoComplete.asmx"
                    ServiceMethod="GetCompletionList"
                    CompletionInterval="1000"
                    CompletionSetCount="20"
                    CompletionListCssClass="autocomplete_completionListElement"
                    CompletionListItemCssClass="autocomplete_listItem"
                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                    DelimiterCharacters=";, :"
                    ShowOnlyCurrentWordInCompletionListItem="true"
                    runat="server">
                    <Animations>
  <OnShow>
  <Sequence>
  <%-- Make the completion list transparent and then show it --%>
  <OpacityAction Opacity="1" />
  <HideAction Visible="false" />

  <%--Cache the original size of the completion list the first time
    the animation is played and then set it to zero --%>
  <ScriptAction Script="// Cache the size and setup the initial size
                                var behavior = $find('AutoCompleteEx');
                                if (!behavior._height) {
                                    var target = behavior.get_completionList();
                                    behavior._height = target.offsetHeight - 2;
                                    target.style.height = '0px';
                                }" />
  <%-- Expand from 0px to the appropriate size while fading in --%>
  <Parallel Duration=".4">
  <FadeIn />
  <Length PropertyKey="height" StartValue="0" 
	EndValueScript="$find('AutoCompleteEx')._height" />
  </Parallel>
  </Sequence>
  </OnShow>
  <OnHide>
  <%-- Collapse down to 0px and fade out --%>
  <Parallel Duration=".4">
  <FadeOut />
  <Length PropertyKey="height" StartValueScript=
	"$find('AutoCompleteEx')._height" EndValue="0" />
  </Parallel>
  </OnHide>
                    </Animations>
                </asp:AutoCompleteExtender>
                <asp:TextBox ID="txtSearch" runat="server" Width="200px"></asp:TextBox>&nbsp;
                        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Font-Bold="True" Font-Italic="False" Font-Names="Agency FB" Font-Overline="False" Font-Size="Large" Font-Underline="True" ForeColor="#000066" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    AllowCustomErrorsRedirect="False">
                </asp:ScriptManager>
                <br />
                <br />
                <div>
                    <asp:DropDownList ID="DrpCategory" OnSelectedIndexChanged="DrpCategory_SelectedIndexChanged" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DrpSubCategory" OnSelectedIndexChanged="DrpSubCategory_SelectedIndexChanged" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </div>
                <hr />
                <br />
                <br />
                <asp:Repeater ID="RepeaterBook" runat="server">
                    <ItemTemplate>
                        <table width="100%" border="1">
                            <tr>
                                <td style="width: 140px">
                        <img src="Images/Upload/<%#Eval("Image")%>" width="200px" height="250px" alt="" />
                                </td>
                                <td align="right" 
                                    style="vertical-align: top; text-align: left; font-size:large; font-family:Andalus">
                                    <a href='AddToCart.aspx?BookID=<%# Eval("BookId") %>'>
                            <br />
                                    <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Names="Algerian" 
                                        Font-Size="X-Large" style="color: #000000" Text='<%#Eval("Title") %>'></asp:Label>
                                    </a>
                        <br />
                                    <b>Author :</b>
                                    <asp:Label ID="Label7" runat="server" style="font-weight:bold" Text='<%#Eval("Author") %>'></asp:Label>
                        <br />
                                    <b>Price ₹ :</b>
                                    <asp:Label ID="Label2" runat="server" style="font-weight:bold" Text='<%#Eval("Price") %>'></asp:Label>
                        <br />
                                    <b>Description :</b>
                                    <asp:Label ID="Label3" runat="server" style="font-weight:bold" Text='<%#Eval("Description") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
    </table>
    
</asp:Content>

