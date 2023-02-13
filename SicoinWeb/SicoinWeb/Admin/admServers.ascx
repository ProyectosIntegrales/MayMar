<%@ Control Language="VB" AutoEventWireup="false" CodeFile="admServers.ascx.vb" Inherits="Admin_admServers" %>
<%@ Register src="~/App_Controls/cntrlError.ascx" tagname="cntrlError" tagprefix="uc1" %>
<asp:UpdatePanel ID="pnlUpdate" runat="server">
    <ContentTemplate>
  <asp:GridView ID="gvServers" runat="server" AutoGenerateColumns="False" CssClass="gridView" DataSourceID="dsServers" AllowPaging="True" PageSize="12" ShowHeaderWhenEmpty="True" AllowSorting="True" Width="100%">
                <AlternatingRowStyle BackColor="#EAEAEA" />
                <Columns>
                    <asp:TemplateField HeaderText="Dirección de Servidor" SortExpression="Clave">
                        <EditItemTemplate>
                            <asp:Textbox ID="txtServer" runat="server" Text='<%# Bind("ServerName") %>' Font-Bold="true" Width="100" MaxLength="200"></asp:Textbox>
                        </EditItemTemplate>
                        <FooterTemplate>
                             <asp:TextBox ID="txtServer" runat="server" CssClass="editTextbox" Width="100" MaxLength="200"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ServerName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Base de Datos" SortExpression="Base de Datos">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDatabase" runat="server" Text='<%# Trim(Eval("DatabaseName"))%>' CssClass="editTextbox" Width="100" MaxLength="200"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                              <asp:TextBox ID="txtDatabase" runat="server"  CssClass="editTextbox" Width="100" MaxLength="200"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("DatabaseName")%>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="300px" />
                    </asp:TemplateField>
                    
                    
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="imbEdit" runat="server" CommandName="EDIT" ImageUrl="~/images/icons/16X16/pencil.png" Height="12" />
                            <asp:ImageButton ID="imbDelete" runat="server" ImageUrl="~/images/icons/16X16/delete (1).png" Height="12" OnClientClick="return confirm('¿Está seguro de eliminar este registro?');" OnClick="Delete" CommandArgument='<%# Eval("ID")%>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                              <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/images/icons/16X16/tick.png" Height="12" OnClick="Save" CommandArgument='<%# Eval("ID")%>' />
                            <asp:ImageButton ID="imbCancel" runat="server" ImageUrl="~/images/icons/16X16/delete.png" Height="12" OnClick="Cancel" />
                        </EditItemTemplate>
                        <HeaderTemplate>
                              <asp:ImageButton ID="imbAdd" runat="server" ImageUrl="~/images/icons/16X16/add.png" Height="12" OnClick="AddNew" />
                        </HeaderTemplate>
                        <FooterTemplate>
                               <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/images/icons/16X16/tick.png" Height="12" OnClick="Insert" />
                            <asp:ImageButton ID="imbCancel" runat="server" ImageUrl="~/images/icons/16X16/delete.png" Height="12" OnClick="Cancel" />
                        </FooterTemplate>
                        <ItemStyle Wrap="false"  CssClass="w20" />
                        <HeaderStyle CssClass="w20" />
                        <FooterStyle CssClass="w20" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle CssClass="selectedCell" />
                <FooterStyle CssClass="gridviewFooter" VerticalAlign="Top" />
                <HeaderStyle CssClass="gridviewHeader" BorderWidth="0px" />
                <PagerStyle CssClass="gridviewPager" HorizontalAlign="Right" />
                <RowStyle VerticalAlign="Top" />
                <SelectedRowStyle CssClass="selectedCell" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsServers" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT * FROM [tblServers]"></asp:SqlDataSource>

        
    </ContentTemplate>
</asp:UpdatePanel>
<uc1:cntrlError ID="cntrlError1" runat="server" />

