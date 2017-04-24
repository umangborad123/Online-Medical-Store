<%@ Page Title="" Language="C#" MasterPageFile="~/Dmaster.master" AutoEventWireup="true" CodeFile="Dhome.aspx.cs" Inherits="Dhome" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="fontStyle">
          <h2></h2>
          <br /><br />
        <table>
            <tr>
                <td>
                    <ul>
                        <li>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="fontHeader" ForeColor="Black" PostBackUrl="~/DupdateProfile.aspx">Update Profile</asp:LinkButton><br /><br />
                        </li>
                        
                    </ul>
                </td>
            </tr>
        </table>  
    </div>
</asp:Content>


