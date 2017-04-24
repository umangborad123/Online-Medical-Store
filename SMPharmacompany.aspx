<%@ Page Title="" Language="C#" MasterPageFile="~/SMmaster.master" AutoEventWireup="true" CodeFile="SMPharmacompany.aspx.cs" Inherits="SMPharmacompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="leftcontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:700px">
        <h2><asp:Label ID="lblcompany" runat="server" CssClass="fontHeader" Text="Pharmacompanies Details"></asp:Label></h2>
                   
        <table>
            <tr>
                <td>
                     <asp:DropDownList ID="drpdeptcat"  CssClass="dropdownlistedges" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpdeptcat_SelectedIndexChanged">
                         <asp:ListItem>Select</asp:ListItem>
                         <asp:ListItem>Medical Department</asp:ListItem>
                         <asp:ListItem>Medical Category</asp:ListItem>
                     </asp:DropDownList>
                                           
                    <br /><br /><br />
                </td>
            </tr>
            
            <tr>
                <td>
                    <%--category--%>
                    <div style="overflow:scroll;height:500px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="1000px" CellPadding="4" ForeColor="#333333" GridLines="None" >
                               <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />
                               <EditRowStyle BackColor="#999999" HorizontalAlign="Center" VerticalAlign="Middle" />
                               <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                       <asp:BoundField DataField = "Description" HeaderText = "Description" />
                                       <asp:BoundField DataField = "Price" HeaderText = "Price" />
                                       <asp:BoundField DataField = "ExpiryDate" HeaderText = "Expiry Date" />
                                       
                                </Columns>
                               </asp:GridView>
                        
                    <%--dept--%>
                     
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" Width="1000px" CellPadding="4" ForeColor="#333333" GridLines="None" >
                               <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />
                               <EditRowStyle BackColor="#999999" HorizontalAlign="Center" VerticalAlign="Middle" />
                               <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                       
                                </Columns>
                               </asp:GridView>
                        </div>
                </td>
            </tr>
        </table>

       </div>
</asp:Content>


