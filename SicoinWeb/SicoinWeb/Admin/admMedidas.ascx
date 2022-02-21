<%@ Control Language="VB" AutoEventWireup="false" CodeFile="admMedidas.ascx.vb" Inherits="Admin_admMedidas" %>
<%@ Register src="../cntrlError.ascx" tagname="cntrlError" tagprefix="uc1" %>
<asp:UpdatePanel ID="pnlUpdate" runat="server">
    <ContentTemplate>
  <asp:GridView ID="gvMedidas" runat="server" AutoGenerateColumns="False" CssClass="gridView" DataSourceID="dsMedidas" AllowPaging="True" PageSize="12" ShowHeaderWhenEmpty="True" AllowSorting="True" Width="100%">
                <AlternatingRowStyle BackColor="#EAEAEA" />
                <Columns>
                    <asp:TemplateField HeaderText="Clave" SortExpression="Clave">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Clave") %>' Font-Bold="true"></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" CssClass="editTextbox" Width="40" MaxLength="6"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Clave") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripción" SortExpression="Descripcion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Trim(Eval("Descripcion"))%>' CssClass="editTextbox" Width="100" MaxLength="20"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                              <asp:TextBox ID="TextBox2" runat="server"  CssClass="editTextbox" Width="100" MaxLength="20"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Descripcion")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="300px" />
                    </asp:TemplateField>
                    
                    
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="imbEdit" runat="server" CommandName="EDIT" ImageUrl="~/images/icons/16X16/pencil.png" Height="12" />
                            <asp:ImageButton ID="imbDelete" runat="server" ImageUrl="~/images/icons/16X16/delete (1).png" Height="12" OnClientClick="return confirm('¿Está seguro de eliminar este registro?');" OnClick="Delete" CommandArgument='<%# Eval("Clave")%>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                              <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/images/icons/16X16/tick.png" Height="12" OnClick="Save" CommandArgument='<%# Eval("Clave")%>' />
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
            <asp:SqlDataSource ID="dsMedidas" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT * FROM [Medidas] ORDER BY [Clave]"></asp:SqlDataSource>

        
    </ContentTemplate>
</asp:UpdatePanel>
<uc1:cntrlError ID="cntrlError1" runat="server" />

