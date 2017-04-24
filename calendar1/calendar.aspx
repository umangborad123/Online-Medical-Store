<%@ Page Language="C#" AutoEventWireup="true" CodeFile="calendar.aspx.cs" Inherits="calendar" %>

<%@ Register src="Calendar.ascx" tagname="Calendar" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:Calendar ID="Calendar1" runat="server" />
    
    </div>
    </form>
</body>
</html>
