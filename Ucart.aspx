<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="Ucart.aspx.cs" Inherits="Ucart" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
	<div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:700px">
    
        <h2><asp:Label ID="lblcart" runat="server" CssClass="fontHeader" Text="Cart Details"></asp:Label></h2>

        <table>
            <tr>
                <td>
                    <div style="overflow:scroll;height:500px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1100px" >
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
                            <asp:BoundField DataField = "Title" HeaderText = "Title" />
                            <asp:BoundField DataField = "FirstName" HeaderText = "First Name" />
                            <asp:BoundField DataField = "LastName" HeaderText = "Last Name" />
                            <asp:BoundField DataField = "DeliveryAddress" HeaderText = "Delivery Address" />
                            <asp:BoundField DataField = "State" HeaderText = "State" />
                            <asp:BoundField DataField = "City" HeaderText = "City" />
                            <asp:BoundField DataField = "Pincode" HeaderText = "Pincode" />
                            <asp:BoundField DataField = "MobileNo" HeaderText = "Contact No." />
                            <asp:BoundField DataField = "CategoryName" HeaderText = "Category" />
                            <asp:BoundField DataField = "SubCatName" HeaderText = "Sub-Category" />
                            <asp:BoundField DataField = "MedicineName" HeaderText = "Medicine" />
                            <asp:BoundField DataField = "Price" HeaderText = "Price" />
                            <asp:BoundField DataField = "Quantity" HeaderText = "Quantity" />
                            <asp:BoundField DataField = "Total" HeaderText = "Total" />
                            <asp:BoundField DataField = "OrderDate" HeaderText = "Order Date" />
                            
                            
                            
                        </Columns>

                    </asp:GridView>
                        </div>
                </td>
            </tr>
        </table>
         
    
    </div>
    </asp:Content>


