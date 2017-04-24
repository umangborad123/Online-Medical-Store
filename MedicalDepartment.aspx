<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="MedicalDepartment.aspx.cs" Inherits="MedicalDepartment" %>

<asp:Content ID="Content5" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content6" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:700px">
    
        <h2>Doctor's Directory</h2>
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
                    <div style="overflow:scroll;height:500px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px">
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
                            <asp:BoundField DataField = "Name" HeaderText = "Name" />
                            <asp:BoundField DataField = "Address" HeaderText = "Address" />
                            <asp:BoundField DataField = "State" HeaderText = "State" />
                            <asp:BoundField DataField = "City" HeaderText = "City" />
                            <asp:BoundField DataField = "Pincode" HeaderText = "Pincode" />
                            <asp:BoundField DataField = "MobileNo" HeaderText = "Contact No" />
                            <asp:BoundField DataField = "Gender" HeaderText = "Gender" />
                            <asp:BoundField DataField = "Email" HeaderText = "Email" />
                            
                        </Columns>

                    </asp:GridView>
                        </div>
                </td>
            </tr>
        </table>
      </ContentTemplate>
   </asp:UpdatePanel>

    </div>
</asp:Content>


