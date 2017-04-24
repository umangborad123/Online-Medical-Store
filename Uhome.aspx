<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="Uhome.aspx.cs" Inherits="Uhome" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
				<div style="margin-left:300px;height:400px">
                    <br />
                    <br />

                    
                <table>
                    <tr>
                        <td>
                            <ul>
                                <li>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="fontHeader" ForeColor="Black" PostBackUrl="UupdateProfile.aspx">Update Profile</asp:LinkButton>
                                    <%--<a href ="UupdateProfile.aspx" class="fontHeader">Update Profile</a>--%><br /><br /><br />
                                </li>
                           </ul>     
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ul>
                                <li>
                                    
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="fontHeader" ForeColor="Black" PostBackUrl="UaddDisease.aspx">Want help from our expert doctors?</asp:LinkButton>
                                    <%--<a href="UaddDisease.aspx" class="fontHeader">Want help from our expert doctors?</a>--%>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </table>    
                    
                    
                </div>
                </asp:Content>


