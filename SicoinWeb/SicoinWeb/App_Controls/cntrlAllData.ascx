<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlAllData.ascx.vb" Inherits="cntrlAllData" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/App_Controls/cntrlError.ascx" TagName="cntrlError" TagPrefix="uc1" %>


<%@ Register src="cntrlDamaged.ascx" tagname="cntrlDamaged" tagprefix="uc2" %>


<style type="text/css">
    .auto-style1 {
        width: 100%;
    }

    .pnlLoginPopup {
        position: absolute !important;
        z-index: 10002 !important;
        top: 65% !important;
        left: 50% !important;
    }
    .auto-style3 {
        height: 7px;
    }
</style>

<asp:HiddenField ID="hflRazon" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hflCliente" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hflImp2" runat="server" ClientIDMode="Static" />

<asp:TextBox ID="txtOp" runat="server" CssClass="textboxg uppercase" Width="120px" Style="display: none"></asp:TextBox>

<table class="auto-style1">
    <tr>
        <td align="right" valign="center" style="width: 190px;">Caja #</td>
        <td>
            <asp:TextBox ID="txtBox" runat="server" Width="100px" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False"></asp:TextBox>&nbsp;<asp:TextBox ID="txtNewOper" runat="server" CssClass="textboxg uppercase" Width="130px" Style="position: relative; top: -42px; left: -99px;"></asp:TextBox>
        </td>
        <td align="center" valign="center" colspan="2" style="font-weight: bold;">Cliente</td>
    </tr>
    <tr>
        <td align="right" valign="center">Mercancía</td>
        <td valign="center">
            <asp:TextBox ID="txtMercancia" runat="server" Width="200px" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False"></asp:TextBox>
        </td>
        <td align="right" valign="center">Nombre</td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="22" Width="250px" Enabled="False" ClientIDMode="Static"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="center">Mcia en U. M.</td>
        <td valign="center">
            <asp:TextBox ID="txtMUM" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False" Width="80px"></asp:TextBox>
        </td>
        <td align="right" valign="center">Razón Social</td>
        <td valign="center">
            <asp:TextBox ID="txtRazon" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Width="250px" Enabled="False" ClientIDMode="Static"></asp:TextBox>

        </td>
    </tr>
    <tr>
        <td align="right" valign="center">Peso</td>
        <td nowrap="nowrap">
            <asp:TextBox ID="txtPeso" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Width="80px" Enabled="False"></asp:TextBox>
            &nbsp;&nbsp;&nbsp; U. M.
            <asp:DropDownList ID="ddlUM" runat="server" CssClass="textboxg uppercase" DataSourceID="dsMedidas" DataTextField="Descripcion" DataValueField="Clave" Font-Size="8" Enabled="False">
            </asp:DropDownList>
            <asp:SqlDataSource ID="dsMedidas" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT Clave, REPLACE(STR(Clave, 2), SPACE(1), '  ') + ' - ' + Descripcion AS Descripcion FROM Medidas ORDER BY Clave"></asp:SqlDataSource>
        </td>
        <td align="right" valign="center">Clave</td>
        <td valign="center">
            <asp:TextBox ID="txtCliente" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False" ClientIDMode="Static"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="center">Fecha de Entrada</td>
        <td>
            <asp:TextBox ID="txtFecha" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="170px"></asp:TextBox>
        </td>
        <td align="right" valign="center">Causa abandono</td>
        <td align="left" valign="center">
            <asp:TextBox ID="txtFechaAb" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="170px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="right" valign="center">Fecha de Salida</td>
        <td align="left" nowrap="nowrap">
            <asp:TextBox ID="txtFechaout" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="160px"></asp:TextBox>
            &nbsp;-&gt;
            <asp:TextBox ID="txtTiempo" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="40px"></asp:TextBox>
            &nbsp;Días</td>
    </tr>
    <tr>
        <td align="right" valign="center" >Fracción A.</td>
        <td class="auto-style3">
            <asp:TextBox ID="txtFraccion" runat="server" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
            &nbsp;</td>
        <td align="right" valign="center" class="auto-style3" >Descargado</td>
        <td align="left" class="auto-style3" >
            <asp:TextBox ID="txtDescargado" runat="server" TabIndex="15" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" AutoPostBack="True" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="center">Valor Comercial</td>
        <td>
            <asp:TextBox ID="txtValor" runat="server" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
            &nbsp;</td>

        <td align="right" valign="center">Remanente</td>
        <td align="left">

            <asp:TextBox ID="txtRemanente" runat="server" TabIndex="16" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" Enabled="False"></asp:TextBox>

        </td>
    </tr>
    <tr>
        <td align="right" valign="center">Importador/Exportador</td>
        <td>
            <asp:TextBox ID="txtImp1" runat="server" Width="300px" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False" ClientIDMode="Static"></asp:TextBox></td>
        <td align="right" valign="center">Mcia Dañada
        </td>
        <td class="d-flex">
           
            <uc2:cntrlDamaged ID="cntrlDamaged" runat="server" />
           
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:TextBox ID="txtImp2" runat="server" Width="300px" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" ReadOnly="False" ClientIDMode="Static" Enabled="False"></asp:TextBox>

        </td>
        <td align="right" valign="center">Factura</td>
        <td align="left" valign="bottom">
            <asp:TextBox ID="txtFactura" runat="server" CausesValidation="True" CssClass="textboxg uppercase" MaxLength="10" onkeydown="nextOnEnter(this,event);" TabIndex="17" Width="80px" Enabled="False"></asp:TextBox>
        </td>


    </tr>
    <tr>
        <td align="right" valign="center">Contenedor y Sellos</td>
        <td>
            <asp:TextBox ID="txtCont" runat="server" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Width="250" Enabled="False"></asp:TextBox>
        </td>
        <td align="right" valign="center">CFDI</td>
        <td valign="center" align="left">

            <asp:TextBox ID="txtCFDI" runat="server" TabIndex="18" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" Width="250px" MaxLength="36" Enabled="False"></asp:TextBox>

        </td>
    </tr>
    <tr>
        <td align="right" valign="center">Bultos</td>
        <td>
            <asp:TextBox ID="txtBultos" runat="server" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        </td>
        <td align="right" valign="center">Monto</td>
        <td align="left">

            <asp:TextBox ID="txtMontoMXP" runat="server" TabIndex="19" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" Width="60px" Enabled="False"></asp:TextBox>

            &nbsp;MXP&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtMontoUSD" runat="server" CausesValidation="True" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="20" Width="60px" Enabled="False"></asp:TextBox>
            &nbsp;USD</td>
    </tr>
    <tr>
        <td align="right" valign="center">Clave de Pedimento</td>
        <td>
            <asp:TextBox ID="txtClave" runat="server" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        </td>
        <td align="right" valign="center">Aprovechamiento</td>
        <td align="left">

            <asp:TextBox ID="txtAprov" runat="server" TabIndex="21" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" Width="60px" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <asp:Panel ID="pnlButtons" runat="server" Style="padding: 20px; text-align: center">
                <asp:Button ID="btnMod" runat="server" CssClass="btn" Style="margin-right: 20px;" TabIndex="25" Text="Modificar" Visible="False" />
                <asp:Button ID="btnOK" runat="server" CssClass="btn" TabIndex="25" Text="Aceptar" Visible="false" Style="margin-right: 20px;" />

                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btna" TabIndex="26" Text="Cancelar" Style="margin-right: 20px;" />
                <asp:Button ID="btnConfirmar" runat="server" CssClass="btn" Style="margin-right: 20px;" TabIndex="25" Text="Confirmar Entrada" Visible="false" />

            </asp:Panel>
        </td>
    </tr>
</table>

<uc1:cntrlError ID="cntrlError" runat="server" />


<asp:HiddenField ID="hflOp" runat="server" />
<asp:HiddenField ID="hflStatus" runat="server" />

