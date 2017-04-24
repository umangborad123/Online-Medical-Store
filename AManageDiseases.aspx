<%@ Page Title="" Language="C#" MasterPageFile="~/Amaster.master" AutoEventWireup="true" CodeFile="AManageDiseases.aspx.cs" Inherits="AManageDiseases" %>

<asp:Content ID="Content3" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="maincontent">
	
    <div class="col_1_of_3 span_1_of_3 second fontStyle" style="width:300px;height:700px">
     <h2>Manage Disease</h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblselect" runat="server" Width="250px" Text="Select Type"></asp:Label><br /><br />
                </td>
                <td>
                    <asp:DropDownList ID="drptype" CssClass="dropdownlistedges" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drptype_SelectedIndexChanged">
                        <asp:ListItem>Select Type</asp:ListItem>
                        <asp:ListItem>Add</asp:ListItem>
                        <asp:ListItem>View</asp:ListItem>
                        <asp:ListItem>Edit or Delete</asp:ListItem>
                    </asp:DropDownList><br /><br />
                </td>
            </tr>
        
        <asp:Panel ID="AddPanel" runat="server">
            <tr>
                <td>
                    <asp:Label ID="lbldeptname" Width="250px" runat="server" Text="Department Name" ></asp:Label><br /><br />
                </td>
                <td>
                    <asp:DropDownList ID="drpdeptname" runat="server" AutoPostBack="True" CssClass="dropdownlistedges"></asp:DropDownList>
                    
                    <br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbldisease" Width="250px" runat="server" Text="Disease Name"></asp:Label><br /><br />
                </td>
                <td>
                    <asp:TextBox ID="txtdisease" runat="server" CssClass="textboxedges" OnTextChanged="txtdisease_TextChanged"></asp:TextBox><br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblsymptoms" Width="250px" runat="server" Text="Symptoms" ></asp:Label><br /><br />
                </td>
                <td>
                    <asp:TextBox ID="txtsymptoms" runat="server" CssClass="textboxedges" Height="200px" TextMode="MultiLine"></asp:TextBox><br /><br />
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Button ID="btnadd" CssClass="textboxedges" Width="150px" Height="40px" runat="server" Text="ADD" OnClick="btnadd_Click" />
                </td>
            </tr>
            </asp:Panel>
            </table>
            
           
        <asp:Panel ID="EditorDeletepanel" runat="server">
            <asp:GridView ID="editordeletegridview" runat="server" AutoGenerateColumns="false" Width="800px" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource1" DataKeyNames="DID">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />
                            
                <EditRowStyle BackColor="#999999" HorizontalAlign="Center" VerticalAlign="Middle" />
                <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                    
                    <asp:BoundField DataField="DiseasesName" HeaderText="DiseasesName" SortExpression="DiseasesName"></asp:BoundField>
                    <asp:BoundField DataField="Symptoms" HeaderText="Symptoms" SortExpression="DiseasesName"></asp:BoundField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                    <asp:BoundField DataField="DID" HeaderText="DID" ReadOnly="True" Visible="false" InsertVisible="False" SortExpression="DID"></asp:BoundField>
                </Columns>

            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:OMSIConnectionString3 %>' SelectCommand="SELECT [DiseasesName], [Symptoms], [DID] FROM [Diseases]" DeleteCommand="DELETE FROM [Diseases] WHERE [DID] = @DID" InsertCommand="INSERT INTO [Diseases] ([DiseasesName], [Symptoms]) VALUES (@DiseasesName, @Symptoms)" UpdateCommand="UPDATE [Diseases] SET [DiseasesName] = @DiseasesName, [Symptoms] = @Symptoms WHERE [DID] = @DID">
                <DeleteParameters>
                    <asp:Parameter Name="DID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DiseasesName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Symptoms" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DiseasesName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Symptoms" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>

        <asp:Panel ID="ViewPanel" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblmedic" Width="250px" runat="server" Text="Select Department" ></asp:Label><br /><br />
                    </td>
                    <td>
                        <asp:DropDownList ID="drpmedicaldept" runat="server" AutoPostBack="True" CssClass="dropdownlistedges" OnSelectedIndexChanged="drpmedicaldept_SelectedIndexChanged"></asp:DropDownList><br /><br />
                    </td>
                </tr>
                </table>
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="viewgridview" runat="server" AutoGenerateColumns="false" Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None">
                               <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />
                               <EditRowStyle BackColor="#999999" HorizontalAlign="Center" VerticalAlign="Middle" />
                               <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                    <asp:BoundField DataField = "DiseasesName" HeaderText = "Disease Name" />
                                    <asp:BoundField DataField = "Symptoms" HeaderText = "Symptoms" />
                                                                       
                                </Columns>
                               </asp:GridView>
                    </td>
                </tr>
            </table>
           
            
        </asp:Panel>
    
            </ContentTemplate>
          </asp:UpdatePanel> 
        
</div>

</asp:Content>


