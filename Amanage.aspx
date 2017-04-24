<%@ Page Title="" Language="C#" MasterPageFile="~/Amaster.master" AutoEventWireup="true" CodeFile="Amanage.aspx.cs" Inherits="Amanage" %>

<asp:Content ID="Content3" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="maincontent">
    <div  style="margin-left:350px;height:500px" class="fontStyle" >
    
    <br /><br /><br />
    <asp:Label ID="Label1" runat="server" Text="Manage" CssClass="fontHeader" Font-Size="XX-Large"></asp:Label>
    <br /><br /><br />
             <table>
                  <tr>
                      <td>
                          <asp:LinkButton ID="LinkButton1" runat="server" CssClass="fontHeader" ForeColor="DarkBlue" PostBackUrl="AManageMedicalDepartment.aspx">Medical Department</asp:LinkButton>
                           <%--<a href ="AManageMedicalDepartment.aspx">Medical Department</a>--%><br /><br />
                     </td>
                 </tr>
                  <tr>
                     <td>
                         <asp:LinkButton ID="LinkButton2" runat="server" CssClass="fontHeader" ForeColor="DarkBlue" PostBackUrl="AManageMedicine.aspx">Medicine</asp:LinkButton>
                          <%--<a href ="AManageMedicine.aspx">Medicine</a>--%><br /><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="fontHeader" ForeColor="DarkBlue" PostBackUrl="AManageDiseases.aspx">Disease</asp:LinkButton>
                         <%--<a href ="AManageDiseases.aspx">Disease</a>--%><br /><br />
                    </td>
                </tr>
           </table>

                <%--<asp:BulletedList ID="BulletedList2" runat="server" BulletStyle="Circle" Font-Bold="True" DisplayMode="LinkButton">
                    <asp:ListItem>Medicine</asp:ListItem>
                    <asp:ListItem>Medical Department</asp:ListItem>
                    <asp:ListItem>Disease</asp:ListItem>
                </asp:BulletedList>    --%>
            </div>
        </asp:Content>


        







        



