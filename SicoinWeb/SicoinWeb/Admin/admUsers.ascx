<%@ Control Language="VB" AutoEventWireup="false" CodeFile="admUsers.ascx.vb" Inherits="Admin_admUsers" %>
<%@ Register Src="~/App_Controls/cntrlError.ascx" TagName="cntrlError" TagPrefix="uc1" %>
<asp:UpdatePanel ID="pnlUpdate" runat="server">
    <ContentTemplate>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="gridView" DataSourceID="dsUsers" AllowPaging="True" PageSize="12" ShowHeaderWhenEmpty="True" AllowSorting="True" Width="100%">
            <AlternatingRowStyle BackColor="#EAEAEA" />
            <Columns>
                <asp:TemplateField HeaderText="Username" SortExpression="Username">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Username")%>' Font-Bold="true"></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="editTextbox" Width="80" MaxLength="20"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Username")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Trim(Eval("Nombre"))%>' CssClass="editTextbox" Width="125" MaxLength="80"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="editTextbox" Width="125" MaxLength="80"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Trim(Eval("Email"))%>' CssClass="editTextbox" Width="150" MaxLength="80"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="editTextbox" Width="150" MaxLength="80"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="ServerName" SortExpression="ServerName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlServer" runat="server" CssClass="editTextbox" DataSourceID="dsServers" DataTextField="ServerName" DataValueField="ID" SelectedValue='<%# Eval("ServerID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsServers" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT 0 AS ID, 'Seleccionar' AS ServerName UNION SELECT ID, ServerName + '\' + DatabaseName AS ServerName FROM tblServers"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblServer" runat="server" Text='<%# Bind("ServerName") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlServer" runat="server" CssClass="editTextbox" DataSourceID="dsServers" DataTextField="ServerName" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsServers" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT 0 AS ID, 'Seleccionar' AS ServerName UNION SELECT ID, ServerName + '\' + DatabaseName AS ServerName FROM tblServers"></asp:SqlDataSource>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Priv" SortExpression="Descripcion">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlPrivs" runat="server" DataSourceID="dsPrivs" DataTextField="Descripcion" DataValueField="Priv" CssClass="editTextbox" SelectedValue='<%# Bind("Priv")%>'></asp:DropDownList>

                        <asp:SqlDataSource ID="dsPrivs" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT * FROM [tblPrivs]"></asp:SqlDataSource>

                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlPrivs" runat="server" DataSourceID="dsPrivs" DataTextField="Descripcion" DataValueField="Priv" CssClass="editTextbox"></asp:DropDownList>

                        <asp:SqlDataSource ID="dsPrivs" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT * FROM [tblPrivs]"></asp:SqlDataSource>

                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Descripcion")%>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="SA" SortExpression="SuperAdmin">
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkSuperAdmin" runat="server" Checked='<%# Bind("SuperAdmin") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSuperAdmin" runat="server" Checked='<%# Bind("SuperAdmin") %>' Enabled="False" Visible='<%# Eval("Priv") = 5 %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contraseña">
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="editTextbox" Width="80" MaxLength="80"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnbPassWord" runat="server" Text="Cambiar" OnClick="changePassword">
                        </asp:LinkButton>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="editTextbox" Width="80" MaxLength="80" Visible="false"></asp:TextBox>
                        <asp:ImageButton ID="imbPwd" runat="server" ImageUrl="~/images/icons/16X16/tick.png" CommandArgument='<%# Eval("Username")%>' Visible="false" OnClick="chgPwd" Height="12" />
                        <asp:ImageButton ID="imbCancPwd" runat="server" ImageUrl="~/images/icons/16X16/delete.png" CommandArgument='<%# Eval("Username")%>' Visible="false" OnClick="canPwd" Height="12" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="imbEdit" runat="server" CommandName="EDIT" ImageUrl="~/images/icons/16X16/pencil.png" Height="12" />
                        <asp:ImageButton ID="imbDelete" runat="server" ImageUrl="~/images/icons/16X16/delete (1).png" Height="12" OnClientClick="return confirm('¿Está seguro de eliminar este registro?');" OnClick="Delete" CommandArgument='<%# Eval("Username")%>' Visible='<%# Trim(Username).ToUpper <> Trim(Eval("Username")).ToUpper%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/images/icons/16X16/tick.png" Height="12" OnClick="Save" CommandArgument='<%# Eval("Username")%>' />
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
        <asp:SqlDataSource ID="dsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT tblUsers.Username, tblUsers.Nombre, tblUsers.Email, tblUsers.Password, tblUsers.Priv, tblPrivs.Descripcion, tblServers.ServerName + '\' + tblServers.DatabaseName AS ServerName, ISNULL(tblUsers.ServerID, 0) AS ServerID, ISNULL(tblUsers.SuperAdmin, 0) AS SuperAdmin FROM tblUsers INNER JOIN tblPrivs ON tblUsers.Priv = tblPrivs.Priv LEFT OUTER JOIN tblServers ON tblUsers.ServerID = tblServers.ID ORDER BY tblUsers.Username"></asp:SqlDataSource>


    </ContentTemplate>
</asp:UpdatePanel>
<uc1:cntrlError ID="cntrlError1" runat="server" />

<asp:HiddenField ID="hflUsername" runat="server" />
