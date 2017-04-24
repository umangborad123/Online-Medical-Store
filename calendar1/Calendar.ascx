<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Calendar.ascx.cs" Inherits="Calendar" %>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<asp:DropDownList ID="drpyear" runat="server" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpyear_SelectedIndexChanged" AutoPostBack="True">
     <asp:ListItem>Year</asp:ListItem>
            <asp:ListItem>1990</asp:ListItem>
            <asp:ListItem>1991</asp:ListItem>
            <asp:ListItem>1992</asp:ListItem>
            <asp:ListItem>1993</asp:ListItem>
            <asp:ListItem>1994</asp:ListItem>
            <asp:ListItem>1995</asp:ListItem>
            <asp:ListItem>1996</asp:ListItem>
            <asp:ListItem>1997</asp:ListItem>
            <asp:ListItem>1998</asp:ListItem>
            <asp:ListItem>1999</asp:ListItem>
            <asp:ListItem>2000</asp:ListItem>
            <asp:ListItem>2001</asp:ListItem>
            <asp:ListItem>2002</asp:ListItem>
            <asp:ListItem>2003</asp:ListItem>
            <asp:ListItem>2004</asp:ListItem>
</asp:DropDownList>

<asp:DropDownList ID="drpmonth" runat="server" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpmonth_SelectedIndexChanged" AutoPostBack="True">
    <asp:ListItem>Month</asp:ListItem>
</asp:DropDownList>

<asp:DropDownList ID="drpday" runat="server" CssClass="dropdownlistedges" AutoPostBack="True">
    <asp:ListItem>Day</asp:ListItem>
</asp:DropDownList>
    