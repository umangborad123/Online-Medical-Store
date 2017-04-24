<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="UaddDisease.aspx.cs" Inherits="UaddDisease" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle">
         <h2><asp:Label ID="lblinbox" runat="server" CssClass="fontHeader" Text="Tell us your problems !"></asp:Label></h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbldeptname" runat="server" Text="Department Name" Width ="200px"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpname" runat="server" CssClass ="dropdownlistedges" AutoPostBack="True" OnSelectedIndexChanged="drpname_SelectedIndexChanged"></asp:DropDownList>
                    
                    <br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbldoctor" runat="server" Text="Doctor Name" Width ="200px"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpdoctor" runat="server" CssClass="dropdownlistedges"></asp:DropDownList><br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblproblem" runat="server" Text="Describe Problem" Width ="200px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtproblem" runat="server" TextMode="MultiLine" Width="300px" Height="200px" CssClass="textboxedges"></asp:TextBox><br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnadd" runat="server" CssClass="textboxedges" Width="150px" Height="40px"  Text="Add" OnClick="btnadd_Click" />
                </td>
            </tr>
        </table> 
      </ContentTemplate>
      </asp:UpdatePanel>
    </div>
</asp:Content>


