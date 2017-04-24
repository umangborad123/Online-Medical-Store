<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="Umedicine.aspx.cs" Inherits="Umedicine" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">

</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
	<div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:700px">
          <h2><asp:Label ID="lblmedicines" runat="server" CssClass="fontHeader" Text="Medicines"></asp:Label></h2>
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
            </table>
            <div style="overflow:scroll;height:500px;width:1000px">
            <table>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="980px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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

                        <Columns>
                            <asp:BoundField DataField = "CompanyName" HeaderText = "Company Name" />
                            <asp:BoundField DataField = "MedicineName" HeaderText = "Medicine Name" />
                            <asp:BoundField DataField = "Price" HeaderText = "Price" />
                            <asp:BoundField DataField = "ExpiryDate" HeaderText = "Expiry Date" />
                            <asp:BoundField DataField = "Discount" HeaderText = "Discount" />
                            
                        </Columns>

                    </asp:GridView>
                </td>
            </tr>

        </table> 
                </div>
      </ContentTemplate>
      </asp:UpdatePanel>
                    
    </div>
</asp:Content>


