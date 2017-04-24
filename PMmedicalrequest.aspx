<%@ Page Title="" Language="C#" MasterPageFile="~/PMmaster.master" AutoEventWireup="true" CodeFile="PMmedicalrequest.aspx.cs" Inherits="PMmedicalrequest" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<%--<asp:Content ID="Content5" runat="server" contentplaceholderid="contentdept">--%>
    <%-- <div class="grids">
        <div class="grid box">
            <h4>Pharmaceuticals</h4>
            <a href="Pharmaceuticals.aspx">
            <img src="images/pharmaceuticals-index.png" /></a>
        </div>
        <div class="grid box">
            <h4>Personal Care</h4>
            <a href="Personalcare.aspx">
            <img src="images/personalcare-index.png" /></a>
        </div>
        <div class="grid box">
            <h4>Baby Care</h4>
            <a href="Babycare.aspx">
            <img src="images/babycare-index.png" /></a>
        </div>
        <div class="grid box">
            <h4>Nutrition Health</h4>
            <a href="Nutrition.aspx">
            <img src="images/nutritionhealth-index.png" /></a>
        </div>
        <div class="clear">
        </div>
    </div>--%>
<%--</asp:Content>--%>


<asp:Content ID="Content6" runat="server" contentplaceholderid="maincontent">
   <div style="margin-left:160px;height:800px" class="fontStyle">
     <br /><br />
       <asp:Label ID="Label1" runat="server" Text="Medicine List" Font-Size="X-Large" ForeColor="Black"></asp:Label>
     <br /><br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                       </asp:DropDownList><br /><br />
                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpdeptcat"></asp:RequiredFieldValidator><br /><br />
                    </td>
                      
              </tr>
         </table>    
         
         <div style="overflow:scroll;height:500px">                            
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
                                    <asp:BoundField DataField = "Description" HeaderText = "Description" />
                                    <asp:BoundField DataField = "Price" HeaderText = "Price" />
                                    <asp:BoundField DataField = "ExpiryDate" HeaderText = "Expiry Date" />
                                    <asp:BoundField DataField = "Discount" HeaderText = "Discount" />
                                    <asp:ImageField DataImageUrlField="MedicineImage" ControlStyle-Height="100px" ControlStyle-Width="100px" HeaderText="Image"></asp:ImageField>
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








