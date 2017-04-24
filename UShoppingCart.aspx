<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="UShoppingCart.aspx.cs" Inherits="UShoppingCart" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:900px">
        <h2><asp:Label ID="lblshopping" runat="server" CssClass="fontHeader" Text="Shopping Cart" Width="200px"></asp:Label></h2>
        <br /><br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

          <div style="width:900px;height:900px">

             <div style="float:left;width:50%">
                <table>

                    <tr>
                        <td>
                            <asp:Label ID="lbldeptcat" runat="server" Text="Select Type" Width="200px"></asp:Label><br /><br />
                        </td>
                        <td>
                            <asp:DropDownList ID="drpdeptcat" runat="server" CssClass="dropdownlistedges" AutoPostBack="True" OnSelectedIndexChanged="drpdeptcat_SelectedIndexChanged" TabIndex="0 ">
                                <asp:ListItem>Select Type</asp:ListItem>
                                <asp:ListItem>Medical Department</asp:ListItem>
                                <asp:ListItem>Medical Category</asp:ListItem>
                            </asp:DropDownList><br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpdeptcat"></asp:RequiredFieldValidator>
                        </td>
                        
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblcname" runat="server" Text="Company Name"></asp:Label><br /><br />
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcname" runat="server" AutoPostBack="true" CssClass="dropdownlistedges"></asp:DropDownList><br /><br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpcname"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <asp:Panel ID="panelmedicdept" runat="server">
                    
                    <tr>
                        <td>
                            <asp:Label ID="lblmedicdept" runat="server" Text="Medical Department"></asp:Label><br /><br />
                        </td>
                        <td>
                            <asp:DropDownList ID="drpmedicdept" runat="server" AutoPostBack="true" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpmedicdept_SelectedIndexChanged" ></asp:DropDownList><br /><br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpmedicdept"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbldisease" runat="server" Text="Disease Name"></asp:Label><br /><br />
                        </td>
                        <td>
                            <asp:DropDownList ID="drpdisease" runat="server" AutoPostBack="true" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpdisease_SelectedIndexChanged"></asp:DropDownList><br /><br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpdisease"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    </asp:Panel>

                    <asp:Panel ID="panelcategory" runat="server">

                    <tr>
                        <td>
                            <asp:Label ID="lblcategory" runat="server" Text="Category"></asp:Label><br /><br />
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcategory" runat="server" AutoPostBack="true" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpcategory_SelectedIndexChanged"  ></asp:DropDownList>
                            <%--DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName"--%>
                            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OMSIConnectionString3 %>" SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource>--%><br /><br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpcategory"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                        <tr>
                        <td>
                            <asp:Label ID="lblsubcategory" runat="server" Text="Sub Category"></asp:Label><br /><br />
                        </td>
                        <td>
                            <asp:DropDownList ID="drpsubcategory" runat="server" AutoPostBack="true" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpsubcategory_SelectedIndexChanged"></asp:DropDownList><br /><br />
                        </td>
                         <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpsubcategory"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    </asp:Panel>

                    <asp:Panel ID="panelbtn" runat="server">

                    <tr>
                        <td>
                            <asp:Label ID="lblmedicine" runat="server" Text="Medicine Name"></asp:Label><br /><br />
                        </td>
                        <td>
                            <asp:DropDownList ID="drpmedicinename" runat="server" AutoPostBack="true" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpmedicinename_SelectedIndexChanged" ></asp:DropDownList><br /><br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpmedicinename"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblprice" runat="server" Text="Price"></asp:Label><br /><br />

                        </td>
                        <td>
                            <span >&#x20B9;</span> 
                            <asp:Label ID="lbldisplayprice" runat="server" Text="0.00"></asp:Label><br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblquantity" runat="server" Text="Quantity"></asp:Label><br /><br />
                        </td>
                        <td>
                           <asp:DropDownList ID="drpquantity" runat="server" AutoPostBack="true" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpquantity_SelectedIndexChanged" ></asp:DropDownList> <br /><br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpquantity"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbltotal" runat="server" Text="Total"></asp:Label><br /><br />
                        </td>
                        <td>
                            <span >&#x20B9;</span> 
                            <asp:Label ID="lbldisplaytotal" runat="server" Text="0.00"></asp:Label><br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="btnadd" runat="server" ImageUrl="~/images/addtocart.png" OnClick="btnadd_Click" /><br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblshoppingcart" runat="server" Text="Items added to cart --> 0"></asp:Label><br /><br />
                        </td>
                    </tr>

                    </asp:Panel>

                </table>
                 
                </div>

              

              <div style="float:right;width:50%">
                    
                    <table>
                        <tr>
                            <td>
                                <%--<asp:Image ID="imgdisp" runat="server" Width="300px" Height="300px" />--%>
                                <img id="imgdisp" runat="server" width="300" height="300" />
                            </td>
                        </tr>
                    </table>

              </div>

              <div >
                  <br /><br />
              <table>
                    <tr>
                        <td>
                            <div>
                    
                               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" OnRowDataBound="GridView1_RowDataBound">
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

                        <%--<Columns>
                            <asp:BoundField DataField="Path" Visible="false" />
                        </Columns>--%>
                            </asp:GridView>

                                 
                                <br /><br />
                   
                   
                            </div>
                        </td>
                        <td><asp:Label ID="lbldeptname" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="btnproceed" runat="server" ImageUrl="~/images/proceed.png" OnClick="btnproceed_Click" />
                        </td>
                    </tr>
                    

                </table>
              </div>
                

                    

                </div>

                
                
            </ContentTemplate>
        </asp:UpdatePanel>
                
    </div>
</asp:Content>


<asp:Content ID="Content6" runat="server" contentplaceholderid="itemtrack">
    <asp:Label ID="lblitemcount" runat="server" Text=""></asp:Label>
</asp:Content>



