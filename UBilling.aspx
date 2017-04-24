<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="UBilling.aspx.cs" Inherits="UBilling" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentdept" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="leftcontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
	<div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:1500px;margin-left:200px;width:600px">
        <br />
         <h2>
             <asp:Label ID="Label1" runat="server" CssClass="fontHeader" Text="Billing Information"></asp:Label>

         </h2>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

        <table>
            <tr>
                <td>
                    <asp:DropDownList ID="drptitle" runat="server"  Height="30px" CssClass="dropdownlistedges" >
                        <asp:ListItem>Title</asp:ListItem>
                        <asp:ListItem>Mr.</asp:ListItem>
                        <asp:ListItem>Mrs.</asp:ListItem>
                        <asp:ListItem>Miss.</asp:ListItem>
                        <asp:ListItem>Ms.</asp:ListItem>
                        <asp:ListItem>Dr.</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtfname" CssClass="textboxedges" runat="server" Width="250px" Height="30px" style="padding-left:15px"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtfname" WatermarkText="First Name" ></asp:TextBoxWatermarkExtender>
                    &nbsp;&nbsp;
                </td>
                 <td>
                    <asp:TextBox ID="txtlname" CssClass="textboxedges" runat="server" Width="200px" Height="30px" style="padding-left:15px"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txtlname" WatermarkText="Last Name" ></asp:TextBoxWatermarkExtender>
                    &nbsp;&nbsp;<br /><br />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:TextBox ID="txtaddress" CssClass="textboxedges" runat="server" TextMode="MultiLine" Height="100px" Width="543px" style="padding-left:15px;padding-top:15px;padding-right:15px;padding-bottom:15px"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID="txtaddress" WatermarkText="Address (Max 200 characters)" ></asp:TextBoxWatermarkExtender><br /><br />
                </td>
            </tr>

            </table>
            <table>

            <tr>
                <td>
                    <asp:DropDownList ID="drpstate" runat="server" CssClass="dropdownlistedges"  Height="30px" AutoPostBack="True" OnSelectedIndexChanged="drpstate_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="State" DataValueField="State">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OMSIConnectionString3 %>" SelectCommand="SELECT [State] FROM [State]"></asp:SqlDataSource>
                    &nbsp;&nbsp;
                </td>
                <td>
                    <asp:DropDownList ID="drpcity" runat="server" CssClass="dropdownlistedges" ToolTip="Select City" Height="30px" AutoPostBack="True"></asp:DropDownList>
                    <br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtpincode" CssClass="textboxedges" runat="server" Width="100px" Height="30px" style="padding-left:15px"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" runat="server" TargetControlID="txtpincode" WatermarkText="Pincode" ></asp:TextBoxWatermarkExtender>
                    &nbsp;&nbsp;
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="India"></asp:Label><br /><br />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="txtmobile" CssClass="textboxedges" runat="server" Width="200px" Height="30px" style="padding-left:15px"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" runat="server" TargetControlID="txtmobile" WatermarkText="Mobile/Phone" ></asp:TextBoxWatermarkExtender>
                    <br /><br />
                </td>
                
            </tr>

        </table>

        <div style="overflow:scroll;width:900px">
        <table>
            <tr>
                <td>
                    <asp:GridView ID="cartgridview" runat="server" AutoGenerateColumns="false" Width="900px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                    <asp:BoundField DataField = "CategoryName" HeaderText = "Category Name"  />
                                    <asp:BoundField DataField = "SubCatName"  HeaderText = "SubCategory Name" />
                                    <asp:BoundField DataField = "DepartmentName" HeaderText = "Department Name"  />
                                    <asp:BoundField DataField = "MedicineName" HeaderText = "Medicine Name" />
                                    <asp:BoundField DataField = "Price" HeaderText = "Price" />
                                    <asp:BoundField DataField = "Quantity" HeaderText = "Quantity" />
                                    <asp:BoundField DataField = "Total" HeaderText = "Total" />
                                    <asp:BoundField DataField = "Path" Visible="false" />
                                   
                                    <asp:ImageField DataImageUrlField="Path" HeaderText="Image" ControlStyle-Height="100px" ControlStyle-Width="100px"></asp:ImageField>

                               </Columns>
                    </asp:GridView>


                </td>
            </tr>
        </table>
        </div> 

       <table>
           <tr>
               <td>
                   <br /><br />
                   <asp:CheckBox ID="checkcod" runat="server" Enabled="false" Text="Cash On Delivery" TextAlign="Left" Height="30px" Checked="true"  />
               </td>
           </tr>
             
            <tr>
                <td><br /><br />
                    <asp:ImageButton ID="btnplaceorder" runat="server" ImageUrl="~/images/PlaceOrder.png" OnClick="btnplaceorder_Click" />
                </td>
            </tr>

        </table>
           

      </ContentTemplate>  
     </asp:UpdatePanel>         
    </div>
</asp:Content>


