<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="UNutritionHealth.aspx.cs" Inherits="UNutritionHealth" %>

<asp:Content ID="Content3" ContentPlaceHolderID="leftcontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content6" runat="server" contentplaceholderid="maincontent">
	<div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:700px">
    
        <br /><br />
                 <div style="overflow:scroll; height:500px;width:800px;margin-left:180px">
                    <asp:DataList ID="datalistnutrition" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" BorderStyle="Dotted" GridLines="Horizontal" CellSpacing="50" CellPadding="10" HorizontalAlign="Center" OnItemCommand="datalistnutrition_ItemCommand" OnEditCommand="datalistnutrition_ItemCommand">

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


