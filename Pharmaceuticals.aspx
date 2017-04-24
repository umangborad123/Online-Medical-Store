<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="Pharmaceuticals.aspx.cs" Inherits="Pharmaceuticals" %>

<asp:Content ID="Content2" ContentPlaceHolderID="leftcontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <%--<!DOCTYPE html>--%>
<html>
<head>
    <title>Online Medical Store</title>
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
<%--<div class="container" style="width:800px">
			<!-- freshdesignweb top bar -->
            <div class="freshdesignweb-top" style="width:800px">
                <a href="http://www.freshdesignweb.com" target="_blank"></a>
                <span class="right">
                    <a href="http://www.freshdesignweb.com/drop-down-responsive-menu-with-css3-and-jquery.html">
                        
                    </a>
                </span>
                <div class="clr"></div>
            </div>--%><!--/ freshdesignweb top bar -->
			     
     <!-- start header here-->
	<%--<header>--%>
        <div style="margin-left:300px;height:800px">
        <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" Width="670px" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Large" ForeColor="#7C6F57" Orientation="Horizontal" StaticSubMenuIndent="10px" DynamicHoverStyle-ForeColor="#000066" DynamicSelectedStyle-ForeColor="#CC0000" StaticHoverStyle-ForeColor="#000066">
            <DynamicHoverStyle ForeColor="Blue" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle />
            <DynamicSelectedStyle />
            <Items>
                <asp:MenuItem NavigateUrl="~/pharmachildren.aspx" Text="Children's Health" Value="Children's Health" ></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pharmamen.aspx" Text="Men's Health" Value="Men's Health"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pharmawomen.aspx" Text="Women's Health" Value="Women's Health"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pharmageneral.aspx" Text="General Health" Value="General Health"></asp:MenuItem>
                
            </Items>
            <StaticHoverStyle ForeColor="Blue" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle  />
        </asp:Menu>
       </div>
	
</body>
</html>

</asp:Content>


