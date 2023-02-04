<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlOutputData.ascx.vb" Inherits="cntrlOutputData" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register src="~/App_Controls/cntrlError.ascx" tagname="cntrlError" tagprefix="uc1" %>


<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>


<table class="auto-style1">
    <tr>
        <td align="right" valign="top" style="width:190px;">Caja #</td>
        <td>
            <asp:TextBox ID="txtBox" runat="server" Width="100px" CssClass="textboxg uppercase"  onkeydown="nextOnEnter(this,event);" Enabled="False"></asp:TextBox>&nbsp;</td>
        <td align="center" valign="top" colspan="2" style="font-weight:bold;" >Cliente&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top">Mercancía</td>
        <td valign="top">
            <asp:TextBox ID="txtMercancia" runat="server" Width="200px" CssClass="textboxg uppercase"  onkeydown="nextOnEnter(this,event);" Enabled="False"></asp:TextBox>
        </td>
        <td align="right" valign="top">Nombre</td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="22" Width="250px" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Mcia en U. M.</td>
        <td valign="top">
            <asp:TextBox ID="txtMUM" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False" Width="100px"></asp:TextBox>
            </td>
        <td align="right" valign="top">Razón Social</td>
        <td valign="top">
            <asp:TextBox ID="txtRazon" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Width="250px" Enabled="False" ClientIDMode="Static"></asp:TextBox>
       
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Peso</td>
        <td nowrap="nowrap">
            <asp:TextBox ID="txtPeso" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);"  Width="100px" Enabled="False"></asp:TextBox>
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
        <td align="right">
            Causa abandono</td>
        <td align="left">
            <asp:TextBox ID="txtFechaAb" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="170px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td align="right" colspan="2" rowspan="6">
            <asp:Panel ID="pnlOut" runat="server" CssClass="tableHl" Style="position:relative; width:400px; left:-10px;" >

           <asp:UpdatePanel ID="pnlUpdate1" runat="server">
               <ContentTemplate>


            <table class="auto-style1" >
                <tr>
        <td align="right" valign="top">Fecha de Salida</td>
        <td align="left">
            <asp:TextBox ID="txtFechaout" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="160px"></asp:TextBox>
            &nbsp;-&gt;
            <asp:TextBox ID="txtTiempo" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="40px"></asp:TextBox>
            &nbsp;Días</td>
                </tr>
                <tr>
        <td align="right" valign="top">&nbsp;</td>
                    <td align="left" valign="top"></td>
                </tr>
                <tr >
        <td align="right" valign="top">
           
            Descargado</td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtDescargado" runat="server" AutoPostBack="True" CausesValidation="True" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="15" Width="80px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp; Remanente&nbsp;<asp:TextBox ID="txtRemanente" runat="server" CausesValidation="True" CssClass="textboxg uppercase" Enabled="False" onkeydown="nextOnEnter(this,event);" TabIndex="16" Width="80px"></asp:TextBox>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" colspan="2" valign="middle" style="min-height: 50px;">
                        <asp:Button ID="btnDeclAb" runat="server" Text="Declarar en Abandono" CssClass="btn" />
                        <asp:Panel ID="pnlDeclAbandono" runat="server" Visible="false" style="border-top: 1px solid #333; margin-top:5px;" >
                            <table>
                                <tr><td style="padding: 5px; width:50%">Declaracón en abandono</td>
                                    <td style="padding: 5px; width:50%">Fecha de salida de abandono</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; width:50%">
<asp:TextBox ID="txtDeclAb" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="100%"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="txtDeclAb_CalendarExtender" runat="server" TargetControlID="txtDeclAb">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td style="padding: 5px; width:50%">
<asp:TextBox ID="txtSalAb" runat="server" CssClass="textboxg uppercase" Width="100%"></asp:TextBox>
                                                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtSalAb">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; width:50%" valign="top">Comentario sobre la razón de Abandono:
                                    </td>
                                    <td style="padding: 5px; width:50%">
                                        <asp:HiddenField ID="hflDeclAb" runat="server" />
                                        <asp:TextBox runat="server" ID="txtNotaAb" Width="100%" CssClass="textboxg uppercase" MaxLength="1000" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>


               </ContentTemplate>
           </asp:UpdatePanel>
                  </asp:Panel>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Fracción A.</td>
        <td>
            <asp:TextBox ID="txtFraccion" runat="server" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        &nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top">Valor Comercial</td>
        <td>
            <asp:TextBox ID="txtValor" runat="server"  onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        &nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top">Importador/Exportador</td>
        <td>
            <asp:TextBox ID="txtImp1" runat="server" Width="300px"   CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Enabled="False" ></asp:TextBox>
       
            <br />
            <asp:TextBox ID="txtImp2" runat="server" Width="300px" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" ReadOnly="False" ClientIDMode="Static" Enabled="False"></asp:TextBox>
           
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Contenedor y Sellos</td>
        <td>
            <asp:TextBox ID="txtCont" runat="server"  onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Width="250" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Bultos</td>
        <td>
            <asp:TextBox ID="txtBultos" runat="server"  onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Clave de Pedimento</td>
        <td>
            <asp:TextBox ID="txtClave" runat="server"  onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Enabled="False"></asp:TextBox>
        </td>
        <td align="right" colspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top" colspan="4">
                        <asp:Panel ID="pnlButtons" runat="server" style="padding: 20px; text-align:center">
                             <asp:Button ID="btnMod" runat="server" CssClass="btn" TabIndex="25" Text="Modificar" Visible="false" Style="margin-right:20px;"/>
                            
                            <asp:Button ID="btnOK" runat="server" CssClass="btn" TabIndex="25" Text="Aceptar" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btna" TabIndex="26" Text="Cancelar" />
                        </asp:Panel>
                    </td>
    </tr>
    </table>

<uc1:cntrlError ID="cntrlError" runat="server" />

<asp:HiddenField ID="hflOp" runat="server" />
<asp:HiddenField ID="hflUsername" runat="server" />

<asp:Panel ID="pnlPopUp" runat="server" CssClass="modalPopUpBig" Width="300" Height="150" style="display:none" >
    <div style="text-align:center; padding:15px;">
        Se ha completado el total de la información de salida para<br />este registro.<br /><br />¿Desea marcar esta operación como terminada?.<br /><br />
        <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Si" Width="80" />
        &nbsp;<asp:Button ID="btnNo" runat="server" Text= "No" CssClass="btna" Width="60" />
    </div>
</asp:Panel>

<asp:Button ID="btnPopUp" runat="server" Style="display:none" />
<ajaxToolkit:ModalPopupExtender ID="pnlConfirm_ModalPopupExtender" runat="server"  TargetControlID="btnPopUp" PopupControlID="pnlPopUp" BackgroundCssClass="modalBackground"  >
</ajaxToolkit:ModalPopupExtender>
