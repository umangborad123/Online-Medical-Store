<%@ Page Title="" Language="C#" MasterPageFile="~/SMmaster.master" AutoEventWireup="true" CodeFile="SMmedicineManage.aspx.cs" Inherits="SMmedicineManage" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle" style="width:600px;height:800px;margin-left:20px">
        <h2><asp:Label ID="lblmedicinemanage" runat="server" CssClass="fontHeader" Text="Manage Stock"></asp:Label></h2>
        
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="drptype" EventName="SelectedIndexChanged"/>
                <asp:AsyncPostBackTrigger ControlID="drpdeptcat" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="drpmdept" EventName="SelectedIndexChanged"/>
                <asp:AsyncPostBackTrigger ControlID="drpdisease"/>
                <asp:AsyncPostBackTrigger ControlID="drpcname" />
                <asp:AsyncPostBackTrigger ControlID="drpcategory" EventName="SelectedIndexChanged"/>
                <asp:AsyncPostBackTrigger ControlID="drpsubcategory"/>
                <asp:PostBackTrigger ControlID="ImageButton1" />
            </Triggers>
             <ContentTemplate>--%>
                           <table border="1">
                               <tr>
                                   <td>
                                        <asp:Label ID="lbltype" runat="server"  Width="250px" Text="Select Type"></asp:Label>
                                   </td>
                                    <td>
                                        <asp:DropDownList ID="drptype" runat="server" CssClass="dropdownlistedges" AutoPostBack="True" OnSelectedIndexChanged="drptype_SelectedIndexChanged">
                                            <asp:ListItem>Select Type</asp:ListItem>
                                            <asp:ListItem>Add</asp:ListItem>
                                            <asp:ListItem>View</asp:ListItem>
                                        </asp:DropDownList>
                                       
                                        <br /><br />
                                   </td>
                               </tr>
                           </table>
                           
                         
                          <asp:Panel ID="drpmedical" runat="server">
                              <table>
                                  <tr>
                                      <td>
                                          <asp:Label ID="lblchoose" Width="250px" runat="server" Text="Department/Catagory"></asp:Label>
                                      </td>
                                       <td>
                                           <asp:DropDownList ID="drpdeptcat"  CssClass="dropdownlistedges" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                              <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem>Medical Department</asp:ListItem>
                                                <asp:ListItem>Medical Category</asp:ListItem>
                                            </asp:DropDownList>
                                           
                                           <br /><br />
                                        </td>
                                    </tr>
                              </table>
                              </asp:Panel>
                    <asp:Panel ID="AddPanel" runat="server">

                          <asp:Panel ID="medicalDept" runat="server">
                              <table border="1">  
                                                                                           
                                       <tr>
                                           <td>
                                               <asp:Label ID="lblmdept" runat="server" Text="Medical Department" Width="250px" ></asp:Label>
                                           </td>
                                           <td>
                                              <asp:DropDownList ID="drpmdept" runat="server" CssClass="dropdownlistedges" AutoPostBack="True" OnSelectedIndexChanged="drpmdept_SelectedIndexChanged">
                                            
                                                </asp:DropDownList> 
                                               
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
                                              <asp:DropDownList ID="drpdisease" runat="server" CssClass="dropdownlistedges" AutoPostBack="True">
                                            
                                                </asp:DropDownList> 
                                               
                                               <br /><br />
                                           </td>
                                           <td>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidatordisease" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpdisease"></asp:RequiredFieldValidator>
                                           </td>
                                       </tr>
                                       </table>
                               </asp:Panel>

                               <table>

                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCname" runat="server" Text="Company Name" Width="250px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpcname" runat="server" CssClass="dropdownlistedges" AutoPostBack="True">
                                            
                                            </asp:DropDownList>
                                            
                                            <br /><br />
                                        </td>
                                         <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorcname" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpcname"></asp:RequiredFieldValidator>
                                        </td> 
                                    </tr>

                                    
                               

                      <asp:Panel ID="category" runat="server">
                          
                               <tr>
                                   <td>
                                       <asp:Label ID="lblcategory" runat="server" Text="Category" ></asp:Label>
                                   </td>
                                   <td>
                                      <asp:DropDownList ID="drpcategory" runat="server" AutoPostBack="True" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpcategory_SelectedIndexChanged" DataSourceID="SqlDataSource4" DataTextField="CategoryName" DataValueField="CategoryName">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:OMSIConnectionString3 %>" SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource>
                                            <br /><br />
                                   </td>
                                   <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorcatagory" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpcategory"></asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Label ID="lblsubcategory" runat="server" Text="Sub Category" ></asp:Label>
                                   </td>
                                   <td>
                                      <asp:DropDownList ID="drpsubcategory" runat="server" CssClass="dropdownlistedges" AutoPostBack="True">
                                            
                                        </asp:DropDownList> <br /><br />
                                   </td>
                                   <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorsubcatagory" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpsubcategory"></asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                      </asp:Panel>
                                   <tr>
                                       <td>
                                            <asp:Label ID="lblmedicinename" runat="server"  Width="250px" Text="Medicine Name"></asp:Label>
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtmedicname" runat="server" CssClass ="textboxedges" Width="300px" OnTextChanged="txtmedicname_TextChanged"></asp:TextBox>
                                       </td>
                                       <td>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidatormedicname" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtmedicname"></asp:RequiredFieldValidator><br /><br />
                                       </td>
                                    </tr>
                                   <tr>
                                       <td>
                                            <asp:Label ID="lbldescription" runat="server"  Width="250px" Text="Medicine Description"></asp:Label>
                                       </td>
                                        <td>
                                           <asp:TextBox ID="txtdescription" runat="server" CssClass ="textboxedges" Width="300px"></asp:TextBox><br /><br />
                                       </td>
                                       
                                    </tr>
                                                                      
                                       <tr>
                                           <td>
                                               <asp:Label ID="lblqty" runat="server" Width="250px" Text="Quantity" ></asp:Label>
                                           </td>
                                           <td>
                                               <asp:TextBox ID="txtqty" runat="server" CssClass ="textboxedges" Width="300px"></asp:TextBox>
                                           </td>
                                           <td>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidatorqty" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtqty"></asp:RequiredFieldValidator><br /><br />
                                           </td>
                                       </tr>

                                 <tr>
                                   <td>
                                       <asp:Label ID="lblmprice" runat="server" Text="Medicine Price"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="txtmprice" runat="server" Height="20px" Width="300px" CssClass="textboxedges"></asp:TextBox><br /><br />
                                   </td>
                                   <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidatormprice" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtmprice"></asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                                <tr>
                                   <td>
                                       <asp:Label ID="lblexdate" runat="server" Text="Medicine Expiry Date"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="txtexdate" runat="server" Height="20px" Width="300px" CssClass="textboxedges" OnTextChanged="txtexdate_TextChanged"></asp:TextBox><br /><br />
                                   </td>
                                   <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorexdate" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtexdate"></asp:RequiredFieldValidator>
                                   </td>
                                </tr>
                                <tr>
                                   <td>
                                       <asp:Label ID="lbldiscount" runat="server" Text="Discount"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="txtdiscount" runat="server" Height="20px" Width="300px" CssClass="textboxedges"></asp:TextBox><br /><br />
                                   </td>
                                   <td>
                                       <asp:Label ID="Label1" runat="server" Text="Optional" ForeColor="Red" Font-Size="X-Small"></asp:Label>
                                   </td>
                                  
                               </tr>
                        
                
                       
                                 <tr>
                                   <td>
                                       <asp:Label ID="lbluimage" runat="server" Text="Upload Image"></asp:Label>
                                   </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:FileUpload ID="imageupload" runat="server" /><br /><br />
                                    </td>
                                    <td>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidatorimageupload" runat="server" ErrorMessage="Only .jpg,.jpeg,.png" ControlToValidate="MedicineImageUpload" ForeColor="Red" Font-Size="X-Small" ValidationExpression="([^\\s]+(\\.(?i)(jpg|png|gif|bmp))$)"></asp:RegularExpressionValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                   <td colspan="2">
                                       <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/SUBMIT.png" OnClick="ImageButton1_Click" >
                                       </asp:ImageButton>
                                       &nbsp;&nbsp;&nbsp;&nbsp;
                                   
                                       <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/breset.png" CausesValidation="False" OnClick="ImageButton2_Click"/>
                                      
                                   </td>
                               </tr>
                           </table>
                    </asp:Panel>    
                  
                
                    
                                
                <%-- <asp:Panel ID="EditDeletePanel" runat="server">
                 
                     <div class="fontStyle" style="width:800px;height:600px">
                         <table>
                             <tr>
                                 <td>
                                     <asp:Label ID="lblselect" Width="250px" runat="server" Text="Department/Catagory"></asp:Label>
                                 </td>
                                  <td>
                                      <asp:DropDownList ID="drpselect"  CssClass="dropdownlistedges" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpselect_SelectedIndexChanged">
                                           <asp:ListItem>Select</asp:ListItem>
                                           <asp:ListItem>Medical Department</asp:ListItem>
                                           <asp:ListItem>Medical Category</asp:ListItem>
                                           </asp:DropDownList>
                                          
                                           <br /><br />
                                  </td>
                             </tr>
                         </table>
                        <div style="overflow:scroll;height:500px;position:absolute">
                         <table>

                             <tr>
                                 <td>
                                     <asp:GridView ID="editdeletegridview" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" >
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
                                             <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                                             <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                                             <asp:BoundField DataField="SubCatName" HeaderText="Sub Category Name" />
                                             <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                                             <asp:BoundField DataField="Description" HeaderText="Description" />
                                             <asp:BoundField DataField="Price" HeaderText="Price" />
                                             <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                             <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" />
                                             <asp:BoundField DataField="MedicineImage" Visible="false" />

                                             <asp:ImageField DataImageUrlField="MedicineImage" ControlStyle-Height="100px" ControlStyle-Width="100px" HeaderText="Image" />

                                         </Columns>

                                     </asp:GridView>

                                     <asp:GridView ID="editdeletegridview2" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px">
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
                                             <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                                             <asp:BoundField DataField="DeptName" HeaderText="Department Name" />
                                             <asp:BoundField DataField="DiseasesName" HeaderText="Diseases Name" />
                                             <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                                             <asp:BoundField DataField="Description" HeaderText="Description" />
                                             <asp:BoundField DataField="Price" HeaderText="Price" />
                                             <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                             <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" />
                                             <asp:BoundField DataField="MedicineImage" Visible="false" />

                                             <asp:ImageField DataImageUrlField="MedicineImage" ControlStyle-Height="100px" ControlStyle-Width="100px" HeaderText="Image" />

                                         </Columns>

                                     </asp:GridView>

                                     
                                 </td>
                             </tr>
                         </table>
                            </div>
                       </div>  
                     </asp:Panel>--%>

           <asp:Panel ID="ViewPanel" runat="server">

              <div class="fontStyle" style="width:800px">
                         <table>
                             <tr>
                                 <td>
                                     <asp:Label ID="Label2" Width="250px" runat="server" Text="Department/Catagory"></asp:Label>
                                 </td>
                                  <td>
                                      <asp:DropDownList ID="drpselect2"  CssClass="dropdownlistedges" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpselect2_SelectedIndexChanged">
                                           <asp:ListItem>Select</asp:ListItem>
                                           <asp:ListItem>Medical Department</asp:ListItem>
                                           <asp:ListItem>Medical Category</asp:ListItem>
                                           </asp:DropDownList>
                                          
                                           <br /><br /><br />
                                  </td>
                             </tr>
                         </table>
                  </div>
                   <div style="overflow:scroll;height:500px;width:1300px">
                         <table>

                             <tr>
                                 <td>
                                     <asp:GridView ID="viewgridview1" runat="server" AutoGenerateColumns="false" Width="1230px" CellPadding="4" ForeColor="#333333" GridLines="None" >
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
                                             <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                                             <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                                             <asp:BoundField DataField="SubCatName" HeaderText="Sub Category Name" />
                                             <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                                             <asp:BoundField DataField="Description" HeaderText="Description" />
                                             <asp:BoundField DataField="Price" HeaderText="Price" />
                                             <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                             <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" />
                                             <asp:BoundField DataField="MedicineImage" Visible="false" />

                                             <asp:ImageField DataImageUrlField="MedicineImage" ControlStyle-Height="100px" ControlStyle-Width="100px" HeaderText="Image" />

                                         </Columns>

                                     </asp:GridView>
                           
                                    <tr>
                                        <td>
                                             <asp:GridView ID="viewgridview2" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1230px">
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
                                                     <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                                                     <asp:BoundField DataField="DeptName" HeaderText="Department Name" />
                                                     <asp:BoundField DataField="DiseasesName" HeaderText="Diseases Name" />
                                                     <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                                                     <asp:BoundField DataField="Description" HeaderText="Description" />
                                                     <asp:BoundField DataField="Price" HeaderText="Price" />
                                                     <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                                     <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" />
                                                     <asp:BoundField DataField="MedicineImage" Visible="false" />

                                                     <asp:ImageField DataImageUrlField="MedicineImage" ControlStyle-Height="100px" ControlStyle-Width="100px" HeaderText="Image" />

                                                 </Columns>

                                             </asp:GridView>

                                         </td>
                                    </tr>
                                </table>
                            </div>
                          
          </asp:Panel>
              
     </div>
</asp:Content>


