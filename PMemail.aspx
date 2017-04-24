<%@ Page Title="" Language="C#" MasterPageFile="~/PMmaster.master" AutoEventWireup="true" CodeFile="PMemail.aspx.cs" Inherits="PMemail" %>
<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<%--<asp:Content ID="Content5" runat="server" contentplaceholderid="contentdept">--%>
    <%-- <div class="grids">
        <div class="grid box">
            <h4>Pharmaceuticals</h4>
            <a href="Pharmaceuticals.aspx">
            <img src="images/pharmaceuticals-index.png" /></a>
        </div>
        <div class="grid box">
            <h4>Personal Care</h4>
            <a href="Personalcare.aspx">
            <img src="images/personalcare-index.png" /></a>
        </div>
        <div class="grid box">
            <h4>Baby Care</h4>
            <a href="Babycare.aspx">
            <img src="images/babycare-index.png" /></a>
        </div>
        <div class="grid box">
            <h4>Nutrition Health</h4>
            <a href="Nutrition.aspx">
            <img src="images/nutritionhealth-index.png" /></a>
        </div>
        <div class="clear">
        </div>
    </div>--%>
<%--</asp:Content>--%>


<asp:Content ID="Content6" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second" style="width:900px;margin-left:300px">
        <h2><asp:Label ID="lblmail" runat="server" CssClass="fontHeader" Text="Compose Mail"></asp:Label></h2>
        <table >
                  <tr>
                        <td>
                            <asp:Label ID="lblto" runat="server" CssClass="fontStyle" Text="To"></asp:Label><br /><br />

                        </td> 

                      </tr>
                     
                   <tr>  
                       <td>
                          <asp:TextBox ID="txtto" runat="server" CssClass="textboxedges" Width="400px"></asp:TextBox><br /><br />
                       </td>
                       <td>
                           <asp:RequiredFieldValidator ID="emailreq" runat="server" ErrorMessage="*" ControlToValidate="txtto" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />

                       </td> 
                       <td>
                           <asp:RegularExpressionValidator ID="emailexpr" runat="server" ErrorMessage="Invalid Email" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtto" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br /><br />

                       </td>
                          </tr>
                      
                         <tr>
                             <td> 
                                 <asp:Label ID="lblsub" runat="server" CssClass="fontStyle" Text="Subject" ></asp:Label><br /><br />

                             </td>
                            </tr>                    

                       <tr>
                             <td>
                                 <asp:TextBox ID="txtsub" runat="server" CssClass="textboxedges" Width="400px"></asp:TextBox><br /><br />
                             </td> 
                             <td>
                           <asp:RequiredFieldValidator ID="subreq" runat="server" ErrorMessage="*" ControlToValidate="txtsub" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />

                             </td>
                       </tr>
                      
                      <tr>
                          <td>
                              <asp:Label ID="lblms" runat="server" CssClass="fontStyle" Text="Message" ></asp:Label><br /><br />

                          </td>

                      </tr>
                          <tr>
                              <td>
                                <asp:TextBox ID="txtms" runat="server" TextMode="MultiLine" CssClass="textboxedges" Width="400px" Height="150px"></asp:TextBox>
                              </td>
                              <td>
                                <asp:RequiredFieldValidator ID="msreq" runat="server" ErrorMessage="*" ControlToValidate="txtms" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                              </td>
                        </tr>
             
            <tr>
                <td>
                    <asp:FileUpload ID="fusmemail" runat="server" Width="400px" /><br /><br />
            <br />
            
                </td>
            </tr>
            
                      <tr><td>
                          <asp:ImageButton ID="snbt" runat="server" ImageUrl="~/images/bsend.png" OnClick="snbt_Click" /></td></tr>


                  </table>  
                  
                </div>
</asp:Content>








