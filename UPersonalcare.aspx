<%@ Page Title="" Language="C#" MasterPageFile="~/UPersonalcare.master" AutoEventWireup="true" CodeFile="UPersonalcare.aspx.cs" Inherits="UPersonalcare" EnableEventValidation="false" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div class="fontStyle">

        <header>
                        <div style="margin-left:300px;height:800px">
                        <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" Width="430px" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Large" ForeColor="#7C6F57" Orientation="Horizontal" StaticSubMenuIndent="10px" DynamicHoverStyle-ForeColor="#000066" DynamicSelectedStyle-ForeColor="#CC0000" StaticHoverStyle-ForeColor="#000066">
                            <DynamicHoverStyle ForeColor="Blue" />
                            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                            <DynamicMenuStyle />
                            <DynamicSelectedStyle />
                            <Items>
                                <asp:MenuItem NavigateUrl="~/UPerface.aspx" Text="Face Care" Value="Face Care" ></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/UPerhaircare.aspx" Text="Hair Care" Value="Hair Care"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/UPerbodycare.aspx" Text="Body Care" Value="Body Care"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/UPeroralcare.aspx" Text="Oral Care" Value="Oral Care"></asp:MenuItem>
                                <%--<asp:MenuItem NavigateUrl="~/UPerlipcare.aspx" Text="Lip Care" Value="Lip Care"></asp:MenuItem>--%>
                            </Items>
                            <StaticHoverStyle ForeColor="Blue" />
                            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                            <StaticSelectedStyle  />
                        </asp:Menu>
                       </div>
	            </header>
                    
    </div>
        </asp:Content>

