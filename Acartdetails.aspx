<%@ Page Title="" Language="C#" MasterPageFile="~/Amaster.master" AutoEventWireup="true" CodeFile="Acartdetails.aspx.cs" Inherits="Acartetails" %>

<asp:Content ID="Content3" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="leftcontent">
				     <div class="col_1_of_3 span_1_of_3 frist fontStyle" style="width:250px">
                         <br />
                         <asp:Label ID="Label1" runat="server" Text="View Details" CssClass="fontHeader" Font-Size="X-Large"></asp:Label>
                         <br />
                         <asp:TreeView ID="detail" runat="server" Width="300px" ImageSet="Arrows" Font-Bold="True" ForeColor="Red" NodeStyle-ForeColor="#000066" EnableTheming="True" HoverNodeStyle-ForeColor="#000066" LeafNodeStyle-ForeColor="#000066" ParentNodeStyle-ForeColor="#000066" RootNodeStyle-ForeColor="#000066" SelectedNodeStyle-ForeColor="Yellow">
                            <HoverNodeStyle Font-Underline="True" ForeColor="#000066" />
                             <LeafNodeStyle ForeColor="#000066" />
                            <Nodes>
                                <%--<asp:TreeNode Text="Registered User" Value="Registered User" Expanded="False">
                                    <asp:TreeNode Text="Patients" Value="Patients"></asp:TreeNode>
                                    <asp:TreeNode Text="Doctors" Value="Doctors"></asp:TreeNode>
                                    <asp:TreeNode Text="Stock Managers" Value="Stock Managers"></asp:TreeNode>
                                    <asp:TreeNode Text="Pharmaceutical Managers" Value="Pharmaceutical Managers"></asp:TreeNode>
                                </asp:TreeNode>--%>
                                <asp:TreeNode Text="View Users" Value="View Users" Expanded="False" Checked="True" SelectAction="Expand">
                                    <asp:TreeNode NavigateUrl="~/Apatientprofile.aspx" Text="Patients" Value="Patients"></asp:TreeNode>
                                    <asp:TreeNode NavigateUrl="~/Adoctorprofile.aspx" Text="Doctors" Value="Doctors"></asp:TreeNode>
                                    <asp:TreeNode NavigateUrl="~/Astockmanager.aspx" Text="Stock Managers" Value="Stock Managers"></asp:TreeNode>
                                    <asp:TreeNode NavigateUrl="~/Apharmaprofile.aspx" Text="Pharmaceutical Managers" Value="Pharmaceutical Managers"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode NavigateUrl="~/Acartdetails.aspx" Text="User Cart Details" Value="User Cart Details" Expanded="False"></asp:TreeNode>
                            </Nodes>
                            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                            <ParentNodeStyle Font-Bold="True" ForeColor="#000066" />
                             <RootNodeStyle ForeColor="#000066" />
                            <SelectedNodeStyle Font-Underline="True" ForeColor="#006600" HorizontalPadding="0px" VerticalPadding="0px" />
                        </asp:TreeView>
                     </div>
                 
                </asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
	<div class="col_1_of_3 span_1_of_3 frist fontStyle">
        <br />
         <h2><asp:Label ID="Label2" runat="server" Text="Cart Details" CssClass="fontHeader" Font-Size="X-Large"></asp:Label></h2>
        <br /><br />
        <table>
            <tr>
                <td>
                    <div style="overflow:scroll;height:500px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" >
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


