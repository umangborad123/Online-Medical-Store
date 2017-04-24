﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Umaster.master" AutoEventWireup="true" CodeFile="Uinbox.aspx.cs" Inherits="Uinbox" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:700px" >
         <br />
        <h2><asp:Label ID="lblinbox" runat="server" CssClass="fontHeader" Text="Inbox"></asp:Label></h2>
        <br />
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
       
        <table>
            <tr>
                <td>
                    <asp:DropDownList ID="drpselect" runat="server" CssClass="dropdownlistedges" AutoPostBack="True" OnSelectedIndexChanged="drpselect_SelectedIndexChanged">
                        <asp:ListItem>Select User</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Doctors</asp:ListItem>
                    </asp:DropDownList><br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <div style="overflow:scroll;height:500px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <EditRowStyle BackColor="#999999" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

                        <Columns>
                            <asp:BoundField DataField = "FromUser" HeaderText = "From" />
                            
                            <asp:BoundField DataField = "Subject" HeaderText = "Subject" />
                            <asp:BoundField DataField = "Message" HeaderText = "Message" />
                            
                            <asp:BoundField DataField = "Date" HeaderText = "Date" />
                            <asp:BoundField DataField = "UploadFile" HeaderText = "Upload File" />
                            <asp:ButtonField Text="Reply" CommandName="Select" />
                        </Columns>

                    </asp:GridView>
                        </div>
                </td>
            </tr>
        </table>
      </ContentTemplate>
    </asp:UpdatePanel>
              
    </div>
</asp:Content>


