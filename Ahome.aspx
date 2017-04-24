<%@ Page Title="" Language="C#" MasterPageFile="~/Amaster.master" AutoEventWireup="true" CodeFile="Ahome.aspx.cs" Inherits="Ahome" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>


<asp:Content ID="Content6" runat="server" contentplaceholderid="maincontent">
     <div class="col_1_of_3 span_1_of_3 second fontStyle" style="width:900px">
     
     </div>
                
</asp:Content>



<asp:Content ID="Content7" runat="server" contentplaceholderid="leftcontent">
				     <div class="col_1_of_3 span_1_of_3 frist fontStyle" style="width:250px">
                         <br />
                         <asp:Label ID="Label1" runat="server" Text="View Details" CssClass="fontHeader" Font-Size="XX-Large"></asp:Label>
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




