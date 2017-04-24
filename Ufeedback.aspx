<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="Ufeedback.aspx.cs" Inherits="Ufeedback" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
				<div class="col_1_of_3 span_1_of_3 second" style="width:800px">
                     <%--<h2>Feedback to us</h2>--%>
                    <%--<img sr title="img1" />--%>
                    <img src="images/feedback.png" title="img1" />
       
        <table>
            
            <tr>
                <td style="width:150px"><asp:Label ID="lblname" runat="server" Text="Name"></asp:Label></td>
                
            </tr>
            
            <tr>
                <td style="width:250px"><asp:TextBox ID="txtname" runat="server" Width="400px" Height="25px" CssClass="textboxtedges"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="Required1" runat="server" ForeColor="Red" ControlToValidate="txtname" ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width:150px"><asp:Label ID="lbemail" runat="server" Text="E-mail"></asp:Label></td>
                
            </tr>
            <tr>
                <td style="width:250px"><asp:TextBox ID="txtemail" runat="server" Width="400px" Height="25px" CssClass="textboxtedges"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="Required2" runat="server" ForeColor="Red" ControlToValidate="txtemail" ErrorMessage="*"></asp:RequiredFieldValidator></td>
               <td> <asp:RegularExpressionValidator ID ="expression" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid Email" Width="200px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="width:150px"><asp:Label ID="lbcomment" runat="server" Text="Comment"></asp:Label></td>
                
            </tr>
            <tr>
                <td style="width:250px"><asp:TextBox ID="txtcomment" runat="server" Width="400px" Height="100px" TextMode="MultiLine" CssClass="textboxtedges"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="txtcomment" ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td ><asp:ImageButton ID="btnsubmit" runat="server" ImageUrl="~/images/SUBMIT.png" /></td>
            </tr>
             
        </table>
                     </div>
                </asp:Content>


