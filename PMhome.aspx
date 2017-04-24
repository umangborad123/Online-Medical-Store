<%@ Page Title="" Language="C#" MasterPageFile="~/PMmaster.master" AutoEventWireup="true" CodeFile="PMhome.aspx.cs" Inherits="PMhome" %>

<%--<asp:Content ID="Content5" runat="server" contentplaceholderid="contentdept">
</asp:Content>--%>


<asp:Content ID="Content6" runat="server" contentplaceholderid="maincontent">
    <div class="fontStyle" style="width:900px">
        <br /><br />
        <h2><asp:Label ID="lblwelcome" runat="server" CssClass="fontHeader" Text="Welcome, "></asp:Label> <asp:Label ID="lblcompany" runat="server" CssClass="fontHeader" Text=""></asp:Label></h2>
        <br /><br />
        <div style="height:300px;margin-left:220px">
        <table>
            <tr>
                <td>
                    <ul>
                        <li>
                            <a href ="PMupdateProfile.aspx">Update Profile</a><br /><br />
                        </li>
                    </ul>      
                </td>
            </tr>
        </table>
        </div>
    </div>
</asp:Content>



<asp:Content ID="Content7" runat="server" contentplaceholderid="leftcontent">
                <div class="col_1_of_3 span_1_of_3 frist">
                   
               </div>
</asp:Content>









<asp:Content ID="Content8" runat="server" contentplaceholderid="logincontent">
  
</asp:Content>










