<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>



<%@ Register Src="~/calendar1/Calendar.ascx" TagPrefix="uc1" TagName="Calendar" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>


<%--<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>--%>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle" style="width:600px">
        <h2>Registeration</h2>
        
                    <img src="images/registration.png" title="img1" />
                    <p style="align-self:auto; text-align: justify; color:black">
                       <div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                              <ContentTemplate>
                           <table border="1">
                               <tr>
                                   <td>
                                        <asp:Label ID="lbluser" runat="server" Width="300px" Text="User Type"></asp:Label>
                                   </td>
                                    <td>
                                        <asp:DropDownList ID="drpusertype" runat="server" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpusertype_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        
                                        <br /><br />
                                   </td>
                               </tr>
                           </table>
                           
                         
                           <asp:Panel ID="Panel1" runat="server">
                           <table border="1" >
                               <tr>
                                   <td>
                                       <asp:Label ID="lblmedicaldept" runat="server" Text="Medical Department" Width="300px"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:DropDownList ID="drpmedicaldept" runat="server" CssClass="dropdownlistedges" AutoPostBack="True" ></asp:DropDownList>
                                       <br /><br />
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Label ID="lblfname" runat="server" Text="Name" Width="300px"></asp:Label>
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
                                       <asp:Label ID="lbldob" runat="server" Text="Date of Birth" ></asp:Label>
                                   </td>
                                   <td>
                                       <uc1:Calendar runat="server" ID="Calendar" /><br /><br />
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Label ID="lblmobile" runat="server" Text="Contact No."></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="txtmobile" runat="server" Height="20px" Width="300px" CssClass="textboxedges" CausesValidation="True"></asp:TextBox><br /><br />
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
                                       <asp:Label ID="lblCname" runat="server" Text="Company Name"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="txtcname" runat="server" Height="20px" Width="300px" CssClass="textboxedges"></asp:TextBox><br /><br />
                                   </td>
                                   <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorcompany" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtcname"></asp:RequiredFieldValidator>
                                   </td>
                                   <td>
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidatorcompany" runat="server" ForeColor="Red" ErrorMessage="Must contains string only" ControlToValidate="txtcname" Width="250px" ValidationExpression="[a-zA-Z ]+$" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                   </td>
                                   
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Label ID="lblgender" runat="server" Text="Gender"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:RadioButton ID="rbmale" runat="server" Text="Male" GroupName="gender"/>&nbsp;&nbsp;&nbsp;
                                       <asp:RadioButton ID="rbfemale" runat="server" Text="Female" GroupName="gender"/><br /><br />
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
                                       <asp:Label ID="lblusername" runat="server" Text="User Name"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="txtusername" runat="server" Width="300px" Height="20px" CssClass="textboxedges"></asp:TextBox><br /><br />
                                   </td>
                                    <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtusername"></asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                                <tr>
                                   <td>
                                       <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="300px" Height="20px" CssClass="textboxedges"></asp:TextBox><br /><br />
                                   </td>
                                    <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                                <tr>
                                   <td>
                                       <asp:Label ID="lblconfirm" runat="server" Text="Confirm Password" Width="300px"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="txtconfirm" runat="server" TextMode="Password" Width="300px" Height="20px" CssClass="textboxedges"></asp:TextBox><br /><br /><br /><br />
                                   </td>
                                    <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtconfirm"></asp:RequiredFieldValidator>
                                   </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password must be match" ForeColor="Red" ControlToCompare="txtpassword" ControlToValidate="txtconfirm" Font-Size="X-Small" ></asp:CompareValidator><br /><br />
                                    </td>
                               </tr>
                               </table>
                              
                           
                                <tr>
                                   <td colspan="2">
                                       <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/bregister.png" OnClick="ImageButton1_Click1" />&nbsp;&nbsp;&nbsp;&nbsp;
                                   
                                       <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/breset.png" OnClick="ImageButton2_Click" CausesValidation="False"/>
                                   </td>
                               </tr>
                           
                                </asp:Panel>
                                 
                       </div>
                    </p>
                                </ContentTemplate>
                              </asp:UpdatePanel>
                </div>
    
</div>
</asp:Content>






<asp:Content ID="Content6" runat="server" contentplaceholderid="loginholder">
    
</asp:Content>







<asp:Content ID="Content7" runat="server" contentplaceholderid="logincontent">
                
                
              </asp:Content>








