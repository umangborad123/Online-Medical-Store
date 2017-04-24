<%@ Page Title="" Language="C#" MasterPageFile="~/Dmaster.master" AutoEventWireup="true" CodeFile="Dpatientpro.aspx.cs" Inherits="Dpatientpro" %>

<asp:Content ID="Content4" ContentPlaceHolderID="logincontent" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="maincontent">
    <div class="col_1_of_3 span_1_of_3 second fontStyle" style="height:700px">
         <h2><asp:Label ID="lblpatients" runat="server" CssClass="fontHeader" Text="Own Patients"></asp:Label></h2>
        
        <table>
            <tr>
                <td>
                    <div style="overflow:scroll;height:500px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="500px">
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
                                    <asp:BoundField DataField = "PatientName" HeaderText = "Patient Name" ControlStyle-CssClass="tablealign" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ApplyFormatInEditMode="True" />
                                    <asp:BoundField DataField = "DeptName" HeaderText = "Department Name" />
                                    <asp:BoundField DataField = "Problem" HeaderText = "Problem" />
                                    
                        </Columns>
                                      
                    </asp:GridView>
                        </div>
                </td>
            </tr>
        </table>
            
    </div>
</asp:Content>


