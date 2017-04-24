<%@ Page Title="" Language="C#" MasterPageFile="~/Amaster.master" AutoEventWireup="true" CodeFile="AManageMedicine.aspx.cs" Inherits="AManageStock" %>

<asp:Content ID="Content3" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="maincontent">
	<div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:900px" >
        <br /><br />
    <h2><asp:Label ID="lblmedicine" Width="270px" runat="server" CssClass="fontHeader" Text="Medicines"></asp:Label></h2>
         
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate>
                   <table>
                       <tr>
                         <td>
                             <asp:Label ID="lblchoose" Width="270px" runat="server" Text="Department/Catagory"></asp:Label>
                         </td>
                         <td>
                             <asp:DropDownList ID="drpdeptcat"  CssClass="dropdownlistedges" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                 <asp:ListItem>Select</asp:ListItem>
                                 <asp:ListItem>Medical Department</asp:ListItem>
                                 <asp:ListItem>Medical Category</asp:ListItem>
                             </asp:DropDownList><br /><br />
                         </td>
                       </tr>
                    </table>

              <asp:Panel ID="deptcategory" runat="server">

                     <table>
                       <tr>
                           <td>
                                <asp:Label ID="Lblcompany" Width="270px" runat="server" Text="Company Name"></asp:Label><br />
                           </td>
                           
                           <td>
                                <asp:DropDownList ID="drpcompany" runat="server" CssClass="dropdownlistedges" AutoPostBack="True"></asp:DropDownList><br /><br />
                                
                           </td>
                       </tr>
                    
                         <asp:Panel ID="medicaldept" runat="server">
                                <tr>
                                   <td>
                                       <asp:Label ID="lblmdept" runat="server" Text="Medical Department" ></asp:Label>
                                   </td>
                                   <td>
                                       <asp:DropDownList ID="drpmdept" CssClass="dropdownlistedges" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpmdept_SelectedIndexChanged"></asp:DropDownList>                      
                                       
                                       
                                       <br /><br />
                                   </td>
                                   <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidatormdepartment" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpmdept"></asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                                <tr>
                                   <td>
                                       <asp:Label ID="lbldisease" runat="server" Text="Disease" ></asp:Label>
                                   </td>
                                   <td>
                                       <asp:DropDownList ID="drpdisease" CssClass="dropdownlistedges" runat="server" AutoPostBack="True"></asp:DropDownList>
                                       
                                       <br /><br />
                                   </td>
                                   <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidatordisease" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpdisease"></asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                         </asp:Panel>

                       <asp:Panel ID="Category" runat="server">
                         
                                 <tr>
                                   <td>
                                        <asp:Label ID="lblcat" runat="server" Width="250px" Text="Catagory"></asp:Label><br /><br />
                                   </td>
                          
                                   <td>
                                        <asp:DropDownList ID="drpcat" runat="server" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpcat_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryName"></asp:DropDownList><br />
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OMSIConnectionString3 %>" SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource><br />
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                        <asp:Label ID="lblsubcat" runat="server" Width="250px" Text="Sub - Catagory"></asp:Label><br />
                                   </td>
                          
                                   <td>
                                        <asp:DropDownList ID="drpsubcat" runat="server" CssClass="dropdownlistedges" AutoPostBack="True"></asp:DropDownList><br /><br />
                                        
                                       
                                   </td>
                               </tr>
                       </asp:Panel>
                       
                         <tr>
                           <td>
                               <asp:Button ID="btndisplay" runat="server" Width ="100px" CssClass="textboxedges" Text="Display" OnClick="btndisplay_Click" /><br /><br />
                           </td>
                         </tr>
                         </table>
                  <asp:Panel ID="g2" runat="server">
                         <table>
                         <tr>
                           <td>
                               <%--medicaldept--%>
                               <div style="overflow:scroll;height:500px">
                               <asp:GridView ID="GridView2" runat="server" Width="1000px" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                       <asp:BoundField DataField = "DeptName" HeaderText = "Department Name" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
                                        <asp:BoundField DataField = "CompanyName" HeaderText = "Company Name" />
                                        <asp:BoundField DataField = "DiseasesName" HeaderText = "Diseases Name" />
                                        <asp:BoundField DataField = "MedicineName" HeaderText = "Medicine Name" />
                                        <asp:BoundField DataField = "Description" HeaderText = "Description" />
                                        <asp:BoundField DataField = "Price" HeaderText = "Price" />
                                        <asp:BoundField DataField = "Quantity" HeaderText = "Quantity" />
                                        <asp:BoundField DataField = "ExpiryDate" HeaderText = "Expiry Date" />
                                        <asp:BoundField DataField = "Discount" HeaderText = "Discount" />
                                        <asp:ImageField DataImageUrlField="MedicineImage" ControlStyle-Width = "100" ControlStyle-Height = "100" HeaderText="Image"></asp:ImageField>
                                   </Columns>
                               </asp:GridView>
                                   </div>
                            </td>
                         </tr>
                        </table>
                     </asp:Panel>

                   <asp:Panel ID="g1" runat="server">
                         <table>
                         <tr>
                           <td>
                               <%--category--%>
                               <div style="overflow:scroll;height:500px">
                               <asp:GridView ID="GridView1" runat="server" Width="1000px" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                       
                                        <asp:BoundField DataField = "MedicineName" HeaderText = "Medicine Name" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
                                        <asp:BoundField DataField = "Description" HeaderText = "Description" />
                                        <asp:BoundField DataField = "Price" HeaderText = "Price" />
                                        <asp:BoundField DataField = "Quantity" HeaderText = "Quantity" />
                                        <asp:BoundField DataField = "ExpiryDate" HeaderText = "Expiry Date" />
                                        <asp:BoundField DataField = "Discount" HeaderText = "Discount" />
                                        <asp:ImageField DataImageUrlField="MedicineImage" ControlStyle-Width = "100" ControlStyle-Height = "100" HeaderText="Image"></asp:ImageField>
                                   </Columns>
                               </asp:GridView>
                            </div>
                            </td>
                         </tr>
                        </table>
                     </asp:Panel>

                 </asp:Panel>
               </ContentTemplate>
            </asp:UpdatePanel>
        

    </div>
</asp:Content>


