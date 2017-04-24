<%@ Page Title="" Language="C#" MasterPageFile="~/Dmaster.master" AutoEventWireup="true" CodeFile="Dmedicine.aspx.cs" Inherits="Dmedicine" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle">
       <h2><asp:Label ID="lblmedicine" runat="server" CssClass="fontHeader" Text="Medicine"></asp:Label></h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
         <%--<table>
             <tr>
                  <td>
                      <asp:Label ID="lbldeptcat" runat="server" Text="Select Type" Width="200px"></asp:Label><br /><br />
                  </td>
                   <td>
                       <asp:DropDownList ID="drpdeptcat" runat="server" CssClass="dropdownlistedges" AutoPostBack="True" OnSelectedIndexChanged="drpdeptcat_SelectedIndexChanged" TabIndex="0 ">
                           <asp:ListItem>Select Type</asp:ListItem>
                           <asp:ListItem>Medical Department</asp:ListItem>
                           <asp:ListItem>Medical Category</asp:ListItem>
                       </asp:DropDownList><br /><br />
                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpdeptcat"></asp:RequiredFieldValidator><br /><br />
                    </td>
                      
              </tr>
         </table>                       --%>         
         <table>           
                     <tr>
                         <td>
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
                                    <asp:BoundField DataField = "CompanyName" HeaderText = "Company Name" ControlStyle-CssClass="tablealign" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ApplyFormatInEditMode="True" />
                                    <asp:BoundField DataField = "MedicineName" HeaderText = "Medicine Name" />
                                    
                                    <asp:BoundField DataField = "Price" HeaderText = "Price" />
                                    <asp:BoundField DataField = "ExpiryDate" HeaderText = "Expiry Date" />
                                    <asp:BoundField DataField = "Discount" HeaderText = "Discount" />
                                    <asp:ImageField DataImageUrlField="MedicineImage" ControlStyle-Height="100px" ControlStyle-Width="100px" HeaderText="Image"></asp:ImageField>
                                </Columns>

                            </asp:GridView>
                             

                         </td>
                     </tr>
                    
                </table>
            </ContentTemplate>
           </asp:UpdatePanel>
                </div>
</asp:Content>


