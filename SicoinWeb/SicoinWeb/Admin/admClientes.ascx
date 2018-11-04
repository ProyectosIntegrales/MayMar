<%@ Control Language="VB" AutoEventWireup="false" CodeFile="admClientes.ascx.vb" Inherits="Admin_admClientes" %>
<%@ Register Src="../App_Controls/cntrlError.ascx" TagName="cntrlError" TagPrefix="uc1" %>
<asp:UpdatePanel ID="pnlUpdate" runat="server">
    <ContentTemplate>
        <asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False" CssClass="gridView" DataSourceID="dsClientes" AllowPaging="True" PageSize="12" ShowHeaderWhenEmpty="True" AllowSorting="True" Width="100%">
            <AlternatingRowStyle BackColor="#EAEAEA" />
            <Columns>
                <asp:TemplateField HeaderText="Clave" SortExpression="Clave">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Clave") %>' Font-Bold="true"></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="editTextbox" Width="40" MaxLength="5"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Clave") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Trim(Eval("Nombre"))%>' CssClass="editTextbox" Width="125" Rows="3" TextMode="MultiLine" MaxLength="80"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="editTextbox" Width="125" Rows="3" TextMode="MultiLine" MaxLength="80"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Razón Social" SortExpression="RSocial">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Trim(Eval("RSocial"))%>' CssClass="editTextbox" Width="120" Rows="3" TextMode="MultiLine" MaxLength="80"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="editTextbox" Width="120" Rows="3" TextMode="MultiLine" MaxLength="80"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("RSocial") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rfc" SortExpression="Rfc">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Rfc") %>' CssClass="editTextbox" Width="80" MaxLength="14"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="editTextbox" Width="80" MaxLength="14"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Rfc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dirección" SortExpression="Direccion">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Trim(Eval("Direccion"))%>' CssClass="editTextbox" Width="160" Rows="3" TextMode="MultiLine" MaxLength="110"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="editTextbox" Width="160" Rows="3" TextMode="MultiLine" MaxLength="110"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Patente" SortExpression="Patente">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Patente") %>' CssClass="editTextbox" Width="40" MaxLength="4"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="editTextbox" Width="40" MaxLength="4"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Patente") %>'></asp:Label>
                    </ItemTemplate>
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
                    <ItemStyle Wrap="false" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle CssClass="selectedCell" />
            <FooterStyle CssClass="gridviewFooter" VerticalAlign="Top" />
            <HeaderStyle CssClass="gridviewHeader" BorderWidth="0px" />
            <PagerStyle CssClass="gridviewPager" HorizontalAlign="Right" />
            <RowStyle VerticalAlign="Top" />
            <SelectedRowStyle CssClass="selectedCell" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsClientes" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT Clave, Nombre, RSocial, Rfc, Direccion, Patente FROM Clientes WHERE (Nombre LIKE '%' + @Filter + '%') AND (@Filter &lt;&gt; '') OR (@Filter = '*') ORDER BY Clave">
            <SelectParameters>
                <asp:ControlParameter ControlID="hflFilter" Name="Filter" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:HiddenField ID="hflFilter" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
<uc1:cntrlError ID="cntrlError1" runat="server" />

