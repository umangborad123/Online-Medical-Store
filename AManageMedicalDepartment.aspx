<%@ Page Title="" Language="C#" MasterPageFile="~/Amaster.master" AutoEventWireup="true" CodeFile="AManageMedicalDepartment.aspx.cs" Inherits="AManageMedicalDepartment" %>

<asp:Content ID="Content3" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="maincontent">
	
     <div class="col_1_of_3 span_1_of_3 second fontStyle" style="width:800px">   
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <br /><br />
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
                 
        </table>
        
        <asp:Panel ID="AddPanel" runat="server">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbldept" Width="250px" runat="server" Text="Add Department"></asp:Label><br /><br />
                </td>
                <td>
                    <asp:TextBox ID="txtdept" runat="server" CssClass="textboxedges" OnTextChanged="txtdept_TextChanged"></asp:TextBox><br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnadd" CssClass="textboxedges" Width="50px" runat="server" Text="ADD" OnClick="btnadd_Click" />
                </td>
            </tr>
        </table>

        </asp:Panel>

        <asp:Panel ID="EditorDeletepanel" runat="server">
            <asp:GridView ID="editordeletegridview" runat="server" AutoGenerateColumns="false" CellPadding="4" Width="500px" ForeColor="#333333" DataKeyNames="MDID" GridLines="None" DataSourceID="SqlDataSource1">
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
                    <asp:BoundField DataField="DeptName" HeaderText="Department Name" SortExpression="DeptName"></asp:BoundField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                    <asp:BoundField DataField="MDID" HeaderText="MDID" ReadOnly="True" Visible="false" InsertVisible="False" SortExpression="MDID"></asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:OMSIConnectionString3 %>' DeleteCommand="DELETE FROM [MedicalDept] WHERE [MDID] = @MDID" InsertCommand="INSERT INTO [MedicalDept] ([DeptName]) VALUES (@DeptName)" SelectCommand="SELECT [DeptName], [MDID] FROM [MedicalDept]" UpdateCommand="UPDATE [MedicalDept] SET [DeptName] = @DeptName WHERE [MDID] = @MDID">
                <DeleteParameters>
                    <asp:Parameter Name="MDID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DeptName" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DeptName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="MDID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>

             <asp:Panel ID="ViewPanel" runat="server">
                        <asp:GridView ID="GridView1" runat="server" Width="200px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource2">
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
                                <asp:BoundField DataField="DeptName" HeaderText="Department Name" SortExpression="DeptName"></asp:BoundField>
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:OMSIConnectionString3 %>' SelectCommand="SELECT [DeptName] FROM [MedicalDept]"></asp:SqlDataSource>
                    </asp:Panel>
    
            </ContentTemplate>
          </asp:UpdatePanel>
   </div>
    			     
</asp:Content>


