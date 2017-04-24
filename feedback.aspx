<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<asp:Content ID="Content5" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content6" runat="server" contentplaceholderid="maincontent">
     <div class="col_1_of_3 span_1_of_3 second fontStyle" style="width:800px">
        <%--<h2>Feedback to us</h2>--%>
                    <%--<img sr title="img1" />--%>
                    <img src="images/feedback.png" title="img1" /><br /><br />
       
        <table>
            
            <tr>
                <td style="width:150px">
                    <asp:Label ID="lblname" runat="server" CssClass="fontStyle" Text="Name:"></asp:Label><br /><br />

                </td>
                
            </tr>
            
            <tr>
                <td style="width:250px">
                    <asp:TextBox ID="txtname" runat="server" Width="400px" Height="25px" CssClass="textboxedges"></asp:TextBox><br /><br />

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Required1" runat="server" ForeColor="Red" ControlToValidate="txtname" ErrorMessage="*"></asp:RequiredFieldValidator><br /><br />

                </td>
            </tr>
            <tr>
                <td style="width:150px; height: 22px">
                    <asp:Label ID="lbemail" runat="server" CssClass="fontStyle" Text="E-mail:"></asp:Label><br /><br />

                </td>
                
            </tr>
            <tr>
                <td style="width:250px">
                    <asp:TextBox ID="txtemail" runat="server" Width="400px" Height="25px" CssClass="textboxedges"></asp:TextBox><br /><br />

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Required2" runat="server" ForeColor="Red" ControlToValidate="txtemail" ErrorMessage="*"></asp:RequiredFieldValidator><br /><br />

                </td>
               <td>
                    <asp:RegularExpressionValidator ID ="expression" runat="server" ControlToValidate="txtemail" ForeColor="Red" ErrorMessage="Invalid Email" Width="200px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br /><br />

               </td>
            </tr>
            <tr>
                <td style="width:150px">
                    <asp:Label ID="lbcomment" runat="server" CssClass="fontStyle" Text="Comment:"></asp:Label><br /><br />

                </td>
                
            </tr>
            <tr>
                <td style="width:250px">
                    <asp:TextBox ID="txtcomment" runat="server" Width="400px" Height="100px" TextMode="MultiLine" CssClass="textboxedges"></asp:TextBox><br /><br />

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="txtcomment" ErrorMessage="*"></asp:RequiredFieldValidator><br /><br />

                </td>
            </tr>
             
        </table>
             <asp:ImageButton ID="buttonsubmit" runat="server" ImageUrl="~/images/SUBMIT.png" AlternateText="Submit" OnClick="buttonsubmit_Click" />     
                </div>
        
</asp:Content>


