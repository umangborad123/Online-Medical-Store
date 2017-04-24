<%@ Page Title="" Language="C#" MasterPageFile="~/Dmaster.master" AutoEventWireup="true" CodeFile="DupdateProfile.aspx.cs" Inherits="DupdateProfile" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle">
        <h2><asp:Label ID="lblupdateprofile" runat="server" CssClass="fontHeader" Text="Update Profile"></asp:Label></h2>
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
         <table>
             <tr>
                <td>
                   <asp:Label ID="lblfname" runat="server" Text="Name" Width="200px"></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtfname" runat="server" Height="20px" Width="300px" CssClass="textboxedges"></asp:TextBox><br /><br />
                </td>
                <td>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtfname"></asp:RequiredFieldValidator>
                </td>
                <td>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="Must contains string only" ControlToValidate="txtfname" ValidationExpression="[a-z A-Z ]+$" Font-Size="X-Small"></asp:RegularExpressionValidator>
                </td>
             </tr>
             <tr>
                 <td>
                    <asp:Label ID="lbladdress" runat="server" Text="Address" ></asp:Label>
                 </td>
                 <td>
                    <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Width="300px" Height="150px" CssClass="textboxedges"></asp:TextBox><br /><br />
                 </td>
                 <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtaddress"></asp:RequiredFieldValidator>
                  </td>
             </tr>

             <asp:Panel ID="paneltextstate" runat="server">
                 <tr>
                  <td>
                      <asp:Label ID="Label1" runat="server" Text="State"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="txtstate" runat="server" CssClass ="textboxedges"></asp:TextBox>
                      <br /><br />
                  </td>
                  <td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtstate"></asp:RequiredFieldValidator>
                  </td>
               </tr>
               <tr>
                  <td>
                      <asp:Label ID="Label2" runat="server" Text="City"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="txtcity" runat="server" CssClass ="textboxedges"></asp:TextBox>
                      <br /><br />
                  </td>
                  <td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtcity"></asp:RequiredFieldValidator>
                  </td>
               </tr>
             </asp:Panel>

             <asp:Panel ID="panelstate" runat="server">

              <tr>
                  <td>
                      <asp:Label ID="lblstate" runat="server" Text="State"></asp:Label>
                  </td>
                  <td>
                      <asp:DropDownList ID="drpstate" runat="server" CssClass="dropdownlistedges" AutoPostBack="True" OnSelectedIndexChanged="drpstate_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="State" DataValueField="State">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OMSIConnectionString3 %>" SelectCommand="SELECT [State] FROM [State]"></asp:SqlDataSource>
                      <br /><br />
                  </td>
                  <td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpstate"></asp:RequiredFieldValidator>
                  </td>
               </tr>
               <tr>
                  <td>
                      <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                  </td>
                  <td>
                      <asp:DropDownList ID="drpcity" runat="server" CssClass="dropdownlistedges" AutoPostBack="True"></asp:DropDownList>
                      <br /><br />
                  </td>
                  <td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpcity"></asp:RequiredFieldValidator>
                  </td>
               </tr>

             </asp:Panel>

                <tr>
                   <td>
                      <asp:Label ID="lblpincode" runat="server" Text="Pincode"></asp:Label>
                   </td>
                    <td>
                       <asp:TextBox ID="txtpincode" runat="server" Height="20px" Width="300px" CssClass="textboxedges"></asp:TextBox><br /><br />
                    </td>
                    <td>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtpincode"></asp:RequiredFieldValidator>
                    </td>
                     <td>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red" ValidationExpression="[0-9]+$" ErrorMessage="Must contains numeric value only" ControlToValidate="txtpincode" Font-Size="X-Small" ></asp:RegularExpressionValidator>
                     </td>
                 </tr>
                  
                   <tr>
                      <td>
                          <asp:Label ID="lblmobile" runat="server" Text="Contact No."></asp:Label>
                      </td>
                      <td>
                          <asp:TextBox ID="txtmobile" runat="server" Height="20px" Width="300px" CssClass="textboxedges"></asp:TextBox><br /><br />
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtmobile"></asp:RequiredFieldValidator>
                      </td>
                      <td>
                          <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Must be of 10 digits" ForeColor="Red" Width="97px" ControlToValidate="txtmobile" OnServerValidate="CustomValidator1_ServerValidate" Font-Size="X-Small"></asp:CustomValidator>
                              
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ForeColor="Red" ErrorMessage="Must contains numeric value only" ValidationExpression="[0-9]+$" ControlToValidate="txtmobile" Font-Size="X-Small" Width="114px"></asp:RegularExpressionValidator>
                      </td>
                   </tr>
                    <tr>
                       <td>
                           <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>
                       </td>
                        <td>
                           <asp:TextBox ID="txtemail" runat="server" Width="300px" Height="20px" CssClass="textboxedges"></asp:TextBox><br /><br />
                       </td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ErrorMessage="Invalid email address" ControlToValidate="txtemail" Width="102px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="X-Small"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                          
                     <tr>
                         <td>
                             <asp:Button ID="btnupdate" runat="server" CssClass="textboxedges" Width="150px" Height="40px" Text="Want to Update!" OnClick="btnupdate_Click" CausesValidation="False" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         </td>
                         <td>
                                 <asp:Button ID="btncancel" runat="server" CssClass="textboxedges" Width="150px" Height="40px" Text="Cancel" OnClick="btncancel_Click" />
                             <asp:Button ID="btnsubmit" runat="server" CssClass="textboxedges" Width="150px" Height="40px" Text="Submit" OnClick="btnsubmit_Click" />
                         </td>
                         
                         
                         
                     </tr>
            
         </table>          
       </ContentTemplate>
     </asp:UpdatePanel>

    </div>
</asp:Content>


