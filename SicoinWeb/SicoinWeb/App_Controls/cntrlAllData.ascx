<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlAllData.ascx.vb" Inherits="cntrlAllData" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register src="~/App_Controls/cntrlError.ascx" tagname="cntrlError" tagprefix="uc1" %>
<%@ Register Src="~/App_Controls/cntrlLogin.ascx" TagPrefix="uc1" TagName="cntrlLogin" %>



<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>

<asp:HiddenField ID="hflRazon" runat="server" />
<asp:HiddenField ID="hflCliente" runat="server" />
<asp:HiddenField ID="hflImp2" runat="server" />

<table class="auto-style1">
    <tr>
        <td align="right" valign="top" style="width:190px;">Caja #</td>
        <td>
            <asp:TextBox ID="txtBox" runat="server" Width="100px" CssClass="textboxg uppercase"  onkeydown="nextOnEnter(this,event);" Enabled="False"></asp:TextBox>&nbsp;<asp:TextBox ID="txtOp" runat="server" CssClass="textboxg uppercase" Width="120px" style="position: relative; top:-41px; left:-95px;"></asp:TextBox>
                </td>
        <td align="center" valign="top" colspan="2" style="font-weight:bold;" >Cliente&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top">Mercancía</td>
        <td valign="top">
            <asp:TextBox ID="txtMercancia" runat="server" Width="200px" CssClass="textboxg uppercase"  onkeydown="nextOnEnter(this,event);" Enabled="False"></asp:TextBox>
        </td>
        <td align="right" valign="top">Nombre</td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="22" Width="250px" Enabled="False" ClientIDMode="Static"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Mcia en U. M.</td>
        <td valign="top">
            <asp:TextBox ID="txtMUM" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False" Width="80px"></asp:TextBox>
            </td>
        <td align="right" valign="top">Razón Social</td>
        <td valign="top">
            <asp:TextBox ID="txtRazon" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Width="250px" Enabled="False" ClientIDMode="Static"></asp:TextBox>
       
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Peso</td>
        <td nowrap="nowrap">
            <asp:TextBox ID="txtPeso" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);"  Width="80px" Enabled="False"></asp:TextBox>
            &nbsp;&nbsp;&nbsp; U. M. <asp:DropDownList ID="ddlUM" runat="server" CssClass="textboxg uppercase" DataSourceID="dsMedidas" DataTextField="Descripcion" DataValueField="Clave" Font-Size="8" Enabled="False">
            </asp:DropDownList>
            <asp:SqlDataSource ID="dsMedidas" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT Clave, REPLACE(STR(Clave, 2), SPACE(1), '  ') + ' - ' + Descripcion AS Descripcion FROM Medidas ORDER BY Clave"></asp:SqlDataSource>
        </td>
        <td align="right" valign="top">Clave</td>
        <td valign="top">
            <asp:TextBox ID="txtCliente" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);"  Enabled="False" ClientIDMode="Static"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Fecha de Entrada</td>
        <td>
            <asp:TextBox ID="txtFecha" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="170px" ></asp:TextBox>
        </td>
        <td align="right" valign="top"  >
            Causa abandono</td>
        <td align="left" valign="top"  >
            <asp:TextBox ID="txtFechaAb" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="170px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">&nbsp;</td>
        <td>
            &nbsp;</td>
          <td align="right" valign="top">Fecha de Salida</td>
        <td align="left" nowrap="nowrap">
            <asp:TextBox ID="txtFechaout" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="160px" ></asp:TextBox>
        &nbsp;-&gt;
            <asp:TextBox ID="txtTiempo" runat="server"  CssClass="textboxg uppercase" Enabled="False" Width="40px"></asp:TextBox>
        &nbsp;Días</td>
    </tr>
    <tr>
        <td align="right" valign="top">Fracción A.</td>
        <td>
            <asp:TextBox ID="txtFraccion" runat="server" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        &nbsp;</td>
        <td align="right" valign="top">Descargado</td>
        <td align="left">
            <asp:TextBox ID="txtDescargado" runat="server" TabIndex="15" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" AutoPostBack="True" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Valor Comercial</td>
        <td>
            <asp:TextBox ID="txtValor" runat="server"  onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        &nbsp;</td>

              <td align="right" valign="top">Remanente</td>
        <td align="left">
           
            <asp:TextBox ID="txtRemanente" runat="server" TabIndex="16" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" Enabled="False"></asp:TextBox>
           
        </td>
      
                

      
    </tr>
    <tr>
        <td align="right" valign="top">Importador/Exportador</td>
        <td>
            <asp:TextBox ID="txtImp1" runat="server" Width="300px"   CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False" ClientIDMode="Static" ></asp:TextBox>
       
            <br />
            <asp:TextBox ID="txtImp2" runat="server" Width="300px" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" ReadOnly="False" ClientIDMode="Static" Enabled="False"></asp:TextBox>
           
            </td>
          <td align="right" valign="bottom">Factura</td>
        <td align="left" valign="bottom">
            <asp:TextBox ID="txtFactura" runat="server" CausesValidation="True" CssClass="textboxg uppercase" MaxLength="10" onkeydown="nextOnEnter(this,event);" TabIndex="17" Width="80px" Enabled="False"></asp:TextBox>
            </td>


    </tr>
    <tr>
        <td align="right" valign="top">Contenedor y Sellos</td>
        <td>
            <asp:TextBox ID="txtCont" runat="server"  onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Width="250" Enabled="False"></asp:TextBox>
        </td>
              <td align="right" valign="top">CFDI</td>
        <td valign="top" align="left">
           
            <asp:TextBox ID="txtCFDI" runat="server" TabIndex="18" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" Width="250px" MaxLength="36" Enabled="False"></asp:TextBox>
           
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Bultos</td>
        <td>
            <asp:TextBox ID="txtBultos" runat="server"  onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        </td>
               <td align="right" valign="top">Monto</td>
        <td align="left">
           
            <asp:TextBox ID="txtMontoMXP" runat="server" TabIndex="19" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" Width="60px" Enabled="False"></asp:TextBox>
           
            &nbsp;MXP&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtMontoUSD" runat="server" CausesValidation="True" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="20" Width="60px" Enabled="False"></asp:TextBox>
            &nbsp;USD</td>
    </tr>
    <tr>
        <td align="right" valign="top">Clave de Pedimento</td>
        <td>
            <asp:TextBox ID="txtClave" runat="server"  onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        </td>
        <td align="right" valign="top">Aprovechamiento</td>
        <td align="left">
           
            <asp:TextBox ID="txtAprov" runat="server" TabIndex="21" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" CausesValidation="True" Width="60px" Enabled="False"></asp:TextBox>
           
                    </td>
    </tr>
    <tr>
        <td colspan="4">
            <asp:Panel ID="pnlButtons" runat="server" style="padding: 20px; text-align:center">
                <asp:Button ID="btnModify" runat="server" CssClass="btn" TabIndex="25" Text="Modificar" />
                            <asp:Button ID="btnOK" runat="server" CssClass="btn" TabIndex="25" Text="Aceptar" Visible="false" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btna" TabIndex="26" Text="Cancelar" />
                        </asp:Panel>
        </td>
    </tr>
    </table>

<uc1:cntrlError ID="cntrlError" runat="server" />

<asp:HiddenField ID="hflOp" runat="server" />

<asp:Panel ID="pnlPopUp" runat="server"  >
    <uc1:cntrlLogin runat="server" ID="cntrlLogin" />
</asp:Panel>
<asp:Button ID="btnPopUp" runat="server" Style="display:none" />
<ajaxToolkit:ModalPopupExtender ID="mdlLogin" runat="server"  TargetControlID="btnPopUp" PopupControlID="pnlPopUp" BackgroundCssClass="modalBackground"  >
</ajaxToolkit:ModalPopupExtender>
