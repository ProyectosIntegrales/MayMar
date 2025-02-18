<%@ Control Language="VB" AutoEventWireup="false" CodeFile="admExportadores.ascx.vb" Inherits="Admin_admExportadores" %>
<%@ Register Src="~/App_Controls/cntrlError.ascx" TagName="cntrlError" TagPrefix="uc1" %>
<asp:UpdatePanel ID="pnlUpdate" runat="server">
    <ContentTemplate>
        <asp:GridView ID="gvExportadores" runat="server" AutoGenerateColumns="False" CssClass="gridView" DataSourceID="dsExportadores" AllowPaging="True" PageSize="12" ShowHeaderWhenEmpty="True" AllowSorting="True" Width="100%">
            <AlternatingRowStyle BackColor="#EAEAEA" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Trim(Eval("NombreExp"))%>' CssClass="editTextbox" Width="100%"  Rows="3" TextMode="MultiLine" MaxLength="80"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="editTextbox" Width="100%"  Rows="3" TextMode="MultiLine" MaxLength="100"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NombreExp") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="25%" />

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Dirección" SortExpression="Direccion">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Trim(Eval("Direccion"))%>' CssClass="editTextbox" Width="100%"  Rows="3" TextMode="MultiLine" MaxLength="100"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="editTextbox" Width="100%" Rows="3" TextMode="MultiLine" MaxLength="100"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ciudad" SortExpression="Ciudad">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Trim(Eval("Ciudad"))%>' CssClass="editTextbox" Width="100%" Rows="3" TextMode="MultiLine" MaxLength="80"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="editTextbox" Width="100%"  Rows="3" TextMode="MultiLine"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Ciudad") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="12%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="RFC" SortExpression="RFC">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Trim(Eval("RFC"))%>' CssClass="editTextbox" Width="100%"  Rows="3" TextMode="MultiLine" MaxLength="80"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="editTextbox" Width="100%"  Rows="3" TextMode="MultiLine"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("RFC") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
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
                    <ItemStyle Wrap="false" HorizontalAlign="Right" CssClass="w20"/>
                    <HeaderStyle CssClass="w20" />
                    <FooterStyle CssClass="w20" HorizontalAlign="Right" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle CssClass="selectedCell" />
            <FooterStyle CssClass="gridviewFooter" VerticalAlign="Top" />
            <HeaderStyle CssClass="gridviewHeader" BorderWidth="0px" />
            <PagerStyle CssClass="gridviewPager" HorizontalAlign="Right" />
            <RowStyle VerticalAlign="Top" />
            <SelectedRowStyle CssClass="selectedCell" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsExportadores" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT ID, NombreExp, Direccion, Ciudad, RFC FROM tblExportadores WHERE (NombreExp LIKE '%' + @Filter + '%') AND (@Filter &lt;&gt; '*') OR (SOUNDEX(NombreExp) = SOUNDEX(@Filter)) AND (@Filter &lt;&gt; '*') OR (@Filter = '*') ORDER BY NombreExp">
            <SelectParameters>
                <asp:ControlParameter ControlID="hflFilter" Name="Filter" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:HiddenField ID="hflFilter" runat="server" />


    </ContentTemplate>
</asp:UpdatePanel>
<uc1:cntrlError ID="cntrlError1" runat="server" />

