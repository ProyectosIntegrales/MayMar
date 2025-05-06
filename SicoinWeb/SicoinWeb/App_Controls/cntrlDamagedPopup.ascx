<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlDamagedPopup.ascx.vb" Inherits="App_Controls_cntrlDamagedPopup" %>
<%@ Register Src="~/App_Controls/cntrlError.ascx" TagName="cntrlError" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<style type="text/css">
    .modalBackground {
        background-color: #414141;
        filter: alpha(opacity=50);
        opacity: 0.5;
    }

    #Container {
        height: 99%;
        min-height: 99%;
    }
</style>

<style type="text/css">
    .Header {
        padding: 3px;
    }

    .style1 {
        width: 100%;
        margin-bottom: 10px;
        margin-left: 15px;
    }
</style>
<link rel="stylesheet" href="/styles/boostrap-grid.css" asp-append-version="true" />



<asp:Button ID="btnShowPopup" runat="server" Text="PopUp" Style="display: none;" />

<cc1:ModalPopupExtender ID="mdlPopup" runat="server" TargetControlID="btnShowPopup"
    PopupControlID="pnlPopup" BackgroundCssClass="modalBackground" DropShadow="True">
</cc1:ModalPopupExtender>

<asp:Panel ID="pnlPopup" runat="server" Width="420px" CssClass="modalPopUpBig w-700"
    BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Style="display: none; min-width: 360px !important; min-height: 180px">
    <div style="text-align: right; position: absolute; top: 0; right: 0;">
        <asp:ImageButton ID="imbClose" runat="server" ImageUrl="~/images/Icons/close.png" Width="16" CausesValidation="False" OnClick="imbClose_Click" />
    </div>
    <div id="Container" style="padding: 0 10px 0 10px; position: relative;">

        <h3 style="margin-top: 0">Mercancía Dañada o Perdida</h3>

        <asp:Panel ID="pnlTable" runat="server">


            <asp:GridView ID="gvDamaged" runat="server" AutoGenerateColumns="False" CssClass="gridView" DataSourceID="dsDamages" AllowPaging="True" PageSize="3" ShowHeaderWhenEmpty="True" AllowSorting="True" Width="100%" BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray">
                <AlternatingRowStyle BackColor="#EAEAEA" />
                <Columns>
                    <asp:TemplateField HeaderText="Cantidad" SortExpression="Cantidad">
                        <EditItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>' Visible="false"></asp:Label>

                            <asp:TextBox ID="txtCantidad" runat="server" CssClass="editTextbox" Width="80" MaxLength="20" Text='<%# Bind("Cantidad") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCantidad" runat="server" CssClass="editTextbox" Width="80" MaxLength="20"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblCantidad" runat="server" Text='<%# Bind("Cantidad")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comentarios" SortExpression="Comentario" ItemStyle-Width="70%">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtComentarios" runat="server" CssClass="editTextbox" Width="100%" Rows="2" TextMode="MultiLine" Text='<%# Bind("Comentario") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtComentarios" runat="server" CssClass="editTextbox" Width="100%" Rows="2" TextMode="MultiLine"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblComentario" runat="server" Text='<%# Bind("Comentario")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Fecha" SortExpression="Fecha" FooterStyle-CssClass="nowrap" ItemStyle-CssClass="nowrap">
                        <EditItemTemplate>


                            <asp:ImageButton ID="imbCalendar1" runat="server" ImageAlign="Bottom" ImageUrl="~/images/icons/16x16/calendar (1).png" Style="width: 16px" />
                            <asp:TextBox ID="txtFecha" runat="server" CssClass="editTextbox" Width="80" Text='<%# Bind("Fecha", "{0:dd/MM/yyyy}") %>' Font-Size="8"></asp:TextBox>
                            <asp:Image ID="imgReq" runat="server" ImageAlign="Middle" ImageUrl="~/images/icons/16x16/question.png" Visible="false" />
                            <cc1:CalendarExtender ID="CalendarExtender0" runat="server" Enabled="True" Format="dd/MM/yyyy" PopupButtonID="imbCalendar1" TargetControlID="txtFecha"></cc1:CalendarExtender>

                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="imbCalendar1" runat="server" ImageAlign="Bottom" ImageUrl="~/images/icons/16x16/calendar (1).png" Style="width: 16px" />
                            <asp:TextBox ID="txtFecha" runat="server" CssClass="editTextbox" Width="80" Text='<%# Bind("Fecha", "{0:dd/MM/yyyy}") %>' Font-Size="8"></asp:TextBox>
                            <asp:Image ID="imgReq" runat="server" ImageAlign="Middle" ImageUrl="~/images/icons/16x16/question.png" Visible="false" />
                            <cc1:CalendarExtender ID="CalendarExtender0" runat="server" Enabled="True" Format="dd/MM/yyyy" PopupButtonID="imbCalendar1" TargetControlID="txtFecha"></cc1:CalendarExtender>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFecha" runat="server" Text='<%# Eval("Fecha", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Usuario" SortExpression="CreatedBy">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUser" runat="server" CssClass="editTextbox" Width="80" Text='<%# Bind("CreatedBy") %>' ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblUser" runat="server"></asp:Label>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUser" runat="server" Text='<%# Bind("CreatedBy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="imbEdit" runat="server" CommandName="EDIT" ImageUrl="~/images/icons/16X16/pencil.png" Height="12" OnCommand="imbEdit_Command" CommandArgument='<%# Container.DataItemIndex %>' />
                            <asp:ImageButton ID="imbDelete" runat="server" ImageUrl="~/images/icons/16X16/delete (1).png" Height="12" OnClientClick="return confirm('¿Está seguro de eliminar este registro?');" OnClick="imbDelete_Click" CommandArgument='<%# Eval("ID")%>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/images/icons/16X16/tick.png" Height="12" OnClick="imbSave_Click" CommandArgument='<%# Eval("ID")%>' />
                            <asp:ImageButton ID="imbCancel" runat="server" ImageUrl="~/images/icons/16X16/delete.png" Height="12" OnClick="imbCancel_Click" />
                        </EditItemTemplate>
                        <HeaderTemplate>
                            <asp:ImageButton ID="imbAdd" runat="server" ImageUrl="~/images/icons/16X16/add.png" Height="12" OnClick="imbAdd_Click" Visible="false" />
                        </HeaderTemplate>
                        <FooterTemplate>
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


            <asp:SqlDataSource ID="dsDamages" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT [ID], [Operacion], [Cantidad], [Comentario], [Fecha], [CreatedBy] FROM [Damages] WHERE ([Operacion] = @Operacion) ORDER BY [Fecha] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="Operacion" SessionField="op" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btnAdd" CssClass="btn" runat="server" Text="Agregar" OnClick="btnAdd_Click" Style="margin-top: 10px" />

        </asp:Panel>

        <asp:Panel ID="pnlAdd" runat="server" Visible="false">
            <div class="d-flex">
                <div class="col d-flex justify-content-end align-items-center">
                    Cantidad
                </div>
                <div class="col-7">
                    <asp:TextBox ID="txtCantidad" Width="60px" runat="server" CssClass="textbox"></asp:TextBox>
                </div>
            </div>

            <div class="d-flex mt-3">
                <div class="col d-flex justify-content-end align-items-center" style="text-align: right">
                    Comentario o descripción
                </div>
                <div class="col-7">
                    <asp:TextBox ID="txtComments" TextMode="MultiLine" Columns="45" Rows="3" runat="server" CssClass="textbox"></asp:TextBox>
                </div>
            </div>

            <div class="d-flex mt-3">
                <div class="col d-flex justify-content-end align-items-center" style="text-align: right">
                    Fecha de detección de daño o pérdida
                </div>
                <div class="col-7 d-flex align-items-center">
                    <asp:ImageButton ID="imbCalendar1" runat="server" ImageAlign="Bottom" ImageUrl="~/images/icons/16x16/calendar (1).png" Style="width: 16px; margin-right: 4px" />
                    <asp:TextBox ID="txtFecha" runat="server" CssClass="textbox" Width="100"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender0" runat="server" Enabled="True" Format="MM/dd/yyyy" PopupButtonID="imbCalendar1" TargetControlID="txtFecha"></cc1:CalendarExtender>
                </div>
            </div>



            <asp:Label ID="lblError" ForeColor="Red" runat="server" CssClass="mt-3" Style="text-align: center" Width="100%" Visible="false">
    Error en la Cantidad
            </asp:Label>

            <asp:Panel ID="pnlButtons" runat="server" Style="margin-top: 20px; text-align: center">

                <asp:Button ID="btnOK" runat="server" CssClass="btn" TabIndex="25" Text="Aceptar" Style="margin-right: 20px;" />

                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btna" TabIndex="26" Text="Cancelar" Style="margin-right: 20px;" />

            </asp:Panel>
        </asp:Panel>


    </div>

</asp:Panel>
<uc1:cntrlError ID="cntrlError" runat="server" />



