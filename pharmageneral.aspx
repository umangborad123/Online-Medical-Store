<%@ Page Title="" Language="C#" MasterPageFile="~/pharmaceuticals.master" AutoEventWireup="true" CodeFile="pharmageneral.aspx.cs" Inherits="pharmageneral" EnableEventValidation="false" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="pharmachild">
    <html>
    <head  >
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <link rel="stylesheet" type="text/css" href="styles.css" media="all" />
        <link rel="stylesheet" type="text/css" href="demo.css" media="all" />
    <!-- jQuery lib from google server ===================== -->
	<script src="js/jquery-1.7.2.min.js"></script>
<!--  javaScript -->
<script>  
<!--  // building select nav for mobile width only -->
    $(function () {
        // building select menu
        $('<select />').appendTo('nav');

        // building an option for select menu
        $('<option />', {
            'selected': 'selected',
            'value': '',
            'text': 'Choise Page...'
        }).appendTo('nav select');

        $('nav ul li a').each(function () {
            var target = $(this);

            $('<option />', {
                'value': target.attr('href'),
                'text': target.text()
            }).appendTo('nav select');

        });

        // on clicking on link
        $('nav select').on('change', function () {
            window.location = $(this).find('option:selected').val();
        });
    });

    // show and hide sub menu
    $(function () {
        $('nav ul li').hover(
            function () {
                //show its submenu
                $('ul', this).slideDown(150);
            },
            function () {
                //hide its submenu
                $('ul', this).slideUp(150);
            }
        );
    });
    //end
</script>
<!-- end -->
        </head>
    <body>
        <div class="container" style="width:800px">
			<!-- freshdesignweb top bar -->
                <div class="freshdesignweb-top" style="width:800px">
                    <a href="http://www.freshdesignweb.com" target="_blank"></a><span class="right"><a href="http://www.freshdesignweb.com/drop-down-responsive-menu-with-css3-and-jquery.html"></a></span>
                    <div class="clr">
                    </div>
            </div>
               
	            <header>

                    <div style="margin-left:300px">
                    <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" Width="670px" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Large" ForeColor="#7C6F57" Orientation="Horizontal" StaticSubMenuIndent="10px" DynamicHoverStyle-ForeColor="#000066" DynamicSelectedStyle-ForeColor="#CC0000" StaticHoverStyle-ForeColor="#000066">
                        <DynamicHoverStyle ForeColor="Blue" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#F7F6F3" />
                        <DynamicSelectedStyle BackColor="#5D7B9D" />
                        <Items>
                            <asp:MenuItem NavigateUrl="~/pharmachildren.aspx" Text="Children's Health" Value="Children's Health"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/pharmamen.aspx" Text="Men's Health" Value="Men's Health"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/pharmawomen.aspx" Text="Women's Health" Value="Women's Health"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/pharmageneral.aspx" Text="General Health" Value="General Health"></asp:MenuItem>
                        
                        </Items>
                        <StaticHoverStyle ForeColor="Blue" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#5D7B9D" />
                    </asp:Menu>
                    </div>

                    <br /><br />
                    <div style="overflow:scroll; height:500px;width:800px;margin-left:180px">
                    <asp:DataList ID="datalistpharmawomen" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" BorderStyle="Dotted" GridLines="Horizontal" CellSpacing="50" CellPadding="10" HorizontalAlign="Center">

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
                           <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="btnaddtocart" runat="server" ImageUrl="~/images/addtocart.png" OnClick="btnaddtocart_Click" />
                            <br /><br /><br />--%>

                        </ItemTemplate>

                    </asp:DataList>
                    </div>
                   
	            </header>
                <!-- end header -->
    
            </div>
    </body>
    </html>
</asp:Content>


