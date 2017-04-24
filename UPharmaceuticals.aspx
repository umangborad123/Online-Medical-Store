<%@ Page Title="" Language="C#" MasterPageFile="~/UPharmaceuticals.master" AutoEventWireup="true" CodeFile="UPharmaceuticals.aspx.cs" Inherits="UPharmaceuticals" EnableEventValidation="false" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="pharmachild">
    <div class="fontStyle">
    
        <div style="margin-left:300px;height:800px" >
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
    </div>
</asp:Content>


