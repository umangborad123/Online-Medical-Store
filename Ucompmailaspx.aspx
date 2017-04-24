<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="Ucompmailaspx.aspx.cs" Inherits="Ucompmailaspx" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
				<div class="col_1_of_3 span_1_of_3 second fontStyle" style="width:800px; margin-left:150px" >
                    <br />
                    <h2><asp:Label ID="lblcomposemail" runat="server" CssClass="fontHeader" Text="Compose Mail"></asp:Label></h2>
                    <br />
                  <table >
                      <tr>
                        <td>
                            <asp:Label ID="tolabel" runat="server" Text="TO:"></asp:Label></td>  </tr>
                     
                   <tr>   <td>   <asp:TextBox ID="totxt" runat="server" CssClass="textboxtedges" Width="400px"></asp:TextBox>
                          </td>
                       <td>
                           <asp:RequiredFieldValidator ID="emailreq" runat="server" ErrorMessage="*" ControlToValidate="totxt" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator></td> 
                       <td>
                           <asp:RegularExpressionValidator ID="emailexpr" runat="server" ErrorMessage="Invalid Email" Font-Size="X-Small" ForeColor="Red" ControlToValidate="totxt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                          </tr>
                      
                         <tr><td> <asp:Label ID="sublabel" runat="server" Text="Subject" ></asp:Label></td>
                            </tr>                    

                       <tr>  <td><asp:TextBox ID="subtxt" runat="server" CssClass="textboxtedges" Width="400px"></asp:TextBox>
                             </td> 
                             <td>
                           <asp:RequiredFieldValidator ID="subreq" runat="server" ErrorMessage="*" ControlToValidate="subtxt" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
                       </tr>
                      
                      <tr>
                          <td>
                              <asp:Label ID="mslabel" runat="server" Text="Message" ></asp:Label></td></tr>
                          <tr><td>
                              <asp:TextBox ID="mstxt" runat="server" TextMode="MultiLine" CssClass="textboxtedges" Width="400px" Height="150px"></asp:TextBox>

                          </td>
                               <td>
                           <asp:RequiredFieldValidator ID="msreq" runat="server" ErrorMessage="*" ControlToValidate="mstxt" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
                      </tr>
                      <tr><td>
                          <asp:ImageButton ID="snbt" runat="server" ImageUrl="~/images/bsend.png" /></td></tr>


                  </table>  
                </div>
                </asp:Content>


