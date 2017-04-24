<%@ Page Title="" Language="C#" MasterPageFile="~/UPersonalcare.master" AutoEventWireup="true" CodeFile="UPerbodycare.aspx.cs" Inherits="UPerbodycare" EnableEventValidation="false" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div class="fontStyle">

        <header>
                        <div style="margin-left:300px">
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
           
        
        <br /><br />
        <div style="overflow:scroll; height:500px;width:800px;margin-left:180px">
                    <asp:DataList ID="datalistperbody" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" BorderStyle="Dotted" GridLines="Horizontal" CellSpacing="50" CellPadding="10" HorizontalAlign="Center" OnItemCommand="datalistperbody_ItemCommand" OnEditCommand="datalistperbody_ItemCommand">

                        <ItemTemplate>

            	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    
                            <asp:Label ID="l1" Text='<%# Eval("MedicineName") %>' runat="server" ForeColor="#006600" Font-Size="Medium" ></asp:Label><br />
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		                    <img alt="" src='FileUpload/<%#Eval("ImageName") %>' height="150" width="150" /><br />

                             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;

                            <asp:Label ID="Label1" Text=' <%# Eval("Description") %>' Font-Size="Small" runat="server"></asp:Label><br />

           	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                            <asp:Label ID="lbl3" runat="server" Text="Price: " Font-Size="Small" ForeColor="Red"></asp:Label> <span >&#x20B9;</span>

		                    <asp:Label ID="l2" Text=' <%# Eval("Price") %>' Font-Size="Small" runat="server"></asp:Label>
       		
		                    <br /><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="btnaddtocart" runat="server" CommandName="AddCart" ImageUrl="~/images/addtocart.png" OnClick="btnaddtocart_Click" />
                            <br /><br /><br />

                        </ItemTemplate>

                    </asp:DataList>
                    </div>
                 
    </div>
        </asp:Content>


