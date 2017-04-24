<%@ Page Title="" Language="C#" MasterPageFile="~/Dmaster.master" AutoEventWireup="true" CodeFile="DResponseEmail.aspx.cs" Inherits="DResponseEmail" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle">
        <h2><asp:Label ID="lblresponsemail" runat="server" CssClass="fontHeader" Text="Response Mail"></asp:Label></h2>
   
        <table>
                      <tr>
                        <td colspan="3">
                            <asp:Label ID="tolabel" runat="server" Text="To" CssClass="fontStyle"></asp:Label><br /><br />
                        </td> 
                      </tr>
                      <tr>  
                          <td> 
                              <asp:TextBox ID="txtto" runat="server" CssClass="textboxedges" Width="350px"></asp:TextBox><br /><br />
                          </td>
                          <td>
                                <asp:RequiredFieldValidator ID="emailreq" runat="server" ErrorMessage="*" ControlToValidate="txtto" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                          </td> 
                          <td>
                                <asp:RegularExpressionValidator ID="emailexpr" runat="server" ErrorMessage="Invalid Email" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtto" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br /><br />
                          </td>
                      </tr>
                      
                         <tr>
                             <td colspan="3">
                                  <asp:Label ID="sublabel" runat="server" CssClass="fontStyle" Text="Subject" ></asp:Label><br /><br />
                             </td>
                         </tr>                    
                         <tr> 
                             <td>
                                <asp:TextBox ID="txtsub" runat="server" CssClass="textboxedges" Width="350px"></asp:TextBox><br /><br />
                             </td> 
                             <td>
                                <asp:RequiredFieldValidator ID="subreq" runat="server" ErrorMessage="*" ControlToValidate="txtsub" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                             </td>
                        </tr>
                      
                          <tr>
                              <td colspan="3">
                                  <asp:Label ID="mslabel" runat="server" Text="Message" CssClass="fontStyle" ></asp:Label><br /><br />
                              </td>
                          </tr>
                          <tr>
                                <td>
                                     <asp:TextBox ID="txtms" runat="server" TextMode="MultiLine" CssClass="textboxedges" Width="350px" Height="150px"></asp:TextBox>
                                </td>
                                <td>
                                     <asp:RequiredFieldValidator ID="msreq" runat="server" ErrorMessage="*" ControlToValidate="txtms" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                          </tr>      
                        
                            <tr>
                                <td>
                                    <asp:FileUpload ID="fusmemail" runat="server"/><br /><br />
                               </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="snbt" runat="server" ImageUrl="~/images/bsend.png" OnClick="snbt_Click" /><br /><br />
                                </td>
                           </tr>
                 </table>  
              
   </div>
</asp:Content>


