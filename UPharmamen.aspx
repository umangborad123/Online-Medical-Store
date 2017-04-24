<%@ Page Title="" Language="C#" MasterPageFile="~/UPharmaceuticals.master" AutoEventWireup="true" CodeFile="UPharmamen.aspx.cs" Inherits="UPharmamen" EnableEventValidation="false" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="pharmachild">
    <div class="fontStyle" style="height:700px">
    
        <div style="margin-left:300px" >
                <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" DynamicHorizontalOffset="2"  Font-Names="Verdana" Font-Size="Large" ForeColor="#7C6F57" Orientation="Horizontal" StaticSubMenuIndent="10px" DynamicHoverStyle-ForeColor="#000066" DynamicSelectedStyle-ForeColor="#CC0000" StaticHoverStyle-ForeColor="#000066" Width="670px">
                    <DynamicHoverStyle ForeColor="Blue" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#F7F6F3" />
                    <DynamicSelectedStyle BackColor="#5D7B9D" />
                    <Items>
                        <asp:MenuItem NavigateUrl="~/UPharmachildren.aspx" Text="Children's Health" Value="Children's Health" ></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/UPharmamen.aspx" Text="Men's Health" Value="Men's Health"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/UPharmawomen.aspx" Text="Women's Health" Value="Women's Health"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/UPharmageneral.aspx" Text="General Health" Value="General Health"></asp:MenuItem>
                        
                    </Items>
                    <StaticHoverStyle ForeColor="Blue" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticSelectedStyle BackColor="#5D7B9D" />
                </asp:Menu>
                    <br /><br />
            </div>
            <div style="overflow:scroll; height:500px;width:800px;margin-left:200px">
                    <asp:DataList ID="datalistpharmamen" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" BorderStyle="Dotted" GridLines="Horizontal" CellSpacing="50" CellPadding="10" HorizontalAlign="Center" OnItemCommand="datalistpharmamen_ItemCommand" OnEditCommand="datalistpharmamen_ItemCommand">

                        <ItemTemplate>

            	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    
                            <asp:Label ID="l1" Text='<%# Eval("MedicineName") %>' runat="server" ForeColor="#006600" Font-Size="Medium" ></asp:Label><br />
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		                    <img alt="" src='FileUpload/<%#Eval("ImageName") %>' height="150" width="150" /><br />

                             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;

                            <asp:Label ID="Label1" Text=' <%# Eval("Description") %>' Font-Size="Small" runat="server"></asp:Label><br />

           	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                            <asp:Label ID="lbl3" runat="server" Text="Price: " Font-Size="Small" ForeColor="Red"></asp:Label> <span >&#x20B9;</span>

		                    <asp:Label ID="l2" Text=' <%# Eval("Price") %>' Font-Size="Small" runat="server"></asp:Label>
       		
		                    <br /><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="btnaddtocart" runat="server" CommandName="AddCart" ImageUrl="~/images/addtocart.png" OnClick="btnaddtocart_Click" />
                            <br /><br /><br />

                        </ItemTemplate>

                    </asp:DataList>
                    </div>


                    
        
    </div>
</asp:Content>


