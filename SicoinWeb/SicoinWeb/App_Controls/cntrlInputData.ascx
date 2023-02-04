<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlInputData.ascx.vb" Inherits="cntrlInputData" %>

<%@ Register src="~/App_Controls/cntrlError.ascx" tagname="cntrlError" tagprefix="uc1" %>


<table class="auto-style1">
    <tr>
        <td align="right" valign="top" style="width:190px;">Caja #</td>
        <td>
            <asp:TextBox ID="txtBox" runat="server" Width="100px" CssClass="textboxg uppercase" TabIndex="10" onkeydown="nextOnEnter(this,event);"></asp:TextBox>&nbsp;</td>
        <td align="center" valign="top" colspan="2" style="font-weight:bold;" >Cliente&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
    </tr>
    <tr>
        <td align="right" valign="top">Mercancía</td>
        <td valign="top">
            <asp:TextBox ID="txtMercancia" runat="server" Width="200px" CssClass="textboxg uppercase" TabIndex="11" onkeydown="nextOnEnter(this,event);"></asp:TextBox>
        </td>
        <td align="right" valign="top">Nombre</td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="22" Width="250px" ClientIDMode="Static"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Mcia en U. M.</td>
        <td valign="top">
            <asp:TextBox ID="txtMUM" runat="server" CssClass="textboxg uppercase" TabIndex="12" onkeydown="nextOnEnter(this,event);" Width="100px"></asp:TextBox>
            </td>
        <td align="right" valign="top">Razón Social</td>
        <td valign="top">
            <asp:TextBox ID="txtRazon" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" Width="250px" Enabled="False" ClientIDMode="Static"></asp:TextBox>
            <asp:HiddenField ID="hflRazon" runat="server" ClientIDMode="Static" />
       
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Peso</td>
        <td nowrap="nowrap">
            <asp:TextBox ID="txtPeso" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="13" Width="100"></asp:TextBox>
            &nbsp;&nbsp;&nbsp; U. M. <asp:DropDownList ID="ddlUM" runat="server" CssClass="textboxg uppercase" DataSourceID="dsMedidas" DataTextField="Descripcion" DataValueField="Clave" Font-Size="8" TabIndex="14" Width="100px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="dsMedidas" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT Clave, REPLACE(STR(Clave, 2), SPACE(1), '  ') + ' - ' + Descripcion AS Descripcion FROM Medidas ORDER BY Clave"></asp:SqlDataSource>
        </td>
        <td align="right" valign="top">Clave</td>
        <td valign="top">
            <asp:TextBox ID="txtCliente" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);"  Enabled="False" ClientIDMode="Static"></asp:TextBox>
            <asp:HiddenField ID="hflCliente" runat="server" ClientIDMode="Static" />
       
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Fecha de Entrada</td>
        <td>
            <asp:TextBox ID="txtFecha" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="170px" ></asp:TextBox>
        </td>
        <td align="right" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top">&nbsp;</td>
        <td>
            &nbsp;</td>
        <td align="right" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top">Fracción A.</td>
        <td>
            <asp:TextBox ID="txtFraccion" runat="server" TabIndex="15" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase"></asp:TextBox>
        &nbsp;</td>
        <td align="right" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top">Valor Comercial</td>
        <td>
            <asp:TextBox ID="txtValor" runat="server" TabIndex="16" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase"></asp:TextBox>
        &nbsp;</td>
        <td align="right" valign="top">&nbsp;</td>
        <td>
           
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">Importador/Exportador</td>
        <td>
            <asp:TextBox ID="txtImp1" runat="server" Width="300px" TabIndex="17"  CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" ClientIDMode="Static" ></asp:TextBox>
            <asp:HiddenField ID="hflImp2" runat="server" ClientIDMode="Static" />
       
            <br />
            <asp:TextBox ID="txtImp2" runat="server" Width="300px" TabIndex="18" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" ReadOnly="False" ClientIDMode="Static" Enabled="False"></asp:TextBox>
           
        </td>
        <td align="right" valign="top">&nbsp;</td>
        <td valign="top">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top">Contenedor y Sellos</td>
        <td>
            <asp:TextBox ID="txtCont" runat="server" TabIndex="19" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase" Width="250"></asp:TextBox>
        </td>
        <td align="right" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td align="right" valign="top">Bultos</td>
        <td>
            <asp:TextBox ID="txtBultos" runat="server" TabIndex ="20" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase"></asp:TextBox>
        </td>
        <td align="right" valign="top">Causa abandono</td>
        <td> <asp:RadioButton ID="rbt1" runat="server" Checked="True" GroupName="ab" Text="45 Días" AutoPostBack="True" TabIndex="23"/>
            <asp:RadioButton ID="rbt2" runat="server" GroupName="ab" Text="3 Meses" AutoPostBack="True" tabindex="24"/></td>
    </tr>
    <tr>
        <td align="right" valign="top">Clave de Pedimento</td>
        <td>
            <asp:TextBox ID="txtClave" runat="server" TabIndex="21" onkeydown="nextOnEnter(this,event);" CssClass="textboxg uppercase"></asp:TextBox>
        </td>
        <td align="right" valign="top">&nbsp;</td>
        <td>
            <asp:TextBox ID="txtFechaAb" runat="server" CssClass="textboxg uppercase" Enabled="False" Width="170px"></asp:TextBox>
        </td>
    </tr>
    </table>

    <div style="padding: 20px; text-align:center">
        <asp:Button ID="btnOK" runat="server" Text="Aceptar" CssClass="btn" TabIndex="25" />
        &nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btna" TabIndex="26" CausesValidation="False" />
    </div>

<uc1:cntrlError ID="cntrlError" runat="server" />

<asp:HiddenField ID="hflOp" runat="server" />
