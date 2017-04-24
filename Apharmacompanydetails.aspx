<%@ Page Title="" Language="C#" MasterPageFile="~/Amaster.master" AutoEventWireup="true" CodeFile="Apharmacompanydetails.aspx.cs" Inherits="Apharmacompanydetails" %>

<asp:Content ID="Content3" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="maincontent">
  <div>
      <br /><br />
       <h2><asp:Label ID="lblpharmacompany" runat="server" CssClass="fontHeader" Text="Pharmaceutical Companies"></asp:Label></h2>
      <br /><br />
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
        <table>
            <tr>
                <td>
                    <asp:DropDownList ID="drpname" runat="server" CssClass ="dropdownlistedges" AutoPostBack="True" OnSelectedIndexChanged="drpname_SelectedIndexChanged"></asp:DropDownList>
                    
                    <br /><br />
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <EditRowStyle BackColor="#999999" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
      </ContentTemplate>
   </asp:UpdatePanel>
  </div>
</asp:Content>


